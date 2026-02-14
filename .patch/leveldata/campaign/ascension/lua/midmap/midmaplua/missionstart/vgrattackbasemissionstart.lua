

--------基地事件合集---------
function midmapextractbaseLV01()	
_ALERT("midmapextractbaseLV01-1") 
Rule_AddInterval("midmapextractbaseLV01time01",10) 
Rule_Remove("midmapextractbaseLV01")            
end  

function midmapextractbaseLV02()	
Rule_AddInterval("midmapextractbaseLV02time01",10) 
Rule_Remove("midmapextractbaseLV02")            
end  

function midmapextractbaseLV03()	
Rule_AddInterval("midmapextractbaseLV03time01",10) 
Rule_Remove("midmapextractbaseLV03")            
end  

function midmapextractbaseLV04()	
Rule_AddInterval("midmapextractbaseLV04time01",10) 
Rule_Remove("midmapextractbaseLV04")            
end  

function midmapextractbaseLV05()	
Rule_AddInterval("midmapextractbaseLV05time01",10) 
Rule_Remove("midmapextractbaseLV05")            
end  

function midmapextractbaseLV06()	
Rule_AddInterval("midmapextractbaseLV06time01",10) 
Rule_Remove("midmapextractbaseLV06")            
end  

function midmapextractbaseLV07()	
Rule_AddInterval("midmapextractbaseLV07time01",10) 
Rule_Remove("midmapextractbaseLV07")            
end  

function midmapextractbaseLV08()	
Rule_AddInterval("midmapextractbaseLV08time01",10) 
Rule_Remove("midmapextractbaseLV08")            
end  

function midmapextractbaseLV09()	
Rule_AddInterval("midmapextractbaseLV09time01",10) 
Rule_Remove("midmapextractbaseLV09")            
end  

function midmapextractbaseLV10()	
Rule_AddInterval("midmapextractbaseLV10time01",10) 
Rule_Remove("midmapextractbaseLV10")            
end  

function midmapextractbaseLV11()	
Rule_AddInterval("midmapextractbaseLV11time01",10) 
Rule_Remove("midmapextractbaseLV11")            
end  

function midmapextractbaseLV12()	
Rule_AddInterval("midmapextractbaseLV12time01",10) 
Rule_Remove("midmapextractbaseLV12")            
end  

function midmapextractbaseLV13()	
Rule_AddInterval("midmapextractbaseLV13time01",10) 
Rule_Remove("midmapextractbaseLV13")            
end  

function midmapextractbaseLV14()	
Rule_AddInterval("midmapextractbaseLV14time01",10) 
Rule_Remove("midmapextractbaseLV14")            
end  

function midmapextractbaseLV15()	
Rule_AddInterval("midmapextractbaseLV15time01",10) 
Rule_Remove("midmapextractbaseLV15")            
end  
--------基地事件合集---------



function round(num)
    local int_part = floor(num)
    if (num - int_part) >= 0.5 then
        return int_part + 1
    else
        return int_part
    end
end

function dofilepathTSTvgrattackbasemissionstart()	
 _ALERT("dofilepathTSTvgrattackbasemissionstart") 
Rule_Remove("dofilepathTSTvgrattackbasemissionstart")            
end  
 

--------通用说明文字-----------
function midmapextractbaseTXT()	
if(exploremission == 1)then  
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","m_lblTitle",0)
UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","m_lblSubTitle",0)
UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage","$105080")
UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)  
Rule_Remove("midmapextractbaseTXT") 
else
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","m_lblTitle",0)
UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","m_lblSubTitle",0)
UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage","$105040")
UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)  
Rule_Remove("midmapextractbaseTXT")            
end  
end 




-----------------设置靠近基地群触发相应事件--------------------------------------
 function vgrattackbasemissionstart() 
 ----------------需要先点击窗口关闭按钮关闭上一个对话窗口------------------------------------------
	if (UI_IsNamedElementVisible("LaunchMenufactorysystemmissionTXT","key01")==0) then
		  UI_HideScreen('LaunchMenufactorysystemmissionTXT')  
     if(SobGroup_PlayerIsInSensorRange("vgrmidmapbaseGroup",0) == 1)then    
        EventPointer_Remove(vgrmidmapbaseGroupPointer)
                  dofilepath("Data:leveldata/campaign/ascension/LUA/mapattack/attackmusic.LUA")
          Rule_AddInterval("musicrandom_time01",10)
        _ALERT("vgrattackbasemissionstart") 
        Rule_AddInterval("vgrattackbasemissionstart02",1)   
       Rule_Remove("vgrattackbasemissionstart")  	 
      end  
    end      
  end    
