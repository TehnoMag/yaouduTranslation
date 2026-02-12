

function midmapmineLV00()	
       	 _ALERT("midmapmineLV")  
	     _ALERT(midmapmineLV)  
if (midmapmineLV < 10) then 
  UI_SetElementVisible("fairyMenu01","m_lblTitle",0)
  UI_SetElementVisible("fairyMenu01","m_lblSubTitle",0)
  UI_SetTextLabelText("fairyMenu01","m_lblMessage","$105095")
  UI_ShowScreen("fairyMenu01", ePopup)		
  ----------------计算各种商品的基础数据-------------------------
  basegood22LV = 0
  basegood22mun = 100
  basegood22W = 5
  basegood33LV = 0
  basegood33mun = 100
  basegood33W = 0.5  
  basegood29LV = -1
  basegood29mun = 10
  basegood29W = 100   
  basegood34LV = -1
  basegood34mun = 100
  basegood34W = 0.01  
  basegood26LV = -2
  basegood26mun = 10
  basegood26W = 50
  basegood76LV = -2
  basegood76mun = 10
  basegood76W = 10  
  basegood30LV = -3
  basegood30mun = 1
  basegood30W = 400   
  basegood27LV = -4
  basegood27mun = 1
  basegood27W = 20  
  basegood23LV = -5
  basegood23mun = 10
  basegood23W = 10
  basegood51LV = -6
  basegood51mun = 1
  basegood51W = 1000  
  basegood52LV = -7
  basegood52mun = 1
  basegood52W = 1000   
  basegood53LV = -8
  basegood53mun = 1
  basegood53W = 2000
  basegood36LV = -9
  basegood36mun = 1
  basegood36W = 100          
    ----------------执行判断代码--玩家是否要就采矿-----------------------	 
Rule_AddInterval("midmapmineLV00_1",1)   --vgrattackbasemissionbattle
Rule_Remove("midmapmineLV00")  
else 
----------不采矿就直接离开-----------------------	
exploremission = 0
Rule_AddInterval("midmapexploreLV00_1",1)
Rule_Remove("midmapmineLV00")            
end
end

-----------------选择是否采矿------------------------------------
function midmapmineLV00_1()	
	if (UI_IsNamedElementVisible("fairyMenu01","key01")==0) then
		UI_SetElementVisible("fairyMenu01","key01",1)
		UI_HideScreen('fairyMenu01')	
		----------------------完成第一次采矿后进入随机触发战斗环节---------------------------  		 	   
   		Rule_AddInterval("midmapminemissionstart",1) 
		Rule_Remove("midmapmineLV00_1")		
	elseif (UI_IsNamedElementVisible("fairyMenu01","key02")==0) then
		UI_SetElementVisible("fairyMenu01","key02",1)
		UI_HideScreen('fairyMenu01')
		removeshipbattleTXT = 0
		Rule_AddInterval("midmapexploreLV00_1",1)
Rule_Remove("midmapmineLV00_1")            
end
end		

-------------------------------------------------------------


--采矿计算代码----
function midmapminemission()
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
--每采矿一次离开时候随机难度增加一级--每采矿一次有可能获得更高级的物资--
		 	 midmapmineLV = midmapmineLV + 1 
       _ALERT("midmapmineLVadd")  
	     _ALERT(midmapmineLV)
       battleLVmission = battleLVmission + 1
       _ALERT("battleLVmission")  
	     _ALERT(battleLVmission)
-----每个商品都有个独立的随机参数good22-----	     
	     good22LV = basegood22LV + midmapmineLV 
	       if (good22LV > 0) then 
	       good22mun = random(basegood22mun*good22LV,basegood22mun*midmapmineLV*g_factorylimitLV*good22LV)   
         _ALERT("good22mun")  
	       _ALERT(good22mun)
	       else
	       good22mun = 0
	       end    
