dofilepath("locale:tradetext.lua")
dofilepath("Data:leveldata/campaign/tutorial/RPG/script/trademenudata.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

ChooseTypeMenu = {
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
	
	{
		type = "RmWindow",
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText =	DTM004[115],
		
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},	
			size_WH = { w=0.4, h=0.4, wr="par", hr="par", },
		},

		;
		
		{
			type = "Button",
		    
			Layout = {					
				pos_XY = {	x=0, y=0, xr="par", yr="par",},			
				size_WH = { w=.04, h = .06, wr = "par", hr = "par",},
			},
		    
			name = "LastTypeButton",
			soundOnEnter = "SFX_ButtonEnter",
			soundOnClicked = "SFX_ButtonClick",
		    
			DefaultGraphic = {
				texture = "DATA:ui\\newui\\pvpimage\\arrow2_dflt.tga",
				uvRect = { 0,1,1,0 },
			},
			OverGraphic = {
				texture = "DATA:ui\\newui\\pvpimage\\arrow2_pass.tga",
				uvRect = { 0,1,1,0 },
			},
			PressedGraphic = {
				texture = "DATA:ui\\newui\\pvpimage\\arrow2_down.tga",
				uvRect = { 0,1,1,0 },
			},
			onMouseClicked = "UI_SetElementVisible('ChooseTypeMenu','LastType', 1)",
		},
		{
			type = "TextLabel",
			name = "TypeLabel",					
			Layout = {
				pos_XY = {	x=.15, y=0, xr="par", yr="par",},			
				size_WH = { w=.15, h = .06, wr = "par", hr = "par",},
			},
			Text = {
				textStyle = "RM_ShipInfoLabel_TextStyle",
				vAlign = "Middle",
				hAlign = "Center",
			},
		},
		{
			type = "Button",
		    Layout = {					
				pos_XY = {	x=.4, y=0, xr="par", yr="par",},			
				size_WH = { w=.04, h = .06, wr = "par", hr = "par",},
			},
		    name = "NextTypeButton",
			soundOnEnter = "SFX_ButtonEnter",
			soundOnClicked = "SFX_ButtonClick",
		    DefaultGraphic = {
				texture = "DATA:ui\\newui\\pvpimage\\arrow2_dflt.tga",
				uvRect = { 1,1,0,0 },
			},
			OverGraphic = {
				texture = "DATA:ui\\newui\\pvpimage\\arrow2_pass.tga",
				uvRect = { 1,1,0,0 },
			},
			PressedGraphic = {
				texture = "DATA:ui\\newui\\pvpimage\\arrow2_down.tga",
				uvRect = { 1,1,0,0 },
			},
			onMouseClicked = "UI_SetElementVisible('ChooseTypeMenu','NextType', 1)",
		},
		{
			type = "TextLabel",
			wrapping = 1,
			Layout = {
				pos_XY = {x=0.05, y=0.1, xr="par", yr="par",},
				size_WH = { w=.35, h =.9, wr = "par", hr = "par",},
			},
			name = "STDesc",
			Text = {
				textStyle = "RM_ShipInfoLabel_TextStyle",
				vAlign = "Top", 
				hAlign = "Left", 
				color = {255,255,255,255,},
			},
		},
		
		{
			type = "Frame",
			Layout = {
				pos_XY = {x=.8, y=0, xr="par", yr="par",},
				size_WH = { w = .06, h = .06, wr="par", hr="par", },
				pivot_XY = { x=.5, y=.5, xr="px", yr="px", },
				lockAspect=1,
			},
			BackgroundGraphic = {
				texture = "data:leveldata\\campaign\\tutorial\\RPG\\Icon\\ui\\money.dds",
				uvRec = {0, 0, 1, 1},
				Surface = THREESTATEBUTTONSURFACE,
			},
		},
		{
			type = "TextLabel",
			Layout = {
				pos_XY = {x=0.83, y=0, xr="par", yr="par",},
				size_WH = { w=.2, h =.06, wr = "par", hr = "par",},
			},
			name = "STDescPrice",
			Text = {
				textStyle = "RM_ShipInfoLabel_TextStyle",
				vAlign = "Middle", 
				hAlign = "Left", 
				color = {255,255,255,255,},
			},
		},	
		{
			type = "Frame",
			Layout = {
				pos_XY = {x=.5, y=0, xr="par", yr="par",},
				size_WH = { w = .06, h = .06, wr="par", hr="par", },
				pivot_XY = { x=.5, y=.5, xr="px", yr="px", },
				lockAspect=1,
			},
			BackgroundGraphic = {
				texture = "data:leveldata\\campaign\\tutorial\\RPG\\Icon\\ui\\tradelevel.dds",
				uvRec = {0, 0, 1, 1},
				Surface = THREESTATEBUTTONSURFACE,
			},
		},
		{
			type = "TextLabel",
			Layout = {
				pos_XY = {x=0.53, y=0, xr="par", yr="par",},
				size_WH = { w=.2, h =.06, wr = "par", hr = "par",},
			},
			name = "STDescTrade",
			Text = {
				textStyle = "RM_ShipInfoLabel_TextStyle",
				vAlign = "Middle", 
				hAlign = "Left", 
				color = {255,255,255,255,},
			},
		},
		
		{
			type = "Frame",
			Layout = {
				pos_XY = {x=.6, y=0, xr="par", yr="par",},
				size_WH = { w = .06, h = .06, wr="par", hr="par", },
				pivot_XY = { x=.5, y=.5, xr="px", yr="px", },
				lockAspect=1,
			},
			BackgroundGraphic = {
				texture = "data:leveldata\\campaign\\tutorial\\RPG\\Icon\\ui\\fightlevel.dds",
				uvRec = {0, 0, 1, 1},
				Surface = THREESTATEBUTTONSURFACE,
			},
		},
		{
			type = "TextLabel",
			Layout = {
				pos_XY = {x=0.63, y=0, xr="par", yr="par",},
				size_WH = { w=.2, h =.06, wr = "par", hr = "par",},
			},
			name = "STDescFight",
			Text = {
				textStyle = "RM_ShipInfoLabel_TextStyle",
				vAlign = "Middle", 
				hAlign = "Left", 
				color = {255,255,255,255,},
			},
		},
		
		{
			type = "Frame",
			Layout = {
				pos_XY = {x=.7, y=0, xr="par", yr="par",},
				size_WH = { w = .06, h = .06, wr="par", hr="par", },
				pivot_XY = { x=.5, y=.5, xr="px", yr="px", },
				lockAspect=1,
			},
			BackgroundGraphic = {
				texture = "data:leveldata\\campaign\\tutorial\\RPG\\Icon\\ui\\poppoint.dds",
				uvRec = {0, 0, 1, 1},
				Surface = THREESTATEBUTTONSURFACE,
			},
		},
		{
			type = "TextLabel",
			Layout = {
				pos_XY = {x=0.73, y=0, xr="par", yr="par",},
				size_WH = { w=.2, h =.06, wr = "par", hr = "par",},
			},
			name = "STDescCrew",
			Text = {
				textStyle = "RM_ShipInfoLabel_TextStyle",
				vAlign = "Middle", 
				hAlign = "Left", 
				color = {255,255,255,255,},
			},
		},
		{
			type = "TextLabel",
			Layout = {
				pos_XY = {x=0.65, y=0.1, xr="par", yr="par",},
				size_WH = { w=.5, h =.9, wr = "par", hr = "par",},
			},
			name = "STDescParams",
			Text = {
				textStyle = "RM_ShipInfoLabel_TextStyle",
				vAlign = "Top", 
				hAlign = "Left", 
				color = {255,255,255,255,},
			},
		},
		
		
		{
			type = "Frame",
			Layout = {
				pos_XY = {x=0.65, y=0.9, xr="par", yr="par",},
				size_WH = { w=.35, h =.1, wr = "par", hr = "par",},
			},
			
			arrangetype = "horiz",
			arrangedir = 1,
			arrangeSep = {	x=BUTTON_SPACING_HORIZ, y=0, xr="scr", yr="scr",},
			;
				
			NewMenuButton("m_btnAccept",	DTM004[15],	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1_Alert_Chipped",	 
							 [[
								UI_SetElementVisible('ChooseTypeMenu','BuyShip', 1)
								UI_SetElementVisible('TradeMenu','playercommand',1)
							 ]]),
			NewMenuButton("m_btnCancel",	DTM004[16],	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	
							 [[
								UI_SetElementVisible('ChooseTypeMenu','Cancel', 1)
								UI_SetElementVisible('TradeMenu','playercommand',1)
							 ]]),
		},
	},

	
	CreateBlindFrame("BuyShip"),
	CreateBlindFrame("Cancel"),
	CreateBlindFrame("NextType"),
	CreateBlindFrame("LastType"),
}	
