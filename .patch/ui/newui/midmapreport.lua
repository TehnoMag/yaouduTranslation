dofilepath("locale:tradetext.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua") 
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

DIALOGWIDTH = 254

midmapReport = {
	stylesheet = "HW2StyleSheet",
	
	Layout = {
		pos_XY = { x=0.0, y=0.0, xr="px", yr="px" },
		size_WH = { w=1, h=1, wr="scr", hr="scr" }
	},
	
	pixelUVCoords = 1,
	
	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN
	},
	
	onShow = "MainUI_PushEnabledCommandState(); MainUI_DisableAllCommands(1);",
	onHide = "MainUI_PopEnabledCommandState()",  
	;
	
	{
		type = "RmWindow",
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText = "$5534",
		
		Layout = {
			pivot_XY = { 0.5, 0.5 },
			pos_XY = { x=0.5, y=0.5, xr="par", yx="par" },
			size_WH = { w=.3, h=.3, wr = "scr", hr="scr" }
		},
		;
		
		{
			-- Salvage OPS Frame
			type = "Frame",
			arrangetype = "vert",
			
			Layout = {
				size_WH = { w=1., h=1., wr="par", hr="par" }
			}
			
			;
			{
				type = "Frame",
				arrangetype = "horiz",
				
				Layout = {
					size_WH = { w=.6, h=1., wr="par", hr="par" }
				}
				
				;
				{
					type = "Frame",
					arrangetype = "vert",
					
					Layout = {
						size_WH = { w=.75, h=1., wr="par", hr="par" },
					}
					;
					
					{
						-- Goods List1
						type = "TextLabel",
						name = "m_lbList1",
						autosize=1,
						
						Layout = {
							size_WH = { w=1., h=1, wr="par", hr="px"}
						},
						
						Text = {
							textStyle = "RM_ShipInfoLabel_TextStyle",
							vAlign = "Top",
							hAlign = "Left"
						}
					},
					{
						-- Goods List2
						type = "TextLabel",
						name = "m_lbList2",
						autosize=1,
						
						Layout = {
							size_WH = { w=1., h=1, wr="par", hr="px"}
						},
						
						Text = {
							textStyle = "RM_ShipInfoLabel_TextStyle",
							vAlign = "Top",
							hAlign = "Left"
						}
					}
				},
				{
					type = "Frame",
					arrangetype = "vert",
					
					Layout = {
						size_WH = { w=.25, h=1., wr="par", hr="par" },
					}					
					;
					
					{
						-- Goods Count1
						type = "TextLabel",
						name = "m_lbList3",
						autosize = 1,
						
						Layout = {
							size_WH = { w=1., h=1, wr="par", hr="px"}
						},
						
						Text = {
							textStyle = "RM_ShipInfoLabel_TextStyle",
							vAlign = "Top",
							hAlign = "Left"
						}
					},
					{
						-- Goods Count2
						type = "TextLabel",
						name = "m_lbList4",
						autosize = 1,
						
						Layout = {
							size_WH = { w=1., h=1, wr="par", hr="px"}
						},
						
						Text = {
							textStyle = "RM_ShipInfoLabel_TextStyle",
							vAlign = "Top",
							hAlign = "Left"
						}
					}
				}
			}
		},
		{
			type = "Frame",
			clipchildren = 0,
			
			Layout = {
				pos_XY = { x=.55, y=0, xr="par", hr="par" },
				size_WH = { w=.4, h=1, wr="par", hr="par" }
			}
			;
			
			{
				type = "TextLabel",
				name = "m_lbNotice",
				wrapping = 1,
				--giveParentMouseInput = 1,
				
				Text = {
					textStyle = "RM_ShipInfoLabel_TextStyle",
					vAlign = "Middle",
					hAlign = "Left"
				}
			}
		},
		{
			type = "Frame",
			arrangetype = "horiz",
			clipchildren = 0,
					
			Layout = {
				pivot_XY = { 0., 1. },
				pos_XY = { x=0, y=1., xr="par", yr="par" },
				size_WH = { w=1., h=25, wr="par", hr="px" }
			}
			;
					
			{
				type = "TextLabel",
				name = "m_lbResultParam",
				
				Layout = {
					size_WH = { w=.5, h=1., wr="par", hr="par" }
				},
						
				Text = {
					textStyle = "RM_ShipInfoLabel_TextStyle",
					vAlign = "Bottom",
					hAlign = "Left"
				}
			},		
			{
				type = "Frame",
				autosize = 1,
				arrangetype = "horiz",
				arrangedir = 1,
				arrangeSep = { x=BUTTON_SPACING_HORIZ, y=0, xr="scr", yr="scr"},
					
				Layout = {
					pivot_XY = { 1., 1. },
					pos_XY = { x=1., y=1., xr="par", yr="par" }
				}
				;
				
				NewMenuButton("btnOK", "$2612", "", 0, BTN_FOOTER_SMALL_LAYOUT, "FEButtonStyle1", [[UI_HideScreen('midmapSalvage');]]),
				NewMenuButton("btnYES", "$71035", "", 0, BTN_FOOTER_SMALL_LAYOUT, "FEButtonStyle1", [[UI_SetElementVisible('midmapSalvage', 'btnYES', 0);]]),
				NewMenuButton("btnNO", "$71040", "", 0, BTN_FOOTER_SMALL_LAYOUT, "FEButtonStyle1", [[UI_SetElementVisible('midmapSalvage', 'btnNO', 0);]])
			}
		}
	}
}