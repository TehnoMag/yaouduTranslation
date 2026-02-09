dofilepath("locale:tradetext.lua")    --引用了贸易系统的语言文字
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")   --好像是原版的默认引用
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua") --好像是原版的默认引用

DIALOGWIDTH = 254   --dialogwidth，字面意思是“对话框宽度”，这里是定义了一个叫dialogwidth的变量，它的值等于254，
--这样在后面需要让某个东西等于254的时候可以不用写=254而是可以写成=DIALOGWIDTH

carrierNOfighter = {          --界面的代码名字
	stylesheet = "HW2StyleSheet",   --不知道啥意思

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					  --界面的位置坐标？
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},        --界面的大小比例
	},

	pixelUVCoords = 1,    --这个数字啥意思
	
	RootElementSettings = {         --应该是颜色设定吧
		backgroundColor = COLOR_FULLSCREEN_DARKEN,  --使用了原版HW2界面的颜色代码？
	},
	
	onShow = "MainUI_PushEnabledCommandState(); MainUI_DisableAllCommands(1);",    --不知道啥意思
	onHide = "MainUI_PopEnabledCommandState()",     --不知道啥意思
	;
		--onShow是这个界面弹出的时候执行的代码
		--DisableAllCommands在界面弹出的时候禁止下新的指令，PushEnabledCommandState在界面弹出的时候已经下的命令还在继续
--onHide是这个界面隐藏的时候执行的代码 



----------------------- Master Frame啥意思这个 --------------------
	{
		type = "RmWindow",      --应该是框架后面的阴影
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText =	"$5533", -- "WARNING",      --警告  应该是行头标题
		-- SubtitleText = "$5169", 	
	
			
		Layout = {
			pivot_XY = { 0.5, 0.5 },			    --界面的位置坐标		
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			 --界面的位置坐标（也许是警告两个字的位置？）	
		},	
		
		autosize  = 1,   --自动把尺寸设置为1？

		--arrangetype = "vert",
		--arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},
		;
			
			
----------------------- Title Text Row -----------------------			
		{
			type = "Frame",   --界面外框
			autosize  = 1,
			arrangetype = "vert",
			arrangedir = 1,	

			Layout = {
				margin_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				margin_RB = { r = PANEL_PAD_HORIZ, b =1, rr = "scr", br = "px" },				 
				size_WH = {	w = 0.5, h = 1.0, wr = "scr", hr = "px" },		
				--max_WH = { w = DIALOGBOX_WIDTH, wr = "scr" },								  --外框大小和坐标
			},	

			
			;			
			-- Message Label
			{
					type = "TextLabel",
					name = "m_lblMessage",	    --和LUA脚本里的m_lblMessage对应，往里面填写可用的文字				
					autosize = 1,
					wrapping = 1,
					Text = {
						textStyle = "RM_MessageLabel_TextStyle",

						vAlign = "Top",
						hAlign = "Left",
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
					wrapping = 1,				--自动换行

					Layout = {
						pivot_XY = { 1.0, 0.0 },					
						pos_XY = {	x=1.0, y=0.0, xr="par", yr="px",},					

					},
					arrangeSep = {	x=BUTTON_SPACING_HORIZ, y=0, xr="scr", yr="scr",},	
					;
					--NewMenuButton("key01",	"$42455",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_SetElementVisible('carrierNOfighter','key01',0);]]),
											NewMenuButton("m_btnAccept",	"$43845",	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[UI_HideScreen('carrierNOfighter');]]),
               --应该是添加了一个确认按钮DTM004[15]代表按钮的文字内容
							
			  },			
			},		
		},
	},	
}

	