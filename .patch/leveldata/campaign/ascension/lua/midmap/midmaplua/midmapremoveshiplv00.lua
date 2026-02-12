

function midmapremoveshipLV00()	
--计算玩家工程力----
	local factorylimitLVtime = g_factorylimit
	local factorylimitLV = 0
	local g_factorylimitLVFull = 0	
	while (g_factorylimitLVList[factorylimitLV+1]<=factorylimitLVtime)and(g_factorylimitLVFull==0) do
		factorylimitLV = factorylimitLV + 1
		if (g_factorylimitLVList[factorylimitLV+1]==nil) then
			g_factorylimitLVFull = 1
		end
	end
	g_factorylimitLV = factorylimitLV+g_factorylimitLVFull 
	       	 _ALERT("g_factorylimitLV")  
	     _ALERT(g_factorylimitLV)   
----------随机可能的残骸规模--玩家工程能力越强残骸规模越大-----------------------------	
       	 _ALERT("midmapremoveshipLV")  
	     _ALERT(midmapremoveshipLV)  
	     battleLVmission = 0
	     midmapremoveshipLVMAX = g_factorylimitLV
	   ------------------防止规模超标--上限11------------------------------------- 
	         if (midmapremoveshipLVMAX  < 11) then  
         midmapremoveshipLVMAX = midmapremoveshipLVMAX
      elseif (midmapremoveshipLVMAX  >= 11) then
      midmapremoveshipLVMAX = 11              
      end	 		    
	    	     
	     midmapremoveshipLVmun = random(1,midmapremoveshipLVMAX)
	     _ALERT("midmapremoveshipLVmun")  
	     _ALERT(midmapremoveshipLVmun)  
	     
	     
	     
	     
--------------------------------------------------------------------------------------	     
if (midmapremoveshipLV < midmapremoveshipLVmun) then 

--------------------划分残骸规模---1到5档-----------------------------------
      if (midmapremoveshipLVmun <= 2) then	
      midmapremoveshipLVTXTLVmun = 1
      elseif (midmapremoveshipLVmun > 2)and(midmapremoveshipLVmun <= 4) then
      midmapremoveshipLVTXTLVmun = 2
      elseif (midmapremoveshipLVmun > 4)and(midmapremoveshipLVmun <= 6) then
      midmapremoveshipLVTXTLVmun = 3 
      elseif (midmapremoveshipLVmun > 6)and(midmapremoveshipLVmun <= 8) then
      midmapremoveshipLVTXTLVmun = 4            
      elseif (midmapremoveshipLVmun > 10) then
      midmapremoveshipLVTXTLVmun = 5
      end       
      
-------------残骸规模说明文字-------------------------------------      
  midmapremoveshipLVmunTXTtime01LV01 = KE04missionTXTLV01A01[001]
  midmapremoveshipLVmunTXTtime01LV02 = KE04missionTXTLV01A01[002]
  midmapremoveshipLVmunTXTtime01LV03 = KE04missionTXTLV01A01[003]
  midmapremoveshipLVmunTXTtime01LV04 = KE04missionTXTLV01A01[004]
  midmapremoveshipLVmunTXTtime01LV05 = KE04missionTXTLV01A01[005] 
   
         local randommidmapremoveshipLVmunTXTtime01LV = 
         {
         midmapremoveshipLVmunTXTtime01LV01,
         midmapremoveshipLVmunTXTtime01LV02,
         midmapremoveshipLVmunTXTtime01LV03,
         midmapremoveshipLVmunTXTtime01LV04, 
         midmapremoveshipLVmunTXTtime01LV05                                                    
         }
         midmapremoveshipLVmunTXT = randommidmapremoveshipLVmunTXTtime01LV[midmapremoveshipLVTXTLVmun] 

  UI_SetElementVisible("fairyMenu01","m_lblTitle",0)
  UI_SetElementVisible("fairyMenu01","m_lblSubTitle",0)
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[298](midmapremoveshipLVmunTXT,midmapremoveshipLVmun))
  UI_ShowScreen("fairyMenu01", ePopup)		
  ----------------计算各种商品的基础数据-------------------------
  basegood22LV = 0
  basegood22mun = 50
  basegood22W = 5
  basegood33LV = 0
  basegood33mun = 50
  basegood33W = 0.5  
  basegood29LV = -1
  basegood29mun = 5
  basegood29W = 100   
  basegood34LV = -1
  basegood34mun = 50
  basegood34W = 0.01  
  basegood26LV = -2
  basegood26mun = 5
  basegood26W = 50
  basegood76LV = -2
  basegood76mun = 5
  basegood76W = 10  
  basegood30LV = -3
  basegood30mun = 1
  basegood30W = 200   
  basegood27LV = -4
  basegood27mun = 1
  basegood27W = 10  
  basegood23LV = -5
  basegood23mun = 10
  basegood23W = 10
  basegood51LV = -6
  basegood51mun = 1
  basegood51W = 500  
  basegood52LV = -7
  basegood52mun = 1
  basegood52W = 500   
  basegood53LV = -8
  basegood53mun = 1
  basegood53W = 1000
  basegood36LV = -9
  basegood36mun = 1
  basegood36W = 50          
    ----------------执行判断代码--玩家是否要就打捞-----------------------	 
