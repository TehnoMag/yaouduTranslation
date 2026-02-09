dofilepath("data:leveldata/campaign/Tutorial/RPG/script/code_keybind.lua")
dofilepath("data:leveldata/campaign/Tutorial/RPG/script/code_shipmanage.lua")
dofilepath("data:leveldata/campaign/Tutorial/RPG/script/code_createdesc.lua")
dofilepath("data:leveldata/campaign/Tutorial/RPG/script/code_output.lua")
dofilepath("data:leveldata/campaign/Tutorial/RPG/script/code_mapswitch.lua")
dofilepath("data:leveldata/campaign/Tutorial/RPG/script/code_usefulfunctions.lua")
dofilepath("data:leveldata/campaign/tutorial/RPG/script/code_crate.lua")
dofilepath("data:leveldata/campaign/tutorial/RPG/script/code_quest.lua")
--贸易系统入口函式
function DTM4_Init()
 	g_currentplayer = Universe_CurrentPlayer()
	Sound_SetMuteActor("All_")
	CPU_EnableAll(0)
	DTM4_LevelPerSet()
	if (MissionData~=nil) then
		DTM4_SetLevel2()
	else
		DTM4_SetLevel1()
	end
	DTM4_LevelAfterSet()
end
--初始化时最先执行的部分设定
function DTM4_LevelPerSet()
	iShipNumUnit = 1
	while(shiplist[iShipNumUnit]~=nil)do
		tinsert(Factory,1,{})
		iShipNumUnit=iShipNumUnit+1
	end
	iShipNumUnit=ceil((iShipNumUnit-1)/10)

	local l_MSIndex = 0
	for i,j in Stations do
	  SobGroup_Create(j.SGName)
		if (SobGroup_Empty(j.SGName)==0) then
			l_MSIndex = l_MSIndex + 1
	    g_StationEP[i] = 0
	    g_StationPing[i] = 0
	    g_MapStations[l_MSIndex] = i
	 	end
	end
	g_goodswarn = {}
	for i,j in Goods do
	  g_goodswarn[i] = 0
	end
	g_GoodsTime = {}
	for i=1,iShipNumUnit do
	  g_GoodsTime[i] = {0,0,0,0,0,0,0,0,0,0,}
	end
	UI_SetElementVisible("ResourceMenu","ResourceBasic",0)
	--UI_SetElementVisible("ResourceMenu","GameTimer",0)
	DTM4_PlayingDTM4("")
	DTM4_ShipDataCreate()
end
--初始地图额外设定
function	DTM4_SetLevel1()
		g_DeltaT =  - Universe_GameTime()
		if (g_FadeTime>0) then
			Universe_Fade(1, 0)
		end
		DTM4_ProfileIDInit()
		for i,j in shiplist do
			FleetData[j.name]={}
		end
		Rule_AddInterval("DTM4_Fade",g_PerFadeTime)
end
--非初始地图额外设定
function DTM4_SetLevel2()
			SobGroup_SetMadState("HPG"..g_CameFrom, "ResourceDo")
			randomseed(mod(g_seed+5*(g_TimeInGame+Universe_GameTime()),100000000))--根据时间和存档种子设本次的随机种子
	    if (g_FadeTime>0) then
				Universe_Fade(1, 0)
	    end
	    if (g_Intercept == 0) then
	    	if (g_CameFrom=="Start") then
	    		g_DeltaT = - Universe_GameTime()
	    	else
	    		g_DeltaT = g_TCostByGate - Universe_GameTime()
	    	end
	    	Rule_AddInterval("DTM4_FreezeGate",0.1)
	    end
	    for i,j in shiplist do
	    	for k,l in FleetData[j.name] do
					SobGroup_SetSwitchOwnerFlag(j.name..k,0)
					local l_ShipData=DTM4_GetShipData(i, l.Type)
					SobGroup_SetHealth(j.name..k,l.Health)
					if (l_ShipData.needdocked==nil) then
				 		FleetData[j.name][k].PingIndex = Ping_AddSobGroup("", "dtm4_name", j.name..k)
					  --for iSub,iData3 in l.Subs do
						--	if (iData3[2]>0) then
						--	  SobGroup_CreateSubSystem(iName..iShip,iData3[1])
						--	end
					  --end
					else
				  	FleetData[j.name][k].PingIndex = Ping_AddSobGroup("", "dtm4_fuel", j.name..k)
						if (l.DockedWith~="")then
							SobGroup_DockSobGroupInstant(j.name..k,l.DockedWith)
						end
					end
					if(l.ControlGroup[1]~=nil)then
						for iIndex,iCGIndex in l.ControlGroup do
							SobGroup_SobGroupAdd("DTM4_ControlGroup"..iCGIndex,j.name..k)
						end
					end
				end
	    end
	    for i=1,10 do
	    	SobGroup_SelectSobGroup("DTM4_ControlGroup"..i)
				MainUI_UserEventData(eGroup, i)
			end
	    SobGroup_DeSelectAll()
			DTM4_LevelPlayerSet()
			UI_SetElementVisible("ResourceMenu","ResourceTrade",1)
			UI_SetElementVisible("NewTaskbar","frame_UpperRight",0)
			UI_SetElementVisible("NewTaskbar","frame_UpperRight_Trade",1)
			Rule_AddInterval("DTM4_PlayerRelationshipSet",1)
	    SobGroup_Despawn("DTM4_Transfer")
	    SobGroup_Despawn("Player_Start")
	    Rule_Add("DTM4_WhenStart")
			Rule_AddInterval("Player_Lose",5)
	    Rule_AddInterval("DTM4_Fade",g_PerFadeTime)
			--if (g_Intercept==0) then
			--	Rule_AddInterval("DTM4_BadTrader",g_TraderTime)
			--end
			Rule_AddInterval("DTM4_BattleReward1",0.9)
			Rule_AddInterval("DTM4_TradeRule1",0.3)
			Rule_AddInterval("DTM4_WatchFleetSize",0.1)
			DTM4_UIUpdate()
			Rule_AddInterval("DTM4_UIUpdate",1)
			Rule_AddInterval("DTM4_CrateCheck",1)
			Rule_AddInterval("DTM4_ShipManageCheck",1)
			DTM4_QuestOninit()
			Rule_AddInterval("DTM4_UIDateUpdate",0.1)
			DTM4_SetRAMCheatKey()
			Rule_AddInterval("DTM4_AntiRAMCheat",5)
			DTM4_weightcalc()
			DTM4_weightlimitcalc()
			SobGroup_SetSwitchOwnerFlag("Sob_PlayerShipRemove",0)
			g_DateYear,g_DateMonth,g_DateDay,g_DateHour,g_DateMinute = DTM4_GetGameDate()
end
--初始化最后执行的部分设定
function DTM4_LevelAfterSet()
	if (MissionData==nil) then
		dofilepath(g_MissionData[g_StartMap].luafilepath)
		Rule_AddInterval("DTM4_WhichGate",1)
		for i,j in g_MissionData[g_StartMap].MapCanGoTo do
		    g_GatePing[i] = 0
		end
	else
		if (g_Intercept==0) then
			Rule_AddInterval("DTM4_WhichGate",1)
			for i,j in g_MissionData[MissionData].MapCanGoTo do
			    g_GatePing[i] = 0
			end
			dofilepath(g_MissionData[MissionData].luafilepath)
		else
			dofilepath(g_InterceptData[g_Intercept].luafilepath)
		end
	end
	LevelLuaStart()
end
--设定玩家的舰队名称、涂装、舰徽、与地图内各势力的关系
function DTM4_LevelPlayerSet()
	Player_SetTeamColours(g_currentplayer,{PlayerSetup.teamcolour[1]/255,PlayerSetup.teamcolour[2]/255,PlayerSetup.teamcolour[3]/255,},{PlayerSetup.stripecolour[1]/255,PlayerSetup.stripecolour[2]/255,PlayerSetup.stripecolour[3]/255,})
	Player_SetBadgeTexture(g_currentplayer, PlayerSetup.emblem)
	local l_MapCamp = {}
	if (g_Intercept==0) then
		l_MapCamp = g_MissionData[DTM4_GetMissionName()].Camp
	else
		l_MapCamp = g_InterceptData[DTM4_GetMissionName()].Camp
	end
	for i,j in l_MapCamp do
		Player_SetPlayerName(i, Camp[j].name)
		Player_SetTeamColours(i,Camp[j].teamcolour,Camp[j].stripecolour)
		Player_SetBadgeTexture(i, Camp[j].emblem)
	end
	local player1 = 1
	local player2 = 2
	while (l_MapCamp[player1]~=nil) do
		while (l_MapCamp[player2]~=nil) do
			if (player1~=player2) then
				if (Camp[l_MapCamp[player1]].relationship[l_MapCamp[player2]]==1) then
					SetAlliance(player1, player2)
				end
			end
			player2 = player2 + 1
		end
		player1 = player1 + 1
		player2 = 1
	end
end
--开场黑转白
function DTM4_Fade()
	if (MissionData==nil) then
		if (g_FadeTime>0) then
			Universe_Fade(0, g_FadeTime)
		end
		Subtitle_Message(g_MissionData.Start.Name, g_FadeTime)
	else
		if (g_FadeTime>0) then
			Universe_Fade(0, g_FadeTime)
		end
		Subtitle_Message(g_MissionData[MissionData].Name, g_FadeTime)
	end
	Rule_Remove("DTM4_Fade")
end
--后续地图初始，玩家舰队跃出超空间
function DTM4_WhenStart()
	if(SobGroup_Empty("DTM4_Transfer")==0)and(SobGroup_AreAllInHyperspace("DTM4_Transfer")==1)then
		SobGroup_Spawn("DTM4_Transfer","StartPoint")
	end
	if (SobGroup_AreAllInHyperspace("Player_Start")==1) then
		SobGroup_ExitHyperSpace("Player_Start", "StartPoint")
		Rule_Remove("DTM4_WhenStart")
		--Rule_Add("DTM4_DockShips")
	end
end
--反内存作弊
function DTM4_AntiRAMCheat()
	if(g_SafeKey2~=DTM4_GetRAMCheatKey())then
		setMissionComplete(0)
		Rule_Remove("DTM4_AntiRAMCheat")
	end
end
--设置反内存作弊Key
function DTM4_SetRAMCheatKey()
	g_SafeKey2 = floor(mod(g_seed*(g_money+133)*(g_PopPointLimit+6)/(g_FightExp+13)/(g_TradeExp+234),100000000))
end
--获取反内存作弊Key
function DTM4_GetRAMCheatKey()
	return floor(mod(g_seed*(g_money+133)*(g_PopPointLimit+6)/(g_FightExp+13)/(g_TradeExp+234),100000000))
end
--奸商
function DTM4_BadTrader()
	local iFuelIndex = 0
	local iLackAmount = 0
	local iShip = 1
	local lGoodKind = {"GTWhileMoving","GTWhileMoving","GTWhileMoving","GTWhileMoving","GTWhileMoving","GTWhileMoving","GTWhileFiring","GTWhileFiring","GTWhileRepairing","GTWhileHPJump",}
	local iGoodKind = lGoodKind[random(10)]
	local iGoodsIndex = 1
	while (Goods[iGoodsIndex]~=nil) do
		while (shiplist[iShip]~=nil) do
			for k,l in FleetData[shiplist[iShip].name] do
				local l_ShipData = DTM4_GetShipData(iShip, l.Type)
				for i,j in l_ShipData[iGoodKind] do
					if (iFuelIndex==0) then
						if (iGoodsIndex==j[1])and(g_goods[j[1]]==0)and(g_goodstake[j[1]]==0) then
							iFuelIndex = iGoodsIndex
							iLackAmount = iLackAmount + j[2]/4
							break
						end
					elseif (iFuelIndex==j[1])and(g_goods[j[1]]==0)and(g_goodstake[j[1]]==0) then
							iLackAmount = iLackAmount + j[2]/4
							break
					end
				end
			end
			iShip = iShip + 1
		end
		iShip = 1
		iGoodsIndex = iGoodsIndex + 1
	end
	if (iLackAmount>0) then
		iLackAmount = floor(min(ceil(iLackAmount),g_money/Goods[iFuelIndex].RUTake,(g_weightlimit-g_weight)/Goods[iFuelIndex].weight))
		if (iLackAmount>0)and(UI_IsScreenActive("TradeMenu")==0) then
			g_LackAmount = iLackAmount
			g_FuelIndex = iFuelIndex
			UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[50](ceil(Goods[g_FuelIndex].name,g_LackAmount,g_LackAmount*Goods[g_FuelIndex].RUTake)))
			UI_ShowScreen("BuyShipConfirmMenu",ePopup)
			Rule_Add("DTM4_WatchBadTrader")
			Rule_Remove("DTM4_BadTrader")
		end
	end
end

