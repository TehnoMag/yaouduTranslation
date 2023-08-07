-------------------------------------------------------------
----------LW_shipmake.lua----------2020年10月10日------------
--由 破天者-孤狼 编写
--这个文件包含 妖都MOD 中的 贸易模式 中用于 将原料兑换为舰船 的UI界面
-----------------------------------------------------------
--相关的控制函数在 data:leveldata/campaign/tutorial/rpg/script/LW_shipmake.lua 中定义
-------------------------------------------------------------
-------------------------------------------------------------


dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
dofilepath("data:leveldata/campaign/tutorial/rpg/script/trade_good.lua")

LW_shipmake = 
{ 
	Layout = 
	{						
		pos_XY = {x=0, y=0, xr="scr", yr="scr",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	stylesheet = "HW2StyleSheet", 
	RootElementSettings = { backgroundColor = { 0, 0, 0, 0, }, }, 
	pixelUVCoords = 1, 
	previousScreen = "NewMainMenu",
	;
	------------------------------------------------------------------------------------
	-- MAIN WINDOW FRAME (Window and Navigation Panel)
	------------------------------------------------------------------------------------
	{
		type = "Frame",
		name = "frmRootbottombigfrm",
		
		Layout = 
		{
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},		
		},

		autosize=1,
		arrangetype = "vert",
		arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},
		;	
		------------------------------------------------------------------------------------
		-- WINDOW FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			TitleText = "Shipbuilding", 
			autosize=1,
			arrangetype = "vert",
			;	
			-- Contents frame
			{
				type = "Frame",
				name = "Contentsframe",
				Layout = 
				{
					pivot_XY = { 0.5, 0.5 },					
					pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},	
					size_WH = {	w = 2/3, h = 2/3, wr = "scr", hr = "scr" },				
				},
				;
				{
					type = "TabPage",
					name = "tabShipMakeUI",		
					visible = 1,
					autosize = 1,
					Layout = 
					{
						pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
						size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
						pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
						pad_RB = { r = 16, b = 16, rr = "px", br = "px" },
					},
					;
					{
						type = "Frame",
						name = "frmShipMakeSelection",		
						visible = 1,
						Layout = 
						{
							--pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
							size_WH = { w = 0.275, h = 1.0, wr = "par", hr = "par" },
						},
						arrangetype = "vert",
						;
						{
							type = "TextLabel",
							name = "lblSelection",
							Layout = 
							{	
								size_WH = {w = 1, h = 1/16, wr = "par", hr = "par",},
								--pos_XY = { x = 0, y = 10/16, xr = "par", yr = "par" },
							},
							autosize=0,
							Text = 
							{
								textStyle = "FEHeading4",
								hAlign = "Left",
								vAlign = "Top",
								text = "Please select:",
							},
						},
						{
							type = "ListBox",
							listBoxStyle = "FEListBoxStyle_Bordered",
							name = "lstSelection",
							Layout = 
							{
								--pos_XY = { x = 0.0, y = 11/16, xr = "par", yr = "par" },
								size_WH = { w = 1, h = 15/16, wr = "par", hr = "par" },
							},

							scrollBarPageSize = 100,
							;
						},			
					},
					{
						type = "Frame",
						name = "frmShipMakeRightPanel",		
						visible = 1,
						Layout = 
						{
							pivot_XY = { 1.0, 0.0 },
							pos_XY = { x = 1.0, y = 0.0, xr = "par", yr = "par" },
							size_WH = { w = 0.7, h = 1.0, wr = "par", hr = "par" },
						},
						arrangetype = "horiz",
						arrangeSep = {	x=PANEL_SPACING_HORIZ, y=0, xr="scr", yr="scr",},
						;
						{
							type = "Frame",
							name = "ResourcesFrame",
							Layout = 
							{				
								--pos_XY = {	x=0, y=0, xr="par", yr="par",},	
								size_WH = {	w = 1.3/3, h = 1, wr = "par", hr = "par" },				
							},
							;
							{
								type = "TextLabel",
								Layout = 
								{	
									size_WH = {w = 1, h = 1/16, wr = "par", hr = "par",},
									pos_XY = { x = 0, y = 0.0, xr = "par", yr = "par" },
								},
								autosize=0,
								Text = 
								{
									textStyle = "FEHeading4",
									hAlign = "Left",
									vAlign = "Top",
									text = "Money required:",
								},
							},
							{
								type = "TextLabel",
								name = "txtMoneyNeeded",
								Layout = 
								{	
									size_WH = {w = 1, h = 1/16, wr = "par", hr = "par",},
									pos_XY = { x = 0, y = 0.0, xr = "par", yr = "par" },
								},
								autosize=0,
								Text = 
								{
									textStyle = "FEHeading4",
									hAlign = "Right",
									vAlign = "Top",
									text = "<c=".."FF0000"..">".."1".."</c>".."/40",
								},
							},
							{
								type = "TextLabel",
								Layout = 
								{	
									size_WH = {w = 1, h = 1/16, wr = "par", hr = "par",},
									pos_XY = { x = 0, y =1/16, xr = "par", yr = "par" },
								},
								autosize=0,
								Text = 
								{
									textStyle = "FEHeading4",
									hAlign = "Left",
									vAlign = "Top",
									text = "Population required:",
								},
							},						
							{
								type = "TextLabel",
								name = "txtUnitcapNeeded",
								Layout = 
								{	
									size_WH = {w = 1, h = 1/16, wr = "par", hr = "par",},
									pos_XY = { x = 0, y = 1/16, xr = "par", yr = "par" },
								},
								autosize=0,
								Text = 
								{
									textStyle = "FEHeading4",
									hAlign = "Right",
									vAlign = "Top",
									text = "<c=".."FF0000"..">".."1".."</c>".."/40",
								},
							},	
							{
								type = "TextLabel",
								Layout = 
								{	
									size_WH = {w = 1, h = 1/16, wr = "par", hr = "par",},
									pos_XY = { x = 0, y =2/16, xr = "par", yr = "par" },
								},
								autosize=0,
								Text = 
								{
									textStyle = "FEHeading4",
									hAlign = "Left",
									vAlign = "Top",
									text = "Required military, etc.:",
								},
							},	
							{
								type = "TextLabel",
								name = "txtFightLevelNeed",
								Layout = 
								{	
									size_WH = {w = 1, h = 1/16, wr = "par", hr = "par",},
									pos_XY = { x = 0, y = 2/16, xr = "par", yr = "par" },
								},
								autosize=0,
								Text = 
								{
									textStyle = "FEHeading4",
									hAlign = "Right",
									vAlign = "Top",
									text = "<c=".."FF0000"..">".."1".."</c>".."/40",
								},
							},			
		--------------------------------------------------------															
							{
								type = "TextLabel",
								name = "buildresourse",
								Layout = 
								{	
									size_WH = {w = 1, h = 1/16, wr = "par", hr = "par",},
									pos_XY = { x = 0, y = 3/16, xr = "par", yr = "par" },
								},
								autosize=0,
								Text = 
								{
									textStyle = "FEHeading4",
									hAlign = "Left",
									vAlign = "Top",
									text = "$40285",  --建造消耗材料
								},
							},
							{
								type = "TextLabel",
								name = "repairresourse",
								Layout = 
								{	
									size_WH = {w = 1, h = 1/16, wr = "par", hr = "par",},
									pos_XY = { x = 0, y = 3/16, xr = "par", yr = "par" },
								},
								autosize=0,
								Text = 
								{
									textStyle = "FEHeading4",
									hAlign = "Left",
									vAlign = "Top",
									text = "$40280",  --修理消耗材料
								},
							},
		-----------------------------------------------------------										
							{
								type = "ListBox",
								listBoxStyle = "FEListBoxStyle_Bordered",
								name = "lstGoodsNeeded",
								Layout = 
								{
									pos_XY = { x = 0.0, y = 4/16, xr = "par", yr = "par" },
									size_WH = { w = 1, h = 5/16, wr = "par", hr = "par" },
								},

								scrollBarPageSize = 200,
								;
							},	
		------------------------------------					
							{
								type = "TextLabel",
								name = "lstweightlimit01",
								Layout = 
								{	
									size_WH = {w = 1, h = 1/16, wr = "par", hr = "par",},
									pos_XY = { x = 0, y = 9/16, xr = "par", yr = "par" },
								},
								autosize=0,
								Text = 
								{
									textStyle = "FEHeading4",
									hAlign = "Left",
									vAlign = "Top",
									text = "$40270", --空余货仓
								},
							},
							{
								type = "TextLabel",
								name = "lstweightlimit",
								Layout = 
								{	
									size_WH = {w = 1, h = 1/16, wr = "par", hr = "par",},
									pos_XY = { x = 0, y = 9/16, xr = "par", yr = "par" },
								},
								autosize=0,
								Text = 
								{
									textStyle = "FEHeading4",
									hAlign = "Right",
									vAlign = "Top",
									text = "<c=".."FF0000"..">".."1".."</c>".."/40",
								},
							},								
		------------------------------------					
							{
								type = "TextLabel",
								name = "lstGoodsremove01",
								Layout = 
								{	
									size_WH = {w = 1, h = 1/16, wr = "par", hr = "par",},
									pos_XY = { x = 0, y = 10/16, xr = "par", yr = "par" },
								},
								autosize=0,
								Text = 
								{
									textStyle = "FEHeading4",
									hAlign = "Left",
									vAlign = "Top",
									text = "Dismantling Harvest:",
								},
							},
							{
								type = "ListBox",
								listBoxStyle = "FEListBoxStyle_Bordered",
								name = "lstGoodsremove",
								Layout = 
								{
									pos_XY = { x = 0.0, y = 11/16, xr = "par", yr = "par" },
									size_WH = { w = 1, h = 5/16, wr = "par", hr = "par" },
								},

								scrollBarPageSize = 200,
								;
							},								
		-----------------------------------------					
						},	
						{
							type = "Frame",
							name = "frmShipDetails",
							Layout = 
							{				
								--pos_XY = {	x= 1.2/3, y = 1/32, xr="par", yr="par",},	
								size_WH = {	w = 1.5/3, h = 1, wr = "par", hr = "par" },				
							},
							;
							{
								type = "TextLabel",
								name = "txtShipDetails",
								Layout = 
								{	
									size_WH = {w = 1, h = 1, wr = "par", hr = "par",},
									pos_XY = { x = 0, y = 0.0, xr = "par", yr = "par" },
								},
								wrapping = 1,				--自动换行
								autosize = 0,
								Text = 
								{
									textStyle = "FEHeading4",
									hAlign = "Left",
									vAlign = "Top",
									text = "A-class destroyer is a very awesome destroyer.\n It has a lot of firepower.\n The armor is also very thick.\n It is a little expensive to build.\n Are you sure you want to build an A-class destroyer?",
								},
							},						
						},
					},
				}
			},
		},
		------------------------------------------------------------------------------------
		-- BOTTOM NAVIGATION FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",
			name = "frmRootbottombigfrm2",					
			WindowTemplate = PANEL_NAVIGATIONFRAME,
			Layout = 
					{
						pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
						pad_RB = { r = 16, b = 16, rr = "px", br = "px" },
					}
			;		
			-- 修复按钮		
			NewMenuButton("m_btnrepair","$40275","$40275",	0,	BTN_FOOTER_FORCELEFT_LAYOUT,	"FEButtonStyle1_Outlined",	[[MainUI_ScarEvent("LW_shipmake_finish(1)")]]),			

			-- 确认按钮		
			NewMenuButton("m_btnAccept","$5157","$5157",	0,	BTN_FOOTER_FORCELEFT_LAYOUT,	"FEButtonStyle1_Outlined",	[[MainUI_ScarEvent("LW_shipmake_finish(1)")]]),			
			-- 拆解按钮		
			NewMenuButton("m_btnRemove","$40260","$40260",	0,	BTN_FOOTER_CENTER_LAYOUT,	"FEButtonStyle1_Outlined",	[[MainUI_ScarEvent("LW_shipmake_finish(2)")]]),			
			-- 返回按钮		
			NewMenuButton("m_btnCancel","$5156","$5156",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Outlined",	[[MainUI_ScarEvent("LW_shipmake_finish(nil)")]]),			
		},		
	},
}

