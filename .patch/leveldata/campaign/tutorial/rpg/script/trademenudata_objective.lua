dofilepath("locale:tradetext.lua")
dofilepath("Data:leveldata/campaign/tutorial/RPG/script/trademenudata.lua")
ObjectivesList[1][1][1][1][1].name="PriObj"
ObjectivesList[1][1][1][1][3][1].name="SecObj"
ObjectivesList[1][2].arrangetype=nil
ObjectivesList[1][2][2]=
			{--查看可领受任务
				type = "TextButton",
				name = "btnAvailable",
				buttonStyle = "FEButtonStyle1_Chipped",	
				visible = 0,
				enabled = 0,
				Layout = {
					pivot_XY = { 0.5, 0.0 },					
					pos_XY = {	x=0.125, y=0.0, xr="par", yr="par"},			
					size_WH = {	w = 0.2, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },					
				},	

				Text = {
					text = "NEW TASKS",
				},
				onMousePressed = "UI_SetElementVisible('ObjectivesList','Available', 1)",
			}
ObjectivesList[1][2][3]=
			{--查看已领受任务
				type = "TextButton",
				name = "btnAccepted",
				buttonStyle = "FEButtonStyle1_Alert_Chipped",	
				visible = 0,
				enabled = 0,
				Layout = {
					pivot_XY = { 0.5, 0.0 },					
					pos_XY = {	x=0.125, y=0.0, xr="par", yr="par"},			
					size_WH = {	w = 0.2, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },					
				},	

				Text = {
					text = "ACCEPTED TASKS",
				},
				onMousePressed = "UI_SetElementVisible('ObjectivesList','Accepted', 1)",
			}
ObjectivesList[1][2][4]=
			{--下一个任务
				type = "TextButton",
				name = "btnNext",
				buttonStyle = "FEButtonStyle1_Chipped",	
				visible = 0,
				enabled = 0,
				Layout = {
					pivot_XY = { 0.5, 0.0 },					
					pos_XY = {	x=0.375, y=0.0, xr="par", yr="par"},			
					size_WH = {	w = 0.2, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },					
				},	

				Text = {
					text = "NEXT TASK",
				},
				onMousePressed = "UI_SetElementVisible('ObjectivesList','Next', 1)",
			}
ObjectivesList[1][2][5]=
			{--接受任务
				type = "TextButton",
				name = "btnAccept",
				buttonStyle = "FEButtonStyle1_Chipped",	
				visible = 0,
				enabled = 0,
				Layout = {
					pivot_XY = { 0.5, 0.0 },					
					pos_XY = {	x=0.625, y=0.0, xr="par", yr="par"},			
					size_WH = {	w = 0.2, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },					
				},	

				Text = {
					text = "ACCEPT TASK",
				},
				onMousePressed = "UI_SetElementVisible('ObjectivesList','Accept', 1)",
			}
ObjectivesList[1][2][6]=
			{--放弃任务
				type = "TextButton",
				name = "btnGiveUp",
				buttonStyle = "FEButtonStyle1_Alert_Chipped",	
				visible = 0,
				enabled = 0,
				Layout = {
					pivot_XY = { 0.5, 0.0 },					
					pos_XY = {	x=0.625, y=0.0, xr="par", yr="par"},			
					size_WH = {	w = 0.2, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },					
				},	

				Text = {
					text = "ABANDON TASK",
				},
				onMousePressed = "UI_SetElementVisible('ObjectivesList','GiveUp', 1)",
			}
ObjectivesList[1][2][7]=
			{--关闭
				type = "TextButton",
				name = "btnClose",
				buttonStyle = "FEButtonStyle1_Alert_Chipped",	
				visible = 0,
				Layout = {
					pivot_XY = { 0.5, 0.0 },					
					pos_XY = {	x=0.875, y=0.0, xr="par", yr="par"},			
					size_WH = {	w = 0.2, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },					
				},	

				Text = {
					text = "CLOSE",
				},
				onMousePressed = "UI_ToggleScreen( 'ObjectivesList', 0)",
			}
			
for i=1,100 do
	if(ObjectivesList[i]==nil)then
		ObjectivesList[i]=CreateBlindFrame("Available")
		ObjectivesList[i+1]=CreateBlindFrame("Accepted")
		ObjectivesList[i+2]=CreateBlindFrame("Accept")
		ObjectivesList[i+3]=CreateBlindFrame("GiveUp")
		ObjectivesList[i+4]=CreateBlindFrame("Next")
		break
	end
end