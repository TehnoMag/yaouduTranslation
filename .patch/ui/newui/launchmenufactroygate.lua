dofilepath("locale:tradetext.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

DIALOGWIDTH = 254

LaunchMenufactroyGATE = {
	stylesheet = "HW2StyleSheet",

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},

	pixelUVCoords = 1, 
	
	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN,
	},
	
	onShow = "MainUI_PushEnabledCommandState(); MainUI_DisableAllCommands(1);",
	onHide = "MainUI_PopEnabledCommandState()",
	;
		


----------------------- Master Frame --------------------
	{
		type = "RmWindow",
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText =	"$5598", -- "WARNING",
		-- SubtitleText = "$5169", 	
	
			
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},				
		},	
		
		autosize  = 1,

		--arrangetype = "vert",
		--arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},
		;
			
			
----------------------- Title Text Row -----------------------			
		{
			type = "Frame",
			autosize  = 1,
			arrangetype = "vert",
			arrangedir = 1,	

			Layout = {
				margin_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				margin_RB = { r = PANEL_PAD_HORIZ, b =1, rr = "scr", br = "px" },				
				size_WH = {	w = 0.5, h = 1.2, wr = "scr", hr = "px" },		
				max_WH = { w = 0.8, wr = "scr" },								
			},	
			arrangeSep = {	x=BUTTON_SPACING_HORIZ, y=0.01, xr="scr", yr="scr",},
			
			;	
			-- Message Label
			{
					type = "TextLabel",
					name = "m_lblMessage",					
					autosize = 1,
					wrapping = 1,
					Text = {
						textStyle = "RM_MessageLabel_TextStyle",

						vAlign = "Top",
						hAlign = "Center",
					},

					Layout = {
						margin_RB = { r = 1, b =PANEL_PAD_VERT, rr = "px", br = "scr" },					
						size_WH = {w = 1, h = 1, wr = "par", hr = "px",}, 
					},

					giveParentMouseInput = 1,
					;
			},
					
			------------------------------------------------------------------------------------
			-- BOTTOM ROW
			------------------------------------------------------------------------------------
			
			{
				type = "Frame",			

				autosize  = 1,

				clipchildren=0,
				Layout = {				
					size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
				},

				;
				{
					type = "Frame",			

					autosize  = 1,

					arrangetype = "horiz",
					arrangedir = 1,	

					Layout = {
						pivot_XY = { 0.0, 0.0 },					
						pos_XY = {	x=0.1, y=0.0, xr="par", yr="px",},					

					},
					arrangeSep = {	x=BUTTON_SPACING_HORIZ, y=0, xr="scr", yr="scr",},	
					;
					NewMenuButton("key01",	"$44681",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenufactroyGATE','key01',0);]]),  --44681  关闭					
					NewMenuButton("key02",	"$47440",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenufactroyGATE','key02',0);]]),  --44681  关闭
					NewMenuButton("key03",	"$47445",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenufactroyGATE','key03',0);]]),  --44680  居住区
					NewMenuButton("key04",	"$47450",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenufactroyGATE','key04',0);]]),			--44681  关闭				
				},
			},
			-------------------44681  关闭-----------------------------------------------------------------
			-- BOTTOM ROW
			------------------------------------------------------------------------------------
			
			{
				type = "Frame",			

				autosize  = 1,

				clipchildren=0,
				Layout = {				
					size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
				},

				;
				{
					type = "Frame",			

					autosize  = 1,

					arrangetype = "horiz",
					arrangedir = 1,	

					Layout = {
						pivot_XY = { 0.0, 0.0 },					
						pos_XY = {	x=0.1, y=0.0, xr="par", yr="px",},					

					},
					arrangeSep = {	x=BUTTON_SPACING_HORIZ, y=0, xr="scr", yr="scr",},	
					;
					NewMenuButton("key05",	"$47455",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenufactroyGATE','key05',0);]]),--44681  关闭
					NewMenuButton("key06",	"$47460",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenufactroyGATE','key06',0);]]),	 	--44681  关闭										  						
				},
			},		
			-------------------44681  关闭-----------------------------------------------------------------
			-- BOTTOM ROW
			------------------------------------------------------------------------------------
			
			{
				type = "Frame",			

				autosize  = 1,

				clipchildren=0,
				Layout = {				
					size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
				},

				;
				{
					type = "Frame",			

					autosize  = 1,

					arrangetype = "horiz",
					arrangedir = 1,	

					Layout = {
						pivot_XY = { 0.0, 0.0 },					
						pos_XY = {	x=0.1, y=0.0, xr="par", yr="px",},					

					},
					arrangeSep = {	x=BUTTON_SPACING_HORIZ, y=0, xr="scr", yr="scr",},	
					;						
					NewMenuButton("key07",	"$47465",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenufactroyGATE','key07',0);]]),
					NewMenuButton("key08",	"$47470",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenufactroyGATE','key08',0);]]),		
					NewMenuButton("key09",	"$47472",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenufactroyGATE','key09',0);]]),		  						
				},
			},						
		},
	},
}

	