Rule_AddInterval("midmapremoveshipLV00_1",1)   --vgrattackbasemissionbattle
Rule_Remove("midmapremoveshipLV00")  
else 
----------不打捞就直接离开-----------------------	
exploremission = 0
Rule_AddInterval("midmapexploreLV00_1",1)
Rule_Remove("midmapremoveshipLV00")            
end
end

-----------------选择是否打捞------------------------------------
function PATCH_midmapremoveshipLV00_1()
	if (UI_IsNamedElementVisible("midmapSalvage","btnYES")==0) then
		UI_HideScreen('midmapSalvage')		 	   
   		Rule_AddInterval("midmapremoveshipmissionstart",1) 
		Rule_Remove("PATCH_midmapremoveshipLV00_1")		
	elseif (UI_IsNamedElementVisible("midmapSalvage","btnNO")==0) then
		UI_HideScreen('midmapSalvage')
		removeshipbattleTXT = 0
		Rule_AddInterval("midmapexploreLV00_1",1)
		Rule_Remove("PATCH_midmapremoveshipLV00_1")            
	end
end

function midmapremoveshipLV00_1()	
	if (UI_IsNamedElementVisible("fairyMenu01","key01")==0) then
		UI_SetElementVisible("fairyMenu01","key01",1)
		UI_HideScreen('fairyMenu01')	
		----------------------完成第一次打捞后进入随机触发战斗环节---------------------------  		 	   
   		Rule_AddInterval("midmapremoveshipmissionstart",1) 
		Rule_Remove("midmapremoveshipLV00_1")		
	elseif (UI_IsNamedElementVisible("fairyMenu01","key02")==0) then
		UI_SetElementVisible("fairyMenu01","key02",1)
		UI_HideScreen('fairyMenu01')
		removeshipbattleTXT = 0
		Rule_AddInterval("midmapexploreLV00_1",1)
Rule_Remove("midmapremoveshipLV00_1")            
end
end		

-------------------------------------------------------------


--打捞计算代码----
function midmapremoveshipmission()
	
--每打捞一次离开时候随机难度增加一级--每打捞一次有可能获得更高级的物资--
		 	 midmapremoveshipLV = midmapremoveshipLV + 1
		 	  --midmapremoveshipLV = 10
       _ALERT("midmapremoveshipLVadd")  
	     _ALERT(midmapremoveshipLV)
       battleLVmission = battleLVmission + 1
       _ALERT("battleLVmission")  
	     _ALERT(battleLVmission)
-----每个商品都有个独立的随机参数good22-----	     
	     good22LV = basegood22LV + midmapremoveshipLV 
	       if (good22LV > 0) then 
	       good22munbase = random(basegood22mun*good22LV,basegood22mun*midmapremoveshipLV*g_factorylimitLV*good22LV)   
	       good22mun = round(good22munbase)	
         _ALERT("good22mun")  
	       _ALERT(good22mun)	       
	       else
	       good22mun = 0
	       end    
-----每个商品都有个独立的随机参数good33-----	       
	     good33LV = basegood33LV + midmapremoveshipLV
	       if (good33LV > 0) then 
	       good33munbase = random(basegood33mun*good33LV,basegood33mun*midmapremoveshipLV*g_factorylimitLV*good33LV)   
	       good33mun = round(good33munbase)	
         _ALERT("good33mun")  
	       _ALERT(good33mun)	 	             
	       else
	       good33mun = 0
	       end    
-----每个商品都有个独立的随机参数good29-----	       
	     good29LV = basegood29LV + midmapremoveshipLV
	       if (good29LV > 0) then 
	       good29munbase = random(basegood29mun*good29LV,basegood29mun*midmapremoveshipLV*g_factorylimitLV*good29LV)   
	       good29mun = round(good29munbase)
         _ALERT("good29mun")  
	       _ALERT(good29mun)	       	
	       else
	       good29mun = 0
	       end    
-----每个商品都有个独立的随机参数good34-----	       
	     good34LV = basegood34LV + midmapremoveshipLV
	       if (good34LV > 0) then 
	       good34munbase = random(basegood34mun*good34LV,basegood34mun*midmapremoveshipLV*g_factorylimitLV*good34LV)   
	       good34mun = round(good34munbase)	
         _ALERT("good34mun")  
	       _ALERT(good34mun)	       
	       else
	       good34mun = 0
	       end 
-----每个商品都有个独立的随机参数good26-----	     
	     good26LV = basegood26LV + midmapremoveshipLV
	       if (good26LV > 0) then 
	       good26munbase = random(basegood26mun*good26LV,basegood26mun*midmapremoveshipLV*g_factorylimitLV*good26LV)   
	       good26mun = round(good26munbase)	
         _ALERT("good26mun")  
	       _ALERT(good26mun)	       
	       else
	       good26mun = 0
	       end    