-----每个商品都有个独立的随机参数good33-----	       
	     good33LV = basegood33LV + midmapmineLV
	       if (good33LV > 0) then 
	       good33mun = random(basegood33mun*good33LV,basegood33mun*midmapmineLV*g_factorylimitLV*good33LV)   
         _ALERT("good33mun")  
	       _ALERT(good33mun)
	       else
	       good33mun = 0
	       end    
-----每个商品都有个独立的随机参数good29-----	       
	     good29LV = basegood29LV + midmapmineLV
	       if (good29LV > 0) then 
	       good29mun = random(basegood29mun*good29LV,basegood29mun*midmapmineLV*g_factorylimitLV*good29LV)   
         _ALERT("good29mun")  
	       _ALERT(good29mun)
	       else
	       good29mun = 0
	       end    
-----每个商品都有个独立的随机参数good34-----	       
	     good34LV = basegood34LV + midmapmineLV
	       if (good34LV > 0) then 
	       good34mun = random(basegood34mun*good34LV,basegood34mun*midmapmineLV*g_factorylimitLV*good34LV)   
         _ALERT("good34mun")  
	       _ALERT(good34mun)
	       else
	       good34mun = 0
	       end 
-----每个商品都有个独立的随机参数good26-----	     
	     good26LV = basegood26LV + midmapmineLV
	       if (good26LV > 0) then 
	       good26mun = random(basegood26mun*good26LV,basegood26mun*midmapmineLV*g_factorylimitLV*good26LV)   
         _ALERT("good26mun")  
	       _ALERT(good26mun)
	       else
	       good26mun = 0
	       end    
-----每个商品都有个独立的随机参数good76-----	       
	     good76LV = basegood76LV + midmapmineLV
	       if (good76LV > 0) then 
	       good76mun = random(basegood76mun*good76LV,basegood76mun*midmapmineLV*g_factorylimitLV*good76LV)   
         _ALERT("good76mun")  
	       _ALERT(good76mun)
	       else
	       good76mun = 0
	       end    
-----每个商品都有个独立的随机参数good30-----	       
	     good30LV = basegood30LV + midmapmineLV
	       if (good30LV > 0) then 
	       good30mun = random(basegood30mun*good30LV,basegood30mun*midmapmineLV*g_factorylimitLV*good30LV)   
         _ALERT("good30mun")  
	       _ALERT(good30mun)
	       else
	       good30mun = 0
	       end    
-----每个商品都有个独立的随机参数good27-----	       
	     good27LV = basegood27LV + midmapmineLV
	       if (good27LV > 0) then 
	       good27mun = random(basegood27mun*good27LV,basegood27mun*midmapmineLV*g_factorylimitLV*good27LV)   
         _ALERT("good27mun")  
	       _ALERT(good27mun)
	       else
	       good27mun = 0
	       end  
-----每个商品都有个独立的随机参数good23-----	     
	     good23LV = basegood23LV + midmapmineLV
	       if (good23LV > 0) then 
	       good23mun = random(basegood23mun*good23LV,basegood23mun*midmapmineLV*g_factorylimitLV*good23LV)   
         _ALERT("good23mun")  
	       _ALERT(good23mun)
	       else
	       good23mun = 0
	       end    
-----每个商品都有个独立的随机参数good51-----	       
	     good51LV = basegood51LV + midmapmineLV
	       if (good51LV > 0) then 
	       good51mun = random(basegood51mun*good51LV,basegood51mun*midmapmineLV*g_factorylimitLV*good51LV)   
         _ALERT("good51mun")  
	       _ALERT(good51mun)
	       else
	       good51mun = 0
	       end    
-----每个商品都有个独立的随机参数good52-----	       
	     good52LV = basegood52LV + midmapmineLV
	       if (good52LV > 0) then 
	       good52mun = random(basegood52mun*good52LV,basegood52mun*midmapmineLV*g_factorylimitLV*good52LV)   
         _ALERT("good52mun")  
	       _ALERT(good52mun)
	       else
	       good52mun = 0
	       end    