function DTM4_WatchBadTrader()
	if (UI_IsNamedElementVisible("TradeMenu","playercommand")==1) then
		UI_SetElementVisible("TradeMenu","playercommand",0)
		if (UI_IsNamedElementVisible("BuyShipConfirmMenu","BuyShipConfirm")==1) then
			UI_SetElementVisible("TradeMenu","BuyShipConfirm",0)
			DTM4_ChangeMoney(-1*ceil(g_LackAmount*Goods[g_FuelIndex].RUTake))
			g_goods[g_FuelIndex] = g_goods[g_FuelIndex] + g_LackAmount
			DTM4_weightcalc()
		elseif (UI_IsNamedElementVisible("BuyShipConfirmMenu","BuyShipCancel")==1) then
			UI_SetElementVisible("TradeMenu","BuyShipCancel",0)
		end
		Rule_AddInterval("DTM4_BadTrader",g_TraderTime)
		Rule_Remove("DTM4_WatchBadTrader")
	end
end
--监视型号选择
function DTM4_WatchTypeChoose()
	if (UI_IsNamedElementVisible("ChooseTypeMenu", "BuyShip")==1) then
		UI_SetElementVisible("ChooseTypeMenu", "BuyShip",0)
		local l_ShipName = shiplist[g_shipconfirm].realname
		local l_ShipData = DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex])
		if (l_ShipData.needdocked==nil) then
			g_BuyShipRealName = l_ShipData.realname..l_ShipName
			if(g_PopPointTotal+l_ShipData.PopPoint<=g_PopPointLimit)then
				Rule_Add("DTM4_GetBuyingShipName1")
			else
				Rule_Add("DTM4_GetBuyingShipName2")
			end
		else
			UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[4](l_ShipData.realname..l_ShipName))
		end
		UI_ShowScreen("BuyShipConfirmMenu",ePopup)
		UI_HideScreen("ChooseTypeMenu")
		Rule_Remove("DTM4_WatchTypeChoose")
	elseif (UI_IsNamedElementVisible("ChooseTypeMenu", "Cancel")==1) then
		g_shipconfirm = 0
		UI_SetElementVisible("ChooseTypeMenu", "Cancel",0)
		UI_HideScreen("ChooseTypeMenu")
		Rule_Remove("DTM4_WatchTypeChoose")
	elseif (UI_IsNamedElementVisible("ChooseTypeMenu", "NextType")==1) then
		UI_SetElementVisible("ChooseTypeMenu", "NextType",0)
		g_TypeIndex = g_TypeIndex + 1
		UI_SetTextLabelText("ChooseTypeMenu", "TypeLabel", shiplist[g_shipconfirm].Typelist[g_BuyShipType[g_TypeIndex]].name)
		UI_SetTextLabelText("ChooseTypeMenu", "STDescParams", CreateShipDesc(g_shipconfirm, g_BuyShipType[g_TypeIndex]))
		UI_SetTextLabelText("ChooseTypeMenu", "STDesc", shiplist[g_shipconfirm].Typelist[g_BuyShipType[g_TypeIndex]].desc)
		UI_SetTextLabelText("ChooseTypeMenu", "STDescPrice", DTM4_GetColorText(g_money,"NotLess", DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).Price, DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).Price))
		UI_SetTextLabelText("ChooseTypeMenu", "STDescTrade", DTM4_GetColorText(g_TradeLevel,"NotLess", DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).TradeLevelNeed, DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).TradeLevelNeed))
		UI_SetTextLabelText("ChooseTypeMenu", "STDescFight", DTM4_GetColorText(g_FightLevel,"NotLess", DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).FightLevelNeed, DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).FightLevelNeed))
		UI_SetTextLabelText("ChooseTypeMenu", "STDescCrew", DTM4_GetColorText(g_PopPointLimit,"NotLess", g_PopPointTotal+DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).PopPoint, DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).PopPoint))
	elseif (UI_IsNamedElementVisible("ChooseTypeMenu", "LastType")==1) then
		UI_SetElementVisible("ChooseTypeMenu", "LastType",0)
		g_TypeIndex = g_TypeIndex - 1
		UI_SetTextLabelText("ChooseTypeMenu", "TypeLabel", shiplist[g_shipconfirm].Typelist[g_BuyShipType[g_TypeIndex]].name)
		UI_SetTextLabelText("ChooseTypeMenu", "STDescParams", CreateShipDesc(g_shipconfirm, g_BuyShipType[g_TypeIndex]))
		UI_SetTextLabelText("ChooseTypeMenu", "STDesc", shiplist[g_shipconfirm].Typelist[g_BuyShipType[g_TypeIndex]].desc)
		UI_SetTextLabelText("ChooseTypeMenu", "STDescPrice", DTM4_GetColorText(g_money,"NotLess", DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).Price, DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).Price))
		UI_SetTextLabelText("ChooseTypeMenu", "STDescTrade", DTM4_GetColorText(g_TradeLevel,"NotLess", DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).TradeLevelNeed, DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).TradeLevelNeed))
		UI_SetTextLabelText("ChooseTypeMenu", "STDescFight", DTM4_GetColorText(g_FightLevel,"NotLess", DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).FightLevelNeed, DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).FightLevelNeed))
		UI_SetTextLabelText("ChooseTypeMenu", "STDescCrew", DTM4_GetColorText(g_PopPointLimit,"NotLess", g_PopPointTotal+DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).PopPoint, DTM4_GetShipData(g_shipconfirm, g_BuyShipType[g_TypeIndex]).PopPoint))
	end
	if (g_BuyShipType[g_TypeIndex+1]==nil) then
		UI_SetElementEnabled("ChooseTypeMenu", "NextTypeButton", 0)
	else
		UI_SetElementEnabled("ChooseTypeMenu", "NextTypeButton", 1)
	end
	if (g_BuyShipType[g_TypeIndex-1]==nil) then
		UI_SetElementEnabled("ChooseTypeMenu", "LastTypeButton", 0)
	else
		UI_SetElementEnabled("ChooseTypeMenu", "LastTypeButton", 1)
	end
end
--船只Ping更新
function DTM4_UpdateShipPing()
	local ss1 = 0
	local ss2 = 0
	local l_ShipData = {}
	for i,j in shiplist do
	  for k,n in FleetData[j.name] do
	  	l_ShipData = DTM4_GetShipData(i,n.Type)
			if (SobGroup_Selected(j.name..k)==1) then
				if (ss2==0) then
					ss1=i
					ss2=k
				else
					ss2=-1
				end
				if (Camera_GetDistanceToSobGroup(j.name..k)<=l_ShipData.PingDis) then
					if (l_ShipData.needdocked==nil) then
					  Ping_AddDescription(n.PingIndex,0,n.Name)
					else
						for l,m in l_ShipData.GTWhileMoving do
							--Ping_AddDescription(n.PingIndex, l-1, Goods[m[1]].name..":"..ceil(100*n.Fuel[l]/m[3]).."%")
							local iFuelText=Goods[m[1]].sign
							local FuelColor={"FF0000","FF4400","FF8800","FFCC0","FFFF00","FFFF00","CCFF00","88FF00","44FF00","00FF00",}
							for i=1,10 do
								if(i<=ceil(10*n.Fuel[l]/m[3]))then
									iFuelText=iFuelText.."<c="..FuelColor[i]..">|</c>"
								end
							end
							Ping_AddDescription(n.PingIndex, l-1, iFuelText)
						end
					end
				else
				  Ping_AddDescription(n.PingIndex,0," ")
				end
			else
				Ping_AddDescription(n.PingIndex,0," ")
			end
		end
	end
	return ss1,ss2,l_ShipData
end
--贸易站监视
function DTM4_WhichStation()
	local iSGItem=1
	local iShip=1
	local iFlag=0
	local iFlag2=1
	local iFlag3=1
	local iFlag4=1
	local kShip=0
	local l_Dis = {}
	for dStation,iStation in g_MapStations do
		if (SobGroup_Empty(Stations[iStation].SGName)==0) then
			if(SobGroup_Selected(Stations[iStation].SGName)==1) then
				if(g_Relationship[g_MissionData[MissionData].Camp[SobGroup_OwnedBy(Stations[iStation].SGName)]]>=0)then
					SobGroup_DeSelectAll()
					local l_TransAmount = 0
					local l_TransSpeed = 0
					if (Stations[iStation].FightLevelNeed<=g_FightLevel)and(Stations[iStation].TradeLevelNeed<=g_TradeLevel) then
						l_Dis = {}
						for i,j in g_MapStations do
							l_Dis[i] = 0
						end
						for iShip,dShip in shiplist do
							if (FleetData[dShip.name][1]~=nil) then
								for j,l in FleetData[dShip.name] do
									for i,k in g_MapStations do
										local l_ShipData = DTM4_GetShipData(iShip, l.Type)
										if (SobGroup_GetDistanceToSobGroup(Stations[k].SGName,dShip.name..j)<=l_ShipData.ChangeRange)and(k==iStation) then
											iFlag = 1
											l_TransAmount = l_TransAmount + l_ShipData.TransAmount
											l_TransSpeed = l_TransSpeed + l_ShipData.TransSpeed
										elseif (SobGroup_GetDistanceToSobGroup(Stations[k].SGName,dShip.name..j)<=l_ShipData.ChangeRange)and(k~=iStation) then
											if (SobGroup_GetDistanceToSobGroup(Stations[k].SGName,dShip.name..j)>SobGroup_GetDistanceToSobGroup(Stations[iStation].SGName,dShip.name..j)) then
												iFlag2 = 0
											end
										end
										l_Dis[i] = l_Dis[i]+SobGroup_GetDistanceToSobGroup(Stations[k].SGName,dShip.name..j)
									end
								end
							end
						end
						for i,j in l_Dis do
							if (l_Dis[dStation]>j) then
								iFlag3 = 0
							end
						end
						iShip = 1
					else
						iFlag4 = 0
					end
					if ((UI_IsScreenActive("TradeMenu")==0)or(UI_IsScreenActive("GateMenu2")==0)) then
						local iWarnText = ""
						if (iFlag==1)and(iFlag2==1)and(iFlag3==1)and(iFlag4==1) then
							g_Station = iStation
							g_STDis = l_Dis[dStation]
							g_TransAmount = l_TransAmount
							g_TransSpeed = l_TransSpeed
							while (Goods[iSGItem]~=nil) do
								if (Stations[iStation].PriceI["G"..iSGItem]~=nil) then
									UI_SetElementSize("TradeMenu","SGItem"..iSGItem,100,dtm4_SGItemHeight)
									UI_SetElementVisible("TradeMenu","SGItem"..iSGItem,1)
									UI_SetTextLabelText("TradeMenu","SGItem"..iSGItem.."Price",DTM4_GetColorText(Stations[iStation].PriceI["G"..iSGItem][1],"Less",0,DTM4_GetPriceI(iStation,iSGItem)))
								else
									UI_SetElementSize("TradeMenu","SGItem"..iSGItem,100,0)
									UI_SetElementVisible("TradeMenu","SGItem"..iSGItem,0)
								end
								if (Stations[iStation].PriceO["G"..iSGItem]~=nil) then
									UI_SetTextLabelText("TradeMenu","FGItem"..iSGItem.."Price",DTM4_GetColorText(0,"Less",Stations[iStation].PriceO["G"..iSGItem][1],DTM4_GetPriceO(iStation,iSGItem)))
								else
									UI_SetTextLabelText("TradeMenu","FGItem"..iSGItem.."Price",DTM4_GetPriceO(iStation,iSGItem))
								end
						    iSGItem = iSGItem + 1
							end
							while (shiplist[iShip]~=nil) do
								if (Stations[iStation].PriceI["S"..iShip]~=nil) then
							    UI_SetElementSize("TradeMenu","SSItem"..iShip,100,dtm4_SSItemHeight)
							    UI_SetElementVisible("TradeMenu","SSItem"..iShip,1)
							    --UI_SetTextLabelText("TradeMenu","SSItem"..iShip.."Price",""..Stations[iStation].PriceI["S"..iShip][1])
							  else
							    UI_SetElementSize("TradeMenu","SSItem"..iShip,100,0)
							    UI_SetElementVisible("TradeMenu","SSItem"..iShip,0)
							  end
						    --if (Stations[iStation].PriceO["S"..iShip]~=nil) then
						    --	UI_SetTextLabelText("TradeMenu","FSItem"..iShip.."Price",""..Stations[iStation].PriceO["S"..iShip][1])
						    --else
						    --	UI_SetTextLabelText("TradeMenu","FSItem"..iShip.."Price",""..shiplist[iShip].DefaultPrice)
						    --end
						    iShip = iShip + 1
							end
							kShip = iShip - 1
							while (Factory[iShip]~=nil) do
								if (DTM4_IfTableHaveElement(Stations[iStation].SF, iShip-kShip)==1) then
							    UI_SetElementSize("TradeMenu","SFItem"..iShip,100,dtm4_SSItemHeight)
							    UI_SetElementVisible("TradeMenu","SFItem"..iShip,1)
							    UI_SetTextLabelText("TradeMenu","SFItem"..iShip.."Price",""..DTM4_GetColorText(g_money,"NotLess",Factory[iShip].Price,Factory[iShip].Price))
							  else
							    UI_SetElementSize("TradeMenu","SFItem"..iShip,100,0)
							    UI_SetElementVisible("TradeMenu","SFItem"..iShip,0)
							  end
						    UI_SetTextLabelText("TradeMenu","FFItem"..iShip.."Price",""..floor(g_FactorySellMultiper*Factory[iShip].Price))
						    iShip = iShip + 1
							end
							UI_SetTextLabelText("TradeMenu","SSDesc","")
							UI_SetTextLabelText("TradeMenu","SSName","")
							UI_ShowScreen("TradeMenu",ePopup)
							Rule_AddInterval("DTM4_WatchTradeMenu",1)  
							--Rule_Add("DTM4_WatchTradeMenu")
							local l_TimeCost = g_STDis/g_TransSpeed
							local l_TimeUnit = DTM004[31]
							local l_TUIndex = 1
							if (l_TimeCost>600) then
								l_TimeCost = l_TimeCost/60
								l_TimeUnit = DTM004[27]
								if (l_TimeCost>240) then
									l_TimeCost = l_TimeCost/24
									l_TimeUnit = DTM004[28]
									if (l_TimeCost>300) then
										l_TimeCost = l_TimeCost/30
										l_TimeUnit = DTM004[29]
										if (l_TimeCost>120) then
											l_TimeCost = l_TimeCost/12
											l_TimeUnit = DTM004[30]
										end
									end
								end
							end
				    	iWarnText = DTM004[163](Stations[iStation].Name,g_TransAmount,floor(l_TimeCost),l_TimeUnit)
				    else
				    	if (iFlag4==0) then
				    		iWarnText = DTM004[80]
				    	elseif (iFlag==0) then
				    		iWarnText = DTM004[23]
				    	else
				    		iWarnText = DTM004[24]
				    	end
				    end
						DTM4_Warn(iWarnText)
				  end
				else
					DTM4_Warn(DTM004[210](Camp[g_MissionData[MissionData].Camp[SobGroup_OwnedBy(Stations[iStation].SGName)]].name))
				end
			end
			local iVR = 0
			for i=0,Universe_PlayerCount()-1 do
		    if (i~=g_currentplayer) then
					if (AreAllied(i,g_currentplayer)==1) then
				    if (SobGroup_PlayerIsInSensorRange(Stations[iStation].SGName, i)==1) then
							iVR = 1
				    end
					end
		    elseif (SobGroup_PlayerIsInSensorRange(Stations[iStation].SGName, g_currentplayer)==1) then
					iVR = 1
		    end
			end
			if (iVR==1) then
		    if (Stations[iStation]["EP"].Color~=nil) then
					if (Stations[iStation]["EP"].Radius~=nil) then
				    if(g_StationEP[iStation]==0) then
							g_StationEP[iStation]=EventPointer_AddSobGroup(Stations[iStation].SGName, Stations[iStation]["EP"].Color, Stations[iStation]["EP"].Radius)
				    elseif (iVR==0)and(g_StationEP[iStation]~=0) then
							EventPointer_Remove(g_StationEP[iStation])
				    end
					end
		    end
		    if (Stations[iStation]["Ping"].Name~=nil) then
					if (g_StationPing[iStation]==0) then
				    g_StationPing[iStation]=Ping_AddSobGroup(DTM004[94](Stations[iStation]["Ping"].Name), "anomaly2", Stations[iStation].SGName)
				    if (Stations[iStation]["Ping"].Desc~=nil) then
					    Ping_AddDescription(g_StationPing[iStation], 0, Stations[iStation]["Ping"].Desc)
						end
					  Ping_AddDescription(g_StationPing[iStation], 1, DTM004[81](Stations[iStation].FightLevelNeed,Stations[iStation].TradeLevelNeed))
					  Ping_LabelVisible(g_StationPing[iStation], 1)
					end
		    end
			elseif (iVR==0) then
		    if (g_StationEP[iStation]~=0) then
					EventPointer_Remove(g_StationEP[iStation])
					g_StationEP[iStation] = 0
		    end
		    if (g_StationPing[iStation]~=0) then
					Ping_Remove(g_StationPing[iStation])
					g_StationPing[iStation] = 0
		    end
			end
		end
  end