-----------------玩家战斗力判断---玩家人口*军等-------区间表----------------------------    
    
  function vgrattackbasemissionstart02() 
  local playerbattleLVtime = g_PopPointTotal*g_FightLevel
	local playerbattleLV = 0
	local g_playerbattleLVFull = 0	
	while (g_playerbattleLVList[playerbattleLV+1]<=playerbattleLVtime)and(g_playerbattleLVFull==0) do
		playerbattleLV = playerbattleLV + 1
		if (g_playerbattleLVList[playerbattleLV+1]==nil) then
			g_playerbattleLVFull = 1
		end
	end
	g_playerbattleLV = playerbattleLV+g_playerbattleLVFull	
	 _ALERT("g_playerbattleLV")  
	 _ALERT(g_playerbattleLV) 
 Rule_AddInterval("vgrattackbasemissionstart03",1)                             
  Rule_Remove("vgrattackbasemissionstart02")          
end      
-----------------玩家战斗力判断---玩家人口*军等-------区间表----------------------------
-----------------玩家规模小于目标----------
    --------------------根据玩家规模随机舰队------------------
    --------------------帝国舰队的协助-----------------------------------
-----------------玩家规模大于目标-------------------------------------
    -------------------选择是否攻击------------------
    -------------------根据玩家规模随机舰队-----------------------------------       
  function vgrattackbasemissionstart03() 
if (g_playerbattleLV < midmapextractbaseLV) then	  --midmapextractbaseLV
    UI_SetElementVisible("fairyMenu01","m_lblTitle",0)
  UI_SetElementVisible("fairyMenu01","m_lblSubTitle",0)
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[255](g_playerbattleLV))
  UI_ShowScreen("fairyMenu01", ePopup) 	
   Rule_AddInterval("vgrattackbasemissionstart04",1)     
   Rule_Remove("vgrattackbasemissionstart03")    
 	else
     UI_SetElementVisible("fairyMenu01","m_lblTitle",0)
  UI_SetElementVisible("fairyMenu01","m_lblSubTitle",0)
  UI_SetTextLabelText("fairyMenu01","m_lblMessage","$105055")
  UI_ShowScreen("fairyMenu01", ePopup) 	
 Rule_AddInterval("vgrattackbasemissionstart05",1)   	         
      	    Rule_Remove("vgrattackbasemissionstart03")
      	 end            
     end    
    
 ---------------玩家实力弱小----选择是否离开------------------        
function vgrattackbasemissionstart04()
	if (UI_IsNamedElementVisible("fairyMenu01","key01")==0) then
		UI_SetElementVisible("fairyMenu01","key01",1)
		UI_HideScreen('fairyMenu01')	
				Rule_AddInterval("vgrattackbasemissionstart04_1",1)
		Rule_Remove("vgrattackbasemissionstart04")		
	elseif (UI_IsNamedElementVisible("fairyMenu01","key02")==0) then
		UI_SetElementVisible("fairyMenu01","key02",1)
		UI_HideScreen('fairyMenu01')
		Rule_AddInterval("vgrattackbasemissionbattlestart",1)
		--Rule_AddInterval("PopPointLVend",1)  
		Rule_Remove("vgrattackbasemissionstart04")
	end
end    
    
 ----------------选择离开------判定荣誉点是否足够------------      
function vgrattackbasemissionstart04_1()	 	
	if (g_goods[180]  >= g_playerbattleLV) then	   --g_playerbattleLV
	  g_goods[180] = g_goods[180] - g_playerbattleLV
	    DTM4_SetRAMCheatKey()
		Rule_AddInterval("vgrattackbasemissionEXIT",1) 
		Rule_Remove("vgrattackbasemissionstart04_1")    
	else
  UI_SetElementVisible("GateMenu2","m_lblTitle",0)
UI_SetElementVisible("GateMenu2","m_lblSubTitle",0)
UI_SetTextLabelText("GateMenu2","m_lblMessage","$105070")
UI_ShowScreen("GateMenu2", ePopup) 			 
Rule_AddInterval("vgrattackbasemissionbattle",1)
  	Rule_Remove("vgrattackbasemissionstart04_1")    
  end
end
   

 ---------------玩家实力强大----选择是否战斗------------------        
function vgrattackbasemissionstart05()
	if (UI_IsNamedElementVisible("fairyMenu01","key01")==0) then
		UI_SetElementVisible("fairyMenu01","key01",1)
		UI_HideScreen('fairyMenu01')	
				Rule_AddInterval("vgrattackbasemissionbattlestart",1)
		Rule_Remove("vgrattackbasemissionstart05")		
	elseif (UI_IsNamedElementVisible("fairyMenu01","key02")==0) then
		UI_SetElementVisible("fairyMenu01","key02",1)
		UI_HideScreen('fairyMenu01')
		Rule_AddInterval("vgrattackbasemissionEXIT",1)
		--Rule_AddInterval("PopPointLVend",1)  
		Rule_Remove("vgrattackbasemissionstart05")
	end