-----每个商品都有个独立的随机参数good76-----	       
	     good76LV = basegood76LV + midmapremoveshipLV
	       if (good76LV > 0) then 
	       good76munbase = random(basegood76mun*good76LV,basegood76mun*midmapremoveshipLV*g_factorylimitLV*good76LV)   
	       good76mun = round(good76munbase)	
         _ALERT("good76mun")  
	       _ALERT(good76mun)	       
	       else
	       good76mun = 0
	       end    
-----每个商品都有个独立的随机参数good30-----	       
	     good30LV = basegood30LV + midmapremoveshipLV
	       if (good30LV > 0) then 
	       good30munbase = random(basegood30mun*good30LV,basegood30mun*midmapremoveshipLV*g_factorylimitLV*good30LV)   
	       good30mun = round(good30munbase)	
        _ALERT("good30mun")  
	       _ALERT(good30mun)	       
	       else
	       good30mun = 0
	       end    
-----每个商品都有个独立的随机参数good27-----	       
	     good27LV = basegood27LV + midmapremoveshipLV
	       if (good27LV > 0) then 
	       good27munbase = random(basegood27mun*good27LV,basegood27mun*midmapremoveshipLV*g_factorylimitLV*good27LV)   
	       good27mun = round(good27munbase)	
         _ALERT("good27mun")  
	       _ALERT(good27mun)	       
	       else
	       good27mun = 0
	       end  
-----每个商品都有个独立的随机参数good23-----	     
	     good23LV = basegood23LV + midmapremoveshipLV
	       if (good23LV > 0) then 
	       good23munbase = random(basegood23mun*good23LV,basegood23mun*midmapremoveshipLV*g_factorylimitLV*good23LV)   
	       good23mun = round(good23munbase)	
         _ALERT("good23mun")  
	       _ALERT(good23mun)	       
	       else
	       good23mun = 0
	       end    
-----每个商品都有个独立的随机参数good51-----	       
	     good51LV = basegood51LV + midmapremoveshipLV
	       if (good51LV > 0) then 
	       good51munbase = random(basegood51mun*good51LV,basegood51mun*midmapremoveshipLV*g_factorylimitLV*good51LV)   
	       good51mun = round(good51munbase)	
         _ALERT("good51mun")  
	       _ALERT(good51mun)	       
	       else
	       good51mun = 0
	       end    
-----每个商品都有个独立的随机参数good52-----	       
	     good52LV = basegood52LV + midmapremoveshipLV
	       if (good52LV > 0) then 
	       good52munbase = random(basegood52mun*good52LV,basegood52mun*midmapremoveshipLV*g_factorylimitLV*good52LV)   
	       good52mun = round(good52munbase)	
         _ALERT("good52mun")  
	       _ALERT(good52mun)	       
	       else
	       good52mun = 0
	       end    
-----每个商品都有个独立的随机参数good53-----	       
	     good53LV = basegood53LV + midmapremoveshipLV
	       if (good53LV > 0) then 
	       good53munbase = random(basegood53mun*good53LV,basegood53mun*midmapremoveshipLV*g_factorylimitLV*good53LV)   
	       good53mun = round(good53munbase)	
         _ALERT("good53mun")  
	       _ALERT(good53mun)	       
	       else
	       good53mun = 0
	       end 
-----每个商品都有个独立的随机参数good36-----	       
	     good36LV = basegood36LV + midmapremoveshipLV
	       if (good36LV > 0) then 
	       good36munbase = random(basegood36mun*good36LV,basegood36mun*midmapremoveshipLV*g_factorylimitLV*good36LV)   
	       good36mun = round(good36munbase)	
         _ALERT("good36mun")  
	       _ALERT(good36mun)	       
	       else
	       good36mun = 0
	       end  	            	         	          
-----计算商品总重量-----	       
	     midmapremoveshipgoodtotalW =  good22mun*basegood22W + good33mun*basegood33W + good29mun*basegood29W + good34mun*basegood34W + good26mun*basegood26W + good76mun*basegood76W + good30mun*basegood30W + good27mun*basegood27W + good23mun*basegood23W + good51mun*basegood51W + good52mun*basegood52W + good53mun*basegood53W + good36mun*basegood36W	     
       _ALERT("midmapremoveshipgoodtotalW")  
	     _ALERT(midmapremoveshipgoodtotalW)	
-----计算玩家货仓空间-----		     	     
g_weightPlay = g_weightlimit - g_weight      
if (midmapremoveshipgoodtotalW < g_weightPlay) then 
Rule_AddInterval("midmapremoveshipLV01",1)
Rule_Remove("midmapremoveshipmission")  
else 
-----------货仓不够离开地图--------------
  UI_SetElementVisible("GateMenu2","m_lblTitle",0)