-----每个商品都有个独立的随机参数good53-----	       
	     good53LV = basegood53LV + midmapmineLV
	       if (good53LV > 0) then 
	       good53mun = random(basegood53mun*good53LV,basegood53mun*midmapmineLV*g_factorylimitLV*good53LV)   
         _ALERT("good53mun")  
	       _ALERT(good53mun)
	       else
	       good53mun = 0
	       end 
-----每个商品都有个独立的随机参数good36-----	       
	     good36LV = basegood36LV + midmapmineLV
	       if (good36LV > 0) then 
	       good36mun = random(basegood36mun*good36LV,basegood36mun*midmapmineLV*g_factorylimitLV*good36LV)   
         _ALERT("good36mun")  
	       _ALERT(good36mun)
	       else
	       good36mun = 0
	       end  	            	         	          
-----计算商品总重量-----	       
	     midmapminegoodtotalW =  good22mun*basegood22W + good33mun*basegood33W + good29mun*basegood29W + good34mun*basegood34W + good26mun*basegood26W + good76mun*basegood76W + good30mun*basegood30W + good27mun*basegood27W + good23mun*basegood23W + good51mun*basegood51W + good52mun*basegood52W + good53mun*basegood53W + good36mun*basegood36W	     
       _ALERT("midmapminegoodtotalW")  
	     _ALERT(midmapminegoodtotalW)	
-----计算玩家货仓空间-----		     	     
g_weightPlay = g_weightlimit - g_weight	       
if (midmapminegoodtotalW < g_weightPlay) then 
Rule_AddInterval("midmapmineLV01",1)
Rule_Remove("midmapminemission")  
else 
-----------货仓不够离开地图--------------
  UI_SetElementVisible("GateMenu2","m_lblTitle",0)
UI_SetElementVisible("GateMenu2","m_lblSubTitle",0)
UI_SetTextLabelText("GateMenu2","m_lblMessage",DTM004[238](g_factorylimit,midmapminegoodtotalW,g_weightPlay))
UI_ShowScreen("GateMenu2", ePopup) 	          
Rule_AddInterval("midmapexploreLV00_1",10)
Rule_Remove("midmapminemission")            
end    
end


function midmapmineLV01()	
text14 = midmapmineLV
       	 _ALERT("midmapmineLV")  
	     _ALERT(midmapmineLV)  
if (midmapmineLV < 10) then 
  -- Rule_AddInterval("midmapmineTXT",1) reroute to Patched version by TehnoMag	
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
Rule_Remove("midmapmineLV01")  
else 
-----------采矿次数已满离开地图--------------
  UI_SetElementVisible("GateMenu2","m_lblTitle",0)
UI_SetElementVisible("GateMenu2","m_lblSubTitle",0)
  UI_SetTextLabelText("GateMenu2","m_lblMessage",DTM004[228](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,good52mun,good53mun,good36mun))
UI_ShowScreen("GateMenu2", ePopup) 
exploremission = 0
Rule_AddInterval("midmapexploreLV00_1",10)
Rule_Remove("midmapmineLV01")            
end
end


