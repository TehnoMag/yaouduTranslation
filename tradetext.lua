DTM004 = {}
DTM004[1] = function(iGood)
	local iText = "体积："..DTM4_GetColorText(g_TransAmount,"NotLess",Goods[iGood].weight,Goods[iGood].weight).."\n"
	iText = iText.."军事等级："..DTM4_GetColorText(g_FightLevel,"NotLess",Goods[iGood].FightLevelNeed,Goods[iGood].FightLevelNeed).."\n"
	iText = iText.."贸易等级："..DTM4_GetColorText(g_TradeLevel,"NotLess",Goods[iGood].TradeLevelNeed,Goods[iGood].TradeLevelNeed).."\n"
	iText = iText..Goods[iGood].Description
	return iText
end
DTM004[2] = "消耗（单位/天）：\n"
DTM004[3] = function(iGood)
	local iText = "体积："..Goods[iGood].weight.."\n"..Goods[iGood].Description
	return iText
end
--DTM004[3] = "货舱容量："
DTM004[4] = function(text)
	local iText="你确定要购买这艘“"..text.."”吗？"
	return iText
end
--DTM004[5] = "”吗？"
DTM004[5] = "、"
DTM004[6] = function(text)
	local iText="你确定要将“"..text.."售出吗？"
	return iText
end
DTM004[7] = function(text)
	local iText="星门 - "..text
	return iText
end
DTM004[8] = function(text1,text2,text3)
	local iText="该星门通往"..text1..", 你确定要通过该跳跃门吗？你需要支付"..text2.."点资金以进行跳跃。\n【注意】舰队中尚有未停泊的机艇，若不停泊，请额外支付"..text3.."点资金办理托运业务。"
	return iText
end
--DTM004[9] = ", 你确定要通过该跳跃门吗？你需要支付"
DTM004[9]=function(text1,text2)
	local iText="该星门通往"..text1..", 你确定要通过该跳跃门吗？你需要支付"..text2.."点资金以进行跳跃。"
	return iText
end
--DTM004[10] = "【注意】舰队中尚有未停泊的机艇，若不停泊，请额外支付"
DTM004[11] = "你的舰船距离过远，无法使用该跳跃门。"
DTM004[12] = "舰队中没有拥有超空间跳跃能力的船，无法进行跳跃。"
DTM004[13] = "使用星门"
DTM004[14] = "通过星际跳跃门前往其他星系"
DTM004[15] = "确定"
DTM004[16] = "取消"
DTM004[17] = "无法使用"
DTM004[18] = "必需货物短缺"
DTM004[19] = "有必需货物储量为0"
DTM004[20] = "贸易信息"
DTM004[21] = "与对方进行贸易"
DTM004[22] = "银河标准历"
DTM004[23] = "您没有靠近该站的船只，无法与对方进行贸易。"
DTM004[24] = "您的舰队和其他空间站过近，无法与对方进行贸易。"
--DTM004[25] = "装卸能力："
--DTM004[26] = "装卸速度："
DTM004[27] = "小时"
DTM004[28] = "天"
DTM004[29] = "月"
DTM004[30] = "年"
DTM004[31] = "分钟"
--DTM004[32] = "预计装卸效率："
--DTM004[33] = "体积，"
--DTM004[34] = "/次"
--DTM004[35] = "日常消耗（单位/天）：\n"
--DTM004[36] = "移动消耗（单位/天）：\n"
--DTM004[37] = "攻击消耗（单位/天）：\n"
--DTM004[38] = "维修消耗（单位/天）：\n"
--DTM004[39] = "跳跃消耗（单位/时）：\n"
DTM004[40] = function(warntext,iwarn,iwarn2,l_goodstake)
		local iText = "您的重要物资："..warntext.."发生短缺，"
		local jwarntext = ""
		kwarntext = {"有些舰船不能开火,","有些舰船动弹不得,","有些舰船的维修工作难以为继,","有些舰船无法进入超空间,","有些舰船无法隐形,","有些舰船无法开启防御场,"}
		if (iwarn2==1) then
			jwarntext = jwarntext.."相关产业正因此停产,"
		end
		if (iwarn[1]==1) then
			jwarntext = jwarntext.."舰队正因此每天损失"..l_goodstake.."点资金,"
		end
		for i=2,7 do
			if (iwarn[i]==1) then
				jwarntext = jwarntext..kwarntext[i-1]
			end
		end
		iText=iText..jwarntext.."为避免更多损失，请尽快补充相应货物"
		return iText
end
--DTM004[40] = "有些舰船不能开火,"
--DTM004[41] = "有些舰船动弹不得,"
--DTM004[42] = "有些舰船的维修工作难以为继,"
--DTM004[43] = "有些舰船无法进入超空间,"
--DTM004[44] = "相关产业正因此停产,"
--DTM004[45] = "舰队正因此每天损失"
--DTM004[46] = "点资金,"
--DTM004[47] = "您的重要物资："
--DTM004[48] = "发生短缺，"
--DTM004[49] = "为避免更多损失，请尽快补充相应货物"
DTM004[50] = function(text1,text2,text3)
	local iText="你遇到一位贩卖"..text1.."的奸商，他提议卖给你"..text2.."单位的"..text1..",但要向你收取"..text3.."点资金。你同意吗？"
	return iText
end
--DTM004[50] = "你遇到一位贩卖"
--DTM004[51] = "的奸商，他提议卖给你"
--DTM004[52] = "单位的"
--DTM004[53] = ",但要向你收取"
--DTM004[54] = "点资金。你同意吗？"
--DTM004[55] = "人口需求："
DTM004[56] = "停止装卸"
--DTM004[57] = "提示：让舰队尽量靠近贸易站，并用一些装卸速度快的机艇（比如舰载机和采矿船）辅助装卸可明显提高装卸效率"
DTM004[58] = "资金不足，不能购入！"
DTM004[59] = "人口不足，不能购入！"
DTM004[60] = "超过数量限制，不能购入！"
DTM004[61] = function(text)
	local iText="你确定要购买这台“"..text.."”吗？"
	return iText
end
DTM004[62] = "货仓空间不足，不能购入！"
DTM004[63] = "这是你的最后一艘船了，不能卖出！"
DTM004[64] = "该船上停泊有其他船只，不能卖出，请清空机库后再试！"
DTM004[65] = "该船上尚有余货，不能卖出，请卖掉一些货物后再试！"
DTM004[66] = "日生产："
DTM004[67] = "日消耗："
DTM004[68] = function(text)
	local iText="当前单位："..text.."%"
	return iText
end
DTM004[69] = function(text)
	local iText="管理至："..text.."单位"
	return iText
end
--DTM004[70] = "单位"
DTM004[71] = function(text)
	local iText="队列中："..text.."单位"
	return iText
end
DTM004[72] = function(text1,text2,text3)
	local iText="当前装卸效率："..text1.."单位/"..text2..text3
	return iText
end
DTM004[73] = function(text1,text2)
	local iText="仍需装卸："..text1.."单位("..text2.."%)"
	return iText
end
DTM004[74] = "装卸中……"
DTM004[75] = "星门已启动，部分靠近星门的战舰会经先行跳跃离开。请将还没有来得及离开的战舰向星门移动，以结束跳跃"
DTM004[76] = "你的舰队勇敢地冲过了这片危险的星区，脱离了重力陷阱区。惊魂未定的你重新组织舰队前往目的地星区，摆脱了捕猎者的追击。"
DTM004[77] = "你的舰队果断掉头逃离了这片危险的星区，脱离了重力陷阱区。惊魂未定的你重新组织舰队返回了来时的星区，摆脱了捕猎者的追击。"
DTM004[78] = "lblResourceUnitsSize_Date"
DTM004[79] = "该船尚在停泊中，不能卖出，请使其脱离机库后再试！"
DTM004[80] = "您的等级不足，无法与对方进行贸易"
DTM004[81] = function(text1,text2)
	local l_color1="FF0000"
	local l_color2="FF0000"
	if(g_FightLevel>=text1)then
		l_color1="00FF00"
	end
	if(g_TradeLevel>=text2)then
		l_color2="00FF00"
	end
	local iText="军事等级："..DTM4_GetColorText(g_FightLevel,"NotLess",text1,text1).." 贸易等级："..DTM4_GetColorText(g_FightLevel,"NotLess",text2,text2)
	return iText
end
--DTM004[82] = "贸易等级："
DTM004[83] = "您的等级不足，无法使用该星门"
DTM004[84] = "您的等级不足，无法购买该种商品。"
DTM004[85] = "您的等级不足，无法购买该型船只。"
DTM004[86] = "您的等级不足，无法购买该种设备。"
DTM004[87] = function(iFactory)
	local iText = ""
	local iText2=DTM4_GetGTData2(iFactory)
	iText = iText.."军事等级："..DTM4_GetColorText(g_FightLevel,"NotLess",Factory[iFactory].FightLevelNeed,Factory[iFactory].FightLevelNeed).."\n"
	iText = iText.."贸易等级："..DTM4_GetColorText(g_TradeLevel,"NotLess",Factory[iFactory].TradeLevelNeed,Factory[iFactory].TradeLevelNeed).."\n"
	iText = iText.."占用空间："..DTM4_GetColorText(g_factorylimit,"NotLess",Factory[iFactory].VCost+g_factoryweight,Factory[iFactory].VCost).."\n"
	iText = iText.."装卸时间："..Factory[iFactory].TCost.."分钟"
	iText = iText..iText2
	iText = iText..Factory[iFactory].Description
	return iText
end
--DTM004[88] = "装卸时间："
DTM004[89] = "游戏即将开始，请稍候……"
DTM004[90] = function(text)
	local iText="加入"..text.."开始游戏，确定吗？"
	return iText
end
--DTM004[91] = "开始游戏，确定吗？"
--DTM004[92] = "工业空间："
DTM004[93] = "工业空间不足，不能购入！"
DTM004[94] = function(text)
	local iText="贸易站 - "..text
	return iText
end
DTM004[95] = function(text)
	local iText="\n该船将被命名为“"..text.."”，如欲更改，请打开游戏的bin\\profiles\\ShipName.txt文件"
	return iText
end
DTM004[96] = "\n初始船只将被命名为“"
DTM004[97] = "”，如欲更改，请打开游戏的bin\\profiles\\ShipName.txt文件"
DTM004[98] = "\n初始船只目前尚没有名称，请在游戏的bin\\release\\ShipName.txt文件中为其编辑一个名称"
DTM004[99] = "单位货物体积超过舰队装卸能力"
DTM004[100] = function(text1,text2,text3,text4)
	local iText="你确定要将“"..text1.."”"..text2.."从“"..text3.."”改造为“"..text4.."”吗？"
	return iText
end
DTM004[101] = "该船上停泊有其他船只，不能改造，请清空机库后再试！"
DTM004[102] = "改造后没有足够的货舱空间，请卖掉一些货物后再试！"
--DTM004[103] = "”吗？"
DTM004[104] = "您的等级不足，无法进行改造。"
DTM004[105] = "资金不足，不能改造！"
DTM004[106] = "人口不足，不能改造！"
DTM004[107] = "欢迎进入菲雅利帝国MOD贸易模式\n在该模式中，你可以从3个职业中选择开局\n点击地图中的舰船从而选择相应职业开始游戏。\n（该模式最早由9CCN萨尤克教主开发，\n菲雅利女皇以此基础改进；另感谢破天者_孤狼、幻天破等伙伴的技术支持）"
DTM004[108] = "管理"
DTM004[109] = "出售选中船只或更改其名称、型号"
DTM004[110] = "货物"
DTM004[111] = "打开/关闭货仓界面"
DTM004[112] = "请选择改造型号"
DTM004[113] = "重命名"
DTM004[114] = "卖出"
DTM004[115] = "请选择购买型号"
DTM004[116] = "贸易等级"
DTM004[117] = "军事等级"
DTM004[118] = "人口"
DTM004[119] = "资金"
DTM004[120] = "游戏时间"
DTM004[121] = function(text1,text2)
	local iText="你确定要将“"..text1.."”"..text2.."售出吗？\n（警告，距离商店5000M以外的地方出售该舰将会导致系统错误无法离开地图）"
	return iText
end
DTM004[122] = "【注意】购买该船将导致人口超过上限，确认后，在继续购买舰船或离开该地图前，必须卖出或托管足够的舰船使人口恢复到允许范围内。"
DTM004[123] = "当前人口超过限制，不能通过星门！"
DTM004[124] = function(l_ShipData,text)
	local iText = ""
	iText = iText.."单艘售价："..DTM4_GetColorText(g_money,"NotLess",l_ShipData.Price,l_ShipData.Price).."\n"
	iText = iText.."货舱容量："..l_ShipData.cap.."\n"
	iText = iText.."工业空间："..l_ShipData.fcap.."\n"
	iText = iText.."人口需求："..DTM4_GetColorText(g_PopPointLimit,"NotLess",g_PopPointTotal+l_ShipData.PopPoint,l_ShipData.PopPoint).."\n"
	iText = iText.."军事等级："..DTM4_GetColorText(g_FightLevel,"NotLess",l_ShipData.FightLevelNeed,l_ShipData.FightLevelNeed).."\n"
	iText = iText.."贸易等级："..DTM4_GetColorText(g_TradeLevel,"NotLess",l_ShipData.TradeLevelNeed,l_ShipData.TradeLevelNeed).."\n"
	iText = iText.."装卸能力："..l_ShipData.TransAmount.."\n"
	iText = iText.."装卸速度："..l_ShipData.TransSpeed.."\n"
	iText = iText.."日常消耗（单位/天）：\n"
			for i,j in l_ShipData.GTAnyTime do
				if (j[2]>0) then
					iText = iText..Goods[j[1]].name.."*"..j[2].."    "
				end
			end
			if (l_ShipData.GTWhileMoving[1]~=nil) then
				iText = iText.."\n".."移动消耗（单位/天）：\n"
				for i,j in l_ShipData.GTWhileMoving do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileFiring[1]~=nil) then
				iText = iText.."\n".."攻击消耗（单位/天）：\n"
				for i,j in l_ShipData.GTWhileFiring do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileRepairing[1]~=nil) then
				iText = iText.."\n".."维修消耗（单位/天）：\n"
				for i,j in l_ShipData.GTWhileRepairing do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileHPJump[1]~=nil) then
				iText = iText.."\n".."跳跃消耗（单位/时）：\n"
				for i,j in l_ShipData.GTWhileHPJump do
					if (j[2]>0)and(j[1]~=g_GoodIndexForDockUnitHP) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileCloaking[1]~=nil) then
				iText = iText.."\n".."隐形消耗（单位/时）：\n"
				for i,j in l_ShipData.GTWhileCloaking do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileDSOpening[1]~=nil) then
				iText = iText.."\n".."力场消耗（单位/时）：\n"
				for i,j in l_ShipData.GTWhileDSOpening do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
	iText = iText..text
	return iText
end
DTM004[125] = "g_BuyShipName = \"\"\n\-\-使用方法：在引号中填写舰船名称，保存。"
DTM004[126] = function(text)
	local iText="贸易经验+"..text
	return iText
end
DTM004[127] = function(text)
	local iText="战斗经验+"..text
	return iText
end
DTM004[128] = "该船为舰队仅剩载舰，不能托管！"
DTM004[129] = "该船上有停泊中船只，不能托管，请释放全部载机后再试！"
DTM004[130] = "该船上尚有余货，不能托管，请卖掉一些货物后再试！"
DTM004[131] = function(text1,text2,text3,text4)
	local iText="你确定要将“"..text1.."”"..text2.."交给"..text3.."托管吗？托管费用为"..text4.."点资金/日"
	return iText
end
--DTM004[132] = "点资金/日"
DTM004[133] = "该船上尚有余货，不能卖出，请卖掉一些货物后再试！"
DTM004[134] = "托管"
--DTM004[135] = "交给"
--DTM004[136] = "从“"
DTM004[137] = function(text)
	local iText="你为所有托管中的舰船支付了"..text.."点资金。"
	return iText
end
--DTM004[138] = "点资金"
DTM004[139] = function(text)
	local iText="你为部分托管中的舰船支付了"..text.."点资金，其他托管中的舰船将无法得到维护！"
	return iText
end
--DTM004[140] = "点资金，其他托管中的舰船将无法得到维护！"
DTM004[141] = "你已无法为托管中的舰船支付费用，所有舰船均无法得到维护！"
DTM004[142] = function(text1,text2)
	local iText="“"..text1.."”"..text2.."状态完好，无需修理！"
	return iText
end
--DTM004[143] = "状态完好，无需修理！"
DTM004[144] = "资金不足，无法修理！"
DTM004[145] = "人口不足，无法接管！"
DTM004[146] = function(text1,text2)
	local iText="你确定要接管“"..text1.."”"..text2.."吗？"
	return iText
end
--DTM004[147] = "吗？"
DTM004[148] = function(text1,text2,text3)
	local iText="维修“"..text1.."”"..text2.."要花费"..text3.."点资金，确定维修吗？"
	return iText
end
--DTM004[149] = "要花费"
--DTM004[150] = "点资金，确定维修吗？"
--DTM004[151] = "”"
DTM004[152] = function(text1,text2)
	local iText="这是你之前丢弃的一个货箱，里面有"..text1.."单位的"..text2.."，回收该货箱吗？"
	return iText
end
--DTM004[153] = "单位的"
DTM004[154] = function(text)
	local iText="你拾到了一个货箱，根据上面的ID，你判断该货箱为"..text.."所有，上交该货箱吗？"
	return iText
end
--DTM004[155] = "所有，上交该货箱吗？"
DTM004[156] = function(text1,text2,text3)
	local iText="你将货箱上交给"..text1.."\n作为报答，你获得"..text2.."点资金\n你与"..text1.."的关系提升了。("..text3..")"
	return iText
end
--DTM004[157] = "作为报答，你获得"
--DTM004[158] = "点资金"
--DTM004[159] = "你与"
DTM004[160] = function(text1,text2,text3,text4)
	local iText="你将货箱里的货物据为己有，里面有"..text1.."单位的"..text2.."\n你与"..text3.."的关系下降了。("..text4..")"
	return iText