end     
   



 ----------------选择不离开------进入战斗状态------------      
function vgrattackbasemissionbattlestart()	
--------玩家军等换算------25级军等换算---必须要加军等换算不然不刷兵----  
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
	Rule_AddInterval("vgrattackbasemissionbattle",midmapextractbaseLV*30) 	
		Rule_AddInterval("vgrattackbasemissionbattleEND",5)  
		vgrattackbasemissionbattletime = 0
		VGRBASEmissionmissionSTARTEND = 0
		Rule_Remove("vgrattackbasemissionbattlestart")
	end	 
-----------------------vgrattackbasemissionbattletime-----------------------------------------------------	
	
	function vgrattackbasemissionbattleEND()	
if(vgrattackbasemissionbattletime == 0)and(vgrattackbasemissionbattletime == 0)and(SobGroup_Count("vgrmidmapbaseGroup") == 0)then	
    VGRBASEmissionmissionEND = 1
	  battleLVmission = 1
	  vgrbase = 0
	  midmapextractfleet = 0
	  Rule_AddInterval("vgrattackendstart",1)   
	  Rule_Remove("vgrattackbasemissionbattle")  
	  Rule_Remove("vgrattackbasemissionbattleEND")   
--elseif (SobGroup_HealthPercentage("vgrmidmapbaseGroup") < 1)and(SobGroup_HealthPercentage("vgrmidmapbaseGroup") > 0)then
elseif (vgrattackbasemissionbattletime == 0)and(SobGroup_HealthPercentage("vgrmidmapbaseGroup") < 0.5)and(SobGroup_HealthPercentage("vgrmidmapbaseGroup") > 0)and(SobGroup_Count("vgrmidmapbaseGroupfollw00") == 0)then
_ALERT("midmapextractbaseENDstartCSTART") 
  midmapextractbaseLVarmy = midmapextractbaseLV*1000
     UI_SetElementVisible("fairyMenu01","m_lblTitle",0)
  UI_SetElementVisible("fairyMenu01","m_lblSubTitle",0)
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[239](g_goods[76],midmapextractbaseLV,midmapextractbaseLVarmy))
  UI_ShowScreen("fairyMenu01", ePopup) 	
  SobGroup_SwitchOwner( "vgrmidmapbaseGroup", 1)
	 battleLVmission = 1
	battleLVrandom = 1
	  vgrbase = 0  
  midmapextractfleet = 0
  VGRBASEmissionmissionSTARTEND = 1
  Rule_AddInterval("midmapextractbaseENDstart02",1) 
  SobGroup_SetHealth("vgrmidmapbaseGroup",0.5)  
Rule_Remove("vgrattackbasemissionbattleEND")  	                          
  end     
end   
	
----------------------------------------------------------------------------	
	function vgrattackbasemissionbattle()	     
	 if(SobGroup_Count("vgrmidmapbaseGroup") > 0)then	 
         local midmapbasebattleLVtime = 
         {
         "midmapextractbattleBASELV01time01",
         "midmapextractbattleBASELV02time01",
         "midmapextractbattleBASELV03time01",
         "midmapextractbattleBASELV04time01",
         "midmapextractbattleBASELV05time01",
         "midmapextractbattleBASELV06time01",
         "midmapextractbattleBASELV07time01",
         "midmapextractbattleBASELV08time01",
         "midmapextractbattleBASELV09time01",
         "midmapextractbattleBASELV10time01",
         "midmapextractbattleBASELV11time01",
         "midmapextractbattleBASELV12time01",
         "midmapextractbattleBASELV13time01",
         "midmapextractbattleBASELV14time01",
         "midmapextractbattleBASELV15time01",
         }    
         midmapbasebattleLVtime = midmapbasebattleLVtime[battleLVrandom] 
     	 _ALERT("midmapbasebattleLVtime")  
	     _ALERT(midmapbasebattleLVtime)  
	     ------------执行随机代码---------------     
	     Rule_AddInterval(midmapbasebattleLVtime,midmapextractbaseLV*2) 
	     midmapextractfleet = 1 
	     vgrattackbasemissionbattletime = 1
-----------------判断控制基地是否摧毁-------------------------------------
   Rule_AddInterval("midmapextractbaseENDstart",5)    
   -----------------测试占领系统-------------------------------------
   --midmapextractfleet = 0              
    Rule_Remove("vgrattackbasemissionbattleEND")        
    Rule_Remove("vgrattackbasemissionbattle")     
 elseif(SobGroup_Count("vgrmidmapbaseGroup") == 0)then	
    VGRBASEmissionmissionEND = 1
	  battleLVmission = 1
	  battleLVrandom = 1
	  vgrbase = 0
	  midmapextractfleet = 0
	  Rule_AddInterval("vgrattackendstart",1)  
	  Rule_Remove("vgrattackbasemissionbattleEND") 
	  Rule_Remove("vgrattackbasemissionbattle")       
  end   