function midmapmineTXT_Patched()
  UI_SetElementVisible("fairyMenu01","m_lblTitle",0)
  UI_SetElementVisible("fairyMenu01","m_lblSubTitle",0)
  if (midmapmineLV == 1) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[229](g_factorylimit,good22mun,good33mun,midmapmineLV))
  UI_ShowScreen("midmapSalvage", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT_Patched") 
  elseif (midmapmineLV == 2) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[230](g_factorylimit,good22mun,good33mun,good29mun,good34mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT_Patched")
  elseif (midmapmineLV == 3) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[231](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT_Patched")   
  elseif (midmapmineLV == 4) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[232](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT_Patched")   
  elseif (midmapmineLV == 5) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[233](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT_Patched")     
  elseif (midmapmineLV == 6) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[234](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT_Patched")     
  elseif (midmapmineLV == 7) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[235](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT_Patched")   
  elseif (midmapmineLV == 8) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[236](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,good52mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT_Patched") 
  elseif (midmapmineLV == 9) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[237](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,good52mun,good53mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT_Patched")  
  elseif (midmapmineLV == 10) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[228](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,good52mun,good53mun,good36mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT_Patched")                          
end
end

function midmapmineTXT()
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
text14 = midmapmineLV
text15 = good76mun
  UI_SetElementVisible("fairyMenu01","m_lblTitle",0)
  UI_SetElementVisible("fairyMenu01","m_lblSubTitle",0)
  if (midmapmineLV == 1) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[229](g_factorylimit,good22mun,good33mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT") 
  elseif (midmapmineLV == 2) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[230](g_factorylimit,good22mun,good33mun,good29mun,good34mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT")
  elseif (midmapmineLV == 3) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[231](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT")   
  elseif (midmapmineLV == 4) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[232](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT")   
  elseif (midmapmineLV == 5) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[233](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT")     
  elseif (midmapmineLV == 6) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[234](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT")     
  elseif (midmapmineLV == 7) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[235](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT")   
  elseif (midmapmineLV == 8) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[236](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,good52mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT") 
  elseif (midmapmineLV == 9) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[237](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,good52mun,good53mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT")  
  elseif (midmapmineLV == 10) then 
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[228](g_factorylimit,good22mun,good33mun,good29mun,good34mun,good26mun,good76mun,good30mun,good27mun,good23mun,good51mun,good52mun,good53mun,good36mun,midmapmineLV))
  UI_ShowScreen("fairyMenu01", ePopup)		
  Rule_AddInterval("midmapmineLV00_1",1)
  Rule_Remove("midmapmineTXT")                          
end
end
    

-------------------------采矿后触发战斗系统---------------------------------------------
  function midmapminemissionstart()	
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
         g_battlemidmapmine = g_factorylimitLV + battleLVmission
	 _ALERT("g_battlemidmapmine")  
	 _ALERT(g_battlemidmapmine)          
--------一共25级固定召唤和15级事件难度召唤--不同事件会引发更高的召唤难度---玩家工程能力越高越容易引来敌人--------	 	         
         local randommidmapminetime = 
         {
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",
         "midmapminebattleLV00",         
         "midmapminebattleLV01",
         "midmapminebattleLV01",
         "midmapminebattleLV01",
         "midmapminebattleLV01",
         "midmapminebattleLV01",
         "midmapminebattleLV01",
         "midmapminebattleLV01",
         "midmapminebattleLV01",
         "midmapminebattleLV01",
         "midmapminebattleLV01"
         }               
         randommidmapminetime = randommidmapminetime[random(battleLVmission,g_battlemidmapmine)] 
     	 _ALERT("randommidmapminetime")  
	     _ALERT(randommidmapminetime)  
	     ------------执行随机代码---------------
	     Rule_AddInterval(randommidmapminetime,1) 
  --------换算完军等才能加载攻击列表-----------	 	   	   	
Rule_Remove("midmapminemissionstart") 
end

function midmapminebattleLV00()	
_ALERT("midmapminebattleLV00start") 
Rule_AddInterval("midmapminemission",1) 
Rule_Remove("midmapminebattleLV00")            
end  

function midmapminebattleLV01()	
_ALERT("midmapminebattleLV01start") 
removeshipbattleTXT = 1
Rule_AddInterval("midmapextractbattleLV01time01",1) 
Rule_AddInterval("midmapminebattleENDstart",1) 
Rule_Remove("midmapminebattleLV01")            
end  



function midmapminebattleENDstart()	
if(midmapextractfleet == 0)then  
removeshipbattleTXT = 0
Rule_AddInterval("midmapminebattleEND",1) 
Rule_Remove("midmapminebattleENDstart")            
end  


function midmapminebattleEND()
_ALERT("midmapminebattleEND")  
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
   	Rule_AddInterval("midmapminebattleENDmoneyLV",1)
   	Rule_Remove("midmapminebattleEND")  	   	
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
	  --Rule_AddInterval("midmapminebattleENDmoney",1)  	
	  Rule_AddInterval("midmapminebattleENDmoneyLV",1) 
		Rule_Remove("midmapminebattleEND")
  end	 
end	


----------赏金结算---------------------------
function midmapminebattleENDmoneyLV()
  if (g_battlemoneyLV <= 10) then
     Honorpointget = 1 
     g_battlemoney = g_battlemoneyLV*10000  
     g_battleexp = g_battlemoneyLV*1000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapminebattleENDTXT",1) 	  
     Rule_Remove("midmapminebattleENDmoneyLV") 
  elseif (g_battlemoneyLV > 10)and(g_battlemoneyLV <= 20) then 
     Honorpointget = 2 
     g_battlemoney = g_battlemoneyLV*50000
     g_battleexp = g_battlemoneyLV*5000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapminebattleENDTXT",1) 	  
     Rule_Remove("midmapminebattleENDmoneyLV")
  elseif (g_battlemoneyLV > 20)and(g_battlemoneyLV <= 30) then 
     Honorpointget = 3 
     g_battlemoney = g_battlemoneyLV*100000
     g_battleexp = g_battlemoneyLV*10000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapminebattleENDTXT",1) 	  
     Rule_Remove("midmapminebattleENDmoneyLV")   
  elseif (g_battlemoneyLV > 30)and(g_battlemoneyLV <= 40) then 
     Honorpointget = 4 
     g_battlemoney = g_battlemoneyLV*200000
     g_battleexp = g_battlemoneyLV*20000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapminebattleENDTXT",1) 	  
     Rule_Remove("midmapminebattleENDmoneyLV")       
  elseif (g_battlemoneyLV > 40)and(g_battlemoneyLV <= 50) then 
     Honorpointget = 5 
     g_battlemoney = g_battlemoneyLV*300000
     g_battleexp = g_battlemoneyLV*30000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapminebattleENDTXT",1) 	  
     Rule_Remove("midmapminebattleENDmoneyLV")   
  elseif (g_battlemoneyLV > 50)and(g_battlemoneyLV <= 60) then 
     Honorpointget = 6 
     g_battlemoney = g_battlemoneyLV*500000
     g_battleexp = g_battlemoneyLV*50000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapminebattleENDTXT",1) 	  
     Rule_Remove("midmapminebattleENDmoneyLV") 
  elseif (g_battlemoneyLV > 60)and(g_battlemoneyLV <= 70) then 
     Honorpointget = 7 
     g_battlemoney = g_battlemoneyLV*750000
     g_battleexp = g_battlemoneyLV*75000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapminebattleENDTXT",1) 	  
     Rule_Remove("midmapminebattleENDmoneyLV")    
  elseif (g_battlemoneyLV > 70)and(g_battlemoneyLV <= 80) then 
     Honorpointget = 7 
     g_battlemoney = g_battlemoneyLV*1000000
     g_battleexp = g_battlemoneyLV*100000
     g_money = g_money + g_battlemoney
     g_FightExp = g_FightExp + g_battleexp
     g_goods[180] = g_goods[180] + Honorpointget
     DTM4_SetRAMCheatKey() 
     Rule_AddInterval("midmapminebattleENDTXT",1) 	  
     Rule_Remove("midmapminebattleENDmoneyLV")                                                  
  end  
end  



----------战利品文本---------判定各种结局生成不同的文本------------------
function midmapminebattleENDTXT()
	 _ALERT("g_battlemoney")  
	 _ALERT(g_battlemoney) 
	 _ALERT("g_battleexp")  
	 _ALERT(g_battleexp) 
	 _ALERT("Honorpointget")  
	 _ALERT(Honorpointget) 	 	   
  UI_SetElementVisible("fairyMenu01","m_lblTitle",0)
  UI_SetElementVisible("fairyMenu01","m_lblSubTitle",0)
  UI_SetTextLabelText("fairyMenu01","m_lblMessage",DTM004[260](g_battlemoney,g_battleexp,Honorpointget,Honorpointget,battleLVmission))
  UI_ShowScreen("fairyMenu01", ePopup)	
  Rule_AddInterval("midmapmineLV00_1",1)     --------计算采矿等级-----------	    
  Rule_Remove("midmapminebattleENDTXT")            
  end  
end  