end
--DTM004[161] = "的关系提升了"
--DTM004[162] = "的关系下降了"
DTM004[163] = function(text1,text2,text3,text4)
	local iText="欢迎光临"..text1.."\n预计装卸效率："..text2.."体积/"..text3..text4.."\n【提示】让你的舰队——尤其是其中装卸速度快的舰船——尽量靠近贸易站，可明显提高装卸效率\n祝您采购愉快！"
	return iText
end
--DTM004[164] = "祝您采购愉快！"
--DTM004[165] = "点资金办理托运业务。"
--DTM004[166] = "点资金以进行跳跃。"
DTM004[167] = "资金不足，不能跳跃！"
DTM004[168] = "改造"
DTM004[169] = function(text1,text2)
	local iText="Lv"..text1.." "..text2
	return iText
end
DTM004[170] = function(text)
	local iText="你的确很想帮助"..text.."，只可惜你没有足够的资金。"
	return iText
end
DTM004[171] = function(text1,text2,text3)
	local iText="你确定要资助"..text1.."点资金给"..text2.."的"..text3.."吗？"
	return iText
end
DTM004[172] = function(text1,text2,text3,text4)
	local iText="你已向"..text1.."的"..text2.."资助了"..text3.."点资金。预计偿还时间为：\n"..text4
	return iText
end
DTM004[173] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您的无私资助，我的生意目前已经有所好转，约定好的偿还金额已经打入您的账户，请查收。\n"..text1.."\n"..text2
	return iText
end
DTM004[174] = function(text1,text2,text3,text4)
	local iText=text1.."的"..text2..text3.."最近遇到了财政困难，需要大量资金的帮助来走出困境。"..text3.."承诺，任何为其资助"..text4.."资金的人都可以在1个月内得到双倍的偿还。"
	return iText
end
DTM004[175] = "任务"
DTM004[176] = "可领受任务"
DTM004[177] = "已领受任务"
DTM004[178] = "任务详情"
DTM004[179] = "商人"
DTM004[180] = "企业家"
DTM004[181] = "借钱任务"
DTM004[182] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您的无私资助，然而不幸的是，我的生意仍无好转迹象，我想我不得不申请破产保护了，对于没能信守承诺我表示深深的歉意，我已将您对我的帮助向"..text1.."内部公布并大力宣传，希望对您会有所帮助\n"..text1.."\n"..text2
	return iText
end
DTM004[183] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您的无私资助，然而不幸的是，我的生意仍无好转迹象，如果可能的话我想晚一个月偿还您的资助金，对于没能信守承诺我表示深深的歉意\n"..text1.."\n"..text2
	return iText
end
DTM004[184] = "采购任务"
DTM004[185] = function(text1,text2,text3)
	local iText="你确定要帮助"..text1.."在十天内完成"..text2.."单位"..text3.."的采购任务吗？"
	return iText
end
DTM004[186] = function(text1,text2,text3,text4)
	local iText=text1.."的"..text2.."最近出现短缺，现愿出"..text3.."点资金作为报酬于10日内购得"..text4.."单位的"..text2.."。"
	return iText
end
DTM004[187] = function(text1,text2,text3,text4,text5)
	local iText="你与"..text1.."签下一批"..text2.."的采购合同，如能在指定日期前将"..text4.."单位的"..text2.."送达，就可获得"..text3.."点资金作为报酬。\n截止时间："..text5
	return iText
end
DTM004[188] = function(text)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您答应帮忙，我们已经在附近放置了一个货箱，一旦购得相应货物，只要将它们放到货箱内即可。\n"..text
	return iText
end
DTM004[189] = function(text)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您送来的货物，约定的报酬已经打入您的账户，对您的帮助我们再次表示深深的感谢。\n"..text
	return iText
end
DTM004[190] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n约定的期限已到，然而我们并没有收到您送来的货物，非常遗憾地通知您，我们已经不再需要"..text2.."了，之前的合同就此作废。\n"..text1
	return iText
end
DTM004[191] = "你确定要放弃这个任务吗？"
DTM004[192] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n了解，看来我们要另找他人采购"..text2.."了。\n"..text1
	return iText
end
DTM004[193] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n真不知我该如何感谢您，我已将您对我的帮助向"..text1.."内部公布并大力宣传，希望对您会有所帮助\n"..text1.."\n"..text2
	return iText
end
DTM004[194] = "附近没有载货舰船，无法拾取！"
DTM004[195] = "该货箱对于你的船而言太大了，无法拾取！"
DTM004[196] = function(text1,text2)
	local iText="你确定要将"..text1.."单位的"..text2.."放进这个货箱吗？"
	return iText
end
DTM004[197] = function(text1,text2)
	local iText="你还没有采购到"..text1.."单位的"..text2.."！"
	return iText
end
DTM004[198] = "附近没有载货舰船，无法卸货！"
DTM004[199] = "清仓任务"
DTM004[200] = function(text)
	local iText="你的确很想购买这批"..text.."，但你没有足够的资金。"
	return iText
end
DTM004[201] = function(text1,text2,text3)
	local iText="你确定要以"..text1.."点资金的价格购买"..text2.."的这批"..text3.."吗？"
	return iText
end
DTM004[202] = function(text1,text2,text3)
	local iText="你刚刚从个人终端上收到一则消息：\n我们已经将"..text1.."单位的"..text2.."装箱并放置在了附近，现在这批货是您的了。\n"..text3
	return iText
end
DTM004[203] = function(text1,text2,text3,text4)
	local iText=text1.."的"..text2.."近日出现滞销，现愿以"..text3.."点资金的低价抛售"..text4.."单位的"..text2.."。"
	return iText
end
DTM004[204] = function(text1,text2,text3,text4)
	local iText="你以"..text3.."点资金的低价从"..text1.."买入了"..text4.."单位的"..text2.."。现在这批货就在"..text1.."附近，请及时取走它们。"
	return iText
end
DTM004[205] = function(text)
	local iText="你告诉"..text.."不用还钱了，对方感激不已。"
	return iText
end
DTM004[206] = function(text)
	local iText=text.."已经连本带利还清了你的资助金。"
	return iText
end
DTM004[207] = function(text1,text2)
	local iText=text1.."破产了，但是你对他的帮助已经在"..text2.."内部广为人知。"
	return iText
end
DTM004[208] = function(text)
	local iText="你已通知"..text.."你无法完成采购任务，估计对方不会高兴的。"
	return iText
end
DTM004[209] = function(text)
	local iText="你完成了与"..text.."签订的采购合同，对方似乎很高兴。"
	return iText
end
DTM004[210] = function(text)
	local iText="你与"..text.."关系紧张，对方禁止你的舰队进入该站！"
	return iText
end
DTM004[211] = "关系不足，不能购入！"
DTM004[212] = "修理"
DTM004[213] = function(l_ShipData,text,l_ShipData2,text2)
	local iText = ""
	iText = iText.."单艘售价："..DTM4_GetColorText(l_ShipData.Price,"Less",l_ShipData2.Price,l_ShipData.Price).."\n"
	iText = iText.."货舱容量："..DTM4_GetColorText(l_ShipData2.cap,"Less",l_ShipData.cap,l_ShipData.cap).."\n"
	iText = iText.."工业空间："..DTM4_GetColorText(l_ShipData2.fcap,"Less",l_ShipData.fcap,l_ShipData.fcap).."\n"
	iText = iText.."人口需求："..DTM4_GetColorText(l_ShipData.PopPoint,"Less",l_ShipData2.PopPoint,l_ShipData.PopPoint).."\n"
	iText = iText.."军事等级："..DTM4_GetColorText(l_ShipData.FightLevelNeed,"Less",l_ShipData2.FightLevelNeed,l_ShipData.FightLevelNeed).."\n"
	iText = iText.."贸易等级："..DTM4_GetColorText(l_ShipData.TradeLevelNeed,"Less",l_ShipData2.TradeLevelNeed,l_ShipData.TradeLevelNeed).."\n"
	iText = iText.."装卸能力："..DTM4_GetColorText(l_ShipData2.TransAmount,"Less",l_ShipData.TransAmount,l_ShipData.TransAmount).."\n"
	iText = iText.."装卸速度："..DTM4_GetColorText(l_ShipData2.TransSpeed,"Less",l_ShipData.TransSpeed,l_ShipData.TransSpeed).."\n"
	iText = iText.."日常消耗（单位/天）：\n"
			for i,j in l_ShipData.GTAnyTime do
				if (j[2]>0) then
					if(l_ShipData2.GTAnyTime[i]~=nil)then
						iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTAnyTime[i][2],j[2]).."\n"
					else
						iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
					end
				end
			end
			if (l_ShipData.GTWhileMoving[1]~=nil) then
				iText = iText.."移动消耗（单位/天）：\n"
				for i,j in l_ShipData.GTWhileMoving do
					if (j[2]>0) then
						if(l_ShipData2.GTWhileMoving[i]~=nil)then
							iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTWhileMoving[i][2],j[2]).."\n"
						else
							iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
						end
					end
				end
			end
			if (l_ShipData.GTWhileFiring[1]~=nil) then
				iText = iText.."攻击消耗（单位/天）：\n"
				for i,j in l_ShipData.GTWhileFiring do
					if (j[2]>0) then
						if(l_ShipData2.GTWhileFiring[i]~=nil)then
							iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTWhileFiring[i][2],j[2]).."\n"
						else
							iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
						end
					end
				end
			end
			if (l_ShipData.GTWhileRepairing[1]~=nil) then
				iText = iText.."维修消耗（单位/天）：\n"
				for i,j in l_ShipData.GTWhileRepairing do
					if (j[2]>0) then
						if(l_ShipData2.GTWhileRepairing[i]~=nil)then
							iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTWhileRepairing[i][2],j[2]).."\n"
						else
							iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
						end
					end
				end
			end
			if (l_ShipData.GTWhileHPJump[1]~=nil) then
				iText = iText.."跳跃消耗（单位/时）：\n"
				for i,j in l_ShipData.GTWhileHPJump do
					if (j[2]>0)and(j[1]~=g_GoodIndexForDockUnitHP) then
						if(l_ShipData2.GTWhileHPJump[i]~=nil)then
							iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTWhileHPJump[i][2],j[2]).."\n"
						else
							iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
						end
					end
				end
			end
			if (l_ShipData.GTWhileCloaking[1]~=nil) then
				iText = iText.."隐形消耗（单位/时）：\n"
				for i,j in l_ShipData.GTWhileCloaking do
					if (j[2]>0) then
						if(l_ShipData2.GTWhileCloaking[i]~=nil)then
							iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTWhileCloaking[i][2],j[2]).."\n"
						else
							iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
						end
					end
				end
			end
			if (l_ShipData.GTWhileDSOpening[1]~=nil) then
				iText = iText.."力场消耗（单位/时）：\n"
				for i,j in l_ShipData.GTWhileDSOpening do
					if (j[2]>0) then
						if(l_ShipData2.GTWhileDSOpening[i]~=nil)then
							iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTWhileDSOpening[i][2],j[2]).."\n"
						else
							iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
						end
					end
				end
			end
	iText = iText..text
	return iText
end
DTM004[214] = "清除任务"
DTM004[215] = function(iCamp,iEnemyCamp)
	local iText="你确定要帮助"..iCamp.."在十天内摧毁"..iEnemyCamp.."的目标吗？"
	return iText
end
DTM004[216] = function(iCamp,iEnemyCamp)
	local iText="感谢你决定帮助我们，"..iEnemyCamp.."的舰队位置已经传输给你，请务必小心。\n"..iCamp
	return iText
end
DTM004[217] = function(iCamp,iEnemyCamp,iReward)
	local iText=iCamp.."日前获悉一支"..iEnemyCamp.."的舰队已经抵达本星区，正策划制造破坏活动，"..iCamp.."愿出"..iReward.."点资金悬赏消灭这支舰队。\n"
	return iText
end
DTM004[218] = function(iCamp,iEnemyCamp,iReward,iData)
	local iText="你答应帮助"..iCamp.."清除来自"..iEnemyCamp.."的威胁，如能在指定日期前将"..iEnemyCamp.."的舰队摧毁，就可获得"..iReward.."点资金作为报酬。\n截止时间："..iData
	return iText
end
DTM004[219] = function(iCamp)
	local iText="你已通知"..iCamp.."你无法完成清除任务，估计对方不会高兴的。"
	return iText
end
DTM004[220] = function(iEnemyCamp)
	local iText="你如约摧毁了"..iEnemyCamp.."的舰队，并暗自希望对方不会知道是谁干的。"
	return iText
end
DTM004[221] = function(iCamp,iEnemyCamp)
	local iText="你刚刚从个人终端上收到一则消息：\n了解，看来我们要另找他人清除来自"..iEnemyCamp.."的威胁了。\n"..iCamp
	return iText
end
DTM004[221] = function(iCamp,iEnemyCamp)
	local iText="你刚刚从个人终端上收到一则消息：\n了解，看来我们要另找他人清除来自"..iEnemyCamp.."的威胁了。\n"..iCamp
	return iText
end
DTM004[222] = function(iCamp,iEnemyCamp)
	local iText="你刚刚从个人终端上收到一则消息：\n约定的期限已到，然而我们并没有看到"..iEnemyCamp.."的目标被摧毁，非常遗憾地通知您，它们已经不再构成威胁了，之前的合同就此作废。\n"..iCamp
	return iText
end
DTM004[223] = function(text)
	local iText="你没能在约定的期限前完成与"..text.."的采购合同，估计对方不会高兴的。"
	return iText
end
DTM004[224] = function(iCamp,iEnemyCamp)
	local iText="你没能在约定的期限前帮助"..iCamp.."摧毁"..iEnemyCamp.."的目标，估计对方不会高兴的。"
	return iText
end
DTM004[225] = function(iCamp,iEnemyCamp)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您帮助我们清除了"..iEnemyCamp.."的威胁，约定的报酬已经打入您的账户，对您的帮助我们再次表示深深的感谢。\n"..iCamp
	return iText
end
DTM004[226] = "规模："
DTM004[227] = function(iDate)
	local iText="应于"..iDate.."前将之摧毁"
	return iText
end
DTM004[228] = function(text1,text2,text3,text4,text5,text6,text15,text7,text8,text9,text10,text11,text12,text13)
	local iText="你的舰队工程力为"..text1..".一共发现了"..text2.."单位的基础合金,"..text3.."单位的奴隶,"..text4.."单位的中型船体构件,"..text5.."单位的耗子,"..text6.."单位的中型武器配件,"..text15.."单位的备用船员,"..text7.."单位的大型船体组件,"..text8.."单位的大型武器配件,"..text9.."单位的高级合金,"..text10.."单位的大型模块化居住区,"..text11.."单位的旗舰级武器配件,"..text12.."单位的旗舰级动力组件,"..text13.."单位的人形电脑,这个残骸带已经打捞不到什么有价值的资源了，你的舰队只能离开"
	return iText
end

DTM004[229] = function(text1,text2,text3,ext14)
	local iText="你的舰队工程力为"..text1..".一共发现了"..text2.."单位的基础合金,"..text3.."单位的奴隶,是否要继续打捞？目前的打捞次数为"..text14.."次，打捞次数越多可以获得的材料和种类越多，但是离开星区的时候会遭遇的敌人越强大"
	return iText
end

DTM004[230] = function(text1,text2,text3,text4,text5,text14)
	local iText="你的舰队工程力为"..text1..".一共发现了"..text2.."单位的基础合金,"..text3.."单位的奴隶,"..text4.."单位的中型船体构件,"..text5.."单位的耗子,是否要继续打捞？目前的打捞次数为"..text14.."次，打捞次数越多可以获得的材料和种类越多，但是离开星区的时候会遭遇的敌人越强大"
	return iText
end

DTM004[231] = function(text1,text2,text3,text4,text5,text6,text15,text14)
	local iText="你的舰队工程力为"..text1..".一共发现了"..text2.."单位的基础合金,"..text3.."单位的奴隶,"..text4.."单位的中型船体构件,"..text5.."单位的耗子,"..text6.."单位的中型武器配件,"..text15.."单位的备用船员,是否要继续打捞？目前的打捞次数为"..text14.."次，打捞次数越多可以获得的材料和种类越多，但是离开星区的时候会遭遇的敌人越强大"
	return iText
end

DTM004[232] = function(text1,text2,text3,text4,text5,text6,text15,text7,text14)
	local iText="你的舰队工程力为"..text1..".一共发现了"..text2.."单位的基础合金,"..text3.."单位的奴隶,"..text4.."单位的中型船体构件,"..text5.."单位的耗子,"..text6.."单位的中型武器配件,"..text15.."单位的备用船员,"..text7.."单位的大型船体组件,是否要继续打捞？目前的打捞次数为"..text14.."次，打捞次数越多可以获得的材料和种类越多，但是离开星区的时候会遭遇的敌人越强大"
	return iText
end

DTM004[233] = function(text1,text2,text3,text4,text5,text6,text15,text7,text8,text14)
	local iText="你的舰队工程力为"..text1..".一共发现了"..text2.."单位的基础合金,"..text3.."单位的奴隶,"..text4.."单位的中型船体构件,"..text5.."单位的耗子,"..text6.."单位的中型武器配件,"..text15.."单位的备用船员,"..text7.."单位的大型船体组件,"..text8.."单位的大型武器配件,是否要继续打捞？目前的打捞次数为"..text14.."次，打捞次数越多可以获得的材料和种类越多，但是离开星区的时候会遭遇的敌人越强大"
	return iText	
end

DTM004[234] = function(text1,text2,text3,text4,text5,text6,text15,text7,text8,text9,text14)
	local iText="你的舰队工程力为"..text1..".一共发现了"..text2.."单位的基础合金,"..text3.."单位的奴隶,"..text4.."单位的中型船体构件,"..text5.."单位的耗子,"..text6.."单位的中型武器配件,"..text15.."单位的备用船员,"..text7.."单位的大型船体组件,"..text8.."单位的大型武器配件,"..text9.."单位的高级合金,是否要继续打捞？目前的打捞次数为"..text14.."次，打捞次数越多可以获得的材料和种类越多，但是离开星区的时候会遭遇的敌人越强大"
	return iText
end

