

function dofilepathTSTmidmapmission02explore()	
 _ALERT("dofilepathTSTmidmapmission02explore") 
Rule_Remove("dofilepathTSTmidmapmission02explore")            
end 

----------------------------探索星区事件链----------------------------------------------------
  function midmapmission02explore()	  
	if (UI_IsNamedElementVisible("LaunchMenuMIDmapmenu","key01")==0) then	
	exploremission = 1
	
----------------------------按钮激活----------------------------------------------------
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
	g_battleLVMAX = g_battleLV*3
	 _ALERT("g_battleLV")  
	 _ALERT(g_battleLV) 
----------------------------随机事件库---------75级-------------------------------------------	 
         local randommidmapexploremissiontime = 
         {
         "midmapexploreLV00",
         "midmapextractbaseLV01",
         "midmapremoveshipLV00",
         "cargoshiptimeLV01",
         "basedefensetimeLV01",   
         "midmapexploreLV00",
         "midmapextractbaseLV02",
         "midmapremoveshipLV00",
         "cargoshiptimeLV02",
         "basedefensetimeLV02",   
         "midmapexploreLV00",
         "midmapextractbaseLV03",
         "midmapremoveshipLV00",
         "cargoshiptimeLV03",
         "basedefensetimeLV03",   
         "midmapexploreLV00",
         "midmapextractbaseLV04",
         "midmapremoveshipLV00",
         "cargoshiptimeLV04",
         "basedefensetimeLV04",   
         "midmapexploreLV00",
         "midmapextractbaseLV05",
         "midmapremoveshipLV00",
         "cargoshiptimeLV05",
         "basedefensetimeLV05",   
         "midmapexploreLV00",
         "midmapextractbaseLV06",
         "midmapremoveshipLV00",
         "cargoshiptimeLV06",
         "basedefensetimeLV06",   
         "midmapexploreLV00",
         "midmapextractbaseLV07",
         "midmapremoveshipLV00",
         "cargoshiptimeLV07",
         "basedefensetimeLV07",   
         "midmapexploreLV00",
         "midmapextractbaseLV08",
         "midmapremoveshipLV00",
         "cargoshiptimeLV08",
         "basedefensetimeLV08",   
         "midmapexploreLV00",
         "midmapextractbaseLV09",
         "midmapremoveshipLV00",
         "cargoshiptimeLV09",
         "basedefensetimeLV09",   
         "midmapexploreLV00",
         "midmapextractbaseLV10",
         "midmapremoveshipLV00",
         "cargoshiptimeLV10",
         "basedefensetimeLV10",   
         "midmapexploreLV00",
         "midmapextractbaseLV11",
         "midmapremoveshipLV00",
         "cargoshiptimeLV11",
         "basedefensetimeLV11",   
         "midmapexploreLV00",
         "midmapextractbaseLV12",
         "midmapremoveshipLV00",
         "cargoshiptimeLV12",
         "basedefensetimeLV12",   
         "midmapexploreLV00",
         "midmapextractbaseLV13",
         "midmapremoveshipLV00",
         "cargoshiptimeLV13",
         "basedefensetimeLV13",   
         "midmapexploreLV00",
         "midmapextractbaseLV14",
         "midmapremoveshipLV00",
         "cargoshiptimeLV14",
         "basedefensetimeLV14",   
         "midmapexploreLV00",
         "midmapextractbaseLV15",
         "midmapremoveshipLV00",
         "cargoshiptimeLV15",
         "basedefensetimeLV15"                                  
         } 	
         randommidmapexploremissiontime = randommidmapexploremissiontime[random(g_battleLV,g_battleLVMAX)]
         --randommidmapexploremissiontime = randommidmapexploremissiontime[random(5,5)]

----------执行探索事件-----------
  --Rule_AddInterval(randommidmapexploremissiontime,1) 
	Rule_AddInterval("midmapremoveshipLV00",1)
       	 _ALERT("randommidmapexploremissiontime")  
	     _ALERT(randommidmapexploremissiontime)  
	Rule_Remove("midmapmission03extract")      
	UI_SetElementVisible("LaunchMenuMIDmapmenu","key02",0)  
	----------检测是否直接遭遇对应敌人而非独立事件-----------   
	Rule_AddInterval("midmapmission02exploreBATTLE",1)  	   
  Rule_Remove("midmapmission02explore") 
  end  
end




--------无事件--顺利离开--------- 