end
--贸易界面监视
function DTM4_WatchTradeMenu()
		if (UI_IsNamedElementVisible("TradeMenu","playercommand")==0) then
			if (UI_IsScreenActive("TradeMenu")==1) then
		    UI_SetTextLabelText("TradeMenu","GoodsWeight1",""..g_factoryweight)
		    UI_SetTextLabelText("TradeMenu","WeightLimit1",""..g_factorylimit)
		    UI_SetTextLabelText("TradeMenu","GoodsWeight2",""..g_weight)
		    UI_SetTextLabelText("TradeMenu","WeightLimit2",""..g_weightlimit)
		    UI_SetElementSize("TradeMenu","GoodsWeightProgress1",floor(dtm4_TradeBayBarLengh*g_factoryweight/g_factorylimit),dtm4_TradeBayBarHeight)
		    UI_SetElementSize("TradeMenu","GoodsWeightProgress2",floor(dtm4_TradeBayBarLengh*g_weight/g_weightlimit),dtm4_TradeBayBarHeight)
				local iShip = 1
				local kShip = 0
				while (shiplist[iShip]~=nil) do
					iShip = iShip + 1
				end
				kShip = iShip - 1
				while (Factory[iShip]~=nil) do
					if (g_Factory[iShip-kShip]>0) then
				    if (UI_IsNamedElementVisible("TradeMenu","FFItem"..iShip)==0) then
							UI_SetElementSize("TradeMenu","FFItem"..iShip,100,dtm4_SSItemHeight)
							UI_SetElementVisible("TradeMenu","FFItem"..iShip, 1)
						else
				    	UI_SetTextLabelText("TradeMenu","FFItem"..iShip.."Num",""..g_Factory[iShip-kShip])
				    end
					elseif (UI_IsNamedElementVisible("TradeMenu","FFItem"..iShip)==1) then
				    UI_SetElementSize("TradeMenu","FFItem"..iShip,100,0)
				    UI_SetElementVisible("TradeMenu","FFItem"..iShip, 0)
					end
					if(UI_IsNamedElementVisible("TradeMenu","FF"..iShip.."Graph")==1)then
						UI_SetTextLabelText("TradeMenu","FSDesc",CreateFactoryDesc(iShip))
					end
					if(UI_IsNamedElementVisible("TradeMenu","SF"..iShip.."Graph")==1)then
						UI_SetTextLabelText("TradeMenu","SSDesc",CreateFactoryDesc(iShip))
					end
					iShip = iShip + 1
				end
		    local iSG=1
		    while (Goods[iSG]~=nil) do
		    	if (g_goods[iSG]>0) then
						if (UI_IsNamedElementVisible("TradeMenu","FGItem"..iSG)==0) then
							UI_SetElementSize("TradeMenu","FGItem"..iSG,100,dtm4_SGItemHeight)
							UI_SetElementVisible("TradeMenu","FGItem"..iSG, 1)
						else
							UI_SetTextLabelText("TradeMenu","FGItem"..iSG.."Num",""..g_goods[iSG])
						end
					elseif (UI_IsNamedElementVisible("TradeMenu","FGItem"..iSG)==1) then
				    UI_SetElementSize("TradeMenu","FGItem"..iSG,100,0)
				    UI_SetElementVisible("TradeMenu","FGItem"..iSG, 0)
				    UI_SetElementVisible("TradeMenu","FGINT",1)
					end
					if (UI_IsNamedElementVisible("TradeMenu","FG"..iSG.."Graph")==1) then
						UI_SetTextLabelText("TradeMenu","FGDesc", CreateGoodDesc(iSG))
					end
					if (UI_IsNamedElementVisible("TradeMenu","SG"..iSG.."Graph")==1) then
						UI_SetTextLabelText("TradeMenu","SGDescTrade", DTM4_GetColorText(g_TradeLevel,"NotLess",Goods[iSG].TradeLevelNeed,Goods[iSG].TradeLevelNeed))
						UI_SetTextLabelText("TradeMenu","SGDescFight", DTM4_GetColorText(g_FightLevel,"NotLess",Goods[iSG].FightLevelNeed,Goods[iSG].FightLevelNeed))
						UI_SetTextLabelText("TradeMenu","SGDesc", CreateGoodDesc(iSG))
					end
					iSG = iSG + 1
		    end
				if (UI_IsNamedElementVisible("TradeMenu","BuyNum2")==0) then
					local iSG=1
					g_MaxBuyNum = 0
					while (Goods[iSG]~=nil) do
						if (UI_IsNamedElementVisible("TradeMenu","SG"..iSG.."Graph")==1) then
							g_MaxBuyNum = DTM4_MaxBuyNum(iSG)
						end
						iSG = iSG + 1
					end
					UI_SetTextLabelText("TradeMenu","BuyGoodsNum","(0-"..g_MaxBuyNum..")")
		    end
				if (UI_IsNamedElementVisible("TradeMenu","SellNum2")==0) then
					local iSG=1
					g_MaxSellNum = 0
					while (Goods[iSG]~=nil) do
						if (UI_IsNamedElementVisible("TradeMenu","FG"..iSG.."Graph")==1) then
							g_MaxSellNum = g_goods[iSG]
						end
						iSG = iSG + 1
					end
					UI_SetTextLabelText("TradeMenu","SellGoodsNum","(0-"..g_MaxSellNum..")")
		    end
				if (UI_IsNamedElementVisible("TradeMenu","NumClear")==1) then
					UI_SetElementVisible("TradeMenu","NumClear",0)
					UI_SetElementVisible("TradeMenu","BuyNum2",0)
					UI_SetElementVisible("TradeMenu","SellNum2",0)
					g_BuyNum = 0
					g_SellNum = 0
					DTM4_NumKeyUnBind()
				end
				if (UI_IsNamedElementVisible("TradeMenu","NumDEL")==1) then
					UI_SetElementVisible("TradeMenu","NumDEL",0)
					if (UI_IsNamedElementVisible("TradeMenu","BuyNum2")==1) then
						g_BuyNum = floor(g_BuyNum/10)
						UI_SetTextLabelText("TradeMenu","BuyGoodsNum",g_BuyNum.."")
					elseif (UI_IsNamedElementVisible("TradeMenu","SellNum2")==1) then
						g_SellNum = floor(g_SellNum/10)
						UI_SetTextLabelText("TradeMenu","SellGoodsNum",g_SellNum.."")
					end
				end
				if (UI_IsNamedElementVisible("TradeMenu","NumAC")==1) then
					UI_SetElementVisible("TradeMenu","NumAC",0)
					if (UI_IsNamedElementVisible("TradeMenu","BuyNum2")==1) then
						g_BuyNum = 0
						UI_SetTextLabelText("TradeMenu","BuyGoodsNum",g_BuyNum.."")
					elseif (UI_IsNamedElementVisible("TradeMenu","SellNum2")==1) then
						g_SellNum = 0
						UI_SetTextLabelText("TradeMenu","SellGoodsNum",g_SellNum.."")
					end
				end
			else
				Universe_SlowDown(1, 0)
				if (g_sLoad~="") then
					Rule_AddInterval(g_sLoad,0.1)
				end
		    Rule_Remove("DTM4_WatchTradeMenu")
			end
		elseif (UI_IsScreenActive("TradeMenu")==1) then
			Universe_SlowDown(0, 0)
			UI_SetElementVisible("TradeMenu","playercommand", 0)
			if (UI_IsNamedElementVisible("TradeMenu","ShipsMenu")==1) then
				if (g_shipconfirm~=0) then--确认买船
					if (UI_IsNamedElementVisible("BuyShipConfirmMenu","BuyShipConfirm")==1) then
						UI_SetElementVisible("BuyShipConfirmMenu","BuyShipConfirm",0)
						if (g_shipconfirm<0) then--卖厂确认
					    local iShip=1
					    local kShip=0
					    while (shiplist[iShip]~=nil) do
					    	iShip = iShip + 1
					    end
							kShip = iShip - 1
						  while (UI_IsNamedElementVisible("TradeMenu","FF"..iShip.."Graph")==0)and(Factory[iShip]~=nil) do
						  	iShip = iShip + 1
						  end
							UI_SetElementVisible("TradeMenu","close1",1)
							UI_ShowScreen("GoodLoadMenu",ePopup)
							g_sLoad = "DTM4_SellFactory"
							g_goodindex = iShip-kShip
							g_goodloaded1 = iShip
							g_LoadNum = Factory[iShip].TCost
							UI_SetTextLabelText("GoodLoadMenu","GoodLoadText2","")
							g_shipconfirm = 0
			    		UI_SetElementVisible("TradeMenu","FGINT",1)
			    	elseif (g_shipconfirm>0) then
					    local iShip=1
					    local kShip=0
					    while (UI_IsNamedElementVisible("TradeMenu","SS"..iShip.."Graph")==0)and(shiplist[iShip]~=nil) do
					    	iShip = iShip + 1
					    end
					    if (shiplist[iShip]~=nil) then--买船确认
								local l_ShipData = DTM4_GetShipData(iShip, g_BuyShipType[g_TypeIndex])
								if (g_money>=l_ShipData.Price)and(g_PopPointTotal<=g_PopPointLimit)and((getn(FleetData[shiplist[iShip].name])<l_ShipData.NumLimit)or(l_ShipData.NumLimit==0))and(DTM4_GetShipVisible(g_Station,l_ShipData)==1)and(g_Relationship[g_MissionData[MissionData].Camp[SobGroup_OwnedBy(Stations[g_Station].SGName)]]>l_ShipData.RelationshipNeed) then
									local l_sp = SobGroup_GetPosition(Stations[g_Station].SGName)
			   			    Volume_AddSphere("ShipSpawn",{l_sp[1]+Stations[g_Station].CPosition[1],l_sp[2]+Stations[g_Station].CPosition[2],l_sp[3]+Stations[g_Station].CPosition[3]},100)
							    SobGroup_SpawnNewShipInSobGroup(g_currentplayer, l_ShipData.name, shiplist[iShip].name..getn(FleetData[shiplist[iShip].name]), "Player_Ships"..g_currentplayer, "ShipSpawn")
							    Volume_Delete("ShipSpawn")
									DTM4_weightlimitcalc()
							    g_money = g_money - l_ShipData.Price
							    DTM4_SetRAMCheatKey()
									UI_SetElementEnabled("TradeMenu","BuyShipButton",0)
								elseif (DTM4_GetShipVisible(iStation,l_ShipData)==0) then
								   Subtitle_Add(Actor_FleetIntel, DTM004[85], 2)
								   UI_PlaySound("SFX_ErrorMessage")
								elseif (g_money<l_ShipData.Price) then
								   Subtitle_Add(Actor_FleetIntel, DTM004[58], 1)
								   UI_PlaySound("SFX_ErrorMessage")
								elseif (g_PopPointTotal+l_ShipData.PopPoint>g_PopPointLimit) then
								   Subtitle_Add(Actor_FleetIntel, DTM004[59], 1)
								   UI_PlaySound("SFX_ErrorMessage")
								elseif (DTM4_GetShipVisible(g_Station,l_ShipData)~=1) then
								   Subtitle_Add(Actor_FleetIntel, DTM004[60], 1.5)
								   UI_PlaySound("SFX_ErrorMessage")
								else
								  Subtitle_Add(Actor_FleetIntel, DTM004[211], 1.5)
								  UI_PlaySound("SFX_ErrorMessage")
								end
							 	if (l_ShipData.needdocked==nil) then
									Rule_Remove("DTM4_GetBuyingShipName1")
									Rule_Remove("DTM4_GetBuyingShipName2")
									g_BuyShipRealName = nil
							 	end
							else--买厂确认
						    kShip = iShip - 1
						    while (UI_IsNamedElementVisible("TradeMenu","SF"..iShip.."Graph")==0)and(Factory[iShip]~=nil) do
						    	iShip = iShip + 1
						    end
								if (g_money>=Factory[iShip].Price) then
									UI_SetElementVisible("TradeMenu","close1",1)
									UI_ShowScreen("GoodLoadMenu",ePopup)
									g_sLoad = "DTM4_LoadFactory"
									g_goodindex = iShip-kShip
									g_goodloaded1 = iShip
									g_LoadNum = Factory[iShip].TCost
									UI_SetTextLabelText("GoodLoadMenu","GoodLoadText2","")
								else
								  Subtitle_Add(Actor_FleetIntel, DTM004[58], 1)
						    	UI_PlaySound("SFX_ErrorMessage")
								end
							end
							g_shipconfirm = 0
						end
			    elseif (UI_IsNamedElementVisible("BuyShipConfirmMenu","BuyShipCancel")==1) then--取消
						UI_SetElementVisible("BuyShipConfirmMenu","BuyShipCancel",0)
						g_shipconfirm = 0
						Rule_Remove("DTM4_GetBuyingShipName1")
						Rule_Remove("DTM4_GetBuyingShipName2")
						g_BuyShipRealName = nil
					end
				elseif (UI_IsNamedElementVisible("TradeMenu","BuyShip")==1) then--买入工厂或舰船
					UI_SetElementVisible("TradeMenu","BuyShip",0)
			    local iShip=1
			    local kShip=0
			    while (UI_IsNamedElementVisible("TradeMenu","SS"..iShip.."Graph")==0)and(shiplist[iShip]~=nil) do
			    	iShip = iShip + 1
			    end
			    if (shiplist[iShip]~=nil) then
						UI_ShowScreen("ChooseTypeMenu",ePopup)
						g_BuyShipType = Stations[g_Station].PriceI["S"..iShip]
						g_TypeIndex = 1
						UI_SetTextLabelText("ChooseTypeMenu", "TypeLabel", shiplist[iShip].Typelist[g_BuyShipType[1]].name)
						UI_SetTextLabelText("ChooseTypeMenu", "STDescParams", CreateShipDesc(iShip, g_BuyShipType[1]))
						UI_SetTextLabelText("ChooseTypeMenu", "STDesc", shiplist[iShip].Typelist[g_BuyShipType[1]].desc)
						UI_SetTextLabelText("ChooseTypeMenu", "STDescPrice", DTM4_GetColorText(g_money,"NotLess", DTM4_GetShipData(iShip, g_BuyShipType[1]).Price, DTM4_GetShipData(iShip, g_BuyShipType[1]).Price))
						UI_SetTextLabelText("ChooseTypeMenu", "STDescTrade", DTM4_GetColorText(g_TradeLevel,"NotLess", DTM4_GetShipData(iShip, g_BuyShipType[1]).TradeLevelNeed, DTM4_GetShipData(iShip, g_BuyShipType[1]).TradeLevelNeed))
						UI_SetTextLabelText("ChooseTypeMenu", "STDescFight", DTM4_GetColorText(g_FightLevel,"NotLess", DTM4_GetShipData(iShip, g_BuyShipType[1]).FightLevelNeed, DTM4_GetShipData(iShip, g_BuyShipType[1]).FightLevelNeed))
						UI_SetTextLabelText("ChooseTypeMenu", "STDescCrew", DTM4_GetColorText(g_PopPointLimit,"NotLess", g_PopPointTotal+DTM4_GetShipData(iShip, g_BuyShipType[1]).PopPoint, DTM4_GetShipData(iShip, g_BuyShipType[1]).PopPoint))
						Rule_Add("DTM4_WatchTypeChoose")
						g_shipconfirm = iShip
					else
						kShip = iShip - 1
				    while (UI_IsNamedElementVisible("TradeMenu","SF"..iShip.."Graph")==0)and(Factory[iShip]~=nil) do
				    	iShip = iShip + 1
				    end
						if (g_money>=Factory[iShip].Price)and(g_weight<=g_weightlimit-Factory[iShip].VCost)and(g_factoryweight<=g_factorylimit-Factory[iShip].VCost)and(DTM4_GetFactoryVisible(g_Station,iShip)==1)and(g_Relationship[g_MissionData[MissionData].Camp[SobGroup_OwnedBy(Stations[g_Station].SGName)]]>Factory[iShip].RelationshipNeed) then
						  UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[61](Factory[iShip].Name))
						  UI_ShowScreen("BuyShipConfirmMenu",ePopup)
						  g_shipconfirm = iShip
						elseif (DTM4_GetFactoryVisible(g_Station,iShip)==0) then
						  Subtitle_Add(Actor_FleetIntel, DTM004[86], 2)
						  UI_PlaySound("SFX_ErrorMessage")
						elseif (g_money<Factory[iShip].Price) then
						  Subtitle_Add(Actor_FleetIntel, DTM004[58], 1)
						  UI_PlaySound("SFX_ErrorMessage")
						elseif (g_factoryweight>g_factorylimit-Factory[iShip].VCost) then
						  Subtitle_Add(Actor_FleetIntel, DTM004[93], 1.5)
						  UI_PlaySound("SFX_ErrorMessage")
						elseif (DTM4_GetFactoryVisible(g_Station,iShip)~=1) then
						  Subtitle_Add(Actor_FleetIntel, DTM004[62], 1.5)
						  UI_PlaySound("SFX_ErrorMessage")
						else
						  Subtitle_Add(Actor_FleetIntel, DTM004[211], 1.5)
						  UI_PlaySound("SFX_ErrorMessage")
						end
					end
				elseif (UI_IsNamedElementVisible("TradeMenu","SellShip")==1) then--卖出工厂
					UI_SetElementVisible("TradeMenu","SellShip",0)
			    local iShip=1
			    local kShip=0
			    while (shiplist[iShip]~=nil) do
			    	iShip = iShip + 1
			    end
					kShip = iShip - 1
				  while (UI_IsNamedElementVisible("TradeMenu","FF"..iShip.."Graph")==0)and(Factory[iShip]~=nil) do
				    iShip = iShip + 1
				  end
					UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[6](Factory[iShip].Name))
					UI_ShowScreen("BuyShipConfirmMenu",ePopup)
					g_shipconfirm = -iShip
				end
			elseif (UI_IsNamedElementVisible("TradeMenu","GoodsMenu")==1) then
				if (UI_IsNamedElementVisible("TradeMenu","BuyNum1")==1) then
					UI_SetElementVisible("TradeMenu","playercommand", 1)
					UI_SetElementVisible("TradeMenu","BuyNum1",0)
					DTM4_BuyKeyBind()
					g_BuyNum = 0
					g_SellNum = 0
					UI_SetTextLabelText("TradeMenu","BuyGoodsNum","_")
					UI_SetElementVisible("TradeMenu","SellNum2",0)
				elseif (UI_IsNamedElementVisible("TradeMenu","BuyNum2")==1) then
					if (UI_IsNamedElementVisible("TradeMenu","BuyGoods")==1) then--购买
						UI_SetElementVisible("TradeMenu","BuyGoods",0)
						local iSG=1
						while (UI_IsNamedElementVisible("TradeMenu","SG"..iSG.."Graph")==0)and(Goods[iSG]~=nil) do
							iSG = iSG + 1
						end
						g_goodindex = iSG
						DTM4_GoodLoadCulc()
						if (DTM4_GetGoodVisible(g_Station,iSG)==1)and(g_TransAmount>0) then
							UI_SetElementVisible("TradeMenu","close2",1)
							UI_ShowScreen("GoodLoadMenu",ePopup)
							g_sLoad = "DTM4_LoadGood"
							g_LoadNum = g_BuyNum
							g_goodloaded1 = 0
							g_goodloaded2 = 0
							g_BuyNum = 0
							DTM4_NumKeyUnBind()
							UI_SetElementVisible("TradeMenu","BuyNum2",0)
							--Subtitle_Message(DTM004[57], 10)
						elseif (g_TransAmount==0) then
							Subtitle_Add(Actor_FleetIntel, DTM004[99], 2)
						  UI_PlaySound("SFX_ErrorMessage")
						else
							Subtitle_Add(Actor_FleetIntel, DTM004[84], 2)
						  UI_PlaySound("SFX_ErrorMessage")
						end
					elseif (UI_IsNamedElementVisible("TradeMenu","SellNum1")==1) then
						UI_SetElementVisible("TradeMenu","playercommand", 1)
						UI_SetElementVisible("TradeMenu","BuyNum2",0)
						g_BuyNum = 0
						DTM4_NumKeyUnBind()
					end
				elseif (UI_IsNamedElementVisible("TradeMenu","SellNum1")==1) then
					UI_SetElementVisible("TradeMenu","playercommand", 1)
					UI_SetElementVisible("TradeMenu","SellNum1",0)
					DTM4_SellKeyBind()
					g_SellNum = 0
					g_BuyNum = 0
					UI_SetTextLabelText("TradeMenu","SellGoodsNum","_")
				elseif (UI_IsNamedElementVisible("TradeMenu","SellNum2")==1) then
					if (UI_IsNamedElementVisible("TradeMenu","SellGoods")==1) then--卖出
						UI_SetElementVisible("TradeMenu","SellGoods",0)
						local iSG=1
						while (UI_IsNamedElementVisible("TradeMenu","FG"..iSG.."Graph")==0)and(Goods[iSG]~=nil) do
							iSG = iSG + 1
						end
						g_goodindex = iSG
						DTM4_GoodLoadCulc()
						if (g_TransAmount>0) then
							UI_SetElementVisible("TradeMenu","close2",1)
							UI_ShowScreen("GoodLoadMenu",ePopup)
							g_sLoad = "DTM4_SellGood"
							g_LoadNum = g_SellNum
							g_goodloaded1 = 0
							g_goodloaded2 = 0
					    g_SellNum = 0
							UI_SetElementVisible("TradeMenu","SellNum2",0)
							DTM4_NumKeyUnBind()
							--Subtitle_Message(DTM004[57], 10)
						else
							Subtitle_Add(Actor_FleetIntel, DTM004[99], 2)
						  UI_PlaySound("SFX_ErrorMessage")
						end
					end
				end
			end
			DTM4_weightcalc()
			DTM4_weightlimitcalc()
		end