DTM004[235] = function(text1,text2,text3,text4,text5,text6,text15,text7,text8,text9,text10,text14)
	local iText="你的舰队工程力为"..text1..".一共发现了"..text2.."单位的基础合金,"..text3.."单位的奴隶,"..text4.."单位的中型船体构件,"..text5.."单位的耗子,"..text6.."单位的中型武器配件,"..text15.."单位的备用船员,"..text7.."单位的大型船体组件,"..text8.."单位的大型武器配件,"..text9.."单位的高级合金,"..text10.."单位的大型模块化居住区,是否要继续打捞？目前的打捞次数为"..text14.."次，打捞次数越多可以获得的材料和种类越多，但是离开星区的时候会遭遇的敌人越强大"
	return iText
end

DTM004[236] = function(text1,text2,text3,text4,text5,text6,text15,text7,text8,text9,text10,text11,text14)
	local iText="你的舰队工程力为"..text1..".一共发现了"..text2.."单位的基础合金,"..text3.."单位的奴隶,"..text4.."单位的中型船体构件,"..text5.."单位的耗子,"..text6.."单位的中型武器配件,"..text15.."单位的备用船员,"..text7.."单位的大型船体组件,"..text8.."单位的大型武器配件,"..text9.."单位的高级合金,"..text10.."单位的大型模块化居住区,"..text11.."单位的旗舰级武器配件,是否要继续打捞？目前的打捞次数为"..text14.."次，打捞次数越多可以获得的材料和种类越多，但是离开星区的时候会遭遇的敌人越强大"
	return iText
end

DTM004[237] = function(text1,text2,text3,text4,text5,text6,text15,text7,text8,text9,text10,text11,text12,text14)
	local iText="你的舰队工程力为"..text1..".一共发现了"..text2.."单位的基础合金,"..text3.."单位的奴隶,"..text4.."单位的中型船体构件,"..text5.."单位的耗子,"..text6.."单位的中型武器配件,"..text15.."单位的备用船员,"..text7.."单位的大型船体组件,"..text8.."单位的大型武器配件,"..text9.."单位的高级合金,"..text10.."单位的大型模块化居住区,"..text11.."单位的旗舰级武器配件,"..text12.."单位的旗舰级动力组件,是否要继续打捞？目前的打捞次数为"..text14.."次，打捞次数越多可以获得的材料和种类越多，但是离开星区的时候会遭遇的敌人越强大"
	return iText
end

DTM004[238] = function(text1,text2,text3)
	local iText="你的舰队工程力为"..text1..".一共发现了"..text2.."单位的物资,但是你的舰队只有"..text3.."单位的空间,所以只能放弃打捞，离开星区"
	return iText
end

DTM004[239] = function(text1,text2,text3)
	local iText="维格尔基地已经被重创，现在你的舰队可以组织一次登陆行动来暂时控制基地，目前你的舰队中一共拥有"..text1.."名陆战队员，是否执行登陆任务？目前该基地的级别为"..text2.."控制它至少需要"..text3.."名陆战队员,注意：你的军等越高，舰队中的陆战队员数量越多，可能遭受的进攻损失就越小"
	return iText
end


DTM004[240] = function(text1,text2,text13,text14,text15,text16,text17,text19,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text13.."单位的奢侈品,"..text14.."单位的堡垒级蓝图碎片,"..text15.."单位的奢华家具,"..text16.."单位的人形电脑,"..text17.."单位的先进堡垒级蓝图碎片,此外还有一共"..text19.."单位的各类物资，这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[241] = function(text1,text2,text11,text12,text13,text14,text15,text16,text19,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text11.."单位的先进旗舰蓝图碎片,"..text12.."单位的帝国女仆,"..text13.."单位的奢侈品,"..text14.."单位的堡垒级蓝图碎片,"..text15.."单位的奢华家具"..text16.."单位的人形电脑,此外还有一共"..text19.."单位的各类物资,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[242] = function(text1,text2,text9,text10,text11,text12,text13,text14,text15,text19,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text9.."单位的修理物资,"..text10.."单位的备用船员,"..text11.."单位的先进旗舰蓝图碎片,"..text12.."单位的帝国女仆,"..text13.."单位的奢侈品,"..text14.."单位的堡垒级蓝图碎片,"..text15.."单位的奢华家具,此外还有一共"..text19.."单位的各类物资,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[243] = function(text1,text2,text7,text8,text9,text10,text11,text12,text13,text14,text19,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text7.."单位的中型武器配件,"..text8.."单位的奴隶,"..text9.."单位的修理物资,"..text10.."单位的备用船员,"..text11.."单位的先进旗舰蓝图碎片,"..text12.."单位的帝国女仆,"..text13.."单位的奢侈品,"..text14.."单位的堡垒级蓝图碎片,此外还有一共"..text19.."单位的各类物资,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[244] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text3.."单位的氢燃料,"..text4.."单位的基础补给,"..text5.."单位的珍惜矿石,"..text6.."单位的弹药,"..text7.."单位的中型武器配件,"..text8.."单位的奴隶,"..text9.."单位的修理物资,"..text10.."单位的备用船员,"..text11.."单位的先进旗舰蓝图碎片,"..text12.."单位的帝国女仆,"..text13.."单位的奢侈品,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[245] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text3.."单位的氢燃料,"..text4.."单位的基础补给,"..text5.."单位的珍惜矿石,"..text6.."单位的弹药,"..text7.."单位的中型武器配件,"..text8.."单位的奴隶,"..text9.."单位的修理物资,"..text10.."单位的备用船员,"..text11.."单位的先进旗舰蓝图碎片,"..text12.."单位的帝国女仆,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[246] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text3.."单位的氢燃料,"..text4.."单位的基础补给,"..text5.."单位的珍惜矿石,"..text6.."单位的弹药,"..text7.."单位的中型武器配件,"..text8.."单位的奴隶,"..text9.."单位的修理物资,"..text10.."单位的备用船员,"..text11.."单位的先进旗舰蓝图碎片,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[247] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text3.."单位的氢燃料,"..text4.."单位的基础补给,"..text5.."单位的珍惜矿石,"..text6.."单位的弹药,"..text7.."单位的中型武器配件,"..text8.."单位的奴隶,"..text9.."单位的修理物资,"..text10.."单位的备用船员,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[248] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text3.."单位的氢燃料,"..text4.."单位的基础补给,"..text5.."单位的珍惜矿石,"..text6.."单位的弹药,"..text7.."单位的中型武器配件,"..text8.."单位的奴隶,"..text9.."单位的修理物资,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[249] = function(text1,text2,text3,text4,text5,text6,text7,text8,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text3.."单位的氢燃料,"..text4.."单位的基础补给,"..text5.."单位的珍惜矿石,"..text6.."单位的弹药,"..text7.."单位的中型武器配件,"..text8.."单位的奴隶,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[250] = function(text1,text2,text3,text4,text5,text6,text7,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text3.."单位的氢燃料,"..text4.."单位的基础补给,"..text5.."单位的珍惜矿石,"..text6.."单位的弹药,"..text7.."单位的中型武器配件,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[251] = function(text1,text2,text3,text4,text5,text6,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text3.."单位的氢燃料,"..text4.."单位的基础补给,"..text5.."单位的珍惜矿石,"..text6.."单位的弹药,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[252] = function(text1,text2,text3,text4,text5,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text3.."单位的氢燃料,"..text4.."单位的基础补给,"..text5.."单位的珍惜矿石,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[253] = function(text1,text2,text3,text4,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text3.."单位的氢燃料,"..text4.."单位的基础补给,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[254] = function(text1,text2,text3,text18)
	local iText="你的舰队一共拥有"..text1.."名陆战队员，在付出"..text2.."人的伤亡后，你的陆战部队在舰队火力的支援下成功的控制了基地。并成功的搜刮到了"..text3.."单位的氢燃料,这些资源一共占据您的舰队"..text18.."的货仓空间(如果你的舰队空间不够，那么只能打捞到其中一部分资源)"
	return iText
end

DTM004[255] = function(text1)
	local iText="维格尔基地的指挥官评估了您的舰队的战斗力后，决定放你一马。您可以选择是否消耗"..text1.."个荣誉点来离开该地图。（滞留在该星区中会引来维格尔舰队的追杀）"
	return iText
end

DTM004[256] = function(text1,text2,text3)
	local iText="你战胜了维格尔舰队并解除了重力场的干扰，除此之外你还获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬，另外舰队将会展开一场打捞行动，对战场进行打扫"
	return iText
end

DTM004[257] = function(text1,text2,text3)
	local iText="在搜刮完维格尔基地的战利品后，你引爆了这座基地，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬"
	return iText
end

DTM004[258] = function(text1,text2,text3,text4)
	local iText="在击退了维格尔舰队后，商船队的首领向您表示感谢并支付了额外的酬劳，这场战斗中一共有"..text1.."艘商船幸存，你一共获得了"..text2.."的资金奖励和"..text3.."的战斗经验还有"..text4.."的荣誉点作为报酬，另外商船队首领还会赠送您一份特别的蓝图碎片作为报酬"
	return iText
end

DTM004[259] = function(text1,text2,text3)
	local iText="你守卫住了基地，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬，为了感谢您的贡献，基地指挥官特意开放了一个秘密物资商店来供您采购"
	return iText
end

DTM004[260] = function(text1,text2,text3,text4)
	local iText="你成功的击退了来袭的维格尔舰队，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬，是否还需要继续打捞？目前你已经打捞了"..text4.."次"
	return iText
end

DTM004[261] = function(text1,text2,text3,text4)
	local iText="你摧毁了所有的先祖战舰，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的先祖遗物"
	return iText
end

DTM004[262] = function(text1,text2,text3,text4)
	local iText="你摧毁了所有的先祖战舰，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的先祖遗物，可惜的是由于货仓空间不足，这部分物资无法携带"
	return iText
end

DTM004[263] = function(text1,text2,text3,text4)
	local iText="你摧毁了所有的先祖战舰，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的先祖遗物，可惜的是由于货仓空间不足，这部分物资无法携带"
	return iText
end

DTM004[264] = function(text1)
	local iText="你的舰队超空间燃料不足，跳跃需要"..text1.."的超空间燃料，是否需要消耗您账户一半的资金向黑市商人紧急采购超空间燃料？"
	return iText
end

DTM004[265] = function(text1)
	local iText="紧急跳跃需要"..text1.."的反物质燃料，请确认是否要紧急充能"
	return iText
end


DTM004[266] = function(text1,text2,text3)
	local iText="你战胜了维格尔舰队，除此之外你还获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点和2张蓝图碎片作为报酬，另外舰队将会展开一场打捞行动，对战场进行打扫"
	return iText
end


DTM004[267] = function(text1,text2,text3,text4)
	local iText="你歼灭了所有的虫群舰队，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的触手"
	return iText
end

DTM004[268] = function(text1,text2,text3,text4)
	local iText="你歼灭了所有的虫群舰队，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的触手，可惜的是由于货仓空间不足，这部分物资无法携带"
	return iText
end

DTM004[269] = function(text1,text2,text3,text4)
	local iText="你歼灭了所有的棺骸舰队，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的珍惜矿石"
	return iText
end

DTM004[270] = function(text1,text2,text3,text4)
	local iText="你歼灭了所有的棺骸舰队，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的珍惜矿石，可惜的是由于货仓空间不足，这部分物资无法携带"
	return iText
end

DTM004[271] = function(text1,text2,text3,text4,text5)
	local iText="你摧毁了所有的维格尔商船队，此外你还获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的奴隶，"..text5.."的奢侈品，另外还发现了一份特别的蓝图碎片作为额外收获"
	return iText
end


DTM004[272] = function(text1,text2,text3,text4,text5)
	local iText="你摧毁了所有的维格尔商船队，此外你还获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的奴隶，"..text5.."的奢侈品，可惜的是由于货仓空间不足，这部分物资无法携带，不过在打扫战场的时候另外发现了一份特别的蓝图碎片作为额外收获"
	return iText
end

DTM004[273] = function(text1,text2,text3,text4)
	local iText="你歼灭了所有的水晶体，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的纳米物质"
	return iText
end

DTM004[274] = function(text1,text2,text3,text4)
	local iText="你歼灭了所有的水晶体，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的纳米物质，可惜的是由于货仓空间不足，这部分物资无法携带"
	return iText
end

DTM004[275] = function(text1,text2,text3,text4,text5)
	local iText="你在援军到来前提前摧毁了维格尔基地，由于损毁的太过彻底，所以残破的基地里只有少量的战利品可以搜刮，你在维格尔舰队基地中发现了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的奴隶，"..text5.."的奢侈品,另外在打扫战场的时候还发现了一份特别的蓝图碎片作为额外收获"
	return iText
end

DTM004[276] = function(text1,text2,text3,text4,text5)
	local iText="你在援军到来前提前摧毁了维格尔基地，由于损毁的太过彻底，所以残破的基地里只有少量的战利品可以搜刮，你在维格尔舰队基地中发现了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬,此外在打扫战场的时候，你还从残骸中获取了"..text4.."的奴隶，"..text5.."的奢侈品，可惜的是由于货仓空间不足，这部分物资无法携带，不过在打扫战场的时候另外发现了一份特别的蓝图碎片作为额外收获"
	return iText
end

DTM004[277] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10)
	local iText="你的殖民地目前拥有"..text1.."的人口，安防等级为"..text2.."级，殖民地威胁等级为"..text3..",并拥有"..text4.."的殖民地舰队点数，目前殖民地的建筑规模等级为"..text5.."级,"..text6..""..text7..""..text8..""..text9..","..text10..""
	return iText
end


DTM004[278] = function(text1)
	local iText="你的舰队点数目前只有"..text1.."点，暂时无法召唤这个规模的舰队"
	return iText
end

DTM004[279] = function(text1)
	local iText="你召唤的舰队目前正在分批进入战场，目前还有"..text1.."点的舰队点数还未使用，是否要回收舰队撤离战场？"
	return iText
end

DTM004[280] = function(text1)
	local iText="殖民地舰队已经撤离，一共回收了"..text1.."点的舰队点数"
	return iText
end



DTM004[281] = function(text1)
	local iText="你的资源探索舰队发现了一个"..text1.."的冰矿带"
	return iText
end



DTM004[282] = "小型"
DTM004[283] = "中型"
DTM004[284] = "大型"
DTM004[285] = "巨型"
DTM004[286] = "超巨型"


DTM004[290] = function(text1,text2,text3)
	local iText="你摧毁了整座基地和随之而来的增援舰队，这场战斗中你一共获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬"
	return iText
end


DTM004[291] = function(text1)
	local iText="你的舰队点数目前只有"..text1.."点，暂时无法派出这个规模的舰队"
	return iText
end


DTM004[292] = function(text1,text2,text3)
	local iText="海盗基地已经被重创，现在你的舰队可以组织一次登陆行动来暂时控制基地，目前你的舰队中一共拥有"..text1.."名陆战队员，是否执行登陆任务？目前该基地的级别为"..text2.."控制它至少需要"..text3.."名陆战队员,注意：你的军等越高，舰队中的陆战队员数量越多，可能遭受的进攻损失就越小"
	return iText
end


DTM004[293] = function(text1,text2,text3)
	local iText="你战胜了维格尔军阀舰队并解除了重力场的干扰，除此之外你还获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬，另外舰队将会展开一场打捞行动，对战场进行打扫"
	return iText
end

DTM004[294] = function(text1,text2,text3)
	local iText="你战胜了秘银重工舰队，除此之外你还获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点和1张蓝图碎片作为报酬，另外舰队将会展开一场打捞行动，对战场进行打扫"
	return iText
end

DTM004[295] = function(text1,text2,text3,text4)
	local iText="你战胜了"..text4.."，除此之外你还获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点和1张蓝图碎片作为报酬，另外舰队将会展开一场打捞行动，对战场进行打扫"
	return iText
end


DTM004[296] = function(text1,text2,text3)
	local iText=""..text1.."的规模已经消减了"..text2.."点"..text3..""
	return iText
end

DTM004[297] = "，由于你彻底毁灭了天灾，在一段时期内不会再出现新的任何天灾"

DTM004[298] = function(text1,text2)
	local iText="你在附近星区发现了一片"..text1.."的残骸带，这里似乎刚刚发生过一场激烈的战斗，可能还有有价值的零件可以打捞，同时还有生还者可以营救，从规模上判断，似乎可以进行"..text2.."次的打捞，是否要组织舰队进行打捞？"
	return iText
end





KE04missionTXT = {}
KE04missionTXT[001] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10)
	local iText="你派出了一支"..text1.."舰队，在经过数天探索后，你的舰队发现了一处"..text2..""..text3.."，经过思考后，舰队指挥官决定对"..text3..""..text4..","..text5..","..text6.."行动"..text7.."，探索舰队在"..text8.."附近"..text9..""..text10..""
	return iText
end




KE04missionTXTLV01A01 = {}
KE04missionTXTLV01A01[001] = "小型"
KE04missionTXTLV01A01[002] = "中等规模"
KE04missionTXTLV01A01[003] = "大型"
KE04missionTXTLV01A01[004] = "超大型"
KE04missionTXTLV01A01[005] = "巨型"


KE04missionTXTLV01A02 = {}
KE04missionTXTLV01A02[001] = "小规模的"
KE04missionTXTLV01A02[002] = "中等规模"
KE04missionTXTLV01A02[003] = "大规模的"
KE04missionTXTLV01A02[004] = "规模庞大的"
KE04missionTXTLV01A02[005] = "超大规模的"

KE04missionTXTLV01A03 = {}
KE04missionTXTLV01A03[001] = "冰小行星带"
KE04missionTXTLV01A03[002] = "小行星带"
KE04missionTXTLV01A03[003] = "废弃能源设施"
KE04missionTXTLV01A03[004] = "废弃居住区"
KE04missionTXTLV01A03[005] = "废弃弹药仓库"
KE04missionTXTLV01A03[006] = "废弃钢铁冶炼设施"
KE04missionTXTLV01A03[007] = "废弃零件厂"
KE04missionTXTLV01A03[008] = "废弃的高级处理设施"
KE04missionTXTLV01A03[009] = "废弃船坞"
KE04missionTXTLV01A03[010] = "废弃的战场"
KE04missionTXTLV01A03[011] = "秘密海盗基地"
KE04missionTXTLV01A03[012] = "秘密研究站"

KE04missionTXTLV01A04 = {}
KE04missionTXTLV01A04[001] = "进行开采"
KE04missionTXTLV01A04[002] = "进行探索"
KE04missionTXTLV01A04[003] = "进行侦查"

KE04missionTXTLV01A05 = {}
KE04missionTXTLV01A05[001] = "幸运的是"
KE04missionTXTLV01A05[002] = "不过"
KE04missionTXTLV01A05[003] = "不幸的是"



KE04missionTXTLV02A01 = {}
KE04missionTXTLV02A01[001] = "开采"
KE04missionTXTLV02A01[002] = "探索"
KE04missionTXTLV02A01[003] = "侦查"

KE04missionTXTLV02A02 = {}
KE04missionTXTLV02A02[001] = "进行的很顺利"
KE04missionTXTLV02A02[002] = "进行的很不顺利"
KE04missionTXTLV02A02[003] = "遇到了意外"
KE04missionTXTLV02A02[004] = "遇到了严重事故"
KE04missionTXTLV02A02[005] = "遇到了大麻烦"

KE04missionTXTLV02A03 = {}
KE04missionTXTLV02A03[001] = "没有发现任何敌人舰队"
KE04missionTXTLV02A03[002] = "发现了少量的"
KE04missionTXTLV02A03[003] = "遇到了大量的"
KE04missionTXTLV02A03[004] = "遭遇了海量的"
KE04missionTXTLV02A03[005] = "遇到了可怕规模的"

KE04missionTXTLV02A04 = {}
KE04missionTXTLV02A04[001] = ""
KE04missionTXTLV02A04[002] = "海盗舰队"
KE04missionTXTLV02A04[003] = "失控的先祖舰队"
KE04missionTXTLV02A04[004] = "水晶体舰队"
KE04missionTXTLV02A04[005] = "虫群舰队"
KE04missionTXTLV02A04[006] = "维格尔军阀舰队"
KE04missionTXTLV02A04[007] = "棺骸舰队"

KE04missionTXTLV03A00 = {}
KE04missionTXTLV03A00[001] = ""
KE04missionTXTLV03A00[002] = "在一番战斗后，你的舰队"

KE04missionTXTLV03A01 = {}
KE04missionTXTLV03A01[000] = ""
KE04missionTXTLV03A01[001] = "大获全胜"
KE04missionTXTLV03A01[002] = "获得胜利"
KE04missionTXTLV03A01[003] = "和对手两败俱伤"
KE04missionTXTLV03A01[004] = "损失不小"
KE04missionTXTLV03A01[005] = "受到了严重的损失"

KE04missionTXTLV03A02 = {}
KE04missionTXTLV03A02[000] = ""
KE04missionTXTLV03A02[001] = "，约有"
KE04missionTXTLV03A02[002] = "，约有"
KE04missionTXTLV03A02[003] = "，多达"
KE04missionTXTLV03A02[004] = "，多达"
KE04missionTXTLV03A02[005] = "，差不多"

KE04missionTXTLV03A03 = {}
KE04missionTXTLV03A03[001] = ""
KE04missionTXTLV03A03[002] = "个舰队点数的战舰受损，"

KE04missionTXTLV03A04 = {}
KE04missionTXTLV03A04[000] = ""
KE04missionTXTLV03A04[001] = ""
KE04missionTXTLV03A04[002] = ""
KE04missionTXTLV03A04[003] = "只能选择撤退。"
KE04missionTXTLV03A04[004] = "只能选择撤退。"
KE04missionTXTLV03A04[005] = "只能选择撤退。"

KE04missionTXTLV03A05 = {}
KE04missionTXTLV03A05[001] = ""
KE04missionTXTLV03A05[002] = "在对方舰队撤退后，"

KE04missionTXTLV03A06 = {}
KE04missionTXTLV03A06[001] = "单位的单位的冰矿储备"
KE04missionTXTLV03A06[002] = "单位的能量块"
KE04missionTXTLV03A06[003] = "单位的金属矿石储备"
KE04missionTXTLV03A06[004] = "单位的生活用品储备"
KE04missionTXTLV03A06[005] = "单位的殖民地弹药储备"
KE04missionTXTLV03A06[006] = "单位的合金储备"
KE04missionTXTLV03A06[007] = "单位的机械零件储备"
KE04missionTXTLV03A06[008] = "单位的纳米物质储备"
KE04missionTXTLV03A06[009] = "单位的大型船体储备"
KE04missionTXTLV03A06[010] = "单位的旗舰级核心组件储备"
KE04missionTXTLV03A06[011] = "名奴隶并转化成了殖民地工人"
KE04missionTXTLV03A06[012] = "份的堡垒级蓝图碎片"  

KE04missionTXTLV03A07 = {}
KE04missionTXTLV03A07[001] = "，值得一提的是，由于你的殖民地舰队和海盗舰队的交火，海盗已经盯上了你的殖民地，海盗威胁度上涨1点"
KE04missionTXTLV03A07[002] = ""

KE04missionTXTLV04A01 = {}
KE04missionTXTLV04A01[001] = ""
KE04missionTXTLV04A01[002] = "你的舰队在"  

KE04missionTXTLV04A02 = {}
KE04missionTXTLV04A02[001] = ""
KE04missionTXTLV04A02[002] = "中进行了"  

KE04missionTXTLV04A03 = {}
KE04missionTXTLV04A03[001] = ""
KE04missionTXTLV04A03[002] = "行动，最后在"  

KE04missionTXTLV04A04 = {}
KE04missionTXTLV04A04[001] = ""
KE04missionTXTLV04A04[002] = "中获得了"  

KE04missionTXT[002] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16)
	local iText=""..text1..""..text2..""..text3..""..text4..""..text5..""..text6..""..text7..""..text13..""..text8..""..text14..""..text9..""..text15..""..text8..""..text16..""..text10..""..text11..""..text12..""
	return iText
end

factoryattackLVTXT = {}
factoryattackLVTXT[001] = ""
factoryattackLVTXT[002] = "一支海盗舰队已经在附近建设了临时基地，对方随时会通过这座海盗基地对你的舰队发起进攻"  


factoryattackLVTXTA01 = {}
factoryattackLVTXTA01[001] = ""
factoryattackLVTXTA01[002] = "一支"  

factoryattackLVTXTA02 = {}
factoryattackLVTXTA02[001] = "海盗舰队"
 

factoryattackLVTXTA03 = {}
factoryattackLVTXTA03[001] = ""
factoryattackLVTXTA03[002] = "已经在附近"

factoryattackLVTXTA04 = {}
factoryattackLVTXTA04[001] = ""
factoryattackLVTXTA04[002] = "建设了临时基地"
factoryattackLVTXTA04[003] = "集结了一支舰队"

factoryattackLVTXTA05 = {}
factoryattackLVTXTA05[001] = ""
factoryattackLVTXTA05[002] = "对方随时会对你的殖民地发起进攻"




factoryattackLVTXT[003] = function(text1,text2)
	local iText=""..text1.."的规模增加了，这意味着附近将会有更多"..text1.."集结到殖民地附近，目前的威胁等级为"..text2.."级"
	return iText
end


factoryattackLVTXTLVA01 = {}
factoryattackLVTXTLVA01[001] = "小规模"
factoryattackLVTXTLVA01[002] = "中等规模"
factoryattackLVTXTLVA01[003] = "大规模"
factoryattackLVTXTLVA01[004] = "只超大规模"
factoryattackLVTXTLVA01[005] = "史诗规模"

factoryattackLVTXTLVA02 = {}
factoryattackLVTXTLVA02[001] = "远小于"
factoryattackLVTXTLVA02[002] = "小于"
factoryattackLVTXTLVA02[003] = "不弱于"
factoryattackLVTXTLVA02[004] = "强于"
factoryattackLVTXTLVA02[005] = "远强于"

factoryattackLVTXTLVA03 = {}
factoryattackLVTXTLVA03[001] = "殖民地的外围采矿舰队"
factoryattackLVTXTLVA03[002] = "殖民地外围的巡逻舰队"
factoryattackLVTXTLVA03[003] = "殖民地的核心区域"
factoryattackLVTXTLVA03[004] = "殖民地的防御设施"
factoryattackLVTXTLVA03[005] = "殖民地的核心建筑群"

factoryattackLVTXTLVA04 = {}
factoryattackLVTXTLVA04[001] = "派出拦截舰队进行了拦截"
factoryattackLVTXTLVA04[002] = "集结舰队和对方进行决战"
factoryattackLVTXTLVA04[003] = "集结所有战舰在"
factoryattackLVTXTLVA04[004] = "激活所有防御设施进行抵抗"
factoryattackLVTXTLVA04[005] = "集结所有安保人员在核心建筑群进行防守"
factoryattackLVTXTLVA04[006] = "只能放弃抵抗选择撤离"

factoryattackbaseLVTXTLVA09 = {}
factoryattackbaseLVTXTLVA09[001] = "损失惨重选择撤退"
factoryattackbaseLVTXTLVA09[002] = "遭受不小的伤亡"
factoryattackbaseLVTXTLVA09[003] = "和殖民地舰队两败俱伤"
factoryattackbaseLVTXTLVA09[004] = "取得了优势，获得了不小的战果"
factoryattackbaseLVTXTLVA09[005] = "大获全胜"

factoryattackLVTXTLVA06 = {}
factoryattackLVTXTLVA06[000] = ""
factoryattackLVTXTLVA06[001] = ".你的殖民地舰队打扫战场获得了"
factoryattackLVTXTLVA06[002] = ".你的殖民地一共损失了"
factoryattackLVTXTLVA06[003] = "名奴隶并转化成殖民地工人,"
factoryattackLVTXTLVA06[004] = "单位的合金储备,"
factoryattackLVTXTLVA06[005] = "单位的殖民地弹药储备"
factoryattackLVTXTLVA06[006] = "点数的舰队，"
factoryattackLVTXTLVA06[007] = "名的殖民地工人，"
factoryattackLVTXTLVA06[008] = "幸好附近的帝国巡逻舰队赶来支援，这才阻止了进一步破坏"

factoryattackLVTXTLVA07 = {}
factoryattackLVTXTLVA07[001] = "的奴隶并转为殖民地工人，"
factoryattackLVTXTLVA07[002] = "纳米物质储备"
factoryattackLVTXTLVA07[003] = "食物储备"
factoryattackLVTXTLVA07[004] = "矿石储备"
factoryattackLVTXTLVA07[005] = "生活用品储备"
factoryattackLVTXTLVA07[006] = "电子元件储备"

factoryattackLVTXTLVA08 = {}
factoryattackLVTXTLVA08[001] = "水晶体集群"
factoryattackLVTXTLVA08[002] = "虫群舰队"
factoryattackLVTXTLVA08[003] = "棺骸舰队"
factoryattackLVTXTLVA08[004] = "神秘军阀舰队"
factoryattackLVTXTLVA08[005] = "觉醒先祖舰队"


factoryattackLVTXT[004] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16,text17,text18)
	local iText="一支"..text1..""..text18.."对你的殖民地发动了袭击，由于"..text18.."的规模"..text2.."你殖民地的安防力量，所以"..text18.."选择袭击"..text3..".面对"..text18.."的攻势，殖民地安防力量"..text4..".在激烈的战斗后，"..text18..""..text5..""..text6..""..text7..""..text8..""..text9..""..text10..""..text11..""..text12..""..text13..""..text14..""..text15..""..text16..""..text17..""
	return iText
