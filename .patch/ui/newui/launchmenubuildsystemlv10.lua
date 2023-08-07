dofilepath("locale:tradetext.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

DIALOGWIDTH = 254

LaunchMenubuildsystemLV10 = {
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
					NewMenuButton("key01",	"$44681",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key01',0);]]),  --44681  关闭
					NewMenuButton("key02",	"$44680",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key02',0);]]),  --44680  居住区
					NewMenuButton("key03",	"$44685",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key03',0);]]),			--44681  关闭		
					NewMenuButton("key04",	"$44690",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key04',0);]]),--44681  关闭
					NewMenuButton("key05",	"$44695",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key05',0);]]),	 	--44681  关闭					
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
					NewMenuButton("key06",	"$44700",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key06',0);]]),
					NewMenuButton("key07",	"$44705",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key07',0);]]),			
					NewMenuButton("key08",	"$44710",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key08',0);]]),	
					NewMenuButton("key09",	"$44715",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key09',0);]]),	
					NewMenuButton("key10",	"$44720",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key10',0);]]),			
  						
				},
			},			
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
					NewMenuButton("key11",	"$44725",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key11',0);]]),
					NewMenuButton("key12",	"$44730",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key12',0);]]),
					NewMenuButton("key13",	"$44745",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key13',0);]]),					
					NewMenuButton("key14",	"$44750",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key14',0);]]),
					NewMenuButton("key15",	"$44755",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key15',0);]]),	
 						
				},
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
					NewMenuButton("key16",	"$44760",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key16',0);]]),
					NewMenuButton("key17",	"$44765",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key17',0);]]),			
					NewMenuButton("key18",	"$44770",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key18',0);]]),	
					NewMenuButton("key19",	"$44775",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key19',0);]]),	
					NewMenuButton("key20",	"$44780",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key20',0);]]),			
 						
				},
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
					NewMenuButton("key21",	"$44785",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key21',0);]]),
					NewMenuButton("key22",	"$44790",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key22',0);]]),			
					NewMenuButton("key23",	"$44820",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key23',0);]]),		
					NewMenuButton("key24",	"$44825",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key24',0);]]),			
					NewMenuButton("key25",	"$44826",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('LaunchMenubuildsystemLV10','key25',0);]]),						
				},
			},					
		},
	},
}

	