end
--UI更新
function DTM4_UIUpdate()
	local iShip = 1
	local jShip = 1
	local l_PopPointTotal = 0
	while (shiplist[iShip]~=nil) do
		jShip = 1
		while (FleetData[shiplist[iShip].name][jShip]~=nil) do
			local l_ShipData = DTM4_GetShipData(iShip, FleetData[shiplist[iShip].name][jShip].Type)
			l_PopPointTotal = l_PopPointTotal +l_ShipData.PopPoint
			jShip = jShip + 1
		end
		iShip = iShip + 1
	end
	g_PopPointTotal = l_PopPointTotal
	UI_SetTextLabelText("ResourceMenu","lblResourceUnitsSize_PopPoint",g_PopPointTotal.."/"..g_PopPointLimit)
	if (g_FightLevelFull==0) then
		UI_SetTextLabelText("ResourceMenu","lblResourceUnitsSize_FightLevel",DTM4_GetFightLevel())
	end
	if (g_TradeLevelFull==0) then
		UI_SetTextLabelText("ResourceMenu","lblResourceUnitsSize_TradeLevel",DTM4_GetTradeLevel())
	end
end
--游戏时间更新
function DTM4_UIDateUpdate()
	if (Universe_GameTime()-g_OldGameTime>0.2) then
		g_OldGameTime = g_OldGameTime + 0.2
		g_DateYear,g_DateMonth,g_DateDay,g_DateHour,g_DateMinute = DTM4_AddMinute(g_DateYear,g_DateMonth,g_DateDay,g_DateHour,g_DateMinute,1)
		UI_SetTextLabelText("ResourceMenu",DTM004[78],DTM4_CreateDateString(g_DateYear,g_DateMonth,g_DateDay,g_DateHour,g_DateMinute))
	end
	DTM4_ShipManageTake()