end




KE05missionTXTLV01A01 = {}
KE05missionTXTLV01A01[001] = "小规模的"
KE05missionTXTLV01A01[002] = "中等规模"
KE05missionTXTLV01A01[003] = "大规模的"
KE05missionTXTLV01A01[004] = "规模庞大的"
KE05missionTXTLV01A01[005] = "超大规模的"

KE05missionTXTLV01A02 = {}
KE05missionTXTLV01A02[001] = "远小于"
KE05missionTXTLV01A02[002] = "小于"
KE05missionTXTLV01A02[003] = "不弱于"
KE05missionTXTLV01A02[004] = "强于"
KE05missionTXTLV01A02[005] = "远强于"

KE05missionTXTLV01A03 = {}
KE05missionTXTLV01A03[001] = ""
KE05missionTXTLV01A03[002] = ""
KE05missionTXTLV01A03[003] = ""
KE05missionTXTLV01A03[004] = ""
KE05missionTXTLV01A03[005] = ""

KE05missionTXTLV01A04 = {}
KE05missionTXTLV01A04[001] = "大获全胜"
KE05missionTXTLV01A04[002] = "受到了一定的损失"
KE05missionTXTLV01A04[003] = "和目标舰队两败俱伤"
KE05missionTXTLV01A04[004] = "损失惨重只能撤退"
KE05missionTXTLV01A04[005] = "遭受了重大失败，舰队溃逃"      


factoryattackLVTXTLVA05 = {}
factoryattackLVTXTLVA05[001] = ""
factoryattackLVTXTLVA05[002] = ".但是消减了"
factoryattackLVTXTLVA05[003] = "点的殖民地威胁度."
factoryattackLVTXTLVA05[004] = "海盗基地已经被彻底摧毁，在攻占海盗基地的过程中获得"
factoryattackLVTXTLVA05[005] = "名奴隶，"
factoryattackLVTXTLVA05[006] = "单位的合金储备，" 
factoryattackLVTXTLVA05[007] = "单位的弹药储备，" 
factoryattackLVTXTLVA05[008] = "单位的生活用品储备，" 
factoryattackLVTXTLVA05[009] = "单位的能量块，" 
factoryattackLVTXTLVA05[010] = "台人型电脑储备" 
factoryattackLVTXTLVA05[011] = ".你摧毁海盗基地的行为对周围的海盗产生了震慑，短时间内不会产生新的海盗基地"  



factoryattackLVTXTLVA09 = {}
factoryattackLVTXTLVA09[001] = ""
factoryattackLVTXTLVA09[002] = "由于围攻殖民地的"
factoryattackLVTXTLVA09[003] = "已经被全部消灭，你的反击行为产生了震慑，殖民地周围短时间内不会产生新的威胁"


factoryattackbaseLVTXTLVA10 = {}
factoryattackbaseLVTXTLVA10[001] = ""
factoryattackbaseLVTXTLVA10[002] = "，同时水晶体天灾的总规模下降1点"
factoryattackbaseLVTXTLVA10[003] = "，同时虫群天灾的总规模下降1点"
factoryattackbaseLVTXTLVA10[004] = "，同时棺骸天灾的总规模下降1点"
factoryattackbaseLVTXTLVA10[005] = "，同时神秘的维格尔军阀的总规模下降1点"  
factoryattackbaseLVTXTLVA10[006] = "，同时觉醒的先祖舰队的总规模下降1点"   

KE05missionTXT = {}
KE05missionTXT[001] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16,text17,text18,text19,text20,text22,text23)
	local iText="你集结了一支"..text1.."的殖民地舰队，对"..text23.."发动了远征，你的舰队规模"..text2..""..text23..""..text3.."。在激烈的战斗后，殖民地舰队"..text4.."。这场战斗中你的舰队损失了"..text5.."的舰队点数"..text6..""..text22..""..text7..""..text8..""..text9..""..text10..""..text11..""..text12..""..text13..""..text14..""..text15..""..text16..""..text17..""..text18..""..text19..""..text20..""
	return iText
end


KE05missionTXT[002] = function(text1,text2,text3,text4,text5,text23)
	local iText="你集结了一支"..text1.."的殖民地舰队，对"..text23.."发动了远征，你的舰队规模"..text2..""..text23..""..text3.."。在激烈的战斗后，殖民地舰队"..text4.."。这场战斗中你的舰队损失了"..text5.."的舰队点数"
	return iText
end

KE05missionTXT[003] = function(text1,text2,text3,text4)
	local iText="这场战斗一共消减了"..text1.."点的"..text2.."威胁，战斗结束后，你的舰队对战场进行了打捞，并从战场残骸中发现了"..text3.."单位的"..text4..""
	return iText
end


KE05missionTXT[004] = function(text1,text2)
	local iText="由于围攻殖民地的"..text1.."已经被全部消灭，你的反击行为产生了震慑，殖民地周围短时间内不会产生新的威胁"..text2..""
	return iText
end

KE05missionTXT[005] = function(text1)
	local iText=""..text1.."正对你的殖民地造成威胁，是否派出一支殖民地舰队攻击殖民地附近的"..text1.."集结地？"
	return iText
end


missionmapATTACKfactoryTXT = {}
missionmapATTACKfactoryTXT[001] = function(text1,text2,text3)
	local iText="你战胜了海盗舰队，大幅度的削减了威胁度，除此之外你还获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬，另外舰队将会展开一场打捞行动，对战场进行打扫"
	return iText
end

missionmapATTACKfactoryTXT[002] = function(text1,text2,text3)
	local iText="你摧毁了海盗基地和所有海盗舰队，这个行为大大威慑了所有海盗，短期内不会有新的海盗基地出现，除此之外你还获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬，另外舰队将会展开一场打捞行动，对战场进行打扫"
	return iText
end

missionmapATTACKfactoryTXT[003] = function(text1,text2,text3)
	local iText="你控制了海盗基地并摧毁了所有海盗舰队，这个行为大大威慑了所有海盗，短期内不会有新的海盗基地出现，除此之外你还获得了"..text1.."的资金奖励和"..text2.."的战斗经验还有"..text3.."的荣誉点作为报酬，另外舰队将会展开一场打捞行动，对战场进行打扫"
	return iText
end

missionmapATTACKfactoryTXT[004] = function(text1)
	local iText="殖民地正在遭受"..text1.."的威胁，你可以选择用何种方式进行对抗"
	return iText
end

missionmapATTACKfactoryTXT[005] = function(text1)
	local iText="你是否要前往"..text1.."集结地进行主动攻击？主动攻击"..text1.."集结地会面临较大的风险，但是战胜对手可以获得额外的战利品，同时可以彻底根除"..text1.."隐患"
	return iText
end

missionattackLVTXTLVA01 = {}
missionattackLVTXTLVA01[001] = "水晶体舰队"
missionattackLVTXTLVA01[002] = "虫群舰队"
missionattackLVTXTLVA01[003] = "棺骸舰队"
missionattackLVTXTLVA01[004] = "维格尔舰队"
missionattackLVTXTLVA01[005] = "先祖舰队"


mapattackLVTXTLVA01 = {}
mapattackLVTXTLVA01[001] = "水晶体天灾"
mapattackLVTXTLVA01[002] = "虫群天灾"
mapattackLVTXTLVA01[003] = "棺骸天灾"
mapattackLVTXTLVA01[004] = "神秘的维格尔军阀"
mapattackLVTXTLVA01[005] = "先祖舰队入侵"