end     
  
  --vgrattackbasemissionbattleEND
 ----------------------------------------------------------------------------	
 
  
function vgrattackbasemissionEXIT()	
	  SobGroup_SwitchOwner( "vgrmidmapbaseGroup", 1)   
	   SobGroup_SwitchOwner( "vgrmidmapbaseGroupfollw00", 1) 
	 mapstargatereopentime = 1      
Rule_Remove("vgrattackbasemissionEXIT")            
end   
    
---------------------------判断控制基地可否占领------------------------------------------------------------    
--------------------基地血量为百分之20的时候改变阵营避免被打爆-----------------------
--------------------防守舰队被摧毁后判定是否占领-----------------------
--------------------不占领--直接开门离开---------

---战利品计算---
---15级基地--15种战利品等级--套用打捞系统战利品公式--玩家打捞能力改为玩家陆战队兵力------

    
function midmapextractbaseENDstart()
--------占领-----------计算玩家的陆战队兵力--计算守军兵力--1级1000--占领计算等于玩家兵力扣除守军兵力----
midmapextractbaseLVarmy = midmapextractbaseLV*1000
midmapextractbaseLVarmylast = midmapextractbaseLVarmy + 100
-----------------如果敌人只剩下一个要塞而且残血---------------------------------
--if (SobGroup_HealthPercentage("vgrmidmapbaseGroup") < 1)and(SobGroup_HealthPercentage("vgrmidmapbaseGroup") > 0)then
if (SobGroup_HealthPercentage("vgrmidmapbaseGroup") < 0.5)and(SobGroup_HealthPercentage("vgrmidmapbaseGroup") > 0)and(midmapextractfleet == 0)and(SobGroup_Count("vgrmidmapbaseGroupfollw00") == 0)then
_ALERT("midmapextractbaseENDstartC") 
     UI_SetElementVisible("fairyMenu01","m_lblTitle",0)
  UI_SetElementVisible("fairyMenu01","m_lblSubTitle",0)
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[239](g_goods[76],midmapextractbaseLV,midmapextractbaseLVarmylast))
  UI_ShowScreen("fairyMenu01", ePopup) 	
  vgrbase = 1
  SobGroup_SwitchOwner( "vgrmidmapbaseGroup", 1)
  Rule_AddInterval("midmapextractbaseENDstart02",1) 
  SobGroup_SetHealth("vgrmidmapbaseGroup",0.5)  
Rule_Remove("midmapextractbaseENDstart")  
-----------------要塞被秒杀--要塞支援舰队被摧毁---------------------------------------
	elseif(SobGroup_Count("vgrmidmapbaseGroup") == 0)and(midmapextractbattleVGRTXTBASE == 1)and(midmapextractfleet == 0)and(SobGroup_Count("vgrmidmapbaseGroupfollw00") == 0)then
   _ALERT("midmapextractbaseENDstartALLD") 
	  Rule_AddInterval("midmapextractbaseEND",5) 
    Rule_Remove("midmapextractbaseENDstart") 	     
-----------------要塞被秒杀--要塞支援舰队还没到来---------------------------------------
	Rule_Remove("midmapextractbaseENDstart")            
   end   
end       
    
    
    
    
function midmapextractbaseENDstart02()
	if (UI_IsNamedElementVisible("fairyMenu01","key01")==0) then
		UI_SetElementVisible("fairyMenu01","key01",1)
		UI_HideScreen('fairyMenu01')	
		Rule_AddInterval("vgrattackbaseControls",1)
		Rule_Remove("midmapextractbaseENDstart02")		
	elseif (UI_IsNamedElementVisible("fairyMenu01","key02")==0) then
		UI_SetElementVisible("fairyMenu01","key02",1)
		UI_HideScreen('fairyMenu01')
		SobGroup_SwitchOwner( "vgrmidmapbaseGroup", 5)
		Rule_AddInterval("midmapextractbaseEND",10)
		--Rule_AddInterval("PopPointLVend",1)  
		Rule_Remove("midmapextractbaseENDstart02")
	end