end
--改造界面监控
function DTM4_UpdateShipSelect()
	local l_ShipData = {}
	g_SelectedShipIndex1,g_SelectedShipIndex2,l_ShipData = DTM4_UpdateShipPing()--获取玩家选中舰船的数据编号
	local l_Station = DTM4_GetStationIndexNearBySelectedShip(l_ShipData.ChangeRange)
	if (UI_IsScreenActive("ChangeTypeMenu")==0) then--改造界面未激活
		if (g_SelectedShipIndex2>0) then
			UI_SetElementEnabled("NewTaskbar","btnMods",1)
		else
			UI_SetElementEnabled("NewTaskbar","btnMods",0)
		end
		if (UI_IsNamedElementVisible("ChangeTypeMenu", "OpenMenu")==1) then--激活改造界面
			UI_SetElementVisible("ChangeTypeMenu", "OpenMenu", 0)
			SetShipCompareDesc(g_SelectedShipIndex1, FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type, FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type)
			UI_SetTextLabelText("ChangeTypeMenu", "TypeLabel", shiplist[g_SelectedShipIndex1].Typelist[FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type].name)
			local iChangeFlag = 0
			local iRepairFlag = 1
			if (l_Station>0) then
				g_BuyShipType = Stations[l_Station].PriceI["S"..g_SelectedShipIndex1]
				g_TypeIndex = nil
				if (g_BuyShipType~=nil) then
					local iType = 1
					while (g_BuyShipType[iType]~=nil) do
						if (g_BuyShipType[iType]==FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type) then--贸易站出售小类
							g_TypeIndex = iType
							iRepairFlag = 1
						else--贸易站出售其他小类
							iChangeFlag=1
						end
						iType = iType + 1
					end
					if (g_TypeIndex==nil) then--贸易站不出售小类
						g_BuyShipType[iType] = FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type
						g_TypeIndex = iType
					end
				else--贸易站不出售大类
					g_BuyShipType = {FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type}
					g_TypeIndex = 1
				end
			else
				g_BuyShipType = {FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type}
				g_TypeIndex = 1
			end
			UI_SetElementEnabled("ChangeTypeMenu", "m_btnSell", iRepairFlag)--足够接近则允许卖出
			UI_SetElementEnabled("ChangeTypeMenu", "m_btnManage", iChangeFlag)--足够接近则允许托管
			UI_SetElementEnabled("ChangeTypeMenu", "m_btnRepair", iRepairFlag)--足够接近则允许修理
			UI_ShowScreen("ChangeTypeMenu", ePopup)
			Universe_SlowDown(0, 0)
		end
	elseif (UI_IsScreenActive("ModMenu")==1) then--改造界面激活，改名界面激活
		dofilepath("profiles:ShipName.txt")
		UI_SetTextLabelText("ModMenu","m_lblMessage",DTM004[95](g_BuyShipName))
		if (UI_IsNamedElementVisible("ModMenu","Yes")==1) then
			UI_SetElementVisible("ModMenu","Yes",0)
			FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Name = g_BuyShipName
			UI_HideScreen("ModMenu")
		elseif (UI_IsNamedElementVisible("ModMenu","No")==1) then
			UI_SetElementVisible("ModMenu","No",0)
			UI_HideScreen("ModMenu")
		end
	elseif (UI_IsScreenActive("BuyShipConfirmMenu")==0) then--改造界面激活，改名界面未激活，改造确认界面未激活
		if (UI_IsNamedElementVisible("ChangeTypeMenu", "CloseMenu")==1) then--关闭改造界面
			UI_SetElementVisible("ChangeTypeMenu", "CloseMenu", 0)
			UI_HideScreen('ChangeTypeMenu')
			Universe_SlowDown(1, 0)
		elseif (UI_IsNamedElementVisible("ChangeTypeMenu","SellShip")==1) then--卖船
			UI_SetElementVisible("ChangeTypeMenu","SellShip",0)
			local l_ShipData = DTM4_GetShipData(g_SelectedShipIndex1, FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type)
			if (l_ShipData.needdocked==nil) then
				if (FleetData[shiplist[g_SelectedShipIndex1].name][2]==nil)and(FleetFunctionCheck(g_SelectedShipIndex1)==0) then
					Subtitle_Add(Actor_FleetIntel, DTM004[63], 2)
					UI_PlaySound("SFX_ErrorMessage")
				elseif (TMR_ShipCarryCheck(g_SelectedShipIndex1)==1) then
					Subtitle_Add(Actor_FleetIntel, DTM004[64], 3)
					UI_PlaySound("SFX_ErrorMessage")
				elseif (g_weightlimit - l_ShipData.cap<g_weight) then
					Subtitle_Add(Actor_FleetIntel, DTM004[65], 3)
					UI_PlaySound("SFX_ErrorMessage")
				else
					UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[121](FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Name,shiplist[g_SelectedShipIndex1].realname))
					UI_ShowScreen("BuyShipConfirmMenu",ePopup)
					g_shipconfirm = 1
				end
			else
				if (g_weightlimit - l_ShipData.cap<g_weight) then
					Subtitle_Add(Actor_FleetIntel, DTM004[65], 3)
					UI_PlaySound("SFX_ErrorMessage")
				else
					UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[121](shiplist[g_SelectedShipIndex1].realname,""))
					UI_ShowScreen("BuyShipConfirmMenu",ePopup)
					g_shipconfirm = 1
				end
			end
		elseif (UI_IsNamedElementVisible("ChangeTypeMenu","Manage")==1) then--托管
			UI_SetElementVisible("ChangeTypeMenu","Manage",0)
			local l_ShipData = DTM4_GetShipData(g_SelectedShipIndex1, FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type)
			if (l_ShipData.needdocked==nil) then
				if (FleetData[shiplist[g_SelectedShipIndex1].name][2]==nil)and(FleetFunctionCheck(g_SelectedShipIndex1)==0) then
					Subtitle_Add(Actor_FleetIntel, DTM004[128], 2)
					UI_PlaySound("SFX_ErrorMessage")
				elseif (TMR_ShipCarryCheck(g_SelectedShipIndex1)==1) then
					Subtitle_Add(Actor_FleetIntel, DTM004[129], 3)
					UI_PlaySound("SFX_ErrorMessage")
				elseif (g_weightlimit - l_ShipData.cap<g_weight) then
					Subtitle_Add(Actor_FleetIntel, DTM004[130], 3)
					UI_PlaySound("SFX_ErrorMessage")
				else
					local l_price = ceil(l_ShipData.Price*g_ManagePriceMultiper)
					UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[131](FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Name,shiplist[g_SelectedShipIndex1].realname,Camp[g_MissionData[DTM4_GetMissionName()].Camp[SobGroup_OwnedBy(Stations[l_Station].SGName)]].name,l_price))
					UI_ShowScreen("BuyShipConfirmMenu",ePopup)
					g_shipconfirm = 2
				end
			else
				if (g_weightlimit - l_ShipData.cap<g_weight) then
					Subtitle_Add(Actor_FleetIntel, DTM004[130], 3)
					UI_PlaySound("SFX_ErrorMessage")
				else
					local l_name = l_ShipData.realname
					local l_price = l_ShipData.Price
					UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[131](shiplist[g_SelectedShipIndex1].realname,"",Camp[g_MissionData[DTM4_GetMissionName()].Camp[SobGroup_OwnedBy(Stations[l_Station].SGName)]].name,l_price))
					UI_ShowScreen("BuyShipConfirmMenu",ePopup)
					g_shipconfirm = 2
				end
			end
		elseif (UI_IsNamedElementVisible("ChangeTypeMenu","Change")==1) then--改造
			UI_SetElementVisible("ChangeTypeMenu","Change",0)
			local l_ShipData = DTM4_GetShipData(g_SelectedShipIndex1, FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type)
			local l_ShipData2 = DTM4_GetShipData(g_SelectedShipIndex1, g_BuyShipType[g_TypeIndex])
			if (l_ShipData.needdocked==nil) then
				if (TMR_ShipCarryCheck(g_SelectedShipIndex1)==1) then
					Subtitle_Add(Actor_FleetIntel, DTM004[101], 3)
					UI_PlaySound("SFX_ErrorMessage")
				elseif (g_weightlimit - l_ShipData.cap + l_ShipData2.cap<g_weight) then
					Subtitle_Add(Actor_FleetIntel, DTM004[102], 3)
					UI_PlaySound("SFX_ErrorMessage")
				else
					UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[100](FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Name,shiplist[g_SelectedShipIndex1].realname,l_ShipData.realname,l_ShipData2.realname))
					UI_ShowScreen("BuyShipConfirmMenu",ePopup)
					g_shipconfirm = 3
				end
			else
				if (g_weightlimit - l_ShipData.cap + l_ShipData2.cap<g_weight) then
					Subtitle_Add(Actor_FleetIntel, DTM004[102], 3)
					UI_PlaySound("SFX_ErrorMessage")
				else
					if(l_ShipData.needdocked==nil)then
						UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[100](FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Name,shiplist[g_SelectedShipIndex1].realname,l_ShipData.realname,l_ShipData2.realname))
					else
						UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[100](shiplist[g_SelectedShipIndex1].realname,"",l_ShipData.realname,l_ShipData2.realname))
					end
					UI_ShowScreen("BuyShipConfirmMenu",ePopup)
					g_shipconfirm = 3
				end
			end
		elseif (UI_IsNamedElementVisible("ChangeTypeMenu","Repair")==1) then--维修
			UI_SetElementVisible("ChangeTypeMenu","Repair",0)
			local l_ShipData = DTM4_GetShipData(g_SelectedShipIndex1, FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type)
			local l_health = SobGroup_HealthPercentage(shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2)
			local l_price = ceil((1-l_health)*l_ShipData.Price*g_RepairPriceMultiper)
			if (l_health==1) then
				if(l_ShipData.needdocked~=nil)then
					Subtitle_Add(Actor_FleetIntel, DTM004[142](shiplist[g_SelectedShipIndex1].realname,""), 3)
				else
					Subtitle_Add(Actor_FleetIntel, DTM004[142](FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Name,shiplist[g_SelectedShipIndex1].realname), 3)
				end
				UI_PlaySound("SFX_ErrorMessage")
			elseif (g_money<l_price) then
				Subtitle_Add(Actor_FleetIntel, DTM004[144], 3)
				UI_PlaySound("SFX_ErrorMessage")
			else
				if(l_ShipData.needdocked~=nil)then
					UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[148](shiplist[g_SelectedShipIndex1].realname,"",l_price))
				else
					UI_SetTextLabelText("BuyShipConfirmMenu","ConfirmMessage",DTM004[148](FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Name,shiplist[g_SelectedShipIndex1].realname,l_price))
				end
				UI_ShowScreen("BuyShipConfirmMenu",ePopup)
				g_shipconfirm = 4
			end
		else
			if (g_BuyShipType~=nil) then--设置切换类型按键
				UI_SetElementEnabled("ChangeTypeMenu","LastTypeButton",1-DTM4_NumIsNil(g_BuyShipType[g_TypeIndex-1]))
				UI_SetElementEnabled("ChangeTypeMenu","NextTypeButton",1-DTM4_NumIsNil(g_BuyShipType[g_TypeIndex+1]))
				UI_SetElementEnabled("ChangeTypeMenu","m_btnChange",1-DTM4_NumCompare(g_BuyShipType[g_TypeIndex], FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type))
			else
				UI_SetElementEnabled("ChangeTypeMenu","LastTypeButton",0)
				UI_SetElementEnabled("ChangeTypeMenu","NextTypeButton",0)
			end
			if (UI_IsNamedElementVisible("ChangeTypeMenu", "NextType")==1) then--下一个类型
				UI_SetElementVisible("ChangeTypeMenu", "NextType",0)
				g_TypeIndex = g_TypeIndex + 1
				UI_SetTextLabelText("ChangeTypeMenu", "TypeLabel", shiplist[g_SelectedShipIndex1].Typelist[g_BuyShipType[g_TypeIndex]].name)
				SetShipCompareDesc(g_SelectedShipIndex1, g_BuyShipType[g_TypeIndex], FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type)
			elseif (UI_IsNamedElementVisible("ChangeTypeMenu", "LastType")==1) then--上一个类型
				UI_SetElementVisible("ChangeTypeMenu", "LastType",0)
				g_TypeIndex = g_TypeIndex - 1
				UI_SetTextLabelText("ChangeTypeMenu", "TypeLabel", shiplist[g_SelectedShipIndex1].Typelist[g_BuyShipType[g_TypeIndex]].name)
				SetShipCompareDesc(g_SelectedShipIndex1, g_BuyShipType[g_TypeIndex], FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type)
			end
			if (UI_IsNamedElementVisible("BuyShipConfirmMenu","BuyShipConfirm")==1) then--确认
				UI_SetElementVisible("BuyShipConfirmMenu","BuyShipConfirm",0)
				if (g_shipconfirm==1) then--卖船确认
					local l_ShipData = DTM4_GetShipData(g_SelectedShipIndex1, FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type)
					SobGroup_EnterHyperSpaceOffMap(shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2)
					SobGroup_SobGroupAdd("Sob_PlayerShipRemove",shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2)
					SobGroup_SwitchOwner(shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2,max(1,SobGroup_OwnedBy(Stations[l_Station].SGName)))
					g_money = g_money + g_ShipSellMultiper*l_ShipData.Price
					DTM4_SetRAMCheatKey()
					UI_SetElementVisible("ChangeTypeMenu","CloseMenu", 1)
					UI_SetButtonPressed( "NewTaskbar", "btnMods", 0)
				elseif (g_shipconfirm==2) then--托管确认
					local l_ShipData = DTM4_GetShipData(g_SelectedShipIndex1, FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type)
					local l_manageindex = getn(ShipManage)+1
					SobGroup_CreateIfNotExist("Sob_ShipManage_"..l_manageindex)
					SobGroup_SetSwitchOwnerFlag("Sob_ShipManage_"..l_manageindex,0)
					SobGroup_SobGroupAdd("Sob_ShipManage_"..l_manageindex,shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2)
					SobGroup_SobGroupAdd("Sob_PlayerShipRemove",shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2)
					SobGroup_SwitchOwner(shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2,max(1,SobGroup_OwnedBy(Stations[l_Station].SGName)))
					ShipManage[l_manageindex]=
					{
						fName=shiplist[g_SelectedShipIndex1].name.."_"..FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type,
						Level=DTM4_GetMissionName(),
						Position=FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Position,
						Health=FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Health,
						--Subs=FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Subs,
						OwnedBy=max(1,SobGroup_OwnedBy(Stations[l_Station].SGName)),
					}
					if (l_ShipData.needdocked~=nil) then
						ShipManage[l_manageindex].Fuel=FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Fuel
					else
						ShipManage[l_manageindex]["Name"]=FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Name
					end
					DTM4_SetRAMCheatKey()
					UI_SetElementVisible("ChangeTypeMenu","CloseMenu", 1)
					UI_SetButtonPressed( "NewTaskbar", "btnMods", 0)
				elseif (g_shipconfirm==3) then--改造确认
					local l_ShipData = DTM4_GetShipData(g_SelectedShipIndex1, FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type)
					local l_ShipData2 = DTM4_GetShipData(g_SelectedShipIndex1, g_BuyShipType[g_TypeIndex])
					if (g_money>=(l_ShipData2.Price-l_ShipData.Price)*TypeChangePriceRate)and(g_PopPointTotal+l_ShipData2.PopPoint-l_ShipData.PopPoint<=g_PopPointLimit)and(DTM4_GetShipVisible(l_Station,l_ShipData2)==1) then
						--Volume_AddSphere("ShipSpawn",SobGroup_GetPosition(shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2),100)
						--SobGroup_SpawnNewShipInSobGroup(g_currentplayer, l_ShipData2.name, shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2, shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2, "ShipSpawn")
						SobGroup_Clear("UnitReplacementTempGroup")
						SobGroup_SpawnNewShipInSobGroup(g_currentplayer, l_ShipData2.name, shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2, "UnitReplacementTempGroup", "UnitReplacementTempVolume")
						SobGroup_ParadeSobGroup("UnitReplacementTempGroup", shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2, 2)
						Ping_Remove(FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].PingIndex)
						SobGroup_Despawn(shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2)
						SobGroup_SwitchOwner(shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2,max(1,SobGroup_OwnedBy(Stations[l_Station].SGName)))
						SobGroup_Clear(shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2)
						SobGroup_SobGroupAdd(shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2, "UnitReplacementTempGroup")
						FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type = g_BuyShipType[g_TypeIndex]
						FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].PingIndex = Ping_AddSobGroup("", "dtm4_name", shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2)
						Ping_AddDescription(FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].PingIndex,0,FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Name)
						--Volume_Delete("ShipSpawn")
						g_money = g_money + (l_ShipData.Price - l_ShipData2.Price)*TypeChangePriceRate
						DTM4_SetRAMCheatKey()
						DTM4_weightlimitcalc()
						UI_SetElementVisible("ChangeTypeMenu","CloseMenu", 1)
						UI_SetButtonPressed( "NewTaskbar", "btnMods", 0)
					elseif (DTM4_GetShipVisible(iStation,l_ShipData2)==0) then
						Subtitle_Add(Actor_FleetIntel, DTM004[104], 2)
						UI_PlaySound("SFX_ErrorMessage")
					elseif (g_money<(l_ShipData2.Price-l_ShipData.Price)*TypeChangePriceRate) then
						Subtitle_Add(Actor_FleetIntel, DTM004[105], 1)
						UI_PlaySound("SFX_ErrorMessage")
					else
						Subtitle_Add(Actor_FleetIntel, DTM004[106], 1)
						UI_PlaySound("SFX_ErrorMessage")
					end
				elseif (g_shipconfirm==4) then--修理确认
					local l_ShipData = DTM4_GetShipData(g_SelectedShipIndex1, FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Type)
					DTM4_ChangeMoney(ceil((SobGroup_HealthPercentage(shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2)-1)*l_ShipData.Price*g_RepairPriceMultiper))
					SobGroup_SetHealth(shiplist[g_SelectedShipIndex1].name..g_SelectedShipIndex2,1)
					FleetData[shiplist[g_SelectedShipIndex1].name][g_SelectedShipIndex2].Health=1
					DTM4_SetRAMCheatKey()
				end
				g_shipconfirm = 0
			elseif (UI_IsNamedElementVisible("BuyShipConfirmMenu","BuyShipCancel")==1) then--取消
				UI_SetElementVisible("BuyShipConfirmMenu","BuyShipCancel",0)
				g_shipconfirm = 0
			end
		end
	end