mapattackLVTXTLVA02 = {}
mapattackLVTXTLVA02[001] = "目前各大势力处于较为正常状态，但是你可能会在少部分跳跃中继点遭遇对方的侦查舰队"
mapattackLVTXTLVA02[002] = "现在大部分跳跃中继点都有可能遭遇对方的侦察舰队，日常通行的时候请小心应对"
mapattackLVTXTLVA02[003] = "现在你的殖民地也有可能遭遇对方的进攻"
mapattackLVTXTLVA02[004] = "现在各大势力的边缘区域也有可能遭遇对方的进攻"
mapattackLVTXTLVA02[005] = "现在各大势力的核心区域也有可能遭遇对方的进攻"


mapattackbattleLVTXTLVA01 = {}
mapattackbattleLVTXTLVA01[001] = "水晶体天灾"
mapattackbattleLVTXTLVA01[002] = "虫群天灾"
mapattackbattleLVTXTLVA01[003] = "棺骸天灾"
mapattackbattleLVTXTLVA01[004] = "神秘的维格尔军阀"
mapattackbattleLVTXTLVA01[005] = "觉醒的先祖"

mapattackbattleLVTXTLVA02 = {}
mapattackbattleLVTXTLVA02[001] = "小规模"
mapattackbattleLVTXTLVA02[002] = "中等规模"
mapattackbattleLVTXTLVA02[003] = "大规模"
mapattackbattleLVTXTLVA02[004] = "超大规模"
mapattackbattleLVTXTLVA02[005] = "史诗规模"

mapattacksystemLVTXTLVA01 = {}
mapattacksystemLVTXTLVA01[001] = "较小"
mapattacksystemLVTXTLVA01[002] = "一般"
mapattacksystemLVTXTLVA01[003] = "较大"
mapattacksystemLVTXTLVA01[004] = "十分强大"
mapattacksystemLVTXTLVA01[005] = "无比庞大"

mapattacksystemLVTXTLVA02 = {}
mapattacksystemLVTXTLVA02[001] = "纳米物质"
mapattacksystemLVTXTLVA02[002] = "触手"
mapattacksystemLVTXTLVA02[003] = "珍惜矿石"
mapattacksystemLVTXTLVA02[004] = "维格尔奴隶"
mapattacksystemLVTXTLVA02[005] = "先祖遗物"
mapattacksystemLVTXTLVA02[006] = "奢侈品"

mapattackLVTXTLVA03 = {}
mapattackLVTXTLVA03[001] = "卡拉克行星的外围战场"
mapattackLVTXTLVA03[002] = "虫群舰队副本"
mapattackLVTXTLVA03[003] = "镜之边缘副本或者阿因特斯舰队定锚点外围战场"
mapattackLVTXTLVA03[004] = "大决战副本"
mapattackLVTXTLVA03[005] = "先祖遗迹外围战场"

mapattackTXT = {}
mapattackTXT[001] = function(text1,text2,text3,text4)
	local iText=""..text1.."的规模扩大了，现在为"..text2.."点，"..text3..",只有前往"..text4.."才能彻底消解这场天灾"
	return iText
end



mapattackTXT[002] = function(text1,text2,text3)
	local iText="由于"..text1.."舰队正在到处施虐，你遭遇了"..text1.."的"..text2.."舰队，对方已经启动了重力场阻挡了你的长距离跃迁，你需要消灭对方或者使用紧急跃迁撤离该星区"
	return iText
end

mapattackTXT[003] = function(text1,text2,text3)
	local iText="由于规模达到一定的等级，"..text1.."舰队开始对"..text2.."发动了进攻，尽管当地守军舰队已经努力拦截，但是仍有"..text3.."规模的"..text1.."舰队正在该星区周围活动"
	return iText
end

mapattackTXT[004] = function(text1,text2,text3)
	local iText="由于规模达到一定的等级，"..text1.."舰队开始对"..text2.."发动了进攻，由于当地守军实力强大，所以来袭的"..text1.."舰队已经被全部消灭，但是随着天灾规模不断扩张对方很快会重新发起进攻"
	return iText
end


mapattackTXT[005] = function(text1)
	local iText="由于"..text1.."舰队的进攻，该区域的大部分商业设施都已经瘫痪，你需要清除该区域附近出现的敌人舰队才能恢复商业设施的运转"
	return iText
end

mapattackTXT[006] = function(text1,text2)
	local iText="你的舰队已经到达"..text1.."外围，"..text2.."舰队正在这个区域行动，击溃这些舰队将会大大下降"..text1.."的威胁等级。"
	return iText
end

mapattackTXT[007] = function(text1,text2)
	local iText=""..text1.."舰队正在"..text2.."外围进行骚扰，是否要前往"..text2.."外围进行反击作战？消灭这些"..text1.."舰队将会大大的减轻"..text2.."面临的威胁"
	return iText
end

mapattackTXT[008] = function(text1)
	local iText=""..text1.."的舰队已经到达,请做好防御准备"
	return iText
end

mapattackTXT[009] = function(text1)
	local iText="你的舰队已经到达殖民地外围，"..text1.."舰队正在这个区域行动，击溃这些舰队将会大大下降殖民地的威胁等级。"
	return iText
end

mapattackTXT[010] = function(text1,text2)
	local iText="目前"..text1.."正在银河系中施虐，其威胁程度已经达到了"..text2.."点，目前还没有任何星区遭到入侵"
	return iText
end

mapattackTXT[011] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16,text17,text18,text19,text20,text21,text22,text23,text24,text25,text26,text27,text28,text29,text30,text31,text32,text33,text34,text35)
	local iText="目前"..text1.."正在银河系中施虐，其威胁程度已经达到了"..text2.."点，遭受入侵的星区为"..text3..""..text4..""..text5..""..text6..""..text7..""..text8..""..text9..""..text10..""..text11..""..text12..""..text13..""..text14..""..text15..""..text16..""..text17..""..text18..""..text19..""..text20..""..text21..""..text22..""..text23..""..text24..""..text25..""..text26..""..text27..""..text28..""..text29..""..text30..""..text31..""..text32..""..text33..""..text34..""..text35..""
	return iText
end

mapattackTXT[012] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16,text17,text18,text19,text20,text21,text22,text23,text24,text25,text26,text27,text28,text29,text30,text31,text32,text33,text34,text35)
	local iText="目前遭受入侵的星区为"..text3..""..text4..""..text5..""..text6..""..text7..""..text8..""..text9..""..text10..""..text11..""..text12..""..text13..""..text14..""..text15..""..text16..""..text17..""..text18..""..text19..""..text20..""..text21..""..text22..""..text23..""..text24..""..text25..""..text26..""..text27..""..text28..""..text29..""..text30..""..text31..""..text32..""..text33..""..text34..""..text35..""
	return iText
end

mapattackTXT[013] = function(text1,text2)
	local iText="目前还没有任何星区遭到入侵"
	return iText
end

mapattackTXTEND = {}
mapattackTXTEND[001] = function(text1,text2,text3,text4,text5,text6,text7)
	local iText="你已经击败了"..text1.."的舰队，由于你的舰队规模"..text2.."，进攻"..text3.."的"..text1.."舰队损失了"..text4.."点规模，在战斗结束后你打扫战场获得了"..text5.."的资金奖励和"..text6.."的战斗经验还有"..text7.."的荣誉点作为报酬"
	return iText
end

mapattackTXTEND[002] = function(text1,text2,text3)
	local iText="由于你的出色表现"..text1.."的整体规模下降了1点，另外你还获得了"..text2.."单位的"..text3..""
	return iText
end

mapattackTXTEND[003] = function(text1)
	local iText="由于你的出色表现"..text1.."的整体规模下降了1点，由于你货仓空间不够，已经无法获得任何额外的战利品了"
	return iText
end

mapattackTXTEND[004] = function(text1,text2,text4,text5,text6,text7)
	local iText="你已经击败了"..text1.."的舰队，由于你的舰队规模"..text2.."，进攻殖民地的"..text1.."舰队损失了"..text4.."点规模，在战斗结束后你打扫战场获得了"..text5.."的资金奖励和"..text6.."的战斗经验还有"..text7.."的荣誉点作为报酬"
	return iText
end

mapattackTXTEND[005] = function(text2,text3)
	local iText="在打扫战场的时候你还获得了"..text2.."单位的"..text3..""
	return iText
end

mapattackTXTEND[006] = function(text2,text3)
	local iText="在打扫战场的时候你还获得了"..text2.."单位的"..text3.."可惜的是由于你的舰队货仓空间不够，已经无法获得任何额外的战利品了"
	return iText
end


shipUITXT = {}
shipUITXT[000] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10)
	local iText="召唤"..text1.."需要"..text2.."单位的弹药，"..text3.."单位的燃料，"..text4.."单位的"..text5.."，"..text6.."单位的船员作为飞行员，你的舰队目前有"..text7.."单位的弹药，"..text8.."单位的氢燃料，"..text9.."单位的"..text5.."，"..text10.."单位的船员，材料不足"
	return iText
end



shipUITXT[001] = function(text1,text2,text3)
	local iText=""..text1.."数量已经达到上限，该单位最多只能召唤"..text2.."架，而目前已经召唤了"..text3.."架"
	return iText
end

shipUITXT[002] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11)
	local iText="召唤"..text1.."需要"..text2.."单位的弹药，"..text3.."单位的燃料，"..text4.."单位的"..text5.."，"..text6.."单位的船员和1台人型电脑作为飞行员，你的舰队目前有"..text7.."单位的弹药，"..text8.."单位的氢燃料，"..text9.."单位的"..text5.."，"..text10.."单位的船员，"..text11.."单位的人型电脑，材料不足"
	return iText
end

-------------------------------------------------------------------------------------------------

shipUIfighterTXT = {}
shipUIfighterTXT[001] = "封装的轻型战斗机组件"
shipUIfighterTXT[002] = "封装的重型战斗机组件"
shipUIfighterTXT[003] = "封装的炮艇组件"
shipUIfighterTXT[004] = "封装的先进战斗机组件"
shipUIfighterTXT[005] = "封装的重型轰炸机组件"
shipUIfighterTXT[006] = "封装的超级战斗机组件"

shipUIzer_carrier1UITXT = {}
shipUIzer_carrier1UITXT[001] = "飞镖无人机"
shipUIzer_carrier1UITXT[002] = "封装的轻型战斗机组件"
shipUIzer_carrier1UITXT[003] = "AH防卫装甲"
shipUIzer_carrier1UITXT[004] = "封装的炮艇组件"
shipUIzer_carrier1UITXT[005] = "飞镖轰炸机"
shipUIzer_carrier1UITXT[006] = "封装的轻型战斗机组件"


shipUImodu_ND2carrierPoPo1UITXT = {}
shipUImodu_ND2carrierPoPo1UITXT[001] = "超级兵蜂战斗无人机"
shipUImodu_ND2carrierPoPo1UITXT[002] = "狂蜂轰炸无人机"
shipUImodu_ND2carrierPoPo1UITXT[003] = "波铁亚战机级突击兵装"
shipUImodu_ND2carrierPoPo1UITXT[004] = "凰火级战斗轰炸机"
shipUImodu_ND2carrierPoPo1UITXT[005] = "大铁盒前线支援机"

shipUImodu_carrier1UITXT = {}
shipUImodu_carrier1UITXT[001] = "弯刀舰载机"
shipUImodu_carrier1UITXT[002] = "霉菌炮艇"
shipUImodu_carrier1UITXT[003] = "长矛截击机"
shipUImodu_carrier1UITXT[004] = "弯刀轰炸机"
shipUImodu_carrier1UITXT[005] = "霉菌导弹艇"

	shipUImodu_carrierMK21UITXT = {}
shipUImodu_carrierMK21UITXT[001] = "弯刀舰载机"
shipUImodu_carrierMK21UITXT[002] = "霉菌炮艇"
shipUImodu_carrierMK21UITXT[003] = "长矛截击机"
shipUImodu_carrierMK21UITXT[004] = "弯刀轰炸机"
shipUImodu_carrierMK21UITXT[005] = "霉菌导弹艇"

shipUIbus_car031UITXT = {}
shipUIbus_car031UITXT[001] = "烂汤圆级无人机"
shipUIbus_car031UITXT[002] = "汤圆T级精英战斗机"
shipUIbus_car031UITXT[003] = "汤圆T级精英轰炸机"
shipUIbus_car031UITXT[004] = "钛猎杀者"
shipUIbus_car031UITXT[005] = "烂汤圆级无人机"

shipUIxao_carrierheavyhuge1UITXT = {}
shipUIxao_carrierheavyhuge1UITXT[001] = "流星改战斗机"
shipUIxao_carrierheavyhuge1UITXT[002] = "流星改3战斗机"
shipUIxao_carrierheavyhuge1UITXT[003] = "猎星者战斗机"
shipUIxao_carrierheavyhuge1UITXT[004] = "流星战斗机"
shipUIxao_carrierheavyhuge1UITXT[005] = "雷鸟预警机"



shipUIzer_stardestroy_Lorenhild1UITXT = {}
shipUIzer_stardestroy_Lorenhild1UITXT[001] = "幻象XIV无想"
shipUIzer_stardestroy_Lorenhild1UITXT[002] = "防卫解放者"
shipUIzer_stardestroy_Lorenhild1UITXT[003] = "波铁亚战机级突击兵装"
shipUIzer_stardestroy_Lorenhild1UITXT[004] = "凰火级战斗轰炸机"
shipUIzer_stardestroy_Lorenhild1UITXT[005] = "大铁盒前线支援机"

shipUIzer_stardestroy_Wagner1UITXT = {}
shipUIzer_stardestroy_Wagner1UITXT[001] = "防卫解放者"
shipUIzer_stardestroy_Wagner1UITXT[002] = "防卫解放者"
shipUIzer_stardestroy_Wagner1UITXT[003] = "AH防卫装甲"
shipUIzer_stardestroy_Wagner1UITXT[004] = "封装的炮艇组件"
shipUIzer_stardestroy_Wagner1UITXT[005] = "飞镖轰炸机"
shipUIzer_stardestroy_Wagner1UITXT[006] = "封装的轻型战斗机组件"


shipUImodu_carrierhugewitch1UITXT = {}
shipUImodu_carrierhugewitch1UITXT[001] = "三叉戟A战斗无人机"
shipUImodu_carrierhugewitch1UITXT[002] = "对空长矛"
shipUImodu_carrierhugewitch1UITXT[003] = "利刃战斗机"
shipUImodu_carrierhugewitch1UITXT[004] = "凰火级战斗轰炸机"
shipUImodu_carrierhugewitch1UITXT[005] = "大铁盒前线支援机"

shipUIzer_carrierbattlewitch1UITXT = {}
shipUIzer_carrierbattlewitch1UITXT[001] = "对空破刃零式"
shipUIzer_carrierbattlewitch1UITXT[002] = "零式三叉戟C"
shipUIzer_carrierbattlewitch1UITXT[003] = "探查者"
shipUIzer_carrierbattlewitch1UITXT[004] = "弯刀轰炸机"
shipUIzer_carrierbattlewitch1UITXT[005] = "霉菌导弹艇"

shipUIxao_carrierLDN1UITXT = {}
shipUIxao_carrierLDN1UITXT[001] = "烂汤圆级无人机"
shipUIxao_carrierLDN1UITXT[002] = "汤圆T级精英战斗机"
shipUIxao_carrierLDN1UITXT[003] = "汤圆T级精英轰炸机"
shipUIxao_carrierLDN1UITXT[004] = "汤圆X翼"
shipUIxao_carrierLDN1UITXT[005] = "烂汤圆级无人机"


shipUItai_battleshipD3carrier1UITXT = {}
shipUItai_battleshipD3carrier1UITXT[001] = "泰坦战斗机"
shipUItai_battleshipD3carrier1UITXT[002] = "泰坦轰炸机"
shipUItai_battleshipD3carrier1UITXT[003] = "泰坦炮艇"
shipUItai_battleshipD3carrier1UITXT[004] = "汤圆T级精英战斗机"
shipUItai_battleshipD3carrier1UITXT[005] = "汤圆T级精英轰炸机"

shipUIxao_battleshipD3carrier1UITXT = {}
shipUIxao_battleshipD3carrier1UITXT[001] = "重型无人机K1"
shipUIxao_battleshipD3carrier1UITXT[002] = "AN-1K型重型战斗机"
shipUIxao_battleshipD3carrier1UITXT[003] = "泰坦炮艇"
shipUIxao_battleshipD3carrier1UITXT[004] = "封装的炮艇组件"
shipUIxao_battleshipD3carrier1UITXT[005] = "飞镖轰炸机"



shipUIxao_stardesroyershipyard1UITXT = {}
shipUIxao_stardesroyershipyard1UITXT[001] = "曼陀罗"
shipUIxao_stardesroyershipyard1UITXT[002] = "AN-1K型重型战斗机"
shipUIxao_stardesroyershipyard1UITXT[003] = "波铁亚战机级突击兵装"
shipUIxao_stardesroyershipyard1UITXT[004] = "凰火级战斗轰炸机"
shipUIxao_stardesroyershipyard1UITXT[005] = "大铁盒前线支援机"


shipUImodu_resourcecontrollerhuge1UITXT = {}
shipUImodu_resourcecontrollerhuge1UITXT[001] = "铁球无人战斗艇小队"
shipUImodu_resourcecontrollerhuge1UITXT[002] = "铁桶无人机小队"
shipUImodu_resourcecontrollerhuge1UITXT[003] = "蜂鸟突击艇"
shipUImodu_resourcecontrollerhuge1UITXT[004] = "竹节虫大型运输驳船轰炸型"
shipUImodu_resourcecontrollerhuge1UITXT[005] = "犀牛武装运输艇"


shipUIalos_carrier_huge1UITXT = {}
shipUIalos_carrier_huge1UITXT[001] = "XFA27战斗机"
shipUIalos_carrier_huge1UITXT[002] = "SU33战斗机"
shipUIalos_carrier_huge1UITXT[003] = "MIG33战斗机"
shipUIalos_carrier_huge1UITXT[004] = "战斗无人机"
shipUIalos_carrier_huge1UITXT[005] = "大铁盒前线支援机"