end         
    
  
function vgrattackbaseControls()
-----------------判断陆战队兵力是否足够------------------------------------- 	

	if(g_goods[76] > midmapextractbaseLVarmylast)then
  basegood04LV = 0
  basegood04mun = 1000
  basegood04W = 0.1
  basegood42LV = -1
  basegood42mun = 100
  basegood42W = 1  
  basegood21LV = -2
  basegood21mun = 10
  basegood21W = 150   
  basegood43LV = -3
  basegood43mun = 100
  basegood43W = 1  
  basegood26LV = -4
  basegood26mun = 10
  basegood26W = 50  
  basegood33LV = -5
  basegood33mun = 100
  basegood33W = 0.5
  basegood44LV = -6
  basegood44mun = 100
  basegood44W = 1  
  basegood75LV = -7
  basegood75mun = 100
  basegood75W = 1  
  basegood189LV = -8
  basegood189mun = 0.03
  basegood189W = 0
  basegood35LV = -9
  basegood35mun = 10
  basegood35W = 10  
  basegood12LV = -10
  basegood12mun = 100
  basegood12W = 100   
  basegood179LV = -11
  basegood179mun = 0.02
  basegood179W = 0
  basegood65LV = -12
  basegood65mun = 10
  basegood65W = 300  
  basegood36LV = -13
  basegood36mun = 0.5
  basegood36W = 100  
  basegood187LV = -14
  basegood187mun = 0.01
  basegood187W = 0     
  vgrbaseEXIT = 1         	
	Rule_AddInterval("vgrattackbaseControlsmission",1) 
	Rule_Remove("vgrattackbaseControls")   
  else   
    UI_SetElementVisible("GateMenu2","m_lblTitle",0)
UI_SetElementVisible("GateMenu2","m_lblSubTitle",0)
UI_SetTextLabelText("GateMenu2","m_lblMessage","$105111")
UI_ShowScreen("GateMenu2", ePopup) 		
SobGroup_SwitchOwner( "vgrmidmapbaseGroup", 5)
  Rule_AddInterval("midmapextractbaseEND",1)
Rule_Remove("vgrattackbaseControls")            
end   
end   





-----------------判断控制基地是否摧毁-------需要战斗开始才能进行摧毁判定------------------------------
function midmapextractbaseEND()	
	if(SobGroup_Count("vgrmidmapbaseGroup") == 0)and(SobGroup_Count("vgrmidmapbaseGroupfollw00") == 0)then  
	_ALERT("midmapextractbaseEND") 
  vgrbase = 0
  vgrbaseEXIT = 0
  vgrbaseATTACKEND = 1
  Rule_Remove("midmapextractbaseEND")            
  end   
end   
-----------------判断控制基地是否摧毁-------------------------------------


-----------------执行登陆判定代码-------------------------------------
function vgrattackbaseControlsmission()
--计算玩家陆战队损失----
--陆战队额外兵力--
  armyout = g_goods[76] - midmapextractbaseLVarmy
         _ALERT("armyout")  
	       _ALERT(armyout)  
--陆战队额外兵力和守军的兵力比--  
  armylosttime = midmapextractbaseLVarmy/g_goods[76]
           _ALERT("armylosttime")  
	       _ALERT(armylosttime)  
--陆战队的损失数--  
	armylost = round(armyout*armylosttime/g_battleLV)
	           _ALERT("armylost")  
	       _ALERT(armylost)
	                    
--陆战队额外兵力和守军的优势兵力比--  
  armyouttime = g_goods[76]/midmapextractbaseLVarmy	
  	           _ALERT("armyouttime")  
	       _ALERT(armyouttime)  
	       
-----战利品商品等于基础数量--乘以打捞乘数--乘以玩家工业能力值区间乘数---------
-----每个商品都有个独立的随机参数good04-----	     
	     good04LV = basegood04LV + midmapextractbaseLV 
	       if (good04LV > 0) then 
	       good04munMIN = basegood04mun*good04LV
         _ALERT("good04munMIN")  
	       _ALERT(good04munMIN)	       
	       good04munMAX = basegood04mun*midmapextractbaseLV*armyouttime*good04LV
         _ALERT("good04munMAX")  
	       _ALERT(good04munMAX)	       
	       good04munbase = random(good04munMIN,good04munMAX)   
	       good04mun = round(good04munbase)
         _ALERT("good04mun")  
	       _ALERT(good04mun)
	       else
	       good04mun = 0
	       end    
-----每个商品都有个独立的随机参数good42-----	       
	     good42LV = basegood42LV + midmapextractbaseLV
	       if (good42LV > 0) then 
	       good42munbase = random(basegood42mun*good42LV,basegood42mun*midmapextractbaseLV*armyouttime*good42LV)   
         _ALERT("good42mun")  
	       _ALERT(good42mun)  
	       good42mun = round(good42munbase)	       
	       else
	       good42mun = 0
	       end    
-----每个商品都有个独立的随机参数good21-----	       
	     good21LV = basegood21LV + midmapextractbaseLV
	       if (good21LV > 0) then 
	       good21munbase = random(basegood21mun*good21LV,basegood21mun*midmapextractbaseLV*armyouttime*good21LV)   
         _ALERT("good21mun")  
	       _ALERT(good21mun)
	       good21mun = round(good21munbase)	 
	       else
	       good21mun = 0
	       end    