end
--玩家舰队监控
function DTM4_WatchFleetSize()
	DTM4_UpdateShipSelect()
	DTM4_WatchGoodsMenu()
	if (iShipIndex==9) then
		iShipIndex = 0
	else
		iShipIndex = iShipIndex + 1
	end
	local iShip = {}
	local iIndex = 1
	while (shiplist[iShipIndex*iShipNumUnit+iIndex]~=nil)and(iIndex<=iShipNumUnit) do
		iShip = shiplist[iShipIndex*iShipNumUnit+iIndex]
		local l_FleetSize = getn(FleetData[iShip.name])
		local l_ShipNum = DTM4_GetShipNumber(g_currentplayer, iShipIndex*iShipNumUnit+iIndex)
		if (l_ShipNum<l_FleetSize) then
	    for i=l_FleetSize,1,-1 do
				if (SobGroup_GroupInGroup("Sob_PlayerShipRemove",iShip.name..i)==1) then
					    SobGroup_Clear("Sob_PlayerShipRemove")
              SobGroup_Clear(iShip.name..i)
					local l_ShipData=DTM4_GetShipData(iShipIndex*iShipNumUnit+iIndex,FleetData[iShip.name][i].Type)
					if (l_ShipData.needdocked==nil) then
						Ping_Remove(FleetData[iShip.name][i].PingIndex)
						if (i~=l_FleetSize) then
							SobGroup_SobGroupAdd(iShip.name..i,iShip.name..l_FleetSize)
							FleetData[iShip.name][i].Name = FleetData[iShip.name][l_FleetSize].Name
							Ping_Remove(FleetData[iShip.name][l_FleetSize].PingIndex)
							FleetData[iShip.name][i].PingIndex = Ping_AddSobGroup("", "dtm4_name", iShip.name..i)
							Ping_AddDescription(FleetData[iShip.name][i].PingIndex,0,FleetData[iShip.name][i].Name)
						end
					else
						Ping_Remove(FleetData[iShip.name][i].PingIndex)
						if (i~=l_FleetSize) then
							SobGroup_SobGroupAdd(iShip.name..i,iShip.name..l_FleetSize)
							FleetData[iShip.name][i].Fuel = FleetData[iShip.name][l_FleetSize].Fuel
							Ping_Remove(FleetData[iShip.name][l_FleetSize].PingIndex)
							FleetData[iShip.name][i].PingIndex = Ping_AddSobGroup("", "dtm4_name", iShip.name..i)
						end
					end
					FleetData[iShip.name][l_FleetSize] = nil
					SobGroup_Clear(iShip.name..l_FleetSize)
					DTM4_weightlimitcalc()
				elseif (SobGroup_HealthPercentage(iShip.name..i)==0)then
					local l_ShipData=DTM4_GetShipData(iShipIndex*iShipNumUnit+iIndex,FleetData[iShip.name][i].Type)
					if (l_ShipData.needdocked==nil) then
						Ping_Remove(FleetData[iShip.name][i].PingIndex)
						if (i~=l_FleetSize) then
							SobGroup_SobGroupAdd(iShip.name..i,iShip.name..l_FleetSize)
							FleetData[iShip.name][i].Name = FleetData[iShip.name][l_FleetSize].Name
							Ping_Remove(FleetData[iShip.name][l_FleetSize].PingIndex)
							FleetData[iShip.name][i].PingIndex = Ping_AddSobGroup("", "dtm4_name", iShip.name..i)
							Ping_AddDescription(FleetData[iShip.name][i].PingIndex,0,FleetData[iShip.name][i].Name)
						end
					else
						Ping_Remove(FleetData[iShip.name][i].PingIndex)
						if (i~=l_FleetSize) then
							SobGroup_SobGroupAdd(iShip.name..i,iShip.name..l_FleetSize)
							FleetData[iShip.name][i].Fuel = FleetData[iShip.name][l_FleetSize].Fuel
							Ping_Remove(FleetData[iShip.name][l_FleetSize].PingIndex)
							FleetData[iShip.name][i].PingIndex = Ping_AddSobGroup("", "dtm4_name", iShip.name..i)
						end
					end
					local l_Position = FleetData[iShip.name][i].Position
					FleetData[iShip.name][l_FleetSize] = nil
					SobGroup_Clear(iShip.name..l_FleetSize)
					DTM4_LoseGoodsFactory(l_Position,iShip.cap,iShip.fcap)
					DTM4_weightlimitcalc()
				end
	    end
		elseif (l_ShipNum>l_FleetSize) then
	    if (l_ShipNum-l_FleetSize==1) then
				SobGroup_Create(iShip.name..l_ShipNum)
				SobGroup_SetSwitchOwnerFlag(iShip.name..l_ShipNum,0)
				DTM4_FillPlayerShipsByType(iShip.name, g_currentplayer, iShip)
				if(l_FleetSize>0)then
					for i=1,l_FleetSize do
				    SobGroup_SobGroupAdd("DTM4_TempGroup",iShip.name..i)
					end
				end
			  SobGroup_FillSubstract(iShip.name..l_ShipNum, iShip.name, "DTM4_TempGroup")
			  if(SobGroup_Empty(iShip.name..l_ShipNum)==0)then
					FleetData[iShip.name][l_ShipNum] = {}
					FleetData[iShip.name][l_ShipNum].Type = DTM4_GetShipType(iShipIndex*iShipNumUnit+iIndex, iShip.name..l_ShipNum)
					local l_ShipData=DTM4_GetShipData(iShipIndex*iShipNumUnit+iIndex,FleetData[iShip.name][l_ShipNum].Type)
					if (l_ShipData.needdocked==nil) then
						FleetData[iShip.name][l_ShipNum].Name = g_BuyShipName
						FleetData[iShip.name][l_ShipNum].PingIndex = Ping_AddSobGroup("","dtm4_name",iShip.name..l_ShipNum)
					else
						FleetData[iShip.name][l_ShipNum].Fuel = {}
						for iFuelIndex,iFueldata in iShip.GTWhileMoving do
							FleetData[iShip.name][l_ShipNum].Fuel[iFuelIndex] = iFueldata[3]
						end
						FleetData[iShip.name][l_ShipNum].PingIndex = Ping_AddSobGroup("","dtm4_fuel",iShip.name..l_ShipNum)
					end
					g_GoodsTime[iIndex][iShipIndex+1] = floor(Universe_GameTime()+g_DeltaT/5)
					DTM4_weightlimitcalc()
					UI_SetElementEnabled("TradeMenu","BuyShipButton",1)
				end
	    else
				_ALERT("系统性错误1 - 玩家瞬间获得了超过1艘的同型船只")
	    end
		end
		iIndex = iIndex + 1
  end
	iIndex = 1
	while (shiplist[iShipIndex*iShipNumUnit+iIndex]~=nil)and(iIndex<=iShipNumUnit) do    --当该舰的名字处于处于战列列表清单之中的时候
			iShip = shiplist[iShipIndex*iShipNumUnit+iIndex]                                 --战舰名字匹配编号
			for l,i in FleetData[iShip.name] do
				if (g_GoodsTime[iIndex][iShipIndex+1]<(Universe_GameTime()+g_DeltaT/5)) then
					i.Position = SobGroup_GetPosition(iShip.name..l)
					local l_ShipData = DTM4_GetShipData(iShipIndex*iShipNumUnit+iIndex, i.Type)
					local l_DeltaT = (floor(Universe_GameTime()+g_DeltaT/5)-g_GoodsTime[iIndex][iShipIndex+1])/288
					local iMoveFlag = 0
					local iRepairFlag = DTM4_GTFlagCulc(l_DeltaT, l_ShipData.GTWhileRepairing,iShip.name..l,"Repair")
					local iFireFlag = DTM4_GTFlagCulc(l_DeltaT, l_ShipData.GTWhileFiring,iShip.name..l,"Fire")   --战舰开火能力
					local iHPJumpFlag = DTM4_GTFlagCulc(l_DeltaT, l_ShipData.GTWhileHPJump,iShip.name..l,"HPJump")
					local iCloakFlag = DTM4_GTFlagCulc(l_DeltaT, l_ShipData.GTWhileCloaking,iShip.name..l,"Cloak")
					local iDSFlag = DTM4_GTFlagCulc(l_DeltaT, l_ShipData.GTWhileDSOpening,iShip.name..l,"OpenDS")
					if (l_ShipData.needdocked==nil) then
						iMoveFlag = DTM4_GTFlagCulc(l_DeltaT, l_ShipData.GTWhileMoving,iShip.name..l,"Move")
					else
						iMoveFlag = DTM4_GTFlagCulc2(l_DeltaT, i.Fuel,iShip.name..l,"Move")
					end
					for j,k in l_ShipData.GTAnyTime do
					  g_goodstake[k[1]] = g_goodstake[k[1]]+k[2]*l_DeltaT
					end
					--限制攻击
					if (SobGroup_CanDoAbility(iShip.name..l, AB_Attack)==1) then
						if (iFireFlag==0) then
							SobGroup_AbilityActivate(iShip.name..l, AB_Attack, 0)
							SobGroup_AbilityActivate(iShip.name..l, AB_SpecialAttack, 0)
							SobGroup_Stop(g_currentplayer, iShip.name..l)
						elseif ((SobGroup_IsDoingAbility(iShip.name..l, AB_Attack)==1)or(SobGroup_IsDoingAbility(iShip.name..l, AB_SpecialAttack)==1))and(UI_IsScreenActive("TradeMenu")==0) then
							for j,k in l_ShipData.GTWhileFiring do
							  g_goodstake[k[1]] = g_goodstake[k[1]]+k[2]*l_DeltaT
							end
						end
					elseif (iFireFlag==1) then
						SobGroup_AbilityActivate(iShip.name..l, AB_Attack, 1)
						SobGroup_AbilityActivate(iShip.name..l, AB_SpecialAttack, 1)
					end
					--限制移动
					if (l_ShipData.needdocked==nil) then--非停泊类
						if (iMoveFlag==0) then
							--SobGroup_SetSpeed(iShip.name..l, 0.5)
						else
							--SobGroup_SetSpeed(iShip.name..l, 1)
							if (SobGroup_GetActualSpeed(iShip.name..l)>1)and(UI_IsScreenActive("TradeMenu")==0) then
								for j,k in l_ShipData.GTWhileMoving do
								  g_goodstake[k[1]] = g_goodstake[k[1]]+k[2]*l_DeltaT
								end
							end
						end
					else--停泊类
						--if(SobGroup_IsDoingAbility(iShip.name..l, AB_Dock)==1)then--若正停泊，向目标保持停泊
						--	SobGroup_Clear("DTM4_TempGroup")
						--	SobGroup_GetCommandTargets("DTM4_TempGroup", iShip.name..l, COMMAND_Dock)--问题：不好用
						--	if(SobGroup_Empty("DTM4_TempGroup")==0)then
						--		SobGroup_DockSobGroupAndStayDocked(iShip.name..l, "DTM4_TempGroup")
						--	end
						--end
						if (iMoveFlag==0) then--无燃料
							if(SobGroup_CanDoAbility(iShip.name..l, AB_Steering)==1)then
								if(DTM4_CanRefuel(iShip.name..l,l_ShipData.needdocked)==0)or(DTM4_HaveFuel(l_ShipData.GTWhileMoving)==0)then
									SobGroup_SetSpeed(iShip.name..l, 0)
									SobGroup_AbilityActivate(iShip.name..l, AB_Steering, 0)
								end
							else
								if(DTM4_CanRefuel(iShip.name..l,l_ShipData.needdocked)==1)and(DTM4_HaveFuel(l_ShipData.GTWhileMoving)==1)then
									SobGroup_SetSpeed(iShip.name..l, 0.5)
								--SobGroup_ManualEngineGlow(iShip.name..l, 0)
									SobGroup_AbilityActivate(iShip.name..l, AB_Steering, 1)
								end
							end
						else
							if (SobGroup_GetActualSpeed(iShip.name..l)>25)and(UI_IsScreenActive("TradeMenu")==0) then--有速度
								for j,k in l_ShipData.GTWhileMoving do
									i.Fuel[j] = max(0,i.Fuel[j] - k[2]*l_DeltaT)
								end
							end
							if(SobGroup_CanDoAbility(iShip.name..l, AB_Steering)==0) then
								SobGroup_SetSpeed(iShip.name..l, 1)
								SobGroup_AbilityActivate(iShip.name..l, AB_Steering, 1)
							end
						end
						local iDockedWith = DTM4_GetSobGroupDockedWith(iShip.name..l)
						if(iDockedWith~=nil)and(iDockedWith~="")then--若停泊己方船只，加燃料
							DTM4_AddFuel(iShip.name,l,l_ShipData.GTWhileMoving)
							SobGroup_SetSpeed(iShip.name..l, 1)
							if (iRepairFlag==0) then--若无修理材料，强制血量
								if(SobGroup_HealthPercentage(iShip.name..l)>FleetData[iShip.name][l].Health)then
									SobGroup_SetHealth(iShip.name..l,FleetData[iShip.name][l].Health)
								end
							elseif (SobGroup_HealthPercentage(iShip.name..l)<1)and(UI_IsScreenActive("TradeMenu")==0) then--停泊维修消耗
								for j,k in l_ShipData.GTWhileRepairing do
									g_goodstake[k[1]] = g_goodstake[k[1]]+k[2]*l_DeltaT
								end
							end
							--SobGroup_ManualEngineGlow(iShip.name..l, 1)
							--if(SobGroup_GetTactics(iDockedWith)==0)then--攻击性，加完燃料立刻出击
							--	SobGroup_Launch(iShip.name..l,iDockedWith)
							--elseif(SobGroup_GetTactics(iDockedWith)==1)then--防御性，加完燃料，修复完毕再出击
							--	if(SobGroup_HealthPercentage(iShip.name..l)==1)then
							--		SobGroup_Launch(iShip.name..l,iDockedWith)
							--	end
							--被动，不出击
							if(SobGroup_GetTactics(iDockedWith)==2)then--若被动，保持停泊
								SobGroup_ForceStayDockedIfDocking(iShip.name..l)
							--elseif(SobGroup_HealthPercentage(iShip.name..l)==1)then--否则满血满油即出击
							--	SobGroup_Launch(iShip.name..l,iDockedWith)
							end
						--elseif(SobGroup_IsDocked(iShip.name..l)==1)then--若停泊NPC船只，询问是否花钱加燃料
							--DTM4_AddFuel(iShip.name,l,l_ShipData.GTWhileMoving)
						elseif(SobGroup_GroupInGroup(iShip.name..l,"DTM4_Refuel")==1)then--特殊情况下超驰加燃料
							DTM4_AddFuel(iShip.name,l,l_ShipData.GTWhileMoving)
						elseif(SobGroup_SalvagedByPlayer(iShip.name..l, g_currentplayer)==1)then--若打捞，重新入库
							DTM4_DockSalvagedShip(iShip.name..l)
						end
						FleetData[iShip.name][l].Health=SobGroup_HealthPercentage(iShip.name..l)
					end
					--限制维修
					if (SobGroup_CanDoAbility(iShip.name..l, AB_Repair)==1) then
						if (iRepairFlag==0) then
							SobGroup_AbilityActivate(iShip.name..l, AB_Repair, 0)
							SobGroup_Stop(g_currentplayer, iShip.name..l)
						elseif (SobGroup_IsRepairingAndLatched(iShip.name..l)==1)and(UI_IsScreenActive("TradeMenu")==0) then
							for j,k in l_ShipData.GTWhileRepairing do
							  g_goodstake[k[1]] = g_goodstake[k[1]]+k[2]*l_DeltaT
							end
						end
					elseif (iRepairFlag==1) then
						SobGroup_AbilityActivate(iShip.name..l, AB_Repair, 1)
					end
					--限制超跳
					if (SobGroup_CanDoAbility(iShip.name..l, AB_Hyperspace)==1) then
						if (iHPJumpFlag==0) then
							if(DTM4_HPCheck(l_ShipData.GTWhileHPJump)==1)then
								SobGroup_AbilityActivate(iShip.name..l, AB_Hyperspace, 0)
							end
						elseif (i.Gone==0) then
							if (SobGroup_AreAllInHyperspace(iShip.name..l)==1)and(SobGroup_IsDoingAbility(iShip.name..l, AB_HyperspaceViaGate)==0)and(g_Intercept==0) then
								for j,k in l_ShipData.GTWhileHPJump do
								  g_goodstake[k[1]] = g_goodstake[k[1]]+k[2]*l_DeltaT
								end
							end
						end
					elseif (iHPJumpFlag==1) then
						if(DTM4_HPCheck(l_ShipData.GTWhileHPJump)==1)then
							SobGroup_AbilityActivate(iShip.name..l, AB_Hyperspace, 1)
						end
					end
					--限制隐形
					if (SobGroup_CanDoAbility(iShip.name..l, AB_Cloak)==1) then
						if (iCloakFlag==0) then
							SobGroup_AbilityActivate(iShip.name..l, AB_Cloak, 0)
							SobGroup_Stop(g_currentplayer, iShip.name..l)
						elseif (SobGroup_IsDoingAbility(iShip.name..l, AB_Cloak)==1)and(UI_IsScreenActive("TradeMenu")==0) then
							for j,k in l_ShipData.GTWhileCloaking do
							  g_goodstake[k[1]] = g_goodstake[k[1]]+k[2]*l_DeltaT
							end
						end
					elseif (iCloakFlag==1) then
						SobGroup_AbilityActivate(iShip.name..l, AB_Cloak, 1)
					end
					--限制防御场
					if (SobGroup_CanDoAbility(iShip.name..l, AB_DefenseField)==1) then
						if (iDSFlag==0) then
							SobGroup_AbilityActivate(iShip.name..l, AB_DefenseField, 0)
							SobGroup_Stop(g_currentplayer, iShip.name..l)
						elseif (SobGroup_IsDoingAbility(iShip.name..l, AB_DefenseField)==1)and(UI_IsScreenActive("TradeMenu")==0) then
							for j,k in l_ShipData.GTWhileDSOpening do
							  g_goodstake[k[1]] = g_goodstake[k[1]]+k[2]*l_DeltaT
							end
						end
					elseif (iDSFlag==1) then
						SobGroup_AbilityActivate(iShip.name..l, AB_DefenseField, 1)
					end
				end
			end
			g_GoodsTime[iIndex][iShipIndex+1] = floor(Universe_GameTime()+g_DeltaT/5)
			iIndex = iIndex + 1
  end
  DTM4_GoodsTake()
  if (UI_IsScreenActive("TradeMenu")==0) then
		DTM4_GoodsCreate()
  	if (UI_IsScreenActive("GoodLoadMenu")==0) then
  		DTM4_WhichStation()
  	end
  end
  if (Player_GetRU(g_currentplayer)~=1000000) then
		Player_SetRU(g_currentplayer,2880*(g_goods[g_GoodIndexForHPJump]-g_goodstake[g_GoodIndexForHPJump]))
  end
  UI_SetTextLabelText("ResourceMenu","lblResourceUnitsSize_Money",""..floor(g_money))