UI_SetElementVisible("GateMenu2","m_lblSubTitle",0)
UI_SetTextLabelText("GateMenu2","m_lblMessage",DTM004[238](g_factorylimit,midmapremoveshipgoodtotalW,g_weightPlay))
UI_ShowScreen("GateMenu2", ePopup) 	          
Rule_AddInterval("midmapexploreLV00_1",10)
Rule_Remove("midmapremoveshipmission")            
end    
end

function PATCH_PopulateSalvageGoodNames1(bHasMore)
	_ALERT("PATCH_PopulateSalvageGoodNames1")
	local iText = ""
	if (bHasMore == 1) then
		if (good22mun > 0) then
			iText = iText..Goods[22].name..":\n"
		end
		if (good33mun > 0) then
			iText = iText..Goods[33].name..":\n"
		end
		if (good29mun > 0) then
			iText = iText..Goods[29].name..":\n"
		end
		if (good34mun > 0) then
			iText = iText..Goods[34].name..":\n"
		end
		if (good26mun > 0) then
			iText = iText..Goods[26].name..":\n"
		end
		if (good76mun > 0) then
			iText = iText..Goods[76].name..":\n"
		end
		if (good30mun > 0) then
			iText = iText..Goods[30].name..":"
		end
	else
		iText = DTM004[230]
	end
	
	return iText
end

function PATCH_PopulateSalvageGoodNames2(bHasMore)
	_ALERT("PATCH_PopulateSalvageGoodNames2")
	local iText = ""
	if (bHasMore == 1) then
		if (good27mun > 0) then
			iText = iText..Goods[27].name..":\n"
		end
		if (good23mun > 0) then
			iText = iText..Goods[23].name..":\n"
		end
		if (good51mun > 0) then
			iText = iText..Goods[51].name..":\n"
		end
		if (good52mun > 0) then
			iText = iText..Goods[52].name..":\n"
		end
		if (good53mun > 0) then
			iText = iText..Goods[53].name..":\n"
		end
		if (good36mun > 0) then
			iText = iText..Goods[36].name..":"
		end
	else
		iText = " "
	end
	
	return iText
end

function PATCH_PopulateSalvageGoodCount1(bHasMore)
	local iText = ""
	if (bHasMore == 1) then
		if (good22mun > 0) then
			iText = iText..good22mun.."\n"
		end
		if (good33mun > 0) then
			iText = iText..good33mun.."\n"
		end
		if (good29mun > 0) then
			iText = iText..good29mun.."\n"
		end
		if (good34mun > 0) then
			iText = iText..good34mun.."\n"
		end
		if (good26mun > 0) then
			iText = iText..good26mun.."\n"
		end
		if (good76mun > 0) then
			iText = iText..good76mun.."\n"
		end
		if (good30mun > 0) then
			iText = iText..good30mun
		end
	else
		iText = " "
	end
	
	return iText
end

function PATCH_PopulateSalvageGoodCount2(bHasMore)
	local iText = ""
	if (bHasMore == 1) then
		if (good27mun > 0) then
			iText = iText..good27mun.."\n"
		end
		if (good23mun > 0) then
		iText = iText..good23mun.."\n"
		end
		if (good51mun > 0) then
			iText = iText..good51mun.."\n"
		end
		if (good52mun > 0) then
			iText = iText..good52mun.."\n"
		end
		if (good53mun > 0) then
			iText = iText..good53mun.."\n"
		end
		if (good36mun > 0) then
			iText = iText..good36mun
		end
	else
		iText = " "
	end
	
	return iText
end

function PATCH_ShowSalvageResults(bHasMore, Notice)
	if (bHasMore == 1) then
		UI_SetElementVisible("midmapSalvage", "btnOK", 0)
		UI_SetElementVisible("midmapSalvage", "btnYES", 1)
		UI_SetElementVisible("midmapSalvage", "btnNO", 1)
	else
		UI_SetElementVisible("midmapSalvage", "btnOK", 1)
		UI_SetElementVisible("midmapSalvage", "btnYES", 0)
		UI_SetElementVisible("midmapSalvage", "btnNO", 0)
	end
	
	UI_SetTextLabelText("midmapSalvage", "m_lbSavageGoodsNames1", PATCH_PopulateSalvageGoodNames1(bHasMore))
	UI_SetTextLabelText("midmapSalvage", "m_lbSavageGoodsCount1", PATCH_PopulateSalvageGoodCount1(bHasMore))
	UI_SetTextLabelText("midmapSalvage", "m_lbSavageGoodsNames2", PATCH_PopulateSalvageGoodNames2(bHasMore))
	UI_SetTextLabelText("midmapSalvage", "m_lbSavageGoodsCount2", PATCH_PopulateSalvageGoodCount2(bHasMore))
	UI_SetTextLabelText("midmapSalvage", "m_lbSalvageFleetEngCap", "Fleet Enginering Capacity: "..g_factorylimit)
	UI_SetTextLabelText("midmapSalvage", "m_lb_SalvageNotice", Notice)
	UI_ShowScreen("midmapSalvage", ePopup)
