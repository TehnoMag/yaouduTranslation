-------------------------------------------------------------
----------LW_shipmake.lua----------2018年12月15日------------
--由 破天者-孤狼 编写
--这个文件包含 妖都MOD 中的 贸易模式 中用于 进行货物交换 的UI界面
-----------------------------------------------------------
--相关的控制函数在 data:leveldata/campaign/tutorial/rpg/script/LW_goodsexchange.lua 中定义
-------------------------------------------------------------
-------------------------------------------------------------


dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
dofilepath("data:leveldata/campaign/tutorial/rpg/script/trade_good.lua")

LW_goodsexchange = 
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
			TitleText = "Goods exchange", 
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
					size_WH = {	w = 1/2, h = 2/3, wr = "scr", hr = "scr" },				
				},
				;
				{
					type = "TabPage",
					name = "tabShipMakeUI",		
					visible = 1,
					Layout = 
					{
						pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
						size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
						pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
						pad_RB = { r = 16, b = 16, rr = "px", br = "px" },
					},
					;
					{
						type = "TextLabel",
						Layout = 
						{	
							size_WH = {w = 1/3, h = 1/16, wr = "par", hr = "par",},
							pos_XY = { x = 0, y = 0.0, xr = "par", yr = "par" },
						},
						autosize=0,
						Text = 
						{
							textStyle = "FEHeading4",
							hAlign = "Left",
							vAlign = "Middle",
							text = "Select exchange item:",
						},
					},
					{
						type = "ListBox",
						listBoxStyle = "FEListBoxStyle_Bordered",
						name = "lstExchangePlan",
						Layout = 
						{
							pos_XY = { x = 0.0, y = 1/16, xr = "par", yr = "par" },
							size_WH = { w = 1/3, h = 15/16, wr = "par", hr = "par" },
						},

						scrollBarPageSize = 200,
						;
					},
					{
						type = "TextLabel",
						Layout = 
						{	
							size_WH = {w = 0.9/3, h = 1/16, wr = "par", hr = "par",},
							pos_XY = { x = 1.1/3, y = 0.0, xr = "par", yr = "par" },
						},
						autosize=0,
						Text = 
						{
							textStyle = "FEHeading4",
							hAlign = "Left",
							vAlign = "Middle",
							text = "Number of copies:",
						},
					},
					{
						type = "TextLabel",
						name = "txtNumber",
						borderColor = { 112, 157, 180, 255},
			      borderWidth = 1,
			      backgroundColor = {255,255,255,0},
			      arrangeweight = 1,
						Layout = 
						{	
							size_WH = {w = 0.5/3, h = 1/16, wr = "par", hr = "par",},
							pos_XY = { x = 2/3, y = 0.0, xr = "par", yr = "par" },
						},
						autosize=0,
						Text = 
						{
							textStyle = "FEHeading4",
							hAlign = "Center",
							vAlign = "Middle",
							text = "0",
						},
						onMouseClicked = [[MainUI_ScarEvent("LW_goodsexchange_numedit()")]],
					},
					{
						type = "TextLabel",
						Layout = 
						{	
							size_WH = {w = 1.9/3, h = 1/16, wr = "par", hr = "par",},
							pos_XY = { x = 1.1/3, y = 1/16, xr = "par", yr = "par" },
						},
						autosize=0,
						Text = 
						{
							textStyle = "FEHeading4",
							hAlign = "Left",
							vAlign = "Middle",
							text = "Need to pay:",
						},
					},
					{
						type = "ListBox",
						listBoxStyle = "FEListBoxStyle_Bordered",
						name = "lstPay",
						Layout = 
						{
							pos_XY = { x = 1.1/3, y = 2/16, xr = "par", yr = "par" },
							size_WH = { w = 1.9/3, h = 6/16, wr = "par", hr = "par" },
						},

						scrollBarPageSize = 200,
						;
					},
					{
						type = "TextLabel",
						Layout = 
						{	
							size_WH = {w = 1.9/3, h = 1/16, wr = "par", hr = "par",},
							pos_XY = { x = 1.1/3, y = 8/16, xr = "par", yr = "par" },
						},
						autosize=0,
						Text = 
						{
							textStyle = "FEHeading4",
							hAlign = "Left",
							vAlign = "Middle",
							text = "Get:",
						},
					},
					{
						type = "ListBox",
						listBoxStyle = "FEListBoxStyle_Bordered",
						name = "lstGet",
						Layout = 
						{
							pos_XY = { x = 1.1/3, y = 9/16, xr = "par", yr = "par" },
							size_WH = { w = 1.9/3, h = 6/16, wr = "par", hr = "par" },
						},

						scrollBarPageSize = 200,
						;
					},
					{
						type = "TextLabel",
						Layout = 
						{	
							size_WH = {w = 0.9/3, h = 1/16, wr = "par", hr = "par",},
							pos_XY = { x = 1.1/3, y = 15/16, xr = "par", yr = "par" },
						},
						autosize=0,
						Text = 
						{
							textStyle = "FEHeading4",
							hAlign = "Left",
							vAlign = "Middle",
							text = "Paying money:",
						},
					},
					{
						type = "TextLabel",
						name = "txtNeedMoney",
						Layout = 
						{	
							size_WH = {w = 0.9/3, h = 1/16, wr = "par", hr = "par",},
							pos_XY = { x = 1.1/3, y = 15/16, xr = "par", yr = "par" },
						},
						autosize=0,
						Text = 
						{
							textStyle = "FEHeading4",
							hAlign = "Right",
							vAlign = "Middle",
							text = "<c=".."FF0000"..">".."1".."</c>".."/40",
						},
					},
					{
						type = "TextLabel",
						Layout = 
						{	
							size_WH = {w = 0.9/3, h = 1/16, wr = "par", hr = "par",},
							pos_XY = { x = 2.1/3, y = 15/16, xr = "par", yr = "par" },
						},
						autosize=0,
						Text = 
						{
							textStyle = "FEHeading4",
							hAlign = "Left",
							vAlign = "Middle",
							text = "Cargo hold required:",
						},
					},
					{
						type = "TextLabel",
						name = "txtNeedWeight",
						Layout = 
						{	
							size_WH = {w = 0.9/3, h = 1/16, wr = "par", hr = "par",},
							pos_XY = { x = 2.1/3, y = 15/16, xr = "par", yr = "par" },
						},
						autosize=0,
						Text = 
						{
							textStyle = "FEHeading4",
							hAlign = "Right",
							vAlign = "Middle",
							text = "<c=".."FF0000"..">".."1".."</c>".."/40",
						},
					},
				},
			},
		},
		------------------------------------------------------------------------------------
		-- BOTTOM NAVIGATION FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",
			name = "frmRootbottombigfrm2",					
			WindowTemplate = PANEL_NAVIGATIONFRAME,
			;		
			-- 确认按钮		
			NewMenuButton("m_btnAccept","$5157","$5157",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Outlined",	[[MainUI_ScarEvent("LW_goodsexchange_finish(1)")]]),			
			-- 返回按钮		
			NewMenuButton("m_btnCancel","$5156","$5156",	0,	BTN_FOOTER_FORCELEFT_LAYOUT,	"FEButtonStyle1_Outlined",	[[MainUI_ScarEvent("LW_goodsexchange_finish(nil)")]]),			
		},		
	},
}