-----每个商品都有个独立的随机参数good43-----	       
	     good43LV = basegood43LV + midmapextractbaseLV
	       if (good43LV > 0) then 
	       good43munbase = random(basegood43mun*good43LV,basegood43mun*midmapextractbaseLV*armyouttime*good43LV)   
         _ALERT("good43mun")  
	       _ALERT(good43mun)
	       good43mun = round(good43munbase)	 
	       else
	       good43mun = 0
	       end 
-----每个商品都有个独立的随机参数good26-----	     
	     good26LV = basegood26LV + midmapextractbaseLV
	       if (good26LV > 0) then 
	       good26munbase = random(basegood26mun*good26LV,basegood26mun*midmapextractbaseLV*armyouttime*good26LV)   
         _ALERT("good26mun")  
	       _ALERT(good26mun)
	       good26mun = round(good26munbase)	
	       else
	       good26mun = 0
	       end 	       
-----每个商品都有个独立的随机参数good33-----	     
	     good33LV = basegood33LV + midmapextractbaseLV
	       if (good33LV > 0) then 
	       good33munbase = random(basegood33mun*good33LV,basegood33mun*midmapextractbaseLV*armyouttime*good33LV)   
         _ALERT("good33mun")  
	       _ALERT(good33mun)
	       good33mun = round(good33munbase)	
	       else
	       good33mun = 0
	       end    
-----每个商品都有个独立的随机参数good44-----	       
	     good44LV = basegood44LV + midmapextractbaseLV
	       if (good44LV > 0) then 
	       good44munbase = random(basegood44mun*good44LV,basegood44mun*midmapextractbaseLV*armyouttime*good44LV)   
         _ALERT("good44mun")  
	       _ALERT(good44mun)
	       good44mun = round(good44munbase)	
	       else
	       good44mun = 0
	       end     
-----每个商品都有个独立的随机参数good75-----	       
	     good75LV = basegood75LV + midmapextractbaseLV
	       if (good75LV > 0) then 
	       good75munbase = random(basegood75mun*good75LV,basegood75mun*midmapextractbaseLV*armyouttime*good75LV)   
         _ALERT("good75mun")  
	       _ALERT(good75mun)
	       good75mun = round(good75munbase)	
	       else
	       good75mun = 0
	       end  
-----每个商品都有个独立的随机参数good189-----	     
	     good189LV = basegood189LV + midmapextractbaseLV
	       if (good189LV > 0) then 
	       good189munbase = random(basegood189mun*good189LV,basegood189mun*midmapextractbaseLV*armyouttime*good189LV)   
         _ALERT("good189mun")  
	       _ALERT(good189mun)
	       good189mun = round(good189munbase)	
	       else
	       good189mun = 0
	       end    
-----每个商品都有个独立的随机参数good35-----	       
	     good35LV = basegood35LV + midmapextractbaseLV
	       if (good35LV > 0) then 
	       good35munbase = random(basegood35mun*good35LV,basegood35mun*midmapextractbaseLV*armyouttime*good35LV)   
         _ALERT("good35mun")  
	       _ALERT(good35mun)
	       good35mun = round(good35munbase)	
	       else
	       good35mun = 0
	       end    
-----每个商品都有个独立的随机参数good12-----	       
	     good12LV = basegood12LV + midmapextractbaseLV
	       if (good12LV > 0) then 
	       good12munbase = random(basegood12mun*good12LV,basegood12mun*midmapextractbaseLV*armyouttime*good12LV)   
         _ALERT("good12mun")  
	       _ALERT(good12mun)
	       good12mun = round(good12munbase)	
	       else
	       good12mun = 0
	       end    
-----每个商品都有个独立的随机参数good179-----	       
	     good179LV = basegood179LV + midmapextractbaseLV
	       if (good179LV > 0) then 
	       good179munbase = random(basegood179mun*good179LV,basegood179mun*midmapextractbaseLV*armyouttime*good179LV)   
         _ALERT("good179mun")  
	       _ALERT(good179mun)
	       good179mun = round(good179munbase)	
	       else
	       good179mun = 0
	       end 
-----每个商品都有个独立的随机参数good65-----	       
	     good65LV = basegood65LV + midmapextractbaseLV
	       if (good65LV > 0) then 
	       good65mun = random(basegood65mun*good65LV,basegood65mun*midmapextractbaseLV*armyouttime*good65LV)   
         _ALERT("good65mun")  
	       _ALERT(good65mun)
	       good65mun = round(good65munbase)	
	       else
	       good65mun = 0
	       end  
