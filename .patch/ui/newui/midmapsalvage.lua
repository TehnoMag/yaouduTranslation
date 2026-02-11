dofilepath("locale:tradetext.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua") 
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

DIALOGWIDTH = 254

midmapSalvage = {
	stylesheet = "HW2StyleSheet",
	
	Layout = {
		pos_XY = { x=0.0, y=0.0, xr="px", yr="px" },
		size_WH = { w=1, h=1, wr="src", hr="src" }
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
			size_WH = { w=.5, h=.5, wr = "scr", hr="scr" }
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
					size_WH = { w=.5, h=1., wr="par", hr="par" }
				}
				
				;
				{
					type = "Frame",
					arrangetype = "vert",
					
					Layout = {
						size_WH = { w=.6, h=.5, wr="par", hr="par" },
					}
					;
					{
						-- Goods List
						type = "TextLabel",
						name = "m_lbSavageGoodsNames1",
						
						Layout = {
							size_WH = { w=1., h=.5, wr="par", hr="par"}
						},
						
						Text = {
							textStyle = "RM_ShipInfoLabel_TextStyle",
							vAlign = "Top",
							hAlign = "Left"
						}
					},
					{
						-- Goods List
						type = "TextLabel",
						name = "m_lbSavageGoodsNames2",
						
						Layout = {
							size_WH = { w=1., h=0.5, wr="par", hr="par"}
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
						size_WH = { w=.4, h=.5, wr="par", hr="par" },
					}
					;
					{
						-- Goods List
						type = "TextLabel",
						name = "m_lbSavageGoodsCount1",
						
						Layout = {
							size_WH = { w=1., h=.5, wr="par", hr="par"}
						},
						
						Text = {
							textStyle = "RM_ShipInfoLabel_TextStyle",
							vAlign = "Top",
							hAlign = "Left"
						}
					},
					{
						-- Goods List
						type = "TextLabel",
						name = "m_lbSavageGoodsCount2",
						
						Layout = {
							size_WH = { w=1., h=0.5, wr="par", hr="par"}
						},
						
						Text = {
							textStyle = "RM_ShipInfoLabel_TextStyle",
							vAlign = "Top",
							hAlign = "Left"
						}
					}
				}
			}
		}
	}
}