for index,value in Goods do
	LW_shipmake[1][1][1][1][2][1][9][index] = 
	{
		type = "ListBoxItem",
		name = "lstItmGoods"..index,
		visible = 1,
		ignored = 1,
		autosize = 0,
		resizeToListBox = 1,
		arrangetype = "horiz",
		Layout=
		{				
			size_WH = {h = 1/32,hr = "scr",w=1,wr="par"},
		},
		;
		{
			type = "TextLabel",
			name = "txtGoodsName"..index,
			Layout = 
			{	
				size_WH = {w = 1, h = 1, wr = "par", hr = "par",},
				pos_XY = { x = 0, y = 0.0, xr = "par", yr = "par" },
			},
			autosize=0,
			Text = 
			{
				textStyle = "FEHeading4",
				hAlign = "Left",
				vAlign = "Middle",
				text = value.name,
			},
		},
		{
			type = "TextLabel",
			name = "txtGoodsNum"..index,
			Layout = 
			{	
				size_WH = {w = 1, h = 1, wr = "par", hr = "par",},
				pos_XY = { x = 0, y = 0.0, xr = "par", yr = "par" },
			},	
			autosize=0,
			Text = {
				textStyle = "FEHeading4",
				hAlign = "Right",
				vAlign = "Middle",
				text ="<c=".."FF0000"..">".."1".."</c>".."/40",
			},
		},
	}