-----每个商品都有个独立的随机参数good36-----	       
	     good36LV = basegood36LV + midmapextractbaseLV
	       if (good36LV > 0) then 
	       good36munbase = random(basegood36mun*good36LV,basegood36mun*midmapextractbaseLV*armyouttime*good36LV)   
         _ALERT("good36mun")  
	       _ALERT(good36mun)
	       good36mun = round(good36munbase)	
	       else
	       good36mun = 0
	       end 
-----每个商品都有个独立的随机参数good187-----	       
	     good187LV = basegood187LV + midmapextractbaseLV
	       if (good187LV > 0) then 
	       good187mun = random(basegood187mun*good187LV,basegood187mun*midmapextractbaseLV*armyouttime*good187LV)   
         _ALERT("good187mun")  
	       _ALERT(good187mun)
	       good187mun = round(good187munbase)	
	       else
	       good187mun = 0
	       end 	       	       	            	      
-----计算商品总重量-----	       
	     baseControlsgoodtotalW =  good04mun*basegood04W + good42mun*basegood42W + good21mun*basegood21W + good43mun*basegood43W + good26mun*basegood26W + good33mun*basegood33W + good44mun*basegood44W + good75mun*basegood75W + good189mun*basegood189W + good35mun*basegood35W + good12mun*basegood12W + good179mun*basegood179W + good65mun*basegood65W + good36mun*basegood36W + good187mun*basegood187W	     

       _ALERT("baseControlsgoodtotalW")  
	     _ALERT(baseControlsgoodtotalW)	
-----计算玩家货仓空间-----		     	     
g_weightPlay = g_weightlimit - g_weight	       
if (baseControlsgoodtotalW < g_weightPlay) then 
good04munOUT = good04mun
good42munOUT = good42mun
good21munOUT = good21mun
good43munOUT = good43mun
good26munOUT = good26mun
good33munOUT = good33mun
good44munOUT = good44mun
good75munOUT = good75mun
good189munOUT = good189mun
good35munOUT = good35mun
good12munOUT = good12mun
good179munOUT = good179mun
good65munOUT = good65mun
good36munOUT = good36mun
good187munOUT = good187mun
Rule_AddInterval("vgrattackbaseControlsmissionEND",1)
Rule_Remove("vgrattackbaseControlsmission")  
else 
-----------货仓不够离开地图--------------
g_weightPlayOUTtime = baseControlsgoodtotalW/g_weightPlay
good04munOUT = good04mun*g_weightPlayOUTtime
good42munOUT = good42mun*g_weightPlayOUTtime
good21munOUT = good21mun*g_weightPlayOUTtime
good43munOUT = good43mun*g_weightPlayOUTtime
good26munOUT = good26mun*g_weightPlayOUTtime
good33munOUT = good33mun*g_weightPlayOUTtime
good44munOUT = good44mun*g_weightPlayOUTtime
good75munOUT = good75mun*g_weightPlayOUTtime
good189munOUT = good189mun*g_weightPlayOUTtime
good35munOUT = good35mun*g_weightPlayOUTtime
good12munOUT = good12mun*g_weightPlayOUTtime
good179munOUT = good179mun*g_weightPlayOUTtime
good65munOUT = good65mun*g_weightPlayOUTtime
good36munOUT = good36mun*g_weightPlayOUTtime
good187munOUT = good187mun*g_weightPlayOUTtime
Rule_AddInterval("round",1) 
Rule_AddInterval("vgrattackbaseControlsmissionEND",1)         
Rule_Remove("vgrattackbaseControlsmission")            
end    
end



function vgrattackbaseControlsmissionEND()	
  Rule_AddInterval("vgrattackbaseControlsmissionTXT",1)	
       g_goods[76] = g_goods[76] - armylost
	     g_goods[4] = g_goods[4] + good04munOUT  
	     g_goods[42] = g_goods[42] + good42munOUT       
	     g_goods[21] = g_goods[21] + good21munOUT
	     g_goods[43] = g_goods[43] + good43munOUT 
	     g_goods[26] = g_goods[26] + good26munOUT	     
	     g_goods[33] = g_goods[33] + good33munOUT  
	     g_goods[44] = g_goods[44] + good44munOUT       
	     g_goods[75] = g_goods[75] + good75munOUT 	
	     g_goods[189] = g_goods[189] + good189munOUT  
	     g_goods[35] = g_goods[35] + good35munOUT       
	     g_goods[12] = g_goods[12] + good12munOUT
	     g_goods[179] = g_goods[179] + good179munOUT
	     g_goods[65] = g_goods[65] + good65munOUT 	 
	     g_goods[36] = g_goods[36] + good36munOUT 	
	     g_goods[187] = g_goods[187] + good187munOUT 	            
	      	 DTM4_SetRAMCheatKey()       
Rule_Remove("vgrattackbaseControlsmissionEND")  
exploremission = 0
--Rule_AddInterval("midmapexploreLV00_1",10)
Rule_Remove("vgrattackbaseControlsmissionEND")            
end