for index = 1,100 do
  LW_goodsexchange[1][1][1][1][2][index] = 
  {
    type = "ListBoxItem",
    name = "lstItmPlan"..index,
    soundOnClicked = "SFX_ButtonClick",
		soundOnEnter = "SFX_ButtonEnter",
    visible = 1,
    ignored = 1,
    autosize = 0,
    resizeToListBox = 1,
    arrangetype = "horiz",
    overColor = {255,255,255,32},
		pressedColor = {255,255,255,16},
		backgroundColor = {255,255,255,0},
		onMouseClicked = [[MainUI_ScarEvent("LW_goodsexchange_showplan(]]..index..[[)")]],
    Layout=
		{				
			size_WH = {h = 1/32,hr = "scr",w=1,wr="par"},
		},
		;
		{
			type = "TextLabel",
			name = "txtPlanName"..index,
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
				text = "plan_name",
			},
		},
  }
end

for index,value in Goods do
  LW_goodsexchange[1][1][1][1][6][index] =
  {
		type = "ListBoxItem",
		name = "lstItmGoodsPay"..index,
		visible = 1,
		ignored = 1,
		autosize = 0,
		resizeToListBox = 1,
		arrangetype = "horiz",
		Layout=
		{				
			size_WH = {h = 2/32,hr = "scr",w=1,wr="par"},
		},
		;
		{ 
			type = "Frame", 
			Layout=
			{
				pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },		
				size_WH = {w = 2/32 * 9/16 ,h = 1,wr = "scr",hr = "par"},
			},
			BackgroundGraphic = 
			{ 
				texture = value.graph, 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		},
		{
			type = "TextLabel",
			Layout = 
			{	
				size_WH = {w = 3/4, h = 1, wr = "par", hr = "par",},
				pos_XY = { x = 1/4, y = 0.0, xr = "par", yr = "par" },
			},
			wrapping = 1,				--自动换行
			autosize=0,
			Text = {
				textStyle = "FEHeading4",
				hAlign = "Left",
				vAlign = "Middle",
				text = value.name,
			},
		},
		{
			type = "TextLabel",
			name = "txtGoodsPayNum"..index,
			Layout = 
			{	
				size_WH = {w = 2.5/4, h = 1, wr = "par", hr = "par",},
				pos_XY = { x = 1/4, y = 0.0, xr = "par", yr = "par" },
			},
			wrapping = 1,				--自动换行
			autosize=0,
			Text = {
				textStyle = "FEHeading4",
				hAlign = "Right",
				vAlign = "Middle",
				text = "<c=".."FF0000"..">".."1".."</c>".."/40",
			},
		},
  }
  LW_goodsexchange[1][1][1][1][8][index] =
    {
		type = "ListBoxItem",
		name = "lstItmGoodsGet"..index,
		visible = 1,
		ignored = 1,
		autosize = 0,
		resizeToListBox = 1,
		arrangetype = "horiz",
		Layout=
		{				
			size_WH = {h = 2/32,hr = "scr",w=1,wr="par"},
		},
		;
		{ 
			type = "Frame", 
			Layout=
			{
				pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },		
				size_WH = {w = 2/32 * 9/16 ,h = 1,wr = "scr",hr = "par"},
			},
			BackgroundGraphic = 
			{ 
				texture = value.graph, 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		},
		{
			type = "TextLabel",
			Layout = 
			{	
				size_WH = {w = 3/4, h = 1, wr = "par", hr = "par",},
				pos_XY = { x = 1/4, y = 0.0, xr = "par", yr = "par" },
			},
			wrapping = 1,				--自动换行
			autosize=0,
			Text = {
				textStyle = "FEHeading4",
				hAlign = "Left",
				vAlign = "Middle",
				text = value.name,
			},
		},
		{
			type = "TextLabel",
			name = "txtGoodsGetNum"..index,
			Layout = 
			{	
				size_WH = {w = 2.5/4, h = 1, wr = "par", hr = "par",},
				pos_XY = { x = 1/4, y = 0.0, xr = "par", yr = "par" },
			},
			wrapping = 1,				--自动换行
			autosize=0,
			Text = {
				textStyle = "FEHeading4",
				hAlign = "Right",
				vAlign = "Middle",
				text = 1,
			},
		},
  }
end