end

function midmapremoveshipLV01()	
	if (midmapremoveshipgoodtotalW < g_weightPlay) then 
	text14 = midmapremoveshipLV
		_ALERT("midmapremoveshipLV")  
		_ALERT(midmapremoveshipLV)
		_ALERT("midmapremoveshipLVMAX")  
		_ALERT(midmapremoveshipLVMAX)
		-- Patched by TehnoMag
		-- if (midmapremoveshipLV < midmapremoveshipLVMAX) then 
		--  Rule_AddInterval("midmapremoveshipTXT",1)	
		if (midmapremoveshipLV < midmapremoveshipLVMAX) then
			Rule_AddInterval("PATCH_midmapremoveshipTXT", 1)
		-- End Patch
				 g_goods[22] = g_goods[22] + good22mun  
				 g_goods[33] = g_goods[33] + good33mun       
				 g_goods[29] = g_goods[29] + good29mun
				 g_goods[34] = g_goods[34] + good34mun 
				 g_goods[26] = g_goods[26] + good26mun  
				 g_goods[76] = g_goods[76] + good76mun       
				 g_goods[30] = g_goods[30] + good30mun
				 g_goods[27] = g_goods[27] + good27mun 	
				 g_goods[23] = g_goods[23] + good23mun  
				 g_goods[51] = g_goods[51] + good51mun       
				 g_goods[52] = g_goods[52] + good52mun
				 g_goods[53] = g_goods[53] + good53mun
				 g_goods[36] = g_goods[36] + good36mun 	             
					 DTM4_SetRAMCheatKey()       
		Rule_Remove("midmapremoveshipLV01")  
		else 
		-----------打捞次数已满离开地图--------------
		-- Patched by TehnoMag
		--  UI_SetElementVisible("GateMenu2","m_lblTitle",0)
		--UI_SetElementVisible("GateMenu2","m_lblSubTitle",0)
		--  UI_SetTextLabelText("GateMenu2","m_lblMessage",DTM004[228](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,good52mun,good53mun,good36mun))
		--UI_ShowScreen("GateMenu2", ePopup)	
			PATCH_ShowSalvageResults(0, DTM004[228])
		-- End Patch
		exploremission = 0
		Rule_AddInterval("midmapexploreLV00_1",10)
		Rule_Remove("midmapremoveshipLV01")            
		end
	end
end

function PATCH_midmapremoveshipTXT()	
	if (midmapremoveshipLV == 1) then
		PATCH_ShowSalvageResults(1, DTM004[229](midmapremoveshipLV))
	elseif (midmapremoveshipLV == 2) then
		PATCH_ShowSalvageResults(1, DTM004[229](midmapremoveshipLV))
	elseif (midmapremoveshipLV == 3) then
		PATCH_ShowSalvageResults(1, DTM004[229](midmapremoveshipLV))
	elseif (midmapremoveshipLV == 4) then
		PATCH_ShowSalvageResults(1, DTM004[229](midmapremoveshipLV))
	elseif (midmapremoveshipLV == 5) then
		PATCH_ShowSalvageResults(1, DTM004[229](midmapremoveshipLV))
	elseif (midmapremoveshipLV == 6) then
		PATCH_ShowSalvageResults(1, DTM004[229](midmapremoveshipLV))
	elseif (midmapremoveshipLV == 7) then
		PATCH_ShowSalvageResults(1, DTM004[229](midmapremoveshipLV))
	elseif (midmapremoveshipLV == 8) then
		PATCH_ShowSalvageResults(1, DTM004[229](midmapremoveshipLV))
	elseif (midmapremoveshipLV == 9) then
		PATCH_ShowSalvageResults(1, DTM004[229](midmapremoveshipLV))
	elseif (midmapremoveshipLV == 10) then
		PATCH_ShowSalvageResults(0, DTM004[228])
	end
	
	Rule_AddInterval("PATCH_midmapremoveshipLV00_1",1)
	Rule_Remove("PATCH_midmapremoveshipTXT")
end