function vgrattackbaseControlsmissionTXT()
  armytotal = g_goods[76] + armylost
  goodOUTLV15 = good04munOUT + good42munOUT + good21munOUT + good43munOUT + good26munOUT + good33munOUT + good44munOUT + good75munOUT + good189munOUT + good35munOUT
  goodOUTLV14 = good04munOUT + good42munOUT + good21munOUT + good43munOUT + good26munOUT + good33munOUT + good44munOUT + good75munOUT
  goodOUTLV13 = good04munOUT + good42munOUT + good21munOUT + good43munOUT + good26munOUT + good33munOUT
  goodOUTLV12 = good04munOUT + good42munOUT + good21munOUT + good43munOUT


  
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","m_lblTitle",0)
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","m_lblSubTitle",0)
  if (midmapextractbaseLV == 1) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[254](armytotal,armylost,good04mun,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT") 
  elseif (midmapextractbaseLV == 2) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[253](armytotal,armylost,good04mun,good42mun,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")
  elseif (midmapextractbaseLV == 3) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[252](armytotal,armylost,good04mun,good42mun,good21mun,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")   
  elseif (midmapextractbaseLV == 4) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[251](armytotal,armylost,good04mun,good42mun,good21mun,good43mun,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")   
  elseif (midmapextractbaseLV == 5) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[250](armytotal,armylost,good04mun,good42mun,good21mun,good43mun,good26mun,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")     
  elseif (midmapextractbaseLV == 6) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[249](armytotal,armylost,good04mun,good42mun,good21mun,good43mun,good26mun,good33mun,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")     
  elseif (midmapextractbaseLV == 7) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[248](armytotal,armylost,good04mun,good42mun,good21mun,good43mun,good26mun,good33mun,good44mun,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")   
  elseif (midmapextractbaseLV == 8) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[247](armytotal,armylost,good04mun,good42mun,good21mun,good43mun,good26mun,good33mun,good44mun,good75mun,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT") 
  elseif (midmapextractbaseLV == 9) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[246](armytotal,armylost,good04mun,good42mun,good21mun,good43mun,good26mun,good33mun,good44mun,good75mun,good189mun,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")  
  elseif (midmapextractbaseLV == 10) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[245](armytotal,armylost,good04mun,good42mun,good21mun,good43mun,good26mun,good33mun,good44mun,good75mun,good189mun,good35mun,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")
  elseif (midmapextractbaseLV == 11) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[244](armytotal,armylost,good04mun,good42mun,good21mun,good43mun,good26mun,good33mun,good44mun,good75mun,good189mun,good35mun,good12mun,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")  
  elseif (midmapextractbaseLV == 12) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[243](armytotal,armylost,good26mun,good33mun,good44mun,good75mun,good189mun,good35mun,good12mun,good179mun,goodOUTLV12,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")    
  elseif (midmapextractbaseLV == 13) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[242](armytotal,armylost,good44mun,good75mun,good189mun,good35mun,good12mun,good179mun,good65mun,goodOUTLV13,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")   
  elseif (midmapextractbaseLV == 14) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[241](armytotal,armylost,good189mun,good35mun,good12mun,good179mun,good65mun,good36mun,goodOUTLV14,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")  
  elseif (midmapextractbaseLV == 15) then 
  UI_SetTextLabelText("LaunchMenufactorysystemmissionTXT","m_lblMessage",DTM004[240](armytotal,armylost,good12mun,good179mun,good65mun,good36mun,good187mun,goodOUTLV15,baseControlsgoodtotalW))
  UI_ShowScreen("LaunchMenufactorysystemmissionTXT", ePopup)	
  UI_SetElementVisible("LaunchMenufactorysystemmissionTXT","key01",1)			
  Rule_AddInterval("vgrattackbaseControlsmissionTXT_1",1)
  Rule_Remove("vgrattackbaseControlsmissionTXT")                             
end
end
    
    
    function vgrattackbaseControlsmissionTXT_1()
  	if (UI_IsNamedElementVisible("LaunchMenufactorysystemmissionTXT","key01")==0) then  
  	UI_HideScreen('LaunchMenufactorysystemmissionTXT') 
  	      if (VGRBASEmissionmissionSTARTEND==1) then 
  	          _ALERT("mapstargatereopenSET")
  	          Rule_AddInterval("mapstargatereopenSET",1)
  	      elseif (VGRBASEmissionmissionSTARTEND == 0) then 
  	        	_ALERT("midmapextractbaseBATTLEEND") 
               vgrbase = 0
               vgrbaseEXIT = 0
               vgrbaseATTACKEND = 1 
          end     
    Rule_Remove("vgrattackbaseControlsmissionTXT_1")                             
    end
end   