shipUIalos_carrier_super1UITXT = {}
shipUIalos_carrier_super1UITXT[001] = "unicornI战斗机"
shipUIalos_carrier_super1UITXT[002] = "unicornII战斗机"
shipUIalos_carrier_super1UITXT[003] = "unicornIII战斗机"
shipUIalos_carrier_super1UITXT[004] = "弯刀轰炸机"
shipUIalos_carrier_super1UITXT[005] = "霉菌导弹艇"

shipUImodu_carriersuper1UITXT = {}
shipUImodu_carriersuper1UITXT[001] = "弯刀舰载机"
shipUImodu_carriersuper1UITXT[002] = "长矛截击机"
shipUImodu_carriersuper1UITXT[003] = "渡鸦轰炸机"
shipUImodu_carriersuper1UITXT[004] = "长矛轰炸机"
shipUImodu_carriersuper1UITXT[005] = "飞龙轰炸机"

shipUImodu_carriersuperBlack1UITXT = {}
shipUImodu_carriersuperBlack1UITXT[001] = "三叉戟无人机"
shipUImodu_carriersuperBlack1UITXT[002] = "破刃截击机零号"
shipUImodu_carriersuperBlack1UITXT[003] = "破刃轰炸机零号"
shipUImodu_carriersuperBlack1UITXT[004] = "飞龙轰炸机"
shipUImodu_carriersuperBlack1UITXT[005] = "飞镖无人机"


shipUIvgr_battleshiplightcarrier1UITXT = {}
shipUIvgr_battleshiplightcarrier1UITXT[001] = "长枪战斗机MK2"
shipUIvgr_battleshiplightcarrier1UITXT[002] = "长枪战斗机MK2镭射型"
shipUIvgr_battleshiplightcarrier1UITXT[003] = "秃鹰轰炸机"
shipUIvgr_battleshiplightcarrier1UITXT[004] = "入侵者机甲小队"
shipUIvgr_battleshiplightcarrier1UITXT[005] = "入侵者反舰型"

shipUIzmodu_battershipheavggun1UITXT = {}
shipUIzmodu_battershipheavggun1UITXT[001] = "弯刀舰载机"
shipUIzmodu_battershipheavggun1UITXT[002] = "霉菌重炮艇"
shipUIzmodu_battershipheavggun1UITXT[003] = "长矛截击机"
shipUIzmodu_battershipheavggun1UITXT[004] = "秃鹰轰炸机"
shipUIzmodu_battershipheavggun1UITXT[005] = "破刃截击机"


shipUIhgn_busnewship301UITXT = {}
shipUIhgn_busnewship301UITXT[001] = "弯刀战斗机"
shipUIhgn_busnewship301UITXT[002] = "霉菌重炮艇"
shipUIhgn_busnewship301UITXT[003] = "长矛截击机"
shipUIhgn_busnewship301UITXT[004] = "弯刀轰炸机"
shipUIhgn_busnewship301UITXT[005] = "霉菌导弹艇"

shipUIhgn_busnewship311UITXT = {}
shipUIhgn_busnewship311UITXT[001] = "弯刀战斗机"
shipUIhgn_busnewship311UITXT[002] = "霉菌重炮艇"
shipUIhgn_busnewship311UITXT[003] = "长矛截击机"
shipUIhgn_busnewship311UITXT[004] = "弯刀轰炸机"
shipUIhgn_busnewship311UITXT[005] = "霉菌导弹艇"

shipUIhgn_busnewship321UITXT = {}
shipUIhgn_busnewship321UITXT[001] = "弯刀战斗机"
shipUIhgn_busnewship321UITXT[002] = "霉菌重炮艇"
shipUIhgn_busnewship321UITXT[003] = "长矛截击机"
shipUIhgn_busnewship321UITXT[004] = "弯刀轰炸机"
shipUIhgn_busnewship321UITXT[005] = "重型无人机"

shipUIvgr_carrierbattleship1UITXT = {}
shipUIvgr_carrierbattleship1UITXT[001] = "长枪战斗机MK2"
shipUIvgr_carrierbattleship1UITXT[002] = "长枪战斗机MK2镭射"
shipUIvgr_carrierbattleship1UITXT[003] = "秃鹰轰炸机"
shipUIvgr_carrierbattleship1UITXT[004] = "入侵者机甲小队"
shipUIvgr_carrierbattleship1UITXT[005] = "入侵者反舰型"
shipUIvgr_carrierbattleship1UITXT[006] = "封装的轻型战斗机组件"

shipUImodu_carrierheavy1UITXT = {}
shipUImodu_carrierheavy1UITXT[001] = "弯刀战斗机"
shipUImodu_carrierheavy1UITXT[002] = "霉菌重炮艇"
shipUImodu_carrierheavy1UITXT[003] = "长矛截击机"
shipUImodu_carrierheavy1UITXT[004] = "弯刀轰炸机"
shipUImodu_carrierheavy1UITXT[005] = "霉菌导弹艇"


shipUIPil_carriersuper1UITXT = {}
shipUIPil_carriersuper1UITXT[001] = "摆渡人"
shipUIPil_carriersuper1UITXT[002] = "送葬者"
shipUIPil_carriersuper1UITXT[003] = "殉道者"
shipUIPil_carriersuper1UITXT[004] = "终焉之棘"
shipUIPil_carriersuper1UITXT[005] = "摆渡人"

shipUIhgn_carrierheavyKZ1UITXT = {}
shipUIhgn_carrierheavyKZ1UITXT[001] = "撕裂者无人机"
shipUIhgn_carrierheavyKZ1UITXT[002] = "恐爪"
shipUIhgn_carrierheavyKZ1UITXT[003] = "黑翼炮艇"

shipUImodu_battleship14G1UITXT = {}
shipUImodu_battleship14G1UITXT[001] = "摆渡人"
shipUImodu_battleship14G1UITXT[002] = "送葬者"
shipUImodu_battleship14G1UITXT[003] = "殉道者"
shipUImodu_battleship14G1UITXT[004] = "封装的炮艇组件"
shipUImodu_battleship14G1UITXT[005] = "飞镖轰炸机"
shipUImodu_battleship14G1UITXT[006] = "封装的轻型战斗机组件"


shipUIxao_carrierheavyathenaED1UITXT = {}
shipUIxao_carrierheavyathenaED1UITXT[001] = "雷鸟超重型轰炸机"
shipUIxao_carrierheavyathenaED1UITXT[002] = "美杜莎"
shipUIxao_carrierheavyathenaED1UITXT[003] = "流星战斗机改三"
shipUIxao_carrierheavyathenaED1UITXT[004] = "流星战斗机"
shipUIxao_carrierheavyathenaED1UITXT[005] = "大铁盒前线支援机"

shipUIhgn_busnewship371UITXT = {}
shipUIhgn_busnewship371UITXT[001] = "猎星者"
shipUIhgn_busnewship371UITXT[002] = "含光"
shipUIhgn_busnewship371UITXT[003] = "流星战斗机改二"
shipUIhgn_busnewship371UITXT[004] = "流星战斗机"
shipUIhgn_busnewship371UITXT[005] = "霉菌导弹艇"

shipUIhgn_busnewship381UITXT = {}
shipUIhgn_busnewship381UITXT[001] = "正义之枪"
shipUIhgn_busnewship381UITXT[002] = "食人鲳"
shipUIhgn_busnewship381UITXT[003] = "流星战斗机改3"
shipUIhgn_busnewship381UITXT[004] = "流星战斗机"
shipUIhgn_busnewship381UITXT[005] = "霉菌导弹艇"

shipUIxao_carrierheavyathena1UITXT = {}
shipUIxao_carrierheavyathena1UITXT[001] = "流星战斗机改2"
shipUIxao_carrierheavyathena1UITXT[002] = "流星战斗机改3"
shipUIxao_carrierheavyathena1UITXT[003] = "猎星者"
shipUIxao_carrierheavyathena1UITXT[004] = "流星战斗机"
shipUIxao_carrierheavyathena1UITXT[005] = "雷鸟预警机"

shipUIxao_carrierheavyathena2UITXT = {}
shipUIxao_carrierheavyathena2UITXT[001] = "流星战斗机改2"
shipUIxao_carrierheavyathena2UITXT[002] = "流星战斗机改3"
shipUIxao_carrierheavyathena2UITXT[003] = "猎星者"
shipUIxao_carrierheavyathena2UITXT[004] = "流星战斗机"
shipUIxao_carrierheavyathena2UITXT[005] = "雷鸟预警机"

shipUIxao_carrierheavyathena3UITXT = {}
shipUIxao_carrierheavyathena3UITXT[001] = "流星战斗机改2"
shipUIxao_carrierheavyathena3UITXT[002] = "流星战斗机改3"
shipUIxao_carrierheavyathena3UITXT[003] = "猎星者"
shipUIxao_carrierheavyathena3UITXT[004] = "流星战斗机"
shipUIxao_carrierheavyathena3UITXT[005] = "雷鸟预警机"

shipUIxao_carrierheavyathena4UITXT = {}
shipUIxao_carrierheavyathena4UITXT[001] = "流星战斗机改2"
shipUIxao_carrierheavyathena4UITXT[002] = "流星战斗机改3"
shipUIxao_carrierheavyathena4UITXT[003] = "猎星者"
shipUIxao_carrierheavyathena4UITXT[004] = "流星战斗机"
shipUIxao_carrierheavyathena4UITXT[005] = "雷鸟预警机"

shipUIvgr_carrierhuge1UITXT = {}
shipUIvgr_carrierhuge1UITXT[001] = "长枪战斗机MK2"
shipUIvgr_carrierhuge1UITXT[002] = "魔毯轰炸机"
shipUIvgr_carrierhuge1UITXT[003] = "秃鹰轰炸机"
shipUIvgr_carrierhuge1UITXT[004] = "入侵者机甲"
shipUIvgr_carrierhuge1UITXT[005] = "大铁盒前线支援机"

shipUIvgr_carrierhuge2UITXT = {}
shipUIvgr_carrierhuge2UITXT[001] = "长枪战斗机MK2"
shipUIvgr_carrierhuge2UITXT[002] = "魔毯轰炸机"
shipUIvgr_carrierhuge2UITXT[003] = "秃鹰轰炸机"
shipUIvgr_carrierhuge2UITXT[004] = "入侵者机甲"
shipUIvgr_carrierhuge2UITXT[005] = "大铁盒前线支援机"

shipUIvgr_carrierhuge3UITXT = {}
shipUIvgr_carrierhuge3UITXT[001] = "长枪战斗机MK2"
shipUIvgr_carrierhuge3UITXT[002] = "魔毯轰炸机"
shipUIvgr_carrierhuge3UITXT[003] = "秃鹰轰炸机"
shipUIvgr_carrierhuge3UITXT[004] = "入侵者机甲"
shipUIvgr_carrierhuge3UITXT[005] = "大铁盒前线支援机"

shipUIvgr_carrierhuge4UITXT = {}
shipUIvgr_carrierhuge4UITXT[001] = "长枪战斗机MK2"
shipUIvgr_carrierhuge4UITXT[002] = "魔毯轰炸机"
shipUIvgr_carrierhuge4UITXT[003] = "秃鹰轰炸机"
shipUIvgr_carrierhuge4UITXT[004] = "入侵者机甲"
shipUIvgr_carrierhuge4UITXT[005] = "大铁盒前线支援机"

shipUIxao_carrierheavyathenaBD1UITXT = {}
shipUIxao_carrierheavyathenaBD1UITXT[001] = "卡尔瓦罗亚"
shipUIxao_carrierheavyathenaBD1UITXT[002] = "索尔加尔瓦"
shipUIxao_carrierheavyathenaBD1UITXT[003] = "卡尔瓦罗亚"
shipUIxao_carrierheavyathenaBD1UITXT[004] = "封装的炮艇组件"
shipUIxao_carrierheavyathenaBD1UITXT[005] = "飞镖轰炸机"
shipUIxao_carrierheavyathenaBD1UITXT[006] = "封装的轻型战斗机组件"

shipUIxao_carrierheavyathenaBD2UITXT = {}
shipUIxao_carrierheavyathenaBD2UITXT[001] = "卡尔瓦罗亚"
shipUIxao_carrierheavyathenaBD2UITXT[002] = "索尔加尔瓦"
shipUIxao_carrierheavyathenaBD2UITXT[003] = "卡尔瓦罗亚"
shipUIxao_carrierheavyathenaBD2UITXT[004] = "封装的炮艇组件"
shipUIxao_carrierheavyathenaBD2UITXT[005] = "飞镖轰炸机"
shipUIxao_carrierheavyathenaBD2UITXT[006] = "封装的轻型战斗机组件"

shipUIxao_carrierheavyathenaBD3UITXT = {}
shipUIxao_carrierheavyathenaBD3UITXT[001] = "卡尔瓦罗亚"
shipUIxao_carrierheavyathenaBD3UITXT[002] = "索尔加尔瓦"
shipUIxao_carrierheavyathenaBD3UITXT[003] = "卡尔瓦罗亚"
shipUIxao_carrierheavyathenaBD3UITXT[004] = "封装的炮艇组件"
shipUIxao_carrierheavyathenaBD3UITXT[005] = "飞镖轰炸机"
shipUIxao_carrierheavyathenaBD3UITXT[006] = "封装的轻型战斗机组件"

shipUIxao_carrierheavyathenaBD4UITXT = {}
shipUIxao_carrierheavyathenaBD4UITXT[001] = "卡尔瓦罗亚"
shipUIxao_carrierheavyathenaBD4UITXT[002] = "索尔加尔瓦"
shipUIxao_carrierheavyathenaBD4UITXT[003] = "卡尔瓦罗亚"
shipUIxao_carrierheavyathenaBD4UITXT[004] = "封装的炮艇组件"
shipUIxao_carrierheavyathenaBD4UITXT[005] = "飞镖轰炸机"
shipUIxao_carrierheavyathenaBD4UITXT[006] = "封装的轻型战斗机组件"


shipUIvgr_superbattleshipP1UITXT = {}
shipUIvgr_superbattleshipP1UITXT[001] = "入侵者队长"
shipUIvgr_superbattleshipP1UITXT[002] = "入侵者通用型"
shipUIvgr_superbattleshipP1UITXT[003] = "入侵者反舰型"
shipUIvgr_superbattleshipP1UITXT[004] = "入侵者脉冲型"
shipUIvgr_superbattleshipP1UITXT[005] = "大铁盒前线支援机"

shipUIvgr_stardestroy1UITXT = {}
shipUIvgr_stardestroy1UITXT[001] = "旧日支配者"
shipUIvgr_stardestroy1UITXT[002] = "破刃截击机"
shipUIvgr_stardestroy1UITXT[003] = "破刃截击机轰炸型"
shipUIvgr_stardestroy1UITXT[004] = "破刃之剑"
shipUIvgr_stardestroy1UITXT[005] = "霉菌导弹艇"

shipUImodu_supershipMK71UITXT = {}
shipUImodu_supershipMK71UITXT[001] = "龙枪战斗机"
shipUImodu_supershipMK71UITXT[002] = "星辰战斗机"
shipUImodu_supershipMK71UITXT[003] = "圣裁战斗机"
shipUImodu_supershipMK71UITXT[004] = "弯刀轰炸机"
shipUImodu_supershipMK71UITXT[005] = "霉菌导弹艇"

shipUIhgn_busnewship211UITXT = {}
shipUIhgn_busnewship211UITXT[001] = "摆渡人"
shipUIhgn_busnewship211UITXT[002] = "送葬者"
shipUIhgn_busnewship211UITXT[003] = "殉道者"
shipUIhgn_busnewship211UITXT[004] = "破刃截击机零号"
shipUIhgn_busnewship211UITXT[005] = "破刃截击机零号轰炸型"
shipUIhgn_busnewship211UITXT[006] = "封装的轻型战斗机组件"


shipUIhgn_busnewship391UITXT = {}
shipUIhgn_busnewship391UITXT[001] = "三叉戟D反舰型"
shipUIhgn_busnewship391UITXT[002] = "三叉戟D反舰型"
shipUIhgn_busnewship391UITXT[003] = "守护者"
shipUIhgn_busnewship391UITXT[004] = "凰火级战斗轰炸机"
shipUIhgn_busnewship391UITXT[005] = "大铁盒前线支援机"


shipUIxao_supercarrier1UITXT = {}
shipUIxao_supercarrier1UITXT[001] = "雷鸟超重型轰炸机"
shipUIxao_supercarrier1UITXT[002] = "蔷薇食人鲳"
shipUIxao_supercarrier1UITXT[003] = "含光改"
shipUIxao_supercarrier1UITXT[004] = "封装的炮艇组件"
shipUIxao_supercarrier1UITXT[005] = "飞镖轰炸机"
shipUIxao_supercarrier1UITXT[006] = "封装的轻型战斗机组件"


shipUImodu_battlecruiseradventure1UITXT = {}
shipUImodu_battlecruiseradventure1UITXT[001] = "弯刀战斗机"
shipUImodu_battlecruiseradventure1UITXT[002] = "重型无人机"
shipUImodu_battlecruiseradventure1UITXT[003] = "玄鸟级侦察机"
shipUImodu_battlecruiseradventure1UITXT[004] = "凰火级战斗轰炸机"
shipUImodu_battlecruiseradventure1UITXT[005] = "大铁盒前线支援机"

shipUIvgr_supercarrier1UITXT = {}
shipUIvgr_supercarrier1UITXT[001] = "破刃截击机"
shipUIvgr_supercarrier1UITXT[002] = "幻象IX远山"
shipUIvgr_supercarrier1UITXT[003] = "幻象XI圣裁战斗机"
shipUIvgr_supercarrier1UITXT[004] = "新月解放者"
shipUIvgr_supercarrier1UITXT[005] = "光晕"

shipUImodu_battlecruiseradventure1UITXT = {}
shipUImodu_battlecruiseradventure1UITXT[001] = "弯刀舰载机"
shipUImodu_battlecruiseradventure1UITXT[002] = "霉菌炮艇"
shipUImodu_battlecruiseradventure1UITXT[003] = "长矛截击机"
shipUImodu_battlecruiseradventure1UITXT[004] = "弯刀轰炸机"
shipUImodu_battlecruiseradventure1UITXT[005] = "霉菌导弹艇"