end
--货物生产
function DTM4_GoodsCreate()
	local iFactory = 1
	local kShip=1
	local l_weight = 0
	local l_Flag1 = 1
	local l_Flag2 = 1
	while (Factory[kShip].Name==nil) do
		kShip = kShip + 1
	end
	kShip = kShip - 1
	while (g_Factory[iFactory]~=nil) do
	  l_weight = 0
	  l_Flag1 = 1
	  l_Flag2 = 1
		if (g_Factory[iFactory]>0) then
			  for j,k in Factory[iFactory+kShip].GoodsCreate do
					l_weight = l_weight+g_Factory[iFactory]*k[2]*Goods[k[1]].weight/2880
					if (g_goods[k[1]]>=g_goodskeep[k[1]])and(g_goodskeep[k[1]]~=-1) then
					  l_Flag1 = 0
					end
					if (g_goodscreate[k[1]]==0) then
						l_Flag2 = 0
					end
			  end
			  for j,k in Factory[iFactory+kShip].GoodsTake do
					l_weight = l_weight-g_Factory[iFactory]*k[2]*Goods[k[1]].weight/2880
					if ((g_goods[k[1]]==0)and(g_goodstake[k[1]]==0)) then
					  l_Flag2 = 0
					  l_Flag1 = 0
					  if (g_goodswarn[k[1]]~=1) then
							g_goodswarn[k[1]] = 2
					  end
					end
					if ((g_goods[k[1]]<g_goodskeep[k[1]])and(l_Flag2==0)) then
						l_Flag1 = 0
						break
					end
			  end
				DTM4_weightcalc()
				if (max(l_Flag1,l_Flag2)==1)and((l_weight<0)or(g_weight+l_weight<=g_weightlimit)) then
				  for j,k in Factory[iFactory+kShip].GoodsCreate do
						g_goodstake[k[1]] = g_goodstake[k[1]] - g_Factory[iFactory]*k[2]/2880
						g_goodscreate[k[1]] = max(0,g_goodscreate[k[1]] - g_Factory[iFactory]*k[2]/2880)
				  end
				  for j,k in Factory[iFactory+kShip].GoodsTake do
						g_goodstake[k[1]] = g_goodstake[k[1]] + g_Factory[iFactory]*k[2]/2880
				  end
				end
		end
		iFactory = iFactory + 1
  end