function midmapremoveshipTXT()	
text1 = g_factorylimit
text2 = good22mun
text3 = good33mun
text4 = good29mun
text5 = good34mun
text6 = good26mun
text7 = good30mun
text8 = good27mun
text9 = good23mun
text10 = good51mun
text11 = good52mun
text12 = good53mun
text13 = good36mun
text14 = midmapremoveshipLV
text15 = good76mun
  UI_SetElementVisible("fairyMenu01","m_lblTitle",0)
  UI_SetElementVisible("fairyMenu01","m_lblSubTitle",0)
  if (midmapremoveshipLV == 1) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[229](g_factorylimit,good22mun,good33mun,midmapremoveshipLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapremoveshipLV00_1",1)
  Rule_Remove("midmapremoveshipTXT") 
  elseif (midmapremoveshipLV == 2) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[230](g_factorylimit,good22mun,good33mun,good29mun,good34mun,midmapremoveshipLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapremoveshipLV00_1",1)
  Rule_Remove("midmapremoveshipTXT")
  elseif (midmapremoveshipLV == 3) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[231](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,midmapremoveshipLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapremoveshipLV00_1",1)
  Rule_Remove("midmapremoveshipTXT")   
  elseif (midmapremoveshipLV == 4) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[232](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,midmapremoveshipLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapremoveshipLV00_1",1)
  Rule_Remove("midmapremoveshipTXT")   
  elseif (midmapremoveshipLV == 5) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[233](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,midmapremoveshipLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapremoveshipLV00_1",1)
  Rule_Remove("midmapremoveshipTXT")     
  elseif (midmapremoveshipLV == 6) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[234](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,midmapremoveshipLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapremoveshipLV00_1",1)
  Rule_Remove("midmapremoveshipTXT")     
  elseif (midmapremoveshipLV == 7) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[235](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,midmapremoveshipLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapremoveshipLV00_1",1)
  Rule_Remove("midmapremoveshipTXT")   
  elseif (midmapremoveshipLV == 8) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[236](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,good52mun,midmapremoveshipLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapremoveshipLV00_1",1)
  Rule_Remove("midmapremoveshipTXT") 
  elseif (midmapremoveshipLV == 9) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[237](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,good52mun,good53mun,midmapremoveshipLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapremoveshipLV00_1",1)
  Rule_Remove("midmapremoveshipTXT")  
  elseif (midmapremoveshipLV == 10) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[228](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,good52mun,good53mun,good36mun,midmapremoveshipLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapremoveshipLV00_1",1)
  Rule_Remove("midmapremoveshipTXT")                          
end
end
    



-------------------------打捞后触发战斗系统---------------------------------------------
  function midmapremoveshipmissionstart()	
--------玩家军等换算------25级军等换算-----  
	local battleLVtime = g_FightLevel
	local battleLV = 0
	local g_battleLVFull = 0	
	while (g_battleLVList[battleLV+1]<=battleLVtime)and(g_battleLVFull==0) do
		battleLV = battleLV + 1
		if (g_battleLVList[battleLV+1]==nil) then
			g_battleLVFull = 1
		end
	end
	g_battleLV = battleLV+g_battleLVFull
  battleLVship = g_battleLV + battleLVmission	
	 _ALERT("g_battleLV")  
	 _ALERT(g_battleLV) 
--------玩家军等换算-----------	  
--计算玩家工程力----
	local factorylimitLVtime = g_factorylimit
	local factorylimitLV = 0
	local g_factorylimitLVFull = 0	
	while (g_factorylimitLVList[factorylimitLV+1]<=factorylimitLVtime)and(g_factorylimitLVFull==0) do
		factorylimitLV = factorylimitLV + 1
		if (g_factorylimitLVList[factorylimitLV+1]==nil) then
			g_factorylimitLVFull = 1
		end
	end
	g_factorylimitLV = factorylimitLV+g_factorylimitLVFull  
--------换算完军等才能加载攻击列表-----------	 	  
--------战斗几率换算表-----------	 	
         g_battlemidmapremoveship = g_factorylimitLV + midmapremoveshipLV
         if (g_battlemidmapremoveship > 25) then 
          g_battlemidmapremoveship = 25
         elseif (g_battlemidmapremoveship <= 25) then   
          g_battlemidmapremoveship = g_battlemidmapremoveship
	    _ALERT("g_battlemidmapremoveship")  
	    _ALERT(g_battlemidmapremoveship)    
	    end      
--------一共25级固定召唤和15级事件难度召唤--不同事件会引发更高的召唤难度---玩家工程能力越高越容易引来敌人--------	 	         
         local randommidmapremoveshiptime = 
         {
         "midmapremoveshipbattleLV00",
         "midmapremoveshipbattleLV00",
         "midmapremoveshipbattleLV00",
         "midmapremoveshipbattleLV00",
         "midmapremoveshipbattleLV00",
         "midmapremoveshipbattleLV00",
         "midmapremoveshipbattleLV00",
         "midmapremoveshipbattleLV00",
         "midmapremoveshipbattleLV00",
         "midmapremoveshipbattleLV00",         
         "midmapremoveshipbattleLV01",
         "midmapremoveshipbattleLV02",
         "midmapremoveshipbattleLV03",
         "midmapremoveshipbattleLV04",
         "midmapremoveshipbattleLV05",         
         "midmapremoveshipbattleLV06",
         "midmapremoveshipbattleLV07",
         "midmapremoveshipbattleLV08",
         "midmapremoveshipbattleLV09",
         "midmapremoveshipbattleLV10",
         "midmapremoveshipbattleLV11",
         "midmapremoveshipbattleLV12",
         "midmapremoveshipbattleLV13",
         "midmapremoveshipbattleLV14",
         "midmapremoveshipbattleLV15"
         }               
         randommidmapremoveshiptime = randommidmapremoveshiptime[random(midmapremoveshipLV,g_battlemidmapremoveship)] 
         --randommidmapremoveshiptime = randommidmapremoveshiptime[random(14,14)]
     	 _ALERT("randommidmapremoveshiptime")  
	     _ALERT(randommidmapremoveshiptime)  
	     ------------执行随机代码---------------
	     Rule_AddInterval(randommidmapremoveshiptime,1) 
  --------换算完军等才能加载攻击列表-----------	 	   	   	
Rule_Remove("midmapremoveshipmissionstart") 
end


function midmapremoveshipbattleLV00()	
_ALERT("midmapremoveshipbattleLV00start") 
Rule_AddInterval("midmapremoveshipmission",1) 
Rule_Remove("midmapremoveshipbattleLV00")            
end  

function midmapremoveshipbattleLV01()	
_ALERT("midmapremoveshipbattleLV01start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV01time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV01")            
end  

function midmapremoveshipbattleLV02()	
_ALERT("midmapremoveshipbattleLV02start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV02time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV02")            
end  

function midmapremoveshipbattleLV03()	
_ALERT("midmapremoveshipbattleLV03start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV03time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV03")            
end  

function midmapremoveshipbattleLV04()	
_ALERT("midmapremoveshipbattleLV04start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV04time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV04")            
end  

function midmapremoveshipbattleLV05()	
_ALERT("midmapremoveshipbattleLV05start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV05time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV05")            
end  

function midmapremoveshipbattleLV06()	
_ALERT("midmapremoveshipbattleLV06start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV06time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV06")            
end  

function midmapremoveshipbattleLV07()	
_ALERT("midmapremoveshipbattleLV07start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV07time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV07")            
end  

function midmapremoveshipbattleLV08()	
_ALERT("midmapremoveshipbattleLV08start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV08time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV08")            
end  


function midmapremoveshipbattleLV09()	
_ALERT("midmapremoveshipbattleLV09start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV09time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV09")            
end  

function midmapremoveshipbattleLV10()	
_ALERT("midmapremoveshipbattleLV10start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV10time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV10")            
end  

function midmapremoveshipbattleLV11()	
_ALERT("midmapremoveshipbattleLV11start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV11time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV11")            
end  

function midmapremoveshipbattleLV12()	
_ALERT("midmapremoveshipbattleLV12start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV12time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV12")            
end  

function midmapremoveshipbattleLV13()	
_ALERT("midmapremoveshipbattleLV13start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV13time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV13")            
end  

function midmapremoveshipbattleLV14()	
_ALERT("midmapremoveshipbattleLV14start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV14time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV14")            
end  

function midmapremoveshipbattleLV15()	
_ALERT("midmapremoveshipbattleLV15start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV15time01",1) 
Rule_AddInterval("midmapremoveshipbattleENDstart",1) 
Rule_Remove("midmapremoveshipbattleLV15")            
end  


function midmapremoveshipbattleENDstart()	
Rule_Remove("vgrattackendstart") 
if(midmapextractfleet == 0)then   
removeshipbattleTXT = 0
Rule_AddInterval("midmapremoveshipbattleEND",1) 
Rule_Remove("midmapremoveshipbattleENDstart")            
end  


function midmapremoveshipbattleEND()

_ALERT("midmapremoveshipbattleEND")  
PopPointOUTLV = 0
PopPointLV = 0
 ---------------------人口过低-------------------15级----------------------------------------------  	
if (g_PopPointTotal <= 1500) then
  g_PopPointOUTLV = 0
	local PopPointLVtime = g_PopPointTotal
	local PopPointLV = 0
	local g_PopPointLVFull = 0	
	while (g_PopPointLVList[PopPointLV+1]<=PopPointLVtime)and(g_PopPointLVFull==0) do
		PopPointLV = PopPointLV + 1
		if (g_PopPointLVList[PopPointLV+1]==nil) then
			g_PopPointLVFull = 1
		end
	end
	g_PopPointLV = PopPointLV+g_PopPointLVFull
----战利品等级计算-----25级等级奖励---任务奖励10--随机规模奖励15--人口奖励15------	
g_battlemoneyLV = g_battleLV + battleLVrandom + g_PopPointLV
	 _ALERT("g_battlemoneyLV")  
	 _ALERT(g_battlemoneyLV)  
   	Rule_AddInterval("midmapremoveshipbattleENDmoneyLV",1)
   	Rule_Remove("midmapremoveshipbattleEND")  	   	
 ---------------------正常-----------------------------------------------------------------  	  
	else
	g_PopPointLV = 0
	local PopPointOUTLVtime = g_PopPointTotal
	local PopPointOUTLV = 0
	local g_PopPointOUTLVFull = 0	
	while (g_PopPointOUTLVList[PopPointOUTLV+1]<=PopPointOUTLVtime)and(g_PopPointOUTLVFull==0) do
		PopPointOUTLV = PopPointOUTLV + 1
		if (g_PopPointOUTLVList[PopPointOUTLV+1]==nil) then
			g_PopPointOUTLVFull = 1
		end
	end
	g_PopPointOUTLV = PopPointOUTLV+g_PopPointOUTLVFull	
----战利品等级计算-----25级等级奖励---任务奖励15--随机规模奖励15--人口奖励15------	
g_battlemoneyLV = g_battleLV + battleLVrandom + g_PopPointLV - g_PopPointOUTLV 
	 _ALERT("g_battlemoneyLV")  
	 _ALERT(g_battlemoneyLV)   
	  --Rule_AddInterval("midmapremoveshipbattleENDmoney",1)  	
	  Rule_AddInterval("midmapremoveshipbattleENDmoneyLV",1) 
		Rule_Remove("midmapremoveshipbattleEND")
  end	 
end	


----------赏金结算---------------------------
function midmapremoveshipbattleENDmoneyLV()
  if (g_battlemoneyLV <= 10) then
     Honorpointget = 1 
     g_battlemoney = g_battlemoneyLV*10000  
     g_battleexp = g_battlemoneyLV*1000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapremoveshipbattleENDTXT",1) 	  
     Rule_Remove("midmapremoveshipbattleENDmoneyLV") 
  elseif (g_battlemoneyLV > 10)and(g_battlemoneyLV <= 20) then 
     Honorpointget = 2 
     g_battlemoney = g_battlemoneyLV*50000
     g_battleexp = g_battlemoneyLV*5000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapremoveshipbattleENDTXT",1) 	  
     Rule_Remove("midmapremoveshipbattleENDmoneyLV")
  elseif (g_battlemoneyLV > 20)and(g_battlemoneyLV <= 30) then 
     Honorpointget = 3 
     g_battlemoney = g_battlemoneyLV*100000
     g_battleexp = g_battlemoneyLV*10000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapremoveshipbattleENDTXT",1) 	  
     Rule_Remove("midmapremoveshipbattleENDmoneyLV")   
  elseif (g_battlemoneyLV > 30)and(g_battlemoneyLV <= 40) then 
     Honorpointget = 4 
     g_battlemoney = g_battlemoneyLV*200000
     g_battleexp = g_battlemoneyLV*20000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapremoveshipbattleENDTXT",1) 	  
     Rule_Remove("midmapremoveshipbattleENDmoneyLV")       
  elseif (g_battlemoneyLV > 40)and(g_battlemoneyLV <= 50) then 
     Honorpointget = 5 
     g_battlemoney = g_battlemoneyLV*300000
     g_battleexp = g_battlemoneyLV*30000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapremoveshipbattleENDTXT",1) 	  
     Rule_Remove("midmapremoveshipbattleENDmoneyLV")   
  elseif (g_battlemoneyLV > 50)and(g_battlemoneyLV <= 60) then 
     Honorpointget = 6 
     g_battlemoney = g_battlemoneyLV*500000
     g_battleexp = g_battlemoneyLV*50000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapremoveshipbattleENDTXT",1) 	  
     Rule_Remove("midmapremoveshipbattleENDmoneyLV") 
  elseif (g_battlemoneyLV > 60)and(g_battlemoneyLV <= 70) then 
     Honorpointget = 7 
     g_battlemoney = g_battlemoneyLV*750000
     g_battleexp = g_battlemoneyLV*75000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapremoveshipbattleENDTXT",1) 	  
     Rule_Remove("midmapremoveshipbattleENDmoneyLV")    
  elseif (g_battlemoneyLV > 70)and(g_battlemoneyLV <= 80) then 
     Honorpointget = 7 
     g_battlemoney = g_battlemoneyLV*1000000
     g_battleexp = g_battlemoneyLV*100000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapremoveshipbattleENDTXT",1) 	  
     Rule_Remove("midmapremoveshipbattleENDmoneyLV")                                                  
  end  
end  



----------战利品文本---------判定各种结局生成不同的文本------------------
function midmapremoveshipbattleENDTXT()
   battleLVmission = battleLVmission + 1
   midmapremoveshipLV = midmapremoveshipLV + 1
  	midmapextractfleet = 0
	 _ALERT("g_battlemoney")  
	 _ALERT(g_battlemoney) 
	 _ALERT("g_battleexp")  
	 _ALERT(g_battleexp) 
	 _ALERT("Honorpointget")  
	 _ALERT(Honorpointget) 	 	   
  UI_SetElementVisible("fairyMenu01","m_lblTitle",0)
  UI_SetElementVisible("fairyMenu01","m_lblSubTitle",0)
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[260](g_battlemoney,g_battleexp,Honorpointget,battleLVmission))
  UI_ShowScreen("fairyMenu01", ePopup)	
  Rule_AddInterval("midmapremoveshipLV00_1",1)     --------计算打捞等级-----------	    
  Rule_Remove("midmapremoveshipbattleENDTXT")            
  end  
end  



function round(num)
    local int_part = floor(num)
    if (num - int_part) >= 0.5 then
        return int_part + 1
    else
        return int_part
    end
end