shipUIxao_dreadnaughtmissle1UITXT = {}
shipUIxao_dreadnaughtmissle1UITXT[001] = "曼陀罗"
shipUIxao_dreadnaughtmissle1UITXT[002] = "石斛兰防空"
shipUIxao_dreadnaughtmissle1UITXT[003] = "波铁亚战机级突击兵装"
shipUIxao_dreadnaughtmissle1UITXT[004] = "凰火级战斗轰炸机"
shipUIxao_dreadnaughtmissle1UITXT[005] = "大铁盒前线支援机"

shipUIhgn_busnewship781UITXT = {}
shipUIhgn_busnewship781UITXT[001] = "烂汤圆级无人机"
shipUIhgn_busnewship781UITXT[002] = "重型无人机"
shipUIhgn_busnewship781UITXT[003] = "玄鸟级侦察机"
shipUIhgn_busnewship781UITXT[004] = "凰火级战斗轰炸机"
shipUIhgn_busnewship781UITXT[005] = "大铁盒前线支援机"


shipUIhgn_busnewship571UITXT = {}
shipUIhgn_busnewship571UITXT[001] = "玄鸟级侦察机"
shipUIhgn_busnewship571UITXT[002] = "天斩炮艇"
shipUIhgn_busnewship571UITXT[003] = "波铁亚战机级突击兵装"
shipUIhgn_busnewship571UITXT[004] = "凰火级战斗轰炸机"
shipUIhgn_busnewship571UITXT[005] = "大铁盒前线支援机"

shipUIhgn_busnewship671UITXT = {}
shipUIhgn_busnewship671UITXT[001] = "弯刀战斗机"
shipUIhgn_busnewship671UITXT[002] = "长矛截击机"
shipUIhgn_busnewship671UITXT[003] = "渡鸦轰炸机"
shipUIhgn_busnewship671UITXT[004] = "长矛截击机轰炸"
shipUIhgn_busnewship671UITXT[005] = "飞龙轰炸机"

shipUIhgn_busnewship661UITXT = {}
shipUIhgn_busnewship661UITXT[001] = "弯刀战斗机"
shipUIhgn_busnewship661UITXT[002] = "霉菌重炮艇"
shipUIhgn_busnewship661UITXT[003] = "长矛截击机"
shipUIhgn_busnewship661UITXT[004] = "弯刀轰炸机"
shipUIhgn_busnewship661UITXT[005] = "渡鸦轰炸机"


shipUIhgn_busnewship481UITXT = {}
shipUIhgn_busnewship481UITXT[001] = "弯刀战斗机"
shipUIhgn_busnewship481UITXT[002] = "霉菌重炮艇"
shipUIhgn_busnewship481UITXT[003] = "长矛截击机"
shipUIhgn_busnewship481UITXT[004] = "弯刀轰炸机"
shipUIhgn_busnewship481UITXT[005] = "渡鸦轰炸机"


shipUImodu_supershipcarrierC1UITXT = {}
shipUImodu_supershipcarrierC1UITXT[001] = "解放者"
shipUImodu_supershipcarrierC1UITXT[002] = "三叉戟D反舰"
shipUImodu_supershipcarrierC1UITXT[003] = "三叉戟D反舰"
shipUImodu_supershipcarrierC1UITXT[004] = "三叉戟D反舰"
shipUImodu_supershipcarrierC1UITXT[005] = "三叉戟D反舰"

shipUImodu_supershipcarrier1UITXT = {}
shipUImodu_supershipcarrier1UITXT[001] = "守护者"
shipUImodu_supershipcarrier1UITXT[002] = "破刃截击机零号型"
shipUImodu_supershipcarrier1UITXT[003] = "破刃截击机零号轰炸型"
shipUImodu_supershipcarrier1UITXT[004] = "三叉戟D反舰型"
shipUImodu_supershipcarrier1UITXT[005] = "幻象"

shipUIxao_carrierheavyathenaQ1UITXT = {}
shipUIxao_carrierheavyathenaQ1UITXT[001] = "AN-1K型重型战斗机"
shipUIxao_carrierheavyathenaQ1UITXT[002] = "K型无人战斗机"
shipUIxao_carrierheavyathenaQ1UITXT[003] = "流星战斗机改二"
shipUIxao_carrierheavyathenaQ1UITXT[004] = "流星战斗机"
shipUIxao_carrierheavyathenaQ1UITXT[005] = "犀牛武装运输艇"

shipUIhgn_busnewship861UITXT = {}
shipUIhgn_busnewship861UITXT[001] = "朱雀级战斗轰炸无人机"
shipUIhgn_busnewship861UITXT[002] = "朱雀级战斗轰炸无人机"
shipUIhgn_busnewship861UITXT[003] = "朱雀级战斗轰炸无人机"
shipUIhgn_busnewship861UITXT[004] = "朱雀级战斗轰炸无人机"
shipUIhgn_busnewship861UITXT[005] = "朱雀级战斗轰炸无人机"

shipUIhgn_busnewship791UIAATXT = {}
shipUIhgn_busnewship791UIAATXT[001] = "帝征型节点战机-岚牙"
shipUIhgn_busnewship791UIAATXT[002] = "卫蛇型无人机-天倾"
shipUIhgn_busnewship791UIAATXT[003] = "卫蛇型无人机-天倾"
shipUIhgn_busnewship791UIAATXT[004] = "卫蛇型无人机-天倾"
shipUIhgn_busnewship791UIAATXT[005] = "帝征型节点战机-辉界"

shipUIhgn_busnewship791UIBOTXT = {}
shipUIhgn_busnewship791UIBOTXT[001] = "帝征型节点战机-龙槊"
shipUIhgn_busnewship791UIBOTXT[002] = "卫蛇型无人机-曜星"
shipUIhgn_busnewship791UIBOTXT[003] = "卫蛇型无人机-曜星"
shipUIhgn_busnewship791UIBOTXT[004] = "卫蛇型无人机-曜星"
shipUIhgn_busnewship791UIBOTXT[005] = "帝征型节点战机-辉界"

shipUIhgn_busnewship801UITXT = {}
shipUIhgn_busnewship801UITXT[001] = "帝征型节点战机-岚牙"
shipUIhgn_busnewship801UITXT[002] = "帝征型节点战机-龙槊"
shipUIhgn_busnewship801UITXT[003] = "卫蛇型无人机-天倾"
shipUIhgn_busnewship801UITXT[004] = "卫蛇型无人机-曜星"
shipUIhgn_busnewship801UITXT[005] = "帝征型节点战机-辉界"

mapattacksystemMAP = {}
mapattacksystemMAP[001] = "菲雅利之门"
mapattacksystemMAP[002] = "帝国殖民区"
mapattacksystemMAP[003] = "帝国采矿点"
mapattacksystemMAP[004] = "帝国太空农场群"
mapattacksystemMAP[005] = "帝国前线舰队集结地"
mapattacksystemMAP[006] = "菲雅利帝国船坞群"
mapattacksystemMAP[007] = "坦尼斯"
mapattacksystemMAP[008] = "塞勒姆"
mapattacksystemMAP[009] = "希格拉首星"
mapattacksystemMAP[010] = "天使之月"
mapattacksystemMAP[011] = "第142号前哨基地"
mapattacksystemMAP[012] = "尼福尔海姆"
mapattacksystemMAP[013] = "赫尔海利姆"
mapattacksystemMAP[014] = "蚁巢舰队活动区"
mapattacksystemMAP[015] = "阿因特斯舰队定锚点"
mapattacksystemMAP[016] = "星门都市格利普斯"
mapattacksystemMAP[017] = "维格尔东线军阀活动区"
mapattacksystemMAP[018] = "维格尔东线军阀控制区"
mapattacksystemMAP[019] = "卡厄斯联盟—前线哨站"
mapattacksystemMAP[020] = "卡厄斯联盟—利贝尔共和国"
mapattacksystemMAP[021] = "卡厄斯联盟—联合泊地"
mapattacksystemMAP[022] = "追忆之庭重工总部船坞"
mapattacksystemMAP[023] = "卡厄斯联盟混沌商人"
mapattacksystemMAP[024] = "第58特混舰队集结地"
mapattacksystemMAP[025] = "卡厄斯永生者探索之初"
mapattacksystemMAP[026] = "先祖遗迹"
mapattacksystemMAP[027] = "卡拉克行星"
mapattacksystemMAP[028] = "卡厄斯联盟—食用油动力船坞"
mapattacksystemMAP[029] = "阿瓦塔协会探索舰队驻地"
mapattacksystemMAP[030] = "瓦纳海姆"
mapattacksystemMAP[031] = "诺亚库申联合工业园"
mapattacksystemMAP[032] = "开发代号·阿斯玲"
mapattacksystemMAP[033] = "苍星战团巡航坐标"
mapattacksystemMAP[034] = "暗区"
mapattacksystemMAP[035] = "CPSR游魂舰队驻地"

mapgoodsystemMAPname = {}
mapgoodsystemMAPname[000] = ""
mapgoodsystemMAPname[001] = "菲雅利之门"
mapgoodsystemMAPname[002] = "帝国殖民区"
mapgoodsystemMAPname[003] = "帝国采矿点"
mapgoodsystemMAPname[004] = "坦尼斯"
mapgoodsystemMAPname[005] = "塞勒姆"
mapgoodsystemMAPname[006] = "希格拉首星"
mapgoodsystemMAPname[007] = "天使之月"
mapgoodsystemMAPname[008] = "第142号前哨基地"
mapgoodsystemMAPname[009] = "亚加斯前哨站"
mapgoodsystemMAPname[010] = "索德拉根暗礁宙域"
mapgoodsystemMAPname[011] = "阿莱诺亚空间船坞群周边"
mapgoodsystemMAPname[012] = "殖民行星玛加萨"
mapgoodsystemMAPname[013] = "巴塔利安战舰坟场"
mapgoodsystemMAPname[014] = "尼福尔海姆"
mapgoodsystemMAPname[015] = "赫尔海利姆"
mapgoodsystemMAPname[016] = "先祖遗迹"
mapgoodsystemMAPname[017] = "独立星区"
mapgoodsystemMAPname[018] = "帝国太空农场群"
mapgoodsystemMAPname[019] = "帝国前线舰队集结地"
mapgoodsystemMAPname[020] = "维格尔海盗狩猎场"
mapgoodsystemMAPname[021] = "亚基纳茨虫族巢群"
mapgoodsystemMAPname[022] = "图拉尼海盗活动区"
mapgoodsystemMAPname[023] = "卡德什大教堂"
mapgoodsystemMAPname[024] = "卡拉克行星"
mapgoodsystemMAPname[025] = "泰瓦伦共和国边境"
mapgoodsystemMAPname[026] = "菲雅利帝国船坞群"
mapgoodsystemMAPname[027] = "朝圣者活动区"
mapgoodsystemMAPname[028] = "维格尔东线军阀活动区"
mapgoodsystemMAPname[029] = "维格尔东线军阀控制区"
mapgoodsystemMAPname[030] = "EDF控制区"
mapgoodsystemMAPname[031] = "蚁巢舰队活动区"
mapgoodsystemMAPname[032] = "莫尔迪基安大君边境"
mapgoodsystemMAPname[033] = "卡厄斯联盟—前线哨站"
mapgoodsystemMAPname[034] = "卡厄斯联盟—利贝尔共和国"
mapgoodsystemMAPname[035] = "卡厄斯联盟—联合泊地"
mapgoodsystemMAPname[036] = "追忆之庭重工总部船坞"
mapgoodsystemMAPname[037] = "卡厄斯联盟混沌商人"
mapgoodsystemMAPname[038] = "第58特混舰队集结地"
mapgoodsystemMAPname[039] = "卡厄斯永生者探索之初"
mapgoodsystemMAPname[040] = "阿因特斯舰队定锚点"
mapgoodsystemMAPname[041] = "星门都市格利普斯"
mapgoodsystemMAPname[042] = "卡厄斯联盟—食用油动力船坞"	
mapgoodsystemMAPname[043] = "卡厄斯联盟—食用油动力船坞"
mapgoodsystemMAPname[044] = "阿瓦塔协会探索舰队驻地"
mapgoodsystemMAPname[045] = "瓦纳海姆"
mapgoodsystemMAPname[046] = "诺亚库申联合工业园"
mapgoodsystemMAPname[047] = "开发代号·阿斯玲"
mapgoodsystemMAPname[048] = "苍星战团巡航坐标"
mapgoodsystemMAPname[049] = "暗区"
mapgoodsystemMAPname[050] = "CPSR游魂舰队驻地"

mapgoodsystemMAPnameTXT = {}
mapgoodsystemMAPnameTXT[000] = ","
mapgoodsystemMAPnameTXT[001] = ",菲雅利之门"
mapgoodsystemMAPnameTXT[002] = ",帝国殖民区"
mapgoodsystemMAPnameTXT[003] = ",帝国采矿点"
mapgoodsystemMAPnameTXT[004] = ",坦尼斯"
mapgoodsystemMAPnameTXT[005] = ",塞勒姆"
mapgoodsystemMAPnameTXT[006] = ",希格拉首星"
mapgoodsystemMAPnameTXT[007] = ",天使之月"
mapgoodsystemMAPnameTXT[008] = ",第142号前哨基地"
mapgoodsystemMAPnameTXT[009] = ",亚加斯前哨站"
mapgoodsystemMAPnameTXT[010] = ",索德拉根暗礁宙域"
mapgoodsystemMAPnameTXT[011] = ",阿莱诺亚空间船坞群周边"
mapgoodsystemMAPnameTXT[012] = ",殖民行星玛加萨"
mapgoodsystemMAPnameTXT[013] = ",巴塔利安战舰坟场"
mapgoodsystemMAPnameTXT[014] = ",尼福尔海姆"
mapgoodsystemMAPnameTXT[015] = ",赫尔海利姆"
mapgoodsystemMAPnameTXT[016] = ",先祖遗迹"
mapgoodsystemMAPnameTXT[017] = ",独立星区"
mapgoodsystemMAPnameTXT[018] = ",帝国太空农场群"
mapgoodsystemMAPnameTXT[019] = ",帝国前线舰队集结地"
mapgoodsystemMAPnameTXT[020] = ",维格尔海盗狩猎场"
mapgoodsystemMAPnameTXT[021] = ",亚基纳茨虫族巢群"
mapgoodsystemMAPnameTXT[022] = ",图拉尼海盗活动区"
mapgoodsystemMAPnameTXT[023] = ",卡德什大教堂"
mapgoodsystemMAPnameTXT[024] = ",卡拉克行星"
mapgoodsystemMAPnameTXT[025] = ",泰瓦伦共和国边境"
mapgoodsystemMAPnameTXT[026] = ",菲雅利帝国船坞群"
mapgoodsystemMAPnameTXT[027] = ",朝圣者活动区"
mapgoodsystemMAPnameTXT[028] = ",东线军阀活动区"
mapgoodsystemMAPnameTXT[029] = ",东线军阀控制区"
mapgoodsystemMAPnameTXT[030] = ",EDF控制区"
mapgoodsystemMAPnameTXT[031] = ",蚁巢舰队活动区"
mapgoodsystemMAPnameTXT[032] = ",莫尔迪基安边境"
mapgoodsystemMAPnameTXT[033] = ",卡厄斯前线哨站"
mapgoodsystemMAPnameTXT[034] = ",卡厄斯利贝尔共和国"
mapgoodsystemMAPnameTXT[035] = ",卡厄斯联合泊地"
mapgoodsystemMAPnameTXT[036] = ",追忆之庭坞"
mapgoodsystemMAPnameTXT[037] = ",联盟混沌商人"
mapgoodsystemMAPnameTXT[038] = ",第58特混舰队"
mapgoodsystemMAPnameTXT[039] = ",永生者探索之初"
mapgoodsystemMAPnameTXT[040] = ",阿因特斯锚点"
mapgoodsystemMAPnameTXT[041] = ",星门都市格利普斯"
mapgoodsystemMAPnameTXT[042] = ",卡厄斯联盟—食用油动力船坞"	
mapgoodsystemMAPnameTXT[043] = ",卡厄斯联盟—食用油动力船坞"
mapgoodsystemMAPnameTXT[044] = ",阿瓦塔协会探索舰队驻地"
mapgoodsystemMAPnameTXT[045] = ",瓦纳海姆"
mapgoodsystemMAPnameTXT[046] = ",诺亚库申联合工业园"
mapgoodsystemMAPnameTXT[047] = ",开发代号·阿斯玲"
mapgoodsystemMAPnameTXT[048] = ",苍星战团巡航坐标"
mapgoodsystemMAPnameTXT[049] = ",暗区"
mapgoodsystemMAPnameTXT[050] = ",CPSR游魂舰队驻地"

mapgoodsystemGOODname = {}
mapgoodsystemGOODname[001] = "帝国咖啡"
mapgoodsystemGOODname[002] = "帝国女仆"
mapgoodsystemGOODname[003] = "冰矿"
mapgoodsystemGOODname[004] = "大型船体组件"
mapgoodsystemGOODname[005] = "小型船体构件"
mapgoodsystemGOODname[006] = "鲜活海鲜"
mapgoodsystemGOODname[007] = "神圣之息"
mapgoodsystemGOODname[008] = "金属矿石"
mapgoodsystemGOODname[009] = "神圣之息"
mapgoodsystemGOODname[010] = "神圣之息"
mapgoodsystemGOODname[011] = "神圣之息"
mapgoodsystemGOODname[012] = "奢侈品"
mapgoodsystemGOODname[013] = "机械零件"
mapgoodsystemGOODname[014] = "自动维修机器人"
mapgoodsystemGOODname[015] = "章鱼丸子"
mapgoodsystemGOODname[016] = "先祖遗物"
mapgoodsystemGOODname[017] = "神圣之息"
mapgoodsystemGOODname[018] = "三明治"
mapgoodsystemGOODname[019] = "基础修理工具"
mapgoodsystemGOODname[020] = "中型武器配件"
mapgoodsystemGOODname[021] = "神圣之息"
mapgoodsystemGOODname[022] = "神圣之息"
mapgoodsystemGOODname[023] = "神圣之息"
mapgoodsystemGOODname[024] = "珍惜矿石"
mapgoodsystemGOODname[025] = "奢侈品"
mapgoodsystemGOODname[026] = "特种合金"
mapgoodsystemGOODname[027] = "黑暗圣经"
mapgoodsystemGOODname[028] = "奢华家具"
mapgoodsystemGOODname[029] = "大型引擎"
mapgoodsystemGOODname[030] = "游击战三大件"
mapgoodsystemGOODname[031] = "蚁壳素"
mapgoodsystemGOODname[032] = "大君语录"
mapgoodsystemGOODname[033] = "生物电脑"
mapgoodsystemGOODname[034] = "神圣之息"
mapgoodsystemGOODname[035] = "电子元件"
mapgoodsystemGOODname[036] = "高级修理工具"
mapgoodsystemGOODname[037] = "龙须面"
mapgoodsystemGOODname[038] = "神圣之息"
mapgoodsystemGOODname[039] = "神圣之息"
mapgoodsystemGOODname[040] = "神圣之息"
mapgoodsystemGOODname[041] = "管理员"
mapgoodsystemGOODname[042] = "食用油"
mapgoodsystemGOODname[043] = "神圣之息"
mapgoodsystemGOODname[044] = "合成神经簇"
mapgoodsystemGOODname[045] = "歌姬手办"
mapgoodsystemGOODname[046] = "神圣之息"
mapgoodsystemGOODname[047] = "兵蜂控制系统"
mapgoodsystemGOODname[048] = "压缩胶囊"
mapgoodsystemGOODname[049] = "神圣之息"
mapgoodsystemGOODname[050] = "独眼全自动安保眼球机器人"