end	
-----------------------------------------------
for index,value in Goods do
	LW_shipmake[1][1][1][1][2][1][13][index] = 
	{
		type = "ListBoxItem",
		name = "lstremoveItmGoods"..index,
		visible = 1,
		ignored = 1,
		autosize = 0,
		resizeToListBox = 1,
		arrangetype = "horiz",
		Layout=
		{				
			size_WH = {h = 1/32,hr = "scr",w=1,wr="par"},
		},
		;
		{
			type = "TextLabel",
			name = "txtremoveGoodsName"..index,
			Layout = 
			{	
				size_WH = {w = 1, h = 1, wr = "par", hr = "par",},
				pos_XY = { x = 0, y = 0.0, xr = "par", yr = "par" },
			},
			autosize=0,
			Text = 
			{
				textStyle = "FEHeading4",
				hAlign = "Left",
				vAlign = "Middle",
				text = value.name,
			},
		},
		{
			type = "TextLabel",
			name = "txtremoveGoodsNum"..index,
			Layout = 
			{	
				size_WH = {w = 1, h = 1, wr = "par", hr = "par",},
				pos_XY = { x = 0, y = 0.0, xr = "par", yr = "par" },
			},	
			autosize=0,
			Text = {
				textStyle = "FEHeading4",
				hAlign = "Right",
				vAlign = "Middle",
				text ="<c=".."FF0000"..">".."1".."</c>".."/40",
			},
		},
	}	
end


for index = 1,100 do
	LW_shipmake[1][1][1][1][1][2][index] = 
	{
		type = "ListBoxItem",
		soundOnClicked = "SFX_ButtonClick",
		soundOnEnter = "SFX_ButtonEnter",
		name = "lstSelectionItem"..index,
		visible = 1,
		ignored = 1,
		autosize = 0,
		resizeToListBox = 1,
		arrangetype = "horiz",
		Layout=
		{				
			size_WH = {h = 1/32,hr = "scr",w=1,wr="par"},
		},
		overColor = {255,255,255,32},
		pressedColor = {255,255,255,16},
		backgroundColor = {255,255,255,0},
		onMouseClicked = [[
			MainUI_ScarEvent("LW_shipmake_showselection(]]..index..[[)");
		]]
		;
		{
			type = "TextLabel",
			name = "lstSelectionItemName"..index,
			Layout = 
			{	
				size_WH = {w = 1, h = 1, wr = "par", hr = "par",},
				pos_XY = { x = 0, y = 0.0, xr = "par", yr = "par" },
			},
			autosize=0,
			Text = 
			{
				textStyle = "FEHeading4",
				hAlign = "Left",
				vAlign = "Middle",
			},
		},
	}	
end