end
--货物消耗
function DTM4_GoodsTake()
	local iGood = 1
	local l_goodstake = 0
	local iShip2 = 1
	local warntext = ""
	local iwarn = {0,0,0,0,0,0,0}
	local iwarn1 = 0
	local iwarn2 = 0
	local igwarn = {}
	while (Goods[iGood]~=nil) do
		igwarn[iGood] = {0,0,0,0,0,0,0}
	  while (shiplist[iShip2]~=nil) do
	  	for k,l in FleetData[shiplist[iShip2].name] do
	  		local l_ShipData = DTM4_GetShipData(iShip2, l.Type)
				for i,j in l_ShipData.GTAnyTime do
					if (j[1]==iGood) then
						l_goodstake = l_goodstake + Goods[iGood].RUTake*j[2]
						igwarn[iGood][1] = 1
					end
				end
				for i,j in l_ShipData.GTWhileFiring do
					if (j[1]==iGood) then
					    igwarn[iGood][2] = 1
					end
				end
				for i,j in l_ShipData.GTWhileMoving do
					if (j[1]==iGood) then
					    igwarn[iGood][3] = 1
					  end
				end
				for i,j in l_ShipData.GTWhileRepairing do
					if (j[1]==iGood) then
					    igwarn[iGood][4] = 1
					  end
				end
				for i,j in l_ShipData.GTWhileHPJump do
					if (j[1]==iGood)and(j[1]~=g_GoodIndexForDockUnitHP) then
					    igwarn[iGood][5] = 1
					end
				end
				for i,j in l_ShipData.GTWhileCloaking do
					if (j[1]==iGood) then
					    igwarn[iGood][6] = 1
					  end
				end
				for i,j in l_ShipData.GTWhileDSOpening do
					if (j[1]==iGood) then
					    igwarn[iGood][7] = 1
					end
				end
			end
			iShip2 = iShip2 + 1
	  end
	  if (max(igwarn[iGood][1],igwarn[iGood][2],igwarn[iGood][3],igwarn[iGood][4],igwarn[iGood][5],igwarn[iGood][6],igwarn[iGood][7])==1)and(g_goodswarn[iGood]==0)and(g_goods[iGood]==0)and(g_goodstake[iGood]>=0) then
			iwarn1 = 1
			g_goodswarn[iGood]=1
			for i=1,7 do
				iwarn[i]=max(iwarn[i],igwarn[iGood][i])
			end
			if (warntext=="") then
		    warntext = warntext..Goods[iGood].name
			else
		    warntext = warntext..DTM004[5]..Goods[iGood].name
			end
	  elseif (max(igwarn[iGood][1],igwarn[iGood][2],igwarn[iGood][3],igwarn[iGood][4],igwarn[iGood][5],igwarn[iGood][6],igwarn[iGood][7])==1)and(g_goodswarn[iGood]==2)and(g_goods[iGood]==0)and(g_goodstake[iGood]>=0) then
			iwarn1 = 1
			iwarn2 = 1
			g_goodswarn[iGood]=1
			for i=1,7 do
				iwarn[i]=max(iwarn[i],igwarn[iGood][i])
			end
			if (warntext=="") then
		    warntext = warntext..Goods[iGood].name
			else
		    warntext = warntext..DTM004[5]..Goods[iGood].name
			end
	  end
		while (g_goodstake[iGood]>0) do
			if (g_goods[iGood]>0) then
				g_goodstake[iGood] = g_goodstake[iGood] - 1
		    g_goods[iGood] = g_goods[iGood] - 1
			elseif (g_goodstake[iGood]>0) then
		    if (Goods[iGood].TakeRU==1)and(g_money>0) then
		    	DTM4_ChangeMoney(-1*ceil(g_goodstake[iGood]*Goods[iGood].RUTake))
		    	g_goodstake[iGood] = ((g_goodstake[iGood]*Goods[iGood].RUTake)-ceil(g_goodstake[iGood]*Goods[iGood].RUTake))/Goods[iGood].RUTake
		    else
		    	g_goodstake[iGood] = 0
		    end
			end
		end
		while (g_goodstake[iGood]<=-1) do
			g_goodstake[iGood] = g_goodstake[iGood] + 1
			g_goods[iGood] = g_goods[iGood] + 1
	  end
	  if(g_goodswarn[iGood]==1)and(g_goods[iGood]>0)then
	  	g_goodswarn[iGood] = 0
	  end
	  iGood = iGood + 1
	end
  if (iwarn1==1)and(UI_IsScreenActive("GateMenu2")==0) then
		DTM4_Warn(DTM004[40](warntext,iwarn,iwarn2,l_goodstake))
  end
end
--货仓界面监控
function DTM4_WatchGoodsMenu()
		if (UI_IsScreenActive("GoodsMenu")==1) then
			if (UI_IsNamedElementVisible("GoodsMenu","playercommand")==0) then
				local NoneFlag = 0
		    local iSG = 1
		    while (Goods[iSG]~=nil) do
			    if (g_goods[iSG]==0)and(g_goodstake[iSG]==0) then
			    	if (UI_IsNamedElementVisible("GoodsMenu","FGItem"..iSG)==1) then
			        UI_SetElementVisible("GoodsMenu","FGItem"..iSG, 0)
			        UI_SetElementSize("GoodsMenu","FGItem"..iSG,150,0)
							UI_SetElementVisible("GoodsMenu","FGINT",1)
						end
			    else
			    		NoneFlag = 1
			        UI_SetTextLabelText("GoodsMenu","FGItem"..iSG.."Num",""..g_goods[iSG])
							if (UI_IsNamedElementVisible("GoodsMenu","FGItem"..iSG)==0) then
								UI_SetElementSize("GoodsMenu","FGItem"..iSG,150,dtm4_FGItemHeight)
								UI_SetElementVisible("GoodsMenu","FGItem"..iSG, 1)
							else
								UI_SetTextLabelText("GoodsMenu","FGItem"..iSG.."Num",""..g_goods[iSG])
							end
							if (UI_IsNamedElementVisible("GoodsMenu","FG"..iSG.."Graph")==1) then
								if (g_goodstake[iSG]==0) then
									UI_SetTextLabelText("GoodsMenu","FGRate",DTM004[68](100))
									UI_SetElementSize("GoodsMenu","FGRateProgress",75,0)
								else
									UI_SetTextLabelText("GoodsMenu","FGRate",DTM004[68](floor(-g_goodstake[iSG]*100)))
									UI_SetElementSize("GoodsMenu","FGRateProgress",75,dtm4_GoodRateProgress-floor(-g_goodstake[iSG]*dtm4_GoodRateProgress))
								end
								if (g_goodskeep[iSG]==-1) then
									UI_SetTextLabelText("GoodsMenu","FGManage",DTM004[69]("--"))
								else
									UI_SetTextLabelText("GoodsMenu","FGManage",DTM004[69](g_goodskeep[iSG]))
								end
								UI_SetTextLabelText("GoodsMenu","FGQueue",DTM004[71](ceil(g_goodscreate[iSG])))
							end
			    end
					iSG = iSG + 1
				end
		    UI_SetTextLabelText("GoodsMenu","GoodsWeight",""..g_weight)
		    UI_SetTextLabelText("GoodsMenu","WeightLimit",""..g_weightlimit)
			  UI_SetElementSize("GoodsMenu","GoodsWeightProgress",floor(dtm4_CargoBayBarLengh*g_weight/g_weightlimit),dtm4_CargoBayBarHeight)
			  if (NoneFlag == 0) then
			  	UI_SetElementVisible("GoodsMenu","FGNone",1)
				end
			else
		    UI_SetElementVisible("GoodsMenu","playercommand", 0)
				if (UI_IsNamedElementVisible("GoodsMenu","NumInput")==1) then
				    UI_SetElementVisible("GoodsMenu","NumInput",0)
			    	DTM4_InputKeyBind()
		    end
				if (UI_IsNamedElementVisible("GoodsMenu","Throw")==1) then
				    UI_SetElementVisible("GoodsMenu","Throw",0)
						local iSG=1
						while (UI_IsNamedElementVisible("GoodsMenu","FG"..iSG.."Graph")==0) do
							iSG = iSG + 1
						end
				    DTM4_DropCrate(iSG,g_InputNum,SobGroup_GetPosition(DTM4_GetCrateDropGroup(Goods[iSG].weight*g_InputNum)))
				    DTM4_NumKeyUnBind()
						UI_SetElementEnabled("GoodsMenu","ThrowButton",0)
						UI_SetElementEnabled("GoodsMenu","ManageButton",0)
						UI_SetElementEnabled("GoodsMenu","QueueButton",0)
						UI_SetTextLabelText("GoodsMenu","InputNum","")
				end
				if (UI_IsNamedElementVisible("GoodsMenu","Queue")==1) then
					  UI_SetElementVisible("GoodsMenu","Queue",0)
						local iSG=1
						while (UI_IsNamedElementVisible("GoodsMenu","FG"..iSG.."Graph")==0) do
							iSG = iSG + 1
						end
						g_goodscreate[iSG] = g_goodscreate[iSG] + g_InputNum
						DTM4_NumKeyUnBind()
						UI_SetElementEnabled("GoodsMenu","ThrowButton",0)
						UI_SetElementEnabled("GoodsMenu","ManageButton",0)
						UI_SetElementEnabled("GoodsMenu","QueueButton",0)
						UI_SetTextLabelText("GoodsMenu","InputNum","")
				end
				if (UI_IsNamedElementVisible("GoodsMenu","Manage")==1) then
				    UI_SetElementVisible("GoodsMenu","Manage",0)
						local iSG=1
						while (UI_IsNamedElementVisible("GoodsMenu","FG"..iSG.."Graph")==0) do
							iSG = iSG + 1
						end
				    g_goodskeep[iSG] = g_InputNum
				    DTM4_NumKeyUnBind()
						UI_SetElementEnabled("GoodsMenu","ThrowButton",0)
						UI_SetElementEnabled("GoodsMenu","ManageButton",0)
						UI_SetElementEnabled("GoodsMenu","QueueButton",0)
						UI_SetTextLabelText("GoodsMenu","InputNum","")
				end
				if (UI_IsNamedElementVisible("GoodsMenu","CancelQueue")==1) then
					  UI_SetElementVisible("GoodsMenu","CancelQueue",0)
						local iSG=1
						while (UI_IsNamedElementVisible("GoodsMenu","FG"..iSG.."Graph")==0) do
							iSG = iSG + 1
						end
						g_goodscreate[iSG] = 0
				end
				if (UI_IsNamedElementVisible("GoodsMenu","CancelManage")==1) then
				    UI_SetElementVisible("GoodsMenu","CancelManage",0)
						local iSG=1
						while (UI_IsNamedElementVisible("GoodsMenu","FG"..iSG.."Graph")==0) do
							iSG = iSG + 1
						end
				    g_goodskeep[iSG] = -1
				end
				if (UI_IsNamedElementVisible("GoodsMenu","NumDEL")==1) then
					UI_SetElementVisible("GoodsMenu","NumDEL",0)
					g_InputNum = floor(g_InputNum/10)
					UI_SetTextLabelText("GoodsMenu","InputNum",g_InputNum.."")
				end
				if (UI_IsNamedElementVisible("GoodsMenu","NumAC")==1) then
					UI_SetElementVisible("GoodsMenu","NumAC",0)
					g_InputNum = 0
					UI_SetTextLabelText("GoodsMenu","InputNum",g_InputNum.."")
				end
			end
			DTM4_weightcalc()
			DTM4_weightlimitcalc()
		end
end