mapfactorysystemfactoryname = {}
mapfactorysystemfactoryname[001] = "帝国咖啡加工厂"
mapfactorysystemfactoryname[002] = "帝国女仆培训设施"
mapfactorysystemfactoryname[003] = "冰矿采集站"
mapfactorysystemfactoryname[004] = "大型船体组件加工厂"
mapfactorysystemfactoryname[005] = "小型船体构件加工厂"
mapfactorysystemfactoryname[006] = "鲜活海鲜培养槽"
mapfactorysystemfactoryname[007] = "神圣之息"
mapfactorysystemfactoryname[008] = "金属矿石采集站"
mapfactorysystemfactoryname[009] = "神圣之息"
mapfactorysystemfactoryname[010] = "神圣之息"
mapfactorysystemfactoryname[011] = "神圣之息"
mapfactorysystemfactoryname[012] = "奢侈品加工厂"
mapfactorysystemfactoryname[013] = "机械零件加工厂"
mapfactorysystemfactoryname[014] = "自动维修机器人加工厂"
mapfactorysystemfactoryname[015] = "章鱼丸子加工厂"
mapfactorysystemfactoryname[016] = "先祖遗物采集站"
mapfactorysystemfactoryname[017] = "神圣之息"
mapfactorysystemfactoryname[018] = "三明治加工厂"
mapfactorysystemfactoryname[019] = "基础修理工具加工厂"
mapfactorysystemfactoryname[020] = "中型武器配件加工厂"
mapfactorysystemfactoryname[021] = "神圣之息"
mapfactorysystemfactoryname[022] = "神圣之息"
mapfactorysystemfactoryname[023] = "神圣之息"
mapfactorysystemfactoryname[024] = "珍惜矿石采集站"
mapfactorysystemfactoryname[025] = "奢侈品加工厂"
mapfactorysystemfactoryname[026] = "特种合金加工厂"
mapfactorysystemfactoryname[027] = "黑暗圣经复刻厂"
mapfactorysystemfactoryname[028] = "奢华家具加工厂"
mapfactorysystemfactoryname[029] = "大型引擎加工厂"
mapfactorysystemfactoryname[030] = "游击战三大件"
mapfactorysystemfactoryname[031] = "蚁壳素加工厂"
mapfactorysystemfactoryname[032] = "大君语录抄写处"
mapfactorysystemfactoryname[033] = "生物电脑加工厂"
mapfactorysystemfactoryname[034] = "神圣之息"
mapfactorysystemfactoryname[035] = "电子元件加工厂"
mapfactorysystemfactoryname[036] = "高级修理工具加工厂"
mapfactorysystemfactoryname[037] = "龙须面加工厂"
mapfactorysystemfactoryname[038] = "神圣之息"
mapfactorysystemfactoryname[039] = "神圣之息"
mapfactorysystemfactoryname[040] = "神圣之息"
mapfactorysystemfactoryname[041] = "管理员培训基地"
mapfactorysystemfactoryname[042] = "食用油加工厂"
mapfactorysystemfactoryname[043] = "神圣之息"
mapfactorysystemfactoryname[044] = "合成神经簇加工厂"
mapfactorysystemfactoryname[045] = "歌姬手办工厂"
mapfactorysystemfactoryname[046] = "神圣之息"
mapfactorysystemfactoryname[047] = "兵蜂控制系统加工厂"
mapfactorysystemfactoryname[048] = "压缩胶囊加工厂"
mapfactorysystemfactoryname[049] = "神圣之息"
mapfactorysystemfactoryname[050] = "独眼全自动安保眼球机器人加工厂"

randomMAPsmallmissionshipTXT = {}
randomMAPsmallmissionshipTXT[001] = "菲雅利商船"
randomMAPsmallmissionshipTXT[002] = "希格拉货舰"
randomMAPsmallmissionshipTXT[003] = "卡厄斯商船"
randomMAPsmallmissionshipTXT[004] = "维格尔货舰"
randomMAPsmallmissionshipTXT[005] = "埃赫洛斯嘉德货舰"

randomMAPsmallmissionTPYETXT = {}
randomMAPsmallmissionTPYETXT[001] = "运输任务"
randomMAPsmallmissionTPYETXT[002] = "采购任务"
randomMAPsmallmissionTPYETXT[003] = "护航任务"
randomMAPsmallmissionTPYETXT[004] = "反袭击任务"


randomMAPsmallmissionTYPEMIDTXT = {}
randomMAPsmallmissionTYPEMIDTXT[001] = "运输目的地是"
randomMAPsmallmissionTYPEMIDTXT[002] = ""
randomMAPsmallmissionTYPEMIDTXT[003] = "护送目的地是"
randomMAPsmallmissionTYPEMIDTXT[004] = "清缴目标目前正在"

randomMAPsmallmissionTPYEENDTXT = {}
randomMAPsmallmissionTPYEENDTXT[001] = "（放弃任务后不再得到任何奖励，但是你可以自由处理手头采购来的商品）"
randomMAPsmallmissionTPYEENDTXT[002] = "（放弃任务后不再得到任何奖励，但是你可以自由处理手头采购来的商品）"
randomMAPsmallmissionTPYEENDTXT[003] = "（放弃任务后被护航对象会离开舰队，同时扣除的荣誉点无法退还）"
randomMAPsmallmissionTPYEENDTXT[004] = "（放弃任务后该星区政府会寻找其他雇佣舰队来解决入侵问题）"



goodLVoutTXT = {}
goodLVoutTXT[001] = ""
goodLVoutTXT[002] = "（警告！！你的贸易等级超出战斗等级太多，这会导致充能期间有极高几率遭遇敌人进攻）"
goodLVoutTXT[003] = function(text1)
	local iText="舰队正在进行常规跃迁充能，充能期间可能会遭遇海盗舰队的袭击，规模越大的舰队越有遭遇战斗的风险，请做好战斗准备"..text1..""
	return iText
end



randomMAPsmallmissionTXT = {}
randomMAPsmallmissionTXT[001] = function(text1,text2,text3,text4,text5,text6,text7)
	local iText="你接到一个运输任务,你需要把"..text1.."单位的"..text2.."运输到"..text3.."，目的地距离该星区需要进行"..text4.."次跳跃，如果完成，你将会收到"..text5.."的资金奖励"..text4.."的荣誉点奖励（警告：为了运输以上资源，你需要"..text6.."的货仓空间，另外为了防止资源丢失，当地政府会预先扣除"..text7.."资金和"..text4.."荣誉点作为保证金）"
	return iText
end

randomMAPsmallmissionTXT[002] = function(text1,text2,text3,text4,text5,text6)
	local iText="任务条件不满足，接取该任务需要"..text1.."的货仓空间"..text2.."的资金还有"..text3.."的荣誉点，而你的舰队目前拥有"..text4.."的货仓空间"..text5.."的资金"..text6.."的荣誉点"
	return iText
end

randomMAPsmallmissionTXT[003] = function(text1,text2,text3,text4)
	local iText="你从"..text1.."接取的运输任务所要求的"..text2.."商品数量不足,任务需要你携带"..text3.."单位，但是目前你的舰队里只有"..text4.."单位，是否要放弃任务（提示：你可以通过采购或者其他方法补足任务要求的数量）"
	return iText
end
---------你从XXX接取的运输任务所要求的XXXX商品数量不足--任务需要你携带XXX个，但是目前你的舰队里只有XXX个----是否要放弃任务--提示--你可以通过采购或者其他方法补足任务要求的数量-------
randomMAPsmallmissionTXT[004] = function(text1,text2,text3)
	local iText="你已经从"..text1.."接取了运输任务，你的目的地是"..text2.."--你目前正在"..text3.."星区。在手头拥有任务的情况下无法接取新的随机任务，请问是否要放弃运输任务？？（放弃任务后扣除的保证金和荣誉点无法返还，但是你可以自由处理手头的运输商品）"
	return iText
end
 ---------你已经XXX接取了运输任务--你的目的地是--你目前正在XX地图---在手头拥有任务的情况下无法接取新的随机任务，请问是否要放弃运输任务？？（放弃任务后扣除的保证金和荣誉点无法返还，但是你可以自由处理手头的运输商品）--
randomMAPsmallmissionTXT[005] = function(text1,text2,text3)
	local iText="你成功的完成了运输任务,并获得了"..text1.."的任务报酬和"..text2.."荣誉点(包含之前交付的保证金）另外由于你的出色表现，你还获得了"..text3.."的贸易经验"
	return iText
end 
 
--你成功的完成了-运输任务--并获得了XXXX的任务报酬和XXX荣誉点(包含之前交付的保证金）--randomMAPsmallmissionENDMONEYstart
--由于你的出色表现，你还获得了XXX的贸易经验-- 
 
randomMAPsmallmissionTXT[006] = function(text1,text2,text3,text4,text5,text6,text7)
	local iText="你接到一个采购任务,该星区需要"..text1.."单位的"..text2.."。根据情报，在"..text3.."可能出售该商品，出售地星区距离该区域的距离为"..text4.."次跳跃，采购的总金额为"..text7.."。如果能把商品运回来，你将会收到"..text5.."的资金奖励"..text4.."的荣誉点奖励（警告：为了运输以上资源，你需要"..text6.."的货仓空间）\n（到目的地后请点击随机任务进行采购，有特殊的供应商可以无视贸易等级为您供货）"
	return iText
end 
 
randomMAPsmallmissionTXT[007] = function(text1,text2,text3,text4,text5)
	local iText="你从"..text1.."接取了一个采购任务，任务需要你前往"..text2.."采购"..text3.."单位的"..text4.."。目前你的库存里只有"..text5.."单位的"..text4.."，是否要放弃任务？（提示，你也可以通过其他手段获取足够的商品）"
	return iText
end

randomMAPsmallmissionTXT[008] = function(text1)
	local iText="你已经从"..text1.."接取了采购任务，在手头拥有任务的情况下无法接取新的随机任务，请问是否要放弃运输任务？？（放弃任务后不再得到任何奖励，但是你可以自由处理手头采购来的商品）"
	return iText
end

randomMAPsmallmissionTXT[009] = function(text1,text2,text3,text4)
	local iText="你成功的完成了"..text4..",并获得了"..text1.."的任务报酬和"..text2.."荣誉点，另外由于你的出色表现，你还获得了"..text3.."的贸易经验"
	return iText
end 


randomMAPsmallmissionTXT[010] = function(text1,text2,text3,text4)
	local iText="你接到一个护送任务,你需要把1艘"..text1.."护送到"..text2.."，目的地距离该星区需要进行"..text3.."次跳跃，如果完成，你将会收到"..text4.."的资金奖励"..text3.."的荣誉点奖励（警告：如果中途护送目标被摧毁则任务失败，该任务需要预交"..text3.."荣誉点作为保证）"
	return iText
end

randomMAPsmallmissionTXT[011] = function(text1,text2)
	local iText="任务条件不满足，接取该任务需要"..text1.."的荣誉点，而你的舰队目前拥有"..text2.."的荣誉点"
	return iText
end


randomMAPsmallmissionTXT[012] = function(text1,text2,text3)
	local iText="你从"..text1.."接取的护航任务中需要保护的"..text2.."已经被摧毁，任务自动取消，同时之前扣除的"..text3.."荣誉点也无法返还（你可以继续接取新的随机任务）"
	return iText
end


randomMAPsmallmissionTXT[014] = function(text1,text2,text3,text4,text5)
	local iText="你已经从"..text1.."接取了"..text2.."，"..text4..""..text5.." 在手头拥有任务的情况下无法接取新的随机任务，请问是否要放弃任务？？"..text3..""
	return iText
end

randomMAPsmallmissionTXT[015] = function(text1,text2,text3,text4,text5,text6)
	local iText="你接到一个讨伐任务,在"..text1.."外围星区有一支"..text2.."的"..text3.."在活动，他们可能是"..text4.."的前锋侦查舰队，如果你能够将其摧毁，那么你就可以获得"..text5.."的资金奖励"..text6.."的荣誉点奖励"
	return iText
end

randomMAPsmallmissionTXT[016] = function(text1)
	local iText="任务已经确认，请前往"..text1.."外围星区执行清缴作战"
	return iText
end

randomMAPsmallmissionTXT[017] = function(text1,text2)
	local iText="你已经到达"..text1.."，"..text2.."正在该星区的外围星区活动，是否要执行清缴作战？（如果想放弃任务请前往其他星区再点否）"
	return iText
end


randomMAPsmallmissionTXT[018] = function(text1,text5,text6,text7)
	local iText="你已经清缴了"..text1.."的先锋舰队，在战斗结束后你打扫战场获得了"..text5.."的资金奖励和"..text6.."的战斗经验还有"..text7.."的荣誉点作为报酬,任务结束"
	return iText
end

randomMAPsmallmissionTXT[019] = function(text1,text2)
	local iText="你的舰队已经到达"..text1.."外围，"..text2.."的前锋侦察舰队正在这个区域行动，清剿这些舰队可以完成任务。"
	return iText
end


randomMAPsmallmissionTXT[020] = function(text1,text2,text3,text4)
	local iText="你接到了一个采购任务，你需要采购"..text1.."单位的"..text2..".\n目前该星区的一位特殊供货商愿意提供这些货物，你需要支付"..text3.."并准备好"..text4.."的货仓空间，请问是否要进行采购？（警告：特殊供货商每次任务都只能提供一次特殊采购，请勿重复购买）"
	return iText
end


mapfactorysystemdefLV = {}
mapfactorysystemdefLV[001] = "无法抵御任何入侵"
mapfactorysystemdefLV[002] = "可以抵御小规模的海盗和天灾入侵"
mapfactorysystemdefLV[003] = "可以抵御中等规模的海盗和天灾入侵"
mapfactorysystemdefLV[004] = "可以抵御大规模的海盗和天灾入侵"
mapfactorysystemdefLV[005] = "可以抵御超大规模的海盗和天灾入侵"
mapfactorysystemdefLV[006] = "可以抵御特大规模的海盗和天灾入侵"

mapgoodsystemTXT = {}
mapgoodsystemTXT[001] = function(text1,text2,text3,text4,text5,text6)
	local iText=""..text1.."星区目前的生产能力只能提供"..text2.."单位的"..text3.."，由于你的舰队采购的"..text3.."数量远超过当地经销商的现有库存，当地供货商核对库存后发现，约有"..text4.."单位的"..text3.."无法交货，"..text5.."的采购货款已经原路退回。（建议对当地的"..text6.."进行投资，升级当地的产品生产力）"
	return iText
end

mapgoodsystemTXT[002] = function(text1,text2,text3,text4,text5,text6,text7)
	local iText=""..text1.."星区目前的"..text2.."生产等级为"..text3.."级，每次可以提供"..text4.."单位的"..text5..".星区防御能力为"..text6.."级，"..text7.."，你是否要对星区进行投资？"
	return iText
end

mapgoodsystemTXT[003] = function(text1)
	local iText=""..text1.."星区的防御设施等级已经达到10级，无法继续升级"
	return iText
end

mapgoodsystemTXT[004] = function(text1,text2,text3)
	local iText="你是否要投资"..text1.."星区的防御设施？该设施目前等级为"..text2.."级，升级它需要"..text3.."资金"
	return iText
end

mapgoodsystemTXT[005] = function(text1,text2,text3)
	local iText=""..text1.."星区的防御设施已经升级，目前等级为"..text2.."级，为了感谢你做出的贡献，当地政府给与了你"..text3.."点的荣誉点"
	return iText
end

mapgoodsystemTXT[006] = function(text1,text2)
	local iText="你的资金不够,"..text1.."星区的防御设施升级需要"..text2.."的资金"
	return iText
end


mapgoodsystemTXT[007] = function(text1,text2)
	local iText=""..text1.."星区的"..text2.."等级已经达到10级，无法继续升级"
	return iText
end

mapgoodsystemTXT[008] = function(text1,text2,text3,text4)
	local iText="你是否要投资"..text1.."星区的"..text4.."？该设施目前等级为"..text2.."级，升级它需要"..text3.."资金"
	return iText
end


mapgoodsystemTXT[009] = function(text1,text2,text3,text4)
	local iText=""..text1.."星区的"..text4.."已经升级，目前等级为"..text2.."级，为了感谢你做出的贡献，当地政府给与了你"..text3.."点的荣誉点"
	return iText
end

mapgoodsystemTXT[010] = function(text1,text2,text3)
	local iText="你的资金不够,"..text1.."星区的"..text3.."升级需要"..text2.."的资金"
	return iText
end


mapgoodsystemTXT[011] = function(text1,text2,text3)
	local iText=""..text1.."星区没有任何商业设施.星区防御能力为"..text2.."级，"..text3..",你是否要对星区进行投资？"
	return iText
end

mapgoodsystemTXT[012] = function(text1,text2,text3,text4,text5)
	local iText=""..text1.."星区目前的"..text2.."生产等级为"..text3.."级，每次可以提供"..text4.."单位的"..text5..".你是否要投资？(因为当地政权原因，您无法进行任何星区防御方面的投资)"
	return iText
end


