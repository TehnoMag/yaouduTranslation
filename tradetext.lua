DTM004 = {}
DTM004[1] = function(iGood)
	local iText = "Size:"..DTM4_GetColorText(g_TransAmount,"NotLess",Goods[iGood].weight,Goods[iGood].weight).."\n"
	--iText = iText.."Military rank:"..DTM4_GetColorText(g_FightLevel,"NotLess",Goods[iGood].FightLevelNeed,Goods[iGood].FightLevelNeed).."\n"
	--iText = iText.."Trade level:"..DTM4_GetColorText(g_TradeLevel,"NotLess",Goods[iGood].TradeLevelNeed,Goods[iGood].TradeLevelNeed).."\n"
	iText = iText..Goods[iGood].Description
	return iText
end
DTM004[2] = "Consumption (units/day):\n"
DTM004[3] = function(iGood)
	local iText = "Size:"..Goods[iGood].weight.."\n"..Goods[iGood].Description
	return iText
end
--DTM004[3] = "Cargo hold capacity£º"
DTM004[4] = function(text)
	local iText="Are you sure you want to buy this ship '"..text.."'?"
	return iText
end
--DTM004[5] = "¡±£¿"
DTM004[5] = ","
DTM004[6] = function(text)
	local iText="Are you sure you want to put '"..text.."' on sale?"
	return iText
end
DTM004[7] = function(text)
	local iText="Jumpgate - "..text
	return iText
end
DTM004[8] = function(text1,text2,text3)
	local iText="This stargate leads to "..text1..", are you sure you want to go through that jump gate? You need to pay"..text2.."funds to make the jump.\n[Note] There are still undocked boats in the fleet, so if you don't dock them, you'll pay extra."..text3.."funds for docking operations."
	return iText
end
--DTM004[9] = ", Are you sure you want to go through that jump gate? You need to pay"
DTM004[9]=function(text1,text2)
	local iText="This stargate leads to "..text1..", are you sure you want to go through that jump gate? You need to pay "..text2.." funds to make the jump."
	return iText
end
--DTM004[10] = "[Note] There are still undocked boats in the fleet, so if you don't dock them, you'll pay extra."
DTM004[11] = "Your ship is too far away to use this jump gate."
DTM004[12] = "There are no ships in the fleet with hyperspace jump capability to make the jump."
DTM004[13] = "Use the stargate"
DTM004[14] = "Travel to other star systems through a stargate."
DTM004[15] = "OK"
DTM004[16] = "Cancel"
DTM004[17] = "Unavailable"
DTM004[18] = "Shortage of essential cargo"
DTM004[19] = "There is a stock of essential goods at 0"
DTM004[20] = "Trade Information"
DTM004[21] = "Trade with each other"
DTM004[22] = "Galaxy Standard Calendar"
DTM004[23] = "You do not have a ship close to this station and cannot trade with the other side."
DTM004[24] = "Your fleet is too close to other space stations to trade with each other."
--DTM004[25] = "Loading and unloading capacity:"
--DTM004[26] = "Loading and unloading speed:"
DTM004[27] = "Hourly"
DTM004[28] = "Days"
DTM004[29] = "Month"
DTM004[30] = "Year"
DTM004[31] = "minutes"
--DTM004[32] = "Estimated loading and unloading efficiency:"
--DTM004[33] = "Volume,"
--DTM004[34] = "/time"
--DTM004[35] = "Daily consumption (units/day): \n"
--DTM004[36] = "Mobile consumption (units/day): \n"
--DTM004[37] = "Attack consumption (unit/day): \n"
--DTM004[38] = "Maintenance consumption (unit/day): \n"
--DTM004[39] = "Jump consumption (units/hour): \n"
DTM004[40] = function(warntext,iwarn,iwarn2,l_goodstake)
		local iText = "Your important supplies:"..warntext.."are low."
		local jwarntext = ""
		kwarntext = {"Some ships can't fire,", "Some ships can't move,", "Some ships have unsustainable maintenance,", "Some ships can't enter hyperspace,", "Some ships can't cloak,", "Some ships can't open defense fields,"}
		if (iwarn2==1) then
			jwarntext = jwarntext.."Related industries are shutting down as a result,"
		end
		if (iwarn[1]==1) then
			jwarntext = jwarntext.."and the fleet is losing"..l_goodstake.."funds daily,"
		end
		for i=2,7 do
			if (iwarn[i]==1) then
				jwarntext = jwarntext..kwarntext[i-1]
			end
		end
		iText=iText..jwarntext.."to avoid further losses, please replenish the corresponding goods as soon as possible"
		return iText
end
--DTM004[40] = "Some ships can't fire,"
--DTM004[41] = "Some ships are immobilized,"
--DTM004[42] = "Some ships can't sustain repairs,"
--DTM004[43] = "Some ships are unable to enter hyperspace,"
--DTM004[44] = "Related industries are shutting down as a result,"
--DTM004[45] = "Fleet is being lost daily as a result."
--DTM004[46] = "Point funding,"
--DTM004[47] = "Your important supplies:"
--DTM004[48] = "Shortages occur,"
--DTM004[49] = "To avoid further losses, please replenish the appropriate goods as soon as possible"
DTM004[50] = function(text1,text2,text3)
	local iText="You have met a person selling"..text1.."The unscrupulous businessman offers to sell you"..text2.."of the unit"..text1..",at a cost of"..text3.."funds. Do you agree?"
	return iText
end
--DTM004[50] = "You encounter a trafficker"
--DTM004[51] = "of a rogue trader who offers to sell it to you"
--DTM004[52] = "of the unit"
--DTM004[53] = ",but will charge you"
--DTM004[54] = "point funds. Do you agree?"
--DTM004[55] = "Population requirements:"
--DTM004[56] = "Stop loading and unloading"
DTM004[56] = "Stop now"
--DTM004[57] = "Hint: Keeping the fleet as close to the trade station as possible and aiding loading and unloading with some fast loading and unloading airships (such as ships and mining ships) can significantly improve loading and unloading efficiency"
DTM004[58] = "Insufficient funds to purchase!"
DTM004[59] = "Insufficient population to purchase!"
DTM004[60] = "Over quantity limit, cannot purchase!"
DTM004[61] = function(text)
	local iText="Are you sure you want to buy this '"..text.."'?"
	return iText
end
DTM004[62] = "Insufficient cargo space, can't purchase!"
DTM004[63] = "This is your last ship, can't sell!"
DTM004[64] = "There are other ships moored on this ship, can't sell, please empty the hangar and try again!"
DTM004[65] = "There is still spare cargo on this ship, can't sell, please sell some cargo and try again!"
DTM004[66] = "Daily production:"
DTM004[67] = "Daily consumption:"
DTM004[68] = function(text)
	local iText="Current Units:"..text.."%"
	return iText
end
DTM004[69] = function(text)
	local iText="Management to:"..text.."units"
	return iText
end
--DTM004[70] = "units"
DTM004[71] = function(text)
	local iText="In queue:"..text.."units"
	return iText
end
DTM004[72] = function(text1,text2,text3)
	local iText="Current loading and unloading efficiency:"..text1.."units/"..text2..text3
	return iText
end
DTM004[73] = function(text1,text2)
	local iText="Still need to load and unload:"..text1.."units("..text2.."%)"
	return iText
end
DTM004[74] = "Loading and unloading in progress ......"
DTM004[75] = "Jumpgate has been activated, some of the battleships close to the stargate will leave via first jump. Please move the battleships that have not yet had time to leave towards the stargate to end the jump"
DTM004[76] = "Your fleet has bravely charged through this dangerous sector and out of the gravity trap zone. Stunned, you reorganize your fleet to head to your destination sector, free from the predators."
DTM004[77] = "Your fleet has decisively turned around and escaped this dangerous sector, out of the gravity trap zone. Stunned, you reorganized your fleet and returned to the sector from which you came, free of the Predator's pursuit."
DTM004[78] = "lblResourceUnitsSize_Date"
DTM004[79] = "The ship is still moored and cannot be sold, please make it out of the hangar and try again!"
DTM004[80] = "Your level is insufficient to trade with the other side"
DTM004[81] = function(text1,text2)
	local l_color1="FF0000"
	local l_color2="FF0000"
	if(g_FightLevel>=text1)then
		l_color1="00FF00"
	end
	if(g_TradeLevel>=text2)then
		l_color2="00FF00"
	end
	local iText="Military rank:"..DTM4_GetColorText(g_FightLevel,"NotLess",text1,text1).." Trade level:"..DTM4_GetColorText(g_FightLevel,"NotLess",text2,text2)
	return iText
end
--DTM004[82] = "Trade Level:"
DTM004[83] = "You are not of sufficient level to use this stargate"
DTM004[84] = "Your rank is insufficient to purchase this item."
DTM004[85] = "Your level is not sufficient to purchase this type of vessel."
DTM004[86] = "You are not of sufficient level to purchase this type of equipment."
DTM004[87] = function(iFactory)
	local iText = ""
	local iText2=DTM4_GetGTData2(iFactory)
	iText = iText.."Military rank:"..DTM4_GetColorText(g_FightLevel,"NotLess",Factory[iFactory].FightLevelNeed,Factory[iFactory].FightLevelNeed).."\n"
	iText = iText.."Trade level:"..DTM4_GetColorText(g_TradeLevel,"NotLess",Factory[iFactory].TradeLevelNeed,Factory[iFactory].TradeLevelNeed).."\n"
	iText = iText.."Occupancy:"..DTM4_GetColorText(g_factorylimit,"NotLess",Factory[iFactory].VCost+g_factoryweight,Factory[iFactory].VCost).."\n"
	iText = iText.."Loading and unloading time:"..Factory[iFactory].TCost.."minutes"
	iText = iText..iText2
	iText = iText..Factory[iFactory].Description
	return iText
end
--DTM004[88] = "Loading and unloading time:"
DTM004[89] = "Game is about to start, please wait ......"
DTM004[90] = function(text)
	local iText="Do you want to start your journey as "..text.."?"
	return iText
end
--DTM004[91] = "Start game, OK?"
--DTM004[92] = "Industrial space:"
DTM004[93] = "Insufficient industrial space to purchase!"
DTM004[94] = function(text)
	local iText="Trade Post - "..text
	return iText
end
DTM004[95] = function(text)
	local iText="\nThe ship will be named '"..text.."'. If you want to change it, please open the folder bin\\profiles\\ShipName.txt"
	return iText
end
DTM004[96] = "\nThe ship will be named '"
DTM004[97] = "'. If you want to change it, please open the folder bin\\profiles\\ShipName.txt"
DTM004[98] = "\nThe initial ship does not have a name yet, please edit a name for it in the game's bin\\release\\ShipName.txt file"
DTM004[99] = "Unit cargo volume exceeds fleet handling capacity"
DTM004[100] = function(text1,text2,text3,text4)
	local iText="Are you sure you want to put '"..text1.."'"..text2.."from '"..text3.."' convert to '"..text4.."'?"
	return iText
end
DTM004[101] = "There are other ships moored on this ship, it cannot be modified, please empty the hangar and try again!"
DTM004[102] = "There is not enough cargo space after transformation, please sell some cargo and try again!"
--DTM004[103] = "¡±£¿"
DTM004[104] = "Your level is not sufficient for the transformation."
DTM004[105] = "Insufficient funds to remodel!"
DTM004[106] = "Insufficient population to remodel!"
DTM004[107] = "Welcome to the trade mode of Fai`ri Empire.\nIn this mode, you can choose from 3 proffesions to start.\nClick on the ship on the map to select the corresponding proffesion to start the game."
DTM004[108] = "MANAGEMENT"
DTM004[109] = "Sell selected ship or change its name or model"
DTM004[110] = "CARGO"
DTM004[111] = "Open/Close Cargo Screen"
DTM004[112] = "Ship management"
DTM004[113] = "Rename"
DTM004[114] = "Sell"
DTM004[115] = "Ship information and modification selection"
DTM004[116] = "Trade Rank"
DTM004[117] = "Military Grade"
DTM004[118] = "Population"
DTM004[119] = "Funding"
DTM004[120] = "Game Time"
DTM004[121] = function(text1,text2)
	local iText="Are you sure you want to put '"..text1.."'"..text2.."on sale?\n(Warning, selling the ship outside of 5000M from the store will result in a system error preventing it from leaving the map)"
	return iText
end
DTM004[122] = "[Note] Purchasing this ship will cause the population to exceed the limit, after confirmation, you must sell or escrow enough ships to bring the population back to the allowed range before continuing to purchase ships or leaving this map."
DTM004[123] = "Current population exceeds limit, cannot pass through stargate!"
DTM004[124] = function(l_ShipData,text)
	local iText = ""
	--iText = iText.."Price:"..DTM4_GetColorText(g_money,"NotLess",l_ShipData.Price,l_ShipData.Price).."\n"
	iText = iText.."Cargo:"..l_ShipData.cap.."\n"
	--iText = iText.."C/M/T:"..DTM4_GetColorText(g_PopPointLimit,"NotLess",g_PopPointTotal+l_ShipData.PopPoint,l_ShipData.PopPoint).."/"
	--iText = iText..DTM4_GetColorText(g_FightLevel,"NotLess",l_ShipData.FightLevelNeed,l_ShipData.FightLevelNeed).."/"
	--iText = iText..DTM4_GetColorText(g_TradeLevel,"NotLess",l_ShipData.TradeLevelNeed,l_ShipData.TradeLevelNeed).."\n"
	iText = iText.."Industrial:"..l_ShipData.fcap.."\n"
	--iText = iText.."Crew:"..DTM4_GetColorText(g_PopPointLimit,"NotLess",g_PopPointTotal+l_ShipData.PopPoint,l_ShipData.PopPoint).."\n"
	--iText = iText.."Military:"..DTM4_GetColorText(g_FightLevel,"NotLess",l_ShipData.FightLevelNeed,l_ShipData.FightLevelNeed).."\n"
	--iText = iText.."Trade:"..DTM4_GetColorText(g_TradeLevel,"NotLess",l_ShipData.TradeLevelNeed,l_ShipData.TradeLevelNeed).."\n"
	--iText = iText.."M/T ranks:"..DTM4_GetColorText(g_FightLevel,"NotLess",l_ShipData.FightLevelNeed,l_ShipData.FightLevelNeed).."/"..DTM4_GetColorText(g_TradeLevel,"NotLess",l_ShipData.TradeLevelNeed,l_ShipData.TradeLevelNeed).."\n"
	iText = iText.."<b>Logistics</b>\n"
	iText = iText.."  Capacity:"..l_ShipData.TransAmount.."\n"
	iText = iText.."  Speed:"..l_ShipData.TransSpeed.."\n"
	iText = iText.."<b>Consumptions</b>\n"
			for i,j in l_ShipData.GTAnyTime do
				if (j[2]>0) then
					iText = iText.."  "..Goods[j[1]].name..":"..j[2]
				end
			end
			if (l_ShipData.GTWhileMoving[1]~=nil) then
				iText = iText.."\n".."  Fuel(units/day):\n"
				for i,j in l_ShipData.GTWhileMoving do
					if (j[2]>0) then
						iText = iText.."    "..Goods[j[1]].name..":"..j[2]
					end
				end
			end
			if (l_ShipData.GTWhileFiring[1]~=nil) then
				iText = iText.."\n".."  Munitions(unit/day):\n"
				for i,j in l_ShipData.GTWhileFiring do
					if (j[2]>0) then
						iText = iText.."    "..Goods[j[1]].name..":"..j[2]
					end
				end
			end
			if (l_ShipData.GTWhileRepairing[1]~=nil) then
				iText = iText.."\n".."  Maintenance(unit/day):\n"
				for i,j in l_ShipData.GTWhileRepairing do
					if (j[2]>0) then
						iText = iText.."    "..Goods[j[1]].name..":"..j[2]
					end
				end
			end
			if (l_ShipData.GTWhileHPJump[1]~=nil) then
				iText = iText.."\n".."  Jump fuel(unit/hour):\n"
				for i,j in l_ShipData.GTWhileHPJump do
					if (j[2]>0)and(j[1]~=g_GoodIndexForDockUnitHP) then
						iText = iText.."    "..Goods[j[1]].name..":"..j[2]
					end
				end
			end
			if (l_ShipData.GTWhileCloaking[1]~=nil) then
				iText = iText.."\n".."  Cloak fuel(unit/hour):\n"
				for i,j in l_ShipData.GTWhileCloaking do
					if (j[2]>0) then
						iText = iText.."    "..Goods[j[1]].name..":"..j[2]
					end
				end
			end
			if (l_ShipData.GTWhileDSOpening[1]~=nil) then
				iText = iText.."\n".."  Force field(unit/hour):\n"
				for i,j in l_ShipData.GTWhileDSOpening do
					if (j[2]>0) then
						iText = iText.."    "..Goods[j[1]].name..":"..j[2]
					end
				end
			end
	--iText = text
	return iText
end
DTM004[125] = "g_BuyShipName = \"\"\n\-\-Usage: Fill in the ship name in quotation marks and save."
DTM004[126] = function(text)
	local iText="Trade experience+"..text
	return iText
end
DTM004[127] = function(text)
	local iText="Combat Experience+"..text
	return iText
end
DTM004[128] = "This ship is the only carrier ship left in the fleet and cannot be hosted!"
DTM004[129] = "There are ships at anchor on this ship, cannot be hosted, please release all carriers and try again!"
DTM004[130] = "This ship has remaining cargo, cannot be hosted, please sell some cargo and try again!"
DTM004[131] = function(text1,text2,text3,text4)
	local iText="Are you sure you want to put '"..text1.."'"..text2.."for delivery"..text3.."to be hosted? The hosting fee is"..text4.."funds/day"
	return iText
end
--DTM004[132] = "Point funds/day"
DTM004[133] = "There are still spare goods on this ship, can't sell, please sell some goods and try again!"
DTM004[134] = "Escrow"
--DTM004[135] = "Hand over"
--DTM004[136] = "From""
DTM004[137] = function(text)
	local iText="You paid for all ships in escrow"..text.."funds."
	return iText
end
--DTM004[138] = "funds"
DTM004[139] = function(text)
	local iText="You paid for a ship in partial escrow"..text.."funds, other ships in escrow will not be maintained!"
	return iText
end
--DTM004[140] = "funds, other ships in escrow will not be maintained!"
DTM004[141] = "You are no longer able to pay for the ships in escrow, all ships cannot be maintained!"
DTM004[142] = function(text1,text2)
	local iText="'"..text1.."'"..text2.."Perfect condition, no repairs needed!"
	return iText
end
--DTM004[143] = "Perfect condition, no repair needed!"
DTM004[144] = "Insufficient funds to repair!"
DTM004[145] = "Insufficient population to take over!"
DTM004[146] = function(text1,text2)
	local iText="Are you sure you want to take over '"..text1.."'"..text2.."?"
	return iText
end
--DTM004[147] = "£¿"
DTM004[148] = function(text1,text2,text3)
	local iText="Maintenance '"..text1.."'"..text2.."will cost"..text3.."funds, will you repair?"
	return iText
end
--DTM004[149] = "will cost"
--DTM004[150] = "funds, will you repair?"
--DTM004[151] = "¡±"
DTM004[152] = function(text1,text2)
	local iText="This is a cargo box that you discarded earlier and contains"..text1.."of the units"..text2..". Recycle the container?"
	return iText
end
--DTM004[153] = "of the unit"
DTM004[154] = function(text)
	local iText="You pick up a cargo box, and based on the ID above, you determine that the box has"..text..". Turn in the box?"
	return iText
end
--DTM004[155] = ", turn in the box?"
DTM004[156] = function(text1,text2,text3)
	local iText="You hand over the cargo box to"..text1.."\nIn return, you get"..text2.."funds\nYours and"..text1.."relationship is elevated.("..text3..")"
	return iText
end
--DTM004[157] = "In return, you get"
--DTM004[158] = "funds"
--DTM004[159] = "Yours and"
DTM004[160] = function(text1,text2,text3,text4)
	local iText="You take for yourself the goods in the cargo box, which contains"..text1.."of the unit"..text2.."\nYours and"..text3.."relationship went down.("..text4..")"
	return iText
end
--DTM004[161] = "relationship is elevated"
--DTM004[162] = "relationship went down"
DTM004[163] = function(text1,text2,text3,text4)
	local iText="Welcome "..text1..".\nExpected logistics efficiency:"..text2.."Units/"..text3..text4.."\n<b>[Hint]</b> The closer your fleet, the more efficient logistics\nEnjoy your purchase!"
	return iText
end
--DTM004[164] = "Happy purchasing!"
--DTM004[165] = "Tap funds for consignment."
--DTM004[166] = "Order funds for jump."
DTM004[167] = "Insufficient funds for jumping!"
DTM004[168] = "Transformation"
DTM004[169] = function(text1,text2)
	local iText="Lv"..text1.." "..text2
	return iText
end
DTM004[170] = function(text)
	local iText="You do want to help"..text..", it's a pity that you don't have enough money."
	return iText
end
DTM004[171] = function(text1,text2,text3)
	local iText="Are you sure you want to finance"..text1.."funds to"..text2.."of"..text3.."£¿"
	return iText
end
DTM004[172] = function(text1,text2,text3,text4)
	local iText="You have submitted to"..text1.."of"..text2.."a payment of"..text3.."funds. The expected repayment schedule is:\n"..text4
	return iText
end
DTM004[173] = function(text1,text2)
	local iText="You just received a message from your personal terminal:\nThank you for your selfless support, my business has now improved and the agreed repayment amount has been credited to your account, please check it.\n"..text1.."\n"..text2
	return iText
end
DTM004[174] = function(text1,text2,text3,text4)
	local iText=text1..""..text2..text3.."has recently run into financial difficulties and needs a lot of financial help to get out of it."..text3.."commitment, any funding for its"..text4.."Anyone with funds can get double reimbursement within 1 month."
	return iText
end
DTM004[175] = "Mission"
DTM004[176] = "Acceptable Task"
DTM004[177] = "Claimed Task"
DTM004[178] = "Mission Details"
DTM004[179] = "Merchant"
DTM004[180] = "Entrepreneur"
DTM004[181] = "Borrowed Mission"
DTM004[182] = function(text1,text2)
	local iText="You have just received a message from your personal terminal: \n Thank you for your selfless support, however, unfortunately, my business still shows no signs of improvement, I think I will have to file for bankruptcy protection, I am deeply sorry for not keeping my promise, I have sent your help to"..text1.."Internal announcement and vigorous publicity, I hope you will be helped\n"..text1.."\n"..text2
	return iText
end
DTM004[183] = function(text1,text2)
	local iText="You have just received a message from your personal terminal: \n Thank you for your selfless support, unfortunately, my business still shows no signs of improvement, I would like to repay your grant one month later if possible, I deeply apologize for not keeping my promise \n"..text1.."\n"..text2
	return iText
end
DTM004[184] = "Sourcing tasks"
DTM004[185] = function(text1,text2,text3)
	local iText="Are you sure you want to help"..text1.."complete within ten days"..text2.."number of"..text3.."procurement tasks?"
	return iText
end
DTM004[186] = function(text1,text2,text3,text4)
	local iText=text1.."of"..text2.."Recently there is a shortage, now willing to offer"..text3.."funds purchased within 10 days as compensation"..text4.."of the unit"..text2.."."
	return iText
end
DTM004[187] = function(text1,text2,text3,text4,text5)
	local iText="You and"..text1.."sign a batch"..text2.."of the procurement contract, if it can be delivered by the specified date"..text4.."the unit"..text2.."delivered, you will receive"..text3.."funds as payment. \n Deadline:"..text5
	return iText
end
DTM004[188] = function(text)
	local iText="You have just received a message from your personal terminal: \n Thank you for agreeing to help, we have placed a cargo box nearby, once you have purchased the appropriate goods, simply place them in the box. \n"..text
	return iText
end
DTM004[189] = function(text)
	local iText="You have just received a message from your personal terminal: \n Thank you for the delivery, the agreed payment has been credited to your account, and we once again express our deep gratitude for your help. \n"..text
	return iText
end
DTM004[190] = function(text1,text2)
	local iText="You have just received a message from your personal terminal: \n the agreed deadline has arrived, however we have not received your delivery and regret to inform you that we no longer need"..text2..", the previous contract is null and void.\n"..text1
	return iText
end
DTM004[191] = "Are you sure you want to abandon this mission?"
DTM004[192] = function(text1,text2)
	local iText="You just received a message from your personal terminal: \n understand, it seems we have to find another person to purchase"..text2.."(of a person's name).\n"..text1
	return iText
end
DTM004[193] = function(text1,text2)
	local iText="You just received a message from your personal terminal: \n really don't know how I can thank you, I have sent your help to"..text1.."Internal announcement and vigorous publicity, I hope it will be helpful to you \n"..text1.."\n"..text2
	return iText
end
DTM004[194] = "No cargo ships nearby to pick up!"
DTM004[195] = "The container is too big for your ship to pick up!"
DTM004[196] = function(text1,text2)
	local iText="Are you sure you want to put"..text1.."of the unit"..text2.."into this cargo box?"
	return iText
end
DTM004[197] = function(text1,text2)
	local iText="You have not yet procured"..text1.."of the unit"..text2.."!"
	return iText
end
DTM004[198] = "There is no cargo ship nearby to unload the cargo!"
DTM004[199] = "Clearance mission"
DTM004[200] = function(text)
	local iText="You do want to buy this lot"..text..", but you don't have enough money."
	return iText
end
DTM004[201] = function(text1,text2,text3)
	local iText="Are you sure you want to start with"..text1.."funds for the price of"..text2.."of this batch"..text3.."?"
	return iText
end
DTM004[202] = function(text1,text2,text3)
	local iText="You have just received a message from your personal terminal: \nWe have placed"..text1.."units of"..text2.."boxed and placed nearby, this shipment is now yours. \n"..text3
	return iText
end
DTM004[203] = function(text1,text2,text3,text4)
	local iText=text1.."Of"..text2.."recently there was a lag in sales, and now I would like to offer"..text3.."low price selling of funds"..text4.."of the unit"..text2.."."
	return iText
end
DTM004[204] = function(text1,text2,text3,text4)
	local iText="You take"..text3.."the low price of funds from"..text1.."bought"..text4.."of the unit"..text2..". This shipment is now in"..text1.."nearby, please remove them promptly."
	return iText
end
DTM004[205] = function(text)
	local iText="You tell"..text.."no need to pay back the money, the other party was grateful."
	return iText
end
DTM004[206] = function(text)
	local iText=text.."Have paid off your grant with interest."
	return iText
end
DTM004[207] = function(text1,text2)
	local iText=text1.."bankrupt, but your help to him has been"..text2.."widely known internally."
	return iText
end
DTM004[208] = function(text)
	local iText="You have notified"..text.."you won't be able to complete the purchase, and I don't think the other party will be happy."
	return iText
end
DTM004[209] = function(text)
	local iText="You finished with"..text..",the other party seemed happy with the signed purchase contract."
	return iText
end
DTM004[210] = function(text)
	local iText="You and"..text.."relations are tense and the other side has banned your fleet from entering the station!"
	return iText
end
DTM004[211] = "Insufficient relationship to purchase!"
DTM004[212] = "Repair"
DTM004[213] = function(l_ShipData,text,l_ShipData2,text2)
	local iText = ""
	iText = iText.."Price:"..DTM4_GetColorText(l_ShipData.Price,"Less",l_ShipData2.Price,l_ShipData.Price).."\n"
	iText = iText.."Cargo hold capacity:"..DTM4_GetColorText(l_ShipData2.cap,"Less",l_ShipData.cap,l_ShipData.cap).."\n"
	iText = iText.."Industrial Space:"..DTM4_GetColorText(l_ShipData2.fcap,"Less",l_ShipData.fcap,l_ShipData.fcap).."\n"
	iText = iText.."Population demand:"..DTM4_GetColorText(l_ShipData.PopPoint,"Less",l_ShipData2.PopPoint,l_ShipData.PopPoint).."\n"
	iText = iText.."Military rank:"..DTM4_GetColorText(l_ShipData.FightLevelNeed,"Less",l_ShipData2.FightLevelNeed,l_ShipData.FightLevelNeed).."\n"
	iText = iText.."Trade level:"..DTM4_GetColorText(l_ShipData.TradeLevelNeed,"Less",l_ShipData2.TradeLevelNeed,l_ShipData.TradeLevelNeed).."\n"
	iText = iText.."Loading and unloading capacity:"..DTM4_GetColorText(l_ShipData2.TransAmount,"Less",l_ShipData.TransAmount,l_ShipData.TransAmount).."\n"
	iText = iText.."Loading and unloading speed:"..DTM4_GetColorText(l_ShipData2.TransSpeed,"Less",l_ShipData.TransSpeed,l_ShipData.TransSpeed).."\n"
	iText = iText.."Daily consumption (unit/day): \n"
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
				iText = iText.."Fuel consumption (unit/day): \n"
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
				iText = iText.."Munitions consumption (unit/day): \n"
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
				iText = iText.."Maintenance consumption (unit/day): \n"
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
				iText = iText.."Jump fuel consumption (unit/hour): \n"
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
				iText = iText.."Cloak fuel consumption (unit/hour): \n"
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
				iText = iText.."Force field consumption (unit/hour): \n"
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
DTM004[214] = "Clearance tasks"
DTM004[215] = function(iCamp,iEnemyCamp)
	local iText="Are you sure you want to help"..iCamp.."destroyed in ten days"..iEnemyCamp.."the goal?"
	return iText
end
DTM004[216] = function(iCamp,iEnemyCamp)
	local iText="Thank you for deciding to help us!"..iEnemyCamp.."The position of the fleet has been transmitted to you, so please be careful.\n"..iCamp
	return iText
end
DTM004[217] = function(iCamp,iEnemyCamp,iReward)
	local iText=iCamp.."Recently, we learned that a"..iEnemyCamp.."fleet has arrived in this sector and is planning to create sabotage."..iCamp.."If willing to go out"..iReward.."funds are offered for the destruction of this fleet.\n"
	return iText
end
DTM004[218] = function(iCamp,iEnemyCamp,iReward,iData)
	local iText="You promised to help"..iCamp.."clear from"..iEnemyCamp.."of the threat, if it can be delivered by the specified date"..iEnemyCamp.."fleet is destroyed, you get"..iReward.."point funds as payment. \n Deadline:"..iData
	return iText
end
DTM004[219] = function(iCamp)
	local iText="You have notified"..iCamp.."You can't complete the clearance, I guess the other side won't be happy."
	return iText
end
DTM004[220] = function(iEnemyCamp)
	local iText="You destroyed as promised"..iEnemyCamp.."of the fleet and secretly hoped that the other side would not know who did it."
	return iText
end
DTM004[221] = function(iCamp,iEnemyCamp)
	local iText="You just received a message from your personal terminal: \n understand, it seems that we have to find someone else to clear the information from"..iEnemyCamp.."the threat of the up. \n"..iCamp
	return iText
end
DTM004[221] = function(iCamp,iEnemyCamp)
	local iText="You just received a message from your personal terminal: \n understand, it seems that we have to find someone else to clear the information from"..iEnemyCamp.."the threat of the up. \n"..iCamp
	return iText
end
DTM004[222] = function(iCamp,iEnemyCamp)
	local iText="You just received a message from your personal terminal: \n the agreed deadline has arrived, yet we don't see"..iEnemyCamp.."targets have been destroyed, we regret to inform you that they no longer pose a threat and the previous contract is hereby nullified.\n"..iCamp
	return iText
end
DTM004[223] = function(text)
	local iText="You failed to meet the agreed upon deadline with"..text.."of the procurement contract, I guess the other party will not be happy."
	return iText
end
DTM004[224] = function(iCamp,iEnemyCamp)
	local iText="You failed to meet the agreed upon deadline to help"..iCamp.."destroy"..iEnemyCamp.."the target, I guess the other side will not be happy."
	return iText
end
DTM004[225] = function(iCamp,iEnemyCamp)
	local iText="You just received a message from your personal terminal: \n Thank you for helping us clear the"..iEnemyCamp.."of the threat, the agreed payment has been credited to your account, and we once again express our deep gratitude for your help. \n"..iCamp
	return iText
end
DTM004[226] = "Size:"
DTM004[227] = function(iDate)
	local iText="Due on"..iDate.."Destroy it before"
	return iText
end

-- Patched by TehnoMang
-- DTM004[228] = function(text1,text2,text3,text4,text5,text6,text15,text7,text8,text9,text10,text11,text12,text13)
--	local iText="Your fleet's engineering capabilities are: "..text1..".A total of "..text2.." units of basic alloys, "..text3.." units of slaves, "..text4.." units of medium-sized hull components, "..text5.." units of rats, "..text6.." units of medium-sized weapon components, "..text15.." units of spare crew, "..text7.." units of large hull components, "..text8.." units of large weapon components, "..text9.." units of advanced alloys, "..text10.." units of large modular living quarters, "..text11.." units of flagship weapon components, "..text12.." units of flagship power components, "..text13.." units of humanoid computers. This wreckage area yields no more valuable resources; your fleet must leave."
--	return iText
-- end
DTM004[228] = "Debries field yields no more valuable resources. Your fleet must leave."
DTM004[229] = function(text1)
	local iText = "The current salvage count is "..text1..".\n The more times you salvage, the more materials and types you can obtain, but the stronger enemies will be encountered when leaving the sector."
	return iText
end
DTM004[230] = "No Salvage Found"
--DTM004[229] = function(text1,text2,text3,ext14)
--	local iText="Your fleet's engineering capacity is "..text1..". You have discovered "..text2.." units of basic alloy and "..text3.." units of slaves. Do you want to continue salvaging? The current salvage count is "..text14..". The more times you salvage, the more materials and types you can obtain, but the stronger the enemies you will encounter when leaving the star sector."
--	return iText
--end

--DTM004[230] = function(text1,text2,text3,text4,text5,text14)
--	local iText="Your fleet's engineering capacity is "..text1..". You have discovered "..text2.." units of basic alloy, "..text3.." units of slaves, "..text4.." units of medium hull components, and "..text5.." units of rats. Do you want to continue salvaging? The current salvage count is "..text14.." times. The more times you salvage, the more materials and types you will obtain, but the stronger the enemies you will encounter when leaving the sector."
--	return iText
--end

--DTM004[231] = function(text1,text2,text3,text4,text5,text6,text15,text14)
--	local iText="Your fleet's engineering capacity is "..text1..". You have discovered "..text2.." units of basic alloy, "..text3.." units of slaves, "..text4.." units of medium-sized hull components, "..text5.." units of rats, "..text6.." units of medium-sized weapon parts, "..text15.." units of spare crew. Do you want to continue salvaging? The current salvage count is "..text14.." times. The more times you salvage, the more materials and types you can obtain, but the stronger the enemies you will encounter when leaving the sector."
--	return iText
--end

--DTM004[232] = function(text1,text2,text3,text4,text5,text6,text15,text7,text14)
--	local iText="Your fleet's engineering capacity is "..text1..". You have discovered "..text2.." units of basic alloy, "..text3.." units of slaves, "..text4.." units of medium-sized hull components, "..text5.." units of rats, "..text6.." units of medium-sized weapon parts, "..text15.." units of spare crew members, "..text7.." units of large hull components. Do you want to continue salvaging? The current salvage count is "..text14..". The more times you salvage, the more materials and types you can obtain, but the stronger the enemies you will encounter when leaving the sector."
--	return iText
--end

--DTM004[233] = function(text1,text2,text3,text4,text5,text6,text15,text7,text8,text14)
--	local iText="Your fleet's engineering capacity is "..text1..". You have discovered "..text2.." units of basic alloy, "..text3.." units of slaves, "..text4.." units of medium hull components, "..text5.." units of rats, "..text6.." units of medium weapon parts, "..text15.." units of spare crew, "..text7.." units of large hull components, "..text8.." units of large weapon parts. Do you want to continue salvaging? The current salvage count is "..text14..". The more times you salvage, the more materials and types you can obtain, but the stronger the enemies you will encounter when leaving the star sector."
--	return iText	
--end

--DTM004[234] = function(text1,text2,text3,text4,text5,text6,text15,text7,text8,text9,text14)
--	local iText="Your fleet's engineering capacity is "..text1..". You have discovered "..text2.." units of basic alloys, "..text3.." units of slaves, "..text4.." units of medium hull components, "..text5.." units of rats, "..text6.." units of medium weapon parts, "..text15.." units of spare crew, "..text7.." units of large hull components, "..text8.." units of large weapon parts, "..text9.." units of advanced alloys. Do you want to continue salvaging? The current salvage count is "..text14.." times. The more times you salvage, the more materials and types you can obtain, but the stronger the enemies you will encounter when leaving the star sector."
--	return iText
--end

--DTM004[235] = function(text1,text2,text3,text4,text5,text6,text15,text7,text8,text9,text10,text14)
--	local iText="Your fleet's engineering capacity is "..text1..". A total of "..text2.." units of basic alloys, "..text3.." units of slaves, "..text4.." units of medium-sized hull components, "..text5.." units of rats, "..text6.." units of medium-sized weapon parts, "..text15.." units of spare crew, "..text7.." units of large hull components, "..text8.." units of large weapon parts, "..text9.." units of advanced alloys, "..text10.." units of large modular living quarters. Continue salvaging? Current salvage count is "..text14.." times. More salvage attempts will yield more materials and types, but the enemies encountered when leaving the sector will be stronger."
--	return iText
--end

--DTM004[236] = function(text1,text2,text3,text4,text5,text6,text15,text7,text8,text9,text10,text11,text14)
--	local iText="Your fleet's engineering capacity is "..text1..". A total of "..text2.." units of basic alloys, "..text3.." units of slaves, "..text4.." units of medium hull components, "..text5.." units of rats, "..text6.." units of medium weapon parts, "..text15.." units of spare crew, "..text7.." units of large hull components, "..text8.." units of large weapon parts, "..text9.." units of advanced alloys, "..text10.." units of large modular living quarters, "..text11.." units of flagship weapon parts. Continue salvaging? Current salvage count is "..text14.." times. More salvage attempts will yield more materials and types, but the enemies encountered when leaving the sector will be stronger."
--	return iText
--end

--DTM004[237] = function(text1,text2,text3,text4,text5,text6,text15,text7,text8,text9,text10,text11,text12,text14)
--	local iText="Your fleet's engineering capacity is "..text1..". A total of "..text2.." units of basic alloys, "..text3.." units of slaves, "..text4.." units of medium hull components, "..text5.." units of rats, "..text6.." units of medium weapon parts, "..text15.." units of spare crew, "..text7.." units of large hull components, "..text8.." units of large weapon parts, "..text9.." units of advanced alloys, "..text10.." units of large modular living quarters, "..text11.." units of flagship weapon parts, "..text12.." units of flagship power components. Continue salvaging? Current salvage count is "..text14.." times. More salvage attempts will yield more materials and types, but the enemies encountered when leaving the sector will be stronger."
--	return iText
--end

DTM004[238] = function(text1,text2,text3)
	local iText="Your fleet's engineering capacity is "..text1..". You have discovered "..text2.." units of resources, but your fleet only has "..text3.." units of space, so you must abandon the salvage and leave the sector."
	return iText
end

DTM004[239] = function(text1,text2,text3)
	local iText="The Vaygr base has been severely damaged. Your fleet can now organize a landing operation to temporarily control the base. Your fleet currently has "..text1.." marines. Proceed with the landing? The base's current level is "..text2..". Controlling it requires at least "..text3.." marines. Note: The higher your rank, the more marines your fleet will have, and the less damage you may suffer in the attack."
	return iText
end


DTM004[240] = function(text1,text2,text13,text14,text15,text16,text17,text19,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base. They successfully looted "..text13.." units of luxury goods, "..text14.." units of fortress-class blueprint fragments, "..text15.." units of luxury furniture, "..text16.." units of humanoid computers, "..text17.." units of advanced fortress-class blueprint fragments, and a total of "..text19.." units of various supplies. These resources occupy "..text18.." of your fleet's cargo hold space (if your fleet space is insufficient, you can only salvage a portion of these resources)."
	return iText
end

DTM004[241] = function(text1,text2,text11,text12,text13,text14,text15,text16,text19,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base. You successfully looted "..text11.." units of advanced flagship blueprint fragments, "..text12.." units of Imperial Maids, "..text13.." units of luxury goods, "..text14.." units of fortress-class blueprint fragments, "..text15.." units of luxurious furniture, and "..text16.." units of humanoid computers, in addition to a total of "..text19.." units of various supplies. These resources occupy a total of "..text18.." of your fleet's cargo hold space (if your fleet's space is insufficient, you can only salvage a portion of these resources)."
	return iText
end

DTM004[242] = function(text1,text2,text9,text10,text11,text12,text13,text14,text15,text19,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base. You successfully looted "..text9.." units of repair supplies, "..text10.." units of spare crew, "..text11.." units of advanced flagship blueprint fragments, "..text12.." units of Imperial Maids, "..text13.." units of luxury goods, "..text14.." units of fortress-class blueprint fragments, "..text15.." units of luxurious furniture, and a total of "..text19.." units of various supplies. These resources occupy "..text18.." of your fleet's cargo space (if your fleet space is insufficient, you can only salvage a portion of these resources)."
	return iText
end

DTM004[243] = function(text1,text2,text7,text8,text9,text10,text11,text12,text13,text14,text19,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base. You successfully looted "..text7.." units of medium weapon parts, "..text8.." units of slaves, "..text9.." units of repair supplies, "..text10.." units of spare crew, "..text11.." units of advanced flagship blueprint fragments, "..text12.." units of imperial maids, "..text13.." units of luxury goods, "..text14.." units of fortress-class blueprint fragments, and a total of "..text19.." units of various supplies. These resources occupy "..text18.." of your fleet's cargo space (if your fleet space is insufficient, you can only salvage a portion of these resources)."
	return iText
end

DTM004[244] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, supported by fleet firepower, successfully took control of the base. You also successfully looted "..text3.." units of hydrogen fuel, "..text4.." units of basic supplies, "..text5.." units of rare ore, "..text6.." units of ammunition, "..text7.." units of medium weapon parts, "..text8.." units of slaves, "..text9.." units of repair supplies, "..text10.." units of spare crew, "..text11.." units of advanced flagship blueprint fragments, "..text12.." units of imperial maids, and "..text13.." units of luxury goods. These resources occupy a total of "..text18.." of your fleet's cargo space (if your fleet has insufficient space, you can only salvage a portion of these resources)."
	return iText
end

DTM004[245] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, supported by fleet firepower, successfully took control of the base. You also successfully looted "..text3.." units of hydrogen fuel, "..text4.." units of basic supplies, "..text5.." units of rare ore, "..text6.." units of ammunition, "..text7.." units of medium weapon parts, "..text8.." units of slaves, "..text9.." units of repair supplies, "..text10.." units of spare crew, "..text11.." units of advanced flagship blueprint fragments, and "..text12.." units of Imperial Maids. These resources occupy a total of "..text18.." of your fleet's cargo space (if your fleet has insufficient space, you can only salvage a portion of these resources)."
	return iText
end

DTM004[246] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base. You successfully looted "..text3.." units of hydrogen fuel, "..text4.." units of basic supplies, "..text5.." units of rare ore, "..text6.." units of ammunition, "..text7.." units of medium weapon parts, "..text8.." units of slaves, "..text9.." units of repair supplies, "..text10.." units of spare crew, and "..text11.." units of advanced flagship blueprint fragments. These resources occupy a total of "..text18.." of your fleet's cargo space (if your fleet has insufficient space, you can only salvage a portion of these resources)."
	return iText
end

DTM004[247] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base. You successfully looted "..text3.." units of hydrogen fuel, "..text4.." units of basic supplies, "..text5.." units of rare ore, "..text6.." units of ammunition, "..text7.." units of medium weapon parts, "..text8.." units of slaves, "..text9.." units of repair supplies, and "..text10.." units of spare crew. These resources occupy a total of "..text18.." of your fleet's cargo space (if your fleet has insufficient space, you can only salvage a portion of these resources)."
	return iText
end

DTM004[248] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base. You successfully looted "..text3.." units of hydrogen fuel, "..text4.." units of basic supplies, "..text5.." units of rare ore, "..text6.." units of ammunition, "..text7.." units of medium weapon parts, "..text8.." units of slaves, and "..text9.." units of repair supplies. These resources occupy a total of "..text18.." of your fleet's cargo hold space (if your fleet space is insufficient, you can only salvage a portion of these resources)."
	return iText
end

DTM004[249] = function(text1,text2,text3,text4,text5,text6,text7,text8,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base. You also successfully looted "..text3.." units of hydrogen fuel, "..text4.." units of basic supplies, "..text5.." units of rare ore, "..text6.." units of ammunition, "..text7.." units of medium weapon attachments, and "..text8.." units of slaves. These resources occupy a total of "..text18.." of your fleet's cargo hold space (if your fleet's space is insufficient, you can only salvage a portion of these resources)."
	return iText
end

DTM004[250] = function(text1,text2,text3,text4,text5,text6,text7,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base. They successfully looted "..text3.." units of hydrogen fuel, "..text4.." units of basic supplies, "..text5.." units of rare ore, "..text6.." units of ammunition, and "..text7.." units of medium weapon attachments. These resources occupy a total of "..text18.." of your fleet's cargo space (if your fleet has insufficient space, you can only salvage a portion of these resources)."
	return iText
end

DTM004[251] = function(text1,text2,text3,text4,text5,text6,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base. They also successfully looted "..text3.." units of hydrogen fuel, "..text4.." units of basic supplies, "..text5.." units of rare ore, and "..text6.." units of ammunition. These resources occupy a total of "..text18.." of your fleet's cargo hold space (if your fleet's space is insufficient, you can only salvage a portion of these resources)."
	return iText
end

DTM004[252] = function(text1,text2,text3,text4,text5,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base. They also successfully looted "..text3.." units of hydrogen fuel, "..text4.." units of basic supplies, and "..text5.." units of rare ore. These resources occupy a total of "..text18.." of your fleet's cargo hold space (if your fleet's space is insufficient, you can only salvage a portion of these resources)."
	return iText
end

DTM004[253] = function(text1,text2,text3,text4,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base. They also successfully looted "..text3.." units of hydrogen fuel and "..text4.." units of basic supplies. These resources occupy a total of "..text18.." of your fleet's cargo hold space (if your fleet space is insufficient, you can only salvage a portion of these resources)."
	return iText
end

DTM004[254] = function(text1,text2,text3,text18)
	local iText="Your fleet has a total of "..text1.." marines. After suffering "..text2.." casualties, your marines, with the support of fleet firepower, successfully took control of the base and successfully looted "..text3.." units of hydrogen fuel. These resources occupy a total of "..text18.." of your fleet's cargo hold space (if your fleet space is insufficient, you can only salvage a portion of these resources)."
	return iText
end

DTM004[255] = function(text1)
	local iText="The commander of Vaygr Base, after assessing your fleet's combat strength, has decided to spare your life. You can choose whether to consume "..text1.." honor points to leave this map (Staying in this sector will attract the pursuit of the Vaygr fleet)."	
	return iText
end

DTM004[256] = function(text1,text2,text3)
	local iText="You have defeated the Vaygr fleet and removed the interference of the gravitational field. In addition, you have received a reward of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points. Furthermore, the fleet will launch a salvage operation to clean up the battlefield."
	return iText
end

DTM004[257] = function(text1,text2,text3)
	local iText="After looting the Vaygr base, you detonated it. In this battle, you received a total of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points as rewards."
	return iText
end

DTM004[258] = function(text1,text2,text3,text4)
	local iText="After repelling the Vaygr fleet, the merchant fleet leader thanked you and paid you extra rewards. A total of "..text1.." merchant ships survived the battle, and you received a total of "..text2.." funds, "..text3.." combat experience, and "..text4.." honor points as compensation. Additionally, the merchant fleet leader will also gift you a special blueprint fragment as a reward."
	return iText
end

DTM004[259] = function(text1,text2,text3)
	local iText="You successfully defended the base. In this battle, you have received a total of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points as rewards. To thank you for your contribution, the base commander has specially opened a secret supply shop for you to purchase items."	
	return iText
end

DTM004[260] = function(text1,text2,text3,text4)
	local iText="You successfully repelled the attacking Vigel fleet. In this battle, you received a total of "..text1.." funds, "..text2.." battle experience, and "..text3.." honor points as rewards. Do you want to continue salvaging? You have currently salvaged "..text4.." times."
	return iText
end

DTM004[261] = function(text1,text2,text3,text4)
	local iText="You destroyed all the ancestral warships. In this battle, you received a total of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points as rewards. Additionally, while cleaning up the battlefield, you also retrieved "..text4.." ancestral relics from the wreckage."	
	return iText
end

DTM004[262] = function(text1,text2,text3,text4)
	local iText="You destroyed all the ancestral warships. In this battle, you received a total of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points as rewards. In addition, while cleaning up the battlefield, you also retrieved "..text4.." ancestral relics from the wreckage. Unfortunately, due to insufficient cargo space, you could not carry these supplies."	
	return iText
end

DTM004[263] = function(text1,text2,text3,text4)
	local iText="You destroyed all the ancestral warships. In this battle, you received a total of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points as rewards. In addition, while cleaning up the battlefield, you also retrieved "..text4.." ancestral relics from the wreckage. Unfortunately, due to insufficient cargo space, you could not carry these supplies."
	return iText
end

DTM004[264] = function(text1)
	local iText="Your fleet is low on hyperspace fuel. Jumping requires "..text1.." of hyperspace fuel. Do you wish to urgently purchase hyperspace fuel from the black market merchant using half of your account's funds?"
	return iText
end

DTM004[265] = function(text1)
	local iText="Emergency jump requires "..text1.." antimater fuel units."
	return iText
end


DTM004[266] = function(text1,text2,text3)
	local iText="You have defeated the Vaygr fleet. In addition, you have received "..text1.." in funds, "..text2.." in combat experience, "..text3.." in honor points, and 2 blueprint fragments as rewards. Furthermore, the fleet will conduct a salvage operation to clean up the battlefield."
	return iText
end


DTM004[267] = function(text1,text2,text3,text4)
	local iText="You annihilated the entire Zerg fleet. In this battle, you received a total of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points as rewards. Additionally, while cleaning up the battlefield, you also retrieved "..text4.." tentacles from the wreckage."
	return iText
end

DTM004[268] = function(text1,text2,text3,text4)
	local iText="You annihilated the entire Zerg fleet. In this battle, you received a total of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points as rewards. Additionally, while cleaning up the battlefield, you also retrieved "..text4.." tentacles from the wreckage. Unfortunately, due to insufficient cargo space, you couldn't carry these supplies."
	return iText
end

DTM004[269] = function(text1,text2,text3,text4)
	local iText="You annihilated the entire Coffin Fleet. In this battle, you received a total of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points as rewards. Additionally, while cleaning up the battlefield, you also obtained "..text4.." rare ores from the wreckage."
	return iText
end

DTM004[270] = function(text1,text2,text3,text4)
	local iText="You annihilated the entire Coffin Fleet. In this battle, you received a total of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points as rewards. Additionally, while cleaning up the battlefield, you also obtained "..text4.." rare ores from the wreckage. Unfortunately, due to insufficient cargo space, you could not carry these supplies."
	return iText
end

DTM004[271] = function(text1,text2,text3,text4,text5)
	local iText="You destroyed the entire Vaygr merchant fleet, and you also received a reward of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points. Furthermore, while cleaning up the battlefield, you also obtained "..text4.." slaves, "..text5.." luxury goods from the wreckage, and also discovered a special blueprint fragment as an additional bonus."
	return iText
end


DTM004[272] = function(text1,text2,text3,text4,text5)
	local iText="You destroyed the entire Vaygr merchant fleet, and you also received a reward of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points. Furthermore, while cleaning up the battlefield, you also obtained "..text4.." slaves and "..text5.." luxury goods from the wreckage. Unfortunately, due to insufficient cargo space, you couldn't carry these supplies. However, you also discovered a special blueprint fragment as an extra bonus while cleaning up the battlefield."
	return iText
end

DTM004[273] = function(text1,text2,text3,text4)
	local iText="You annihilated all the crystals. In this battle, you received a total of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points. Additionally, while cleaning up the battlefield, you also obtained "..text4.." nanomaterials from the wreckage."
	return iText
end

DTM004[274] = function(text1,text2,text3,text4)
	local iText="You annihilated all the crystals. In this battle, you received a total of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points as rewards. In addition, while cleaning up the battlefield, you also obtained "..text4.." nanomaterials from the wreckage. Unfortunately, due to insufficient cargo space, you cannot carry these supplies."
	return iText
end

DTM004[275] = function(text1,text2,text3,text4,text5)
	local iText="You destroyed the Vaygr base before reinforcements arrived. Due to the complete destruction, only a small amount of loot could be looted from the ruins. You found "..text1.." as a reward, "..text2.." as combat experience, and "..text3.." as honor points. Additionally, while cleaning up the battlefield, you also obtained "..text4.." slaves and "..text5.." luxury items from the wreckage. Furthermore, you discovered a special blueprint fragment as an extra bonus."
	return iText
end

DTM004[276] = function(text1,text2,text3,text4,text5)
	local iText="You destroyed the Vaygr base before reinforcements arrived. Due to the extensive damage, only a small amount of loot could be looted from the ruins. You found "..text1.." as a reward, "..text2.." as combat experience, and "..text3.." as honor points. Additionally, while cleaning up the battlefield, you also obtained "..text4.." slaves and "..text5.." luxury items from the wreckage. Unfortunately, due to insufficient cargo space, you couldn't carry these supplies. However, you also found a special blueprint fragment as an extra bonus while cleaning up the battlefield."
	return iText
end

DTM004[277] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10)
	local iText="Your colony currently has a population of "..text1..", a security level of "..text2..", a colony threat level of "..text3..", and "..text4.." of colony fleet points. The current colony building level is "..text5..", "..text6..", "..text7..", "..text8..", "..text9..", "..text10..""	
	return iText
end


DTM004[278] = function(text1)
	local iText="Your fleet points are currently only "..text1.." points, which is insufficient to summon a fleet of this size at the moment."
	return iText
end

DTM004[279] = function(text1)
	local iText="The fleet you summoned is currently entering the battlefield in batches. You still have "..text1.." points of fleet points remaining unused. Do you wish to recall the fleet and withdraw from the battlefield?"
	return iText
end

DTM004[280] = function(text1)
	local iText="The colony fleet has withdrawn, and a total of "..text1.." fleet points have been recovered."
	return iText
end



DTM004[281] = function(text1)
	local iText="Your resource exploration fleet has discovered a"..text1.."Ice mineral belt"
	return iText
end



DTM004[282] = "small"
DTM004[283] = "medium"
DTM004[284] = "large"
DTM004[285] = "giant"
DTM004[286] = "super giant"


DTM004[290] = function(text1,text2,text3)
	local iText="You destroyed the entire base and the subsequent reinforcement fleet. In this battle, you received a total of "..text1.." funds, "..text2.." combat experience, and "..text3.." honor points as rewards."
	return iText
end


DTM004[291] = function(text1)
	local iText="Your fleet points are currently only "..text1.." points, and you are temporarily unable to dispatch a fleet of this size."
	return iText
end


DTM004[292] = function(text1,text2,text3)
	local iText="The pirate base has been severely damaged. Your fleet can now organize a landing operation to temporarily control the base. Your fleet currently has "..text1.." marines. Proceed with the landing? The base's current level is "..text2..". Controlling it requires at least "..text3.." marines. Note: The higher your rank, the more marines your fleet will have, and the less damage you may suffer during the attack."
	return iText
end


DTM004[293] = function(text1,text2,text3)
	local iText="You have defeated the Vaygr warlord fleet and removed the interference of the gravity field. In addition, you have received a reward of "..text1.." in funds, "..text2.." in combat experience, and "..text3.." in honor points. Furthermore, the fleet will launch a salvage operation to clean up the battlefield."
	return iText
end

DTM004[294] = function(text1,text2,text3)
	local iText="You have defeated the Fai'ry Heavy Industries fleet. In addition, you have received "..text1.." in funds, "..text2.." in combat experience, "..text3.." in honor points, and 1 blueprint fragment as a reward. Furthermore, the fleet will conduct a salvage operation to clean up the battlefield."
	return iText
end

DTM004[295] = function(text1,text2,text3,text4)
	local iText="You have defeated "..text4..", and in addition, you have received "..text1.." in funds, "..text2.." in combat experience, "..text3.." in honor points, and 1 blueprint fragment as a reward. Furthermore, the fleet will conduct a salvage operation to clean up the battlefield."
	return iText
end


DTM004[296] = function(text1,text2,text3)
	local iText=""..text1.."scale was reduced"..text2.."point"..text3..""
	return iText
end

DTM004[297] = ", because you have completely destroyed the natural disaster, no new natural disasters will occur for a period of time."

DTM004[298] = function(text1,text2)
	local iText="We discovered a "..text1.." debris field nearby. There may still be usabale salvage and survivios there. Judging by the scale, it looks like a "..text2.." rescue operation could be possible. Should we mount a rescue operation?"	
	return iText
end





KE04missionTXT = {}
KE04missionTXT[001] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10)
	local iText="You dispatched a fleet"..text1.." After several days of exploration, your fleet discovered a place"..text2..""..text3.." After deliberation, the fleet commander decided to take action on"..text3..""..text4..","..text5..","..text6..""..text7..", exploring the area near"..text8..""..text9..""..text10..""	
	return iText
end




KE04missionTXTLV01A01 = {}
KE04missionTXTLV01A01[001] = "small"
KE04missionTXTLV01A01[002] = "medium"
KE04missionTXTLV01A01[003] = "large"
KE04missionTXTLV01A01[004] = "super large"
KE04missionTXTLV01A01[005] = "giant"


KE04missionTXTLV01A02 = {}
KE04missionTXTLV01A02[001] = "small"
KE04missionTXTLV01A02[002] = "medium"
KE04missionTXTLV01A02[003] = "large"
KE04missionTXTLV01A02[004] = "super large"
KE04missionTXTLV01A02[005] = "giant"

KE04missionTXTLV01A03 = {}
KE04missionTXTLV01A03[001] = "ice asteroid belt"
KE04missionTXTLV01A03[002] = "asteroid belt"
KE04missionTXTLV01A03[003] = "abandoned energy facilities"
KE04missionTXTLV01A03[004] = "abandoned residential areas"
KE04missionTXTLV01A03[005] = "abandoned ammunition depot"
KE04missionTXTLV01A03[006] = "abandoned steel smelting facilities"
KE04missionTXTLV01A03[007] = "scrap parts factory"
KE04missionTXTLV01A03[008] = "abandoned advanced treatment facilities"
KE04missionTXTLV01A03[009] = "abandoned shipyard"
KE04missionTXTLV01A03[010] = "abandoned battlefield"
KE04missionTXTLV01A03[011] = "secret pirate base"
KE04missionTXTLV01A03[012] = "secret research station"

KE04missionTXTLV01A04 = {}
KE04missionTXTLV01A04[001] = "mining"
KE04missionTXTLV01A04[002] = "explore"
KE04missionTXTLV01A04[003] = "conduct reconnaissance"

KE04missionTXTLV01A05 = {}
KE04missionTXTLV01A05[001] = "fortunately"
KE04missionTXTLV01A05[002] = "but"
KE04missionTXTLV01A05[003] = "fnfortunately"



KE04missionTXTLV02A01 = {}
KE04missionTXTLV02A01[001] = "mining"
KE04missionTXTLV02A01[002] = "explore"
KE04missionTXTLV02A01[003] = "investigation"

KE04missionTXTLV02A02 = {}
KE04missionTXTLV02A02[001] = "It's going very smoothly."
KE04missionTXTLV02A02[002] = "It's not going very well."
KE04missionTXTLV02A02[003] = "An accident occurred"
KE04missionTXTLV02A02[004] = "A serious accident has occurred."
KE04missionTXTLV02A02[005] = "I've run into big trouble"

KE04missionTXTLV02A03 = {}
KE04missionTXTLV02A03[001] = "No enemy fleet detected."
KE04missionTXTLV02A03[002] = "A small amount was found"
KE04missionTXTLV02A03[003] = "Encountered a large number of"
KE04missionTXTLV02A03[004] = "Encountered a massive amount"
KE04missionTXTLV02A03[005] = "Encountered a terrifying scale"

KE04missionTXTLV02A04 = {}
KE04missionTXTLV02A04[001] = ""
KE04missionTXTLV02A04[002] = "Pirate Fleet"
KE04missionTXTLV02A04[003] = "The Out-of-Control Ancestral Fleet"
KE04missionTXTLV02A04[004] = "Crystal Fleet"
KE04missionTXTLV02A04[005] = "Swarm"
KE04missionTXTLV02A04[006] = "Vaygr Warlord Fleet"
KE04missionTXTLV02A04[007] = "Coffin Fleet"

KE04missionTXTLV03A00 = {}
KE04missionTXTLV03A00[001] = ""
KE04missionTXTLV03A00[002] = "After a battle, your fleet"

KE04missionTXTLV03A01 = {}
KE04missionTXTLV03A01[000] = ""
KE04missionTXTLV03A01[001] = "A resounding victory"
KE04missionTXTLV03A01[002] = "To achieve victory"
KE04missionTXTLV03A01[003] = "A lose-lose situation with the opponent"
KE04missionTXTLV03A01[004] = "The losses are considerable."
KE04missionTXTLV03A01[005] = "Suffered severe losses"

KE04missionTXTLV03A02 = {}
KE04missionTXTLV03A02[000] = ""
KE04missionTXTLV03A02[001] = ", approximately"
KE04missionTXTLV03A02[002] = ", approximately"
KE04missionTXTLV03A02[003] = ", up to"
KE04missionTXTLV03A02[004] = ", up to"
KE04missionTXTLV03A02[005] = ", almost"

KE04missionTXTLV03A03 = {}
KE04missionTXTLV03A03[001] = ""
KE04missionTXTLV03A03[002] = "One fleet's worth of warships were damaged."

KE04missionTXTLV03A04 = {}
KE04missionTXTLV03A04[000] = ""
KE04missionTXTLV03A04[001] = ""
KE04missionTXTLV03A04[002] = ""
KE04missionTXTLV03A04[003] = "Retreat is the only option."
KE04missionTXTLV03A04[004] = "Retreat is the only option."
KE04missionTXTLV03A04[005] = "Retreat is the only option."

KE04missionTXTLV03A05 = {}
KE04missionTXTLV03A05[001] = ""
KE04missionTXTLV03A05[002] = "After the enemy fleet retreated, "

KE04missionTXTLV03A06 = {}
KE04missionTXTLV03A06[001] = "units of ice"
KE04missionTXTLV03A06[002] = "units of energy block"
KE04missionTXTLV03A06[003] = "units of metal ore"
KE04missionTXTLV03A06[004] = "units of daily necessities"
KE04missionTXTLV03A06[005] = "units of colonial ammunition"
KE04missionTXTLV03A06[006] = "units of alloys"
KE04missionTXTLV03A06[007] = "units of mechanical parts"
KE04missionTXTLV03A06[008] = "units of nanomaterials"
KE04missionTXTLV03A06[009] = "units of large ship hulls"
KE04missionTXTLV03A06[010] = "units of flagship core components"
KE04missionTXTLV03A06[011] = "they were enslaved and transformed into colonial workers."
KE04missionTXTLV03A06[012] = "fortress-level blueprint fragments"  

KE04missionTXTLV03A07 = {}
KE04missionTXTLV03A07[001] = ", it's worth mentioning that due to the clashes between your colonial fleet and the pirate fleet, the pirates have set their sights on your colony, and the pirate threat level has increased by 1 point."
KE04missionTXTLV03A07[002] = ""

KE04missionTXTLV04A01 = {}
KE04missionTXTLV04A01[001] = ""
KE04missionTXTLV04A01[002] = "Your fleet is"

KE04missionTXTLV04A02 = {}
KE04missionTXTLV04A02[001] = ""
KE04missionTXTLV04A02[002] = "In China"  

KE04missionTXTLV04A03 = {}
KE04missionTXTLV04A03[001] = ""
KE04missionTXTLV04A03[002] = "The action, in the end"  

KE04missionTXTLV04A04 = {}
KE04missionTXTLV04A04[001] = ""
KE04missionTXTLV04A04[002] = "It was obtained"  

KE04missionTXT[002] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16)
	local iText=""..text1..""..text2..""..text3..""..text4..""..text5..""..text6..""..text7..""..text13..""..text8..""..text14..""..text9..""..text15..""..text8..""..text16..""..text10..""..text11..""..text12..""
	return iText
end

factoryattackLVTXT = {}
factoryattackLVTXT[001] = ""
factoryattackLVTXT[002] = "A pirate fleet has already established a temporary base nearby, and they could launch an attack on your fleet from this pirate base at any time." 


factoryattackLVTXTA01 = {}
factoryattackLVTXTA01[001] = ""
factoryattackLVTXTA01[002] = "A"  

factoryattackLVTXTA02 = {}
factoryattackLVTXTA02[001] = "Pirate Fleet"
 

factoryattackLVTXTA03 = {}
factoryattackLVTXTA03[001] = ""
factoryattackLVTXTA03[002] = "Already nearby"

factoryattackLVTXTA04 = {}
factoryattackLVTXTA04[001] = ""
factoryattackLVTXTA04[002] = "A temporary base was built"
factoryattackLVTXTA04[003] = "A fleet was assembled"

factoryattackLVTXTA05 = {}
factoryattackLVTXTA05[001] = ""
factoryattackLVTXTA05[002] = "The enemy could attack your colony at any time."




factoryattackLVTXT[003] = function(text1,text2)
	local iText="The size of "..text1.." has increased, meaning more "..text1.." will gather near the colony; the current threat level is "..text2..""
	return iText
end


factoryattackLVTXTLVA01 = {}
factoryattackLVTXTLVA01[001] = "small"
factoryattackLVTXTLVA01[002] = "medium"
factoryattackLVTXTLVA01[003] = "large"
factoryattackLVTXTLVA01[004] = "giant"
factoryattackLVTXTLVA01[005] = "epic"

factoryattackLVTXTLVA02 = {}
factoryattackLVTXTLVA02[001] = "much smaller"
factoryattackLVTXTLVA02[002] = "less than"
factoryattackLVTXTLVA02[003] = "not weaker than"
factoryattackLVTXTLVA02[004] = "stronger than"
factoryattackLVTXTLVA02[005] = "far stronger than"

factoryattackLVTXTLVA03 = {}
factoryattackLVTXTLVA03[001] = "Outer mining fleet of the colony"
factoryattackLVTXTLVA03[002] = "Patrol fleets on the outskirts of the colony"
factoryattackLVTXTLVA03[003] = "The core area of ??the colony"
factoryattackLVTXTLVA03[004] = "Colonial defenses"
factoryattackLVTXTLVA03[005] = "The core building complex of the colony"

factoryattackLVTXTLVA04 = {}
factoryattackLVTXTLVA04[001] = "An interceptor fleet was dispatched to intercept it."
factoryattackLVTXTLVA04[002] = "Assemble the fleet and engage in a decisive battle with the enemy."
factoryattackLVTXTLVA04[003] = "Assemble all warships"
factoryattackLVTXTLVA04[004] = "Activate all defenses to resist."
factoryattackLVTXTLVA04[005] = "All security personnel were mobilized to defend the core building complex."
factoryattackLVTXTLVA04[006] = "The only option was to give up resistance and evacuate."

factoryattackbaseLVTXTLVA09 = {}
factoryattackbaseLVTXTLVA09[001] = "Suffering heavy losses, they chose to retreat."
factoryattackbaseLVTXTLVA09[002] = "Suffered considerable casualties"
factoryattackbaseLVTXTLVA09[003] = "Both sides suffered heavy losses."
factoryattackbaseLVTXTLVA09[004] = "We gained the upper hand and achieved considerable results."
factoryattackbaseLVTXTLVA09[005] = "A resounding victory"

factoryattackLVTXTLVA06 = {}
factoryattackLVTXTLVA06[000] = ""
factoryattackLVTXTLVA06[001] = ". Your colonial fleet has cleaned up the battlefield and gained"
factoryattackLVTXTLVA06[002] = ". Your colonies have lost a total of"
factoryattackLVTXTLVA06[003] = "Slaves were converted into colonial workers,"
factoryattackLVTXTLVA06[004] = "Units of alloys,"
factoryattackLVTXTLVA06[005] = "units of colonial ammunition"
factoryattackLVTXTLVA06[006] = "fleet points,"
factoryattackLVTXTLVA06[007] = "colonial workers,"
factoryattackLVTXTLVA06[008] = "Fortunately, a nearby Imperial patrol fleet arrived to provide support, preventing further destruction."

factoryattackLVTXTLVA07 = {}
factoryattackLVTXTLVA07[001] = "slaves and converted into colonial workers,"
factoryattackLVTXTLVA07[002] = "Nanomaterial storage"
factoryattackLVTXTLVA07[003] = "Food reserves"
factoryattackLVTXTLVA07[004] = "Ore reserves"
factoryattackLVTXTLVA07[005] = "Daily necessities reserves"
factoryattackLVTXTLVA07[006] = "Electronic component reserves"

factoryattackLVTXTLVA08 = {}
factoryattackLVTXTLVA08[001] = "Crystal Cluster"
factoryattackLVTXTLVA08[002] = "Zerg Swarm"
factoryattackLVTXTLVA08[003] = "Coffin Fleet"
factoryattackLVTXTLVA08[004] = "Mysterious Warlord Fleet"
factoryattackLVTXTLVA08[005] = "Awakening Ancestor Fleet"


factoryattackLVTXT[004] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16,text17,text18)
	local iText="A"..text1..""..text18.."An attack was launched on your colony, due to"..text18.."scale"..text2.."The security forces of your colony, therefore"..text18.."select attack"..text3..". Face"..text18.."offensive, colonial security forces"..text4..".After a fierce battle,"..text18..""..text5..""..text6..""..text7..""..text8..""..text9..""..text10..""..text11..""..text12..""..text13..""..text14..""..text15..""..text16..""..text17..""
	return iText
end




KE05missionTXTLV01A01 = {}
KE05missionTXTLV01A01[001] = "????"
KE05missionTXTLV01A01[002] = "????"
KE05missionTXTLV01A01[003] = "????"
KE05missionTXTLV01A01[004] = "?????"
KE05missionTXTLV01A01[005] = "?????"

KE05missionTXTLV01A02 = {}
KE05missionTXTLV01A02[001] = "???"
KE05missionTXTLV01A02[002] = "??"
KE05missionTXTLV01A02[003] = "???"
KE05missionTXTLV01A02[004] = "??"
KE05missionTXTLV01A02[005] = "???"

KE05missionTXTLV01A03 = {}
KE05missionTXTLV01A03[001] = ""
KE05missionTXTLV01A03[002] = ""
KE05missionTXTLV01A03[003] = ""
KE05missionTXTLV01A03[004] = ""
KE05missionTXTLV01A03[005] = ""

KE05missionTXTLV01A04 = {}
KE05missionTXTLV01A04[001] = "????"
KE05missionTXTLV01A04[002] = "????????"
KE05missionTXTLV01A04[003] = "?????????"
KE05missionTXTLV01A04[004] = "????????"
KE05missionTXTLV01A04[005] = "???????,????"      


factoryattackLVTXTLVA05 = {}
factoryattackLVTXTLVA05[001] = ""
factoryattackLVTXTLVA05[002] = ".?????"
factoryattackLVTXTLVA05[003] = "????????."
factoryattackLVTXTLVA05[004] = "???????????,?????????????"
factoryattackLVTXTLVA05[005] = "???,"
factoryattackLVTXTLVA05[006] = "???????," 
factoryattackLVTXTLVA05[007] = "???????," 
factoryattackLVTXTLVA05[008] = "?????????," 
factoryattackLVTXTLVA05[009] = "??????," 
factoryattackLVTXTLVA05[010] = "???????" 
factoryattackLVTXTLVA05[011] = ".?????????????????????,??????????????"  



factoryattackLVTXTLVA09 = {}
factoryattackLVTXTLVA09[001] = ""
factoryattackLVTXTLVA09[002] = "????????"
factoryattackLVTXTLVA09[003] = "???????,???????????,?????????????????"


factoryattackbaseLVTXTLVA10 = {}
factoryattackbaseLVTXTLVA10[001] = ""
factoryattackbaseLVTXTLVA10[002] = ",?????????????1?"
factoryattackbaseLVTXTLVA10[003] = ",????????????1?"
factoryattackbaseLVTXTLVA10[004] = ",????????????1?"
factoryattackbaseLVTXTLVA10[005] = ",????????????????1?"  
factoryattackbaseLVTXTLVA10[006] = ",???????????????1?"   

KE05missionTXT = {}
KE05missionTXT[001] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16,text17,text18,text19,text20,text22,text23)
	local iText="??????"..text1.."??????,?"..text23.."?????,??????"..text2..""..text23..""..text3.."????????,?????"..text4.."?????????????"..text5.."?????"..text6..""..text22..""..text7..""..text8..""..text9..""..text10..""..text11..""..text12..""..text13..""..text14..""..text15..""..text16..""..text17..""..text18..""..text19..""..text20..""
	return iText
end


KE05missionTXT[002] = function(text1,text2,text3,text4,text5,text23)
	local iText="??????"..text1.."??????,?"..text23.."?????,??????"..text2..""..text23..""..text3.."????????,?????"..text4.."?????????????"..text5.."?????"
	return iText
end

KE05missionTXT[003] = function(text1,text2,text3,text4)
	local iText="?????????"..text1.."??"..text2.."??,?????,????????????,??????????"..text3.."???"..text4..""
	return iText
end


KE05missionTXT[004] = function(text1,text2)
	local iText="????????"..text1.."???????,???????????,?????????????????"..text2..""
	return iText
end

KE05missionTXT[005] = function(text1)
	local iText=""..text1.."???????????,???????????????????"..text1.."????"
	return iText
end


missionmapATTACKfactoryTXT = {}
missionmapATTACKfactoryTXT[001] = function(text1,text2,text3)
	local iText="????????,??????????,?????????"..text1.."??????"..text2.."???????"..text3.."????????,??????????????,???????"
	return iText
end

missionmapATTACKfactoryTXT[002] = function(text1,text2,text3)
	local iText="???????????????,?????????????,??????????????,?????????"..text1.."??????"..text2.."???????"..text3.."????????,??????????????,???????"
	return iText
end

missionmapATTACKfactoryTXT[003] = function(text1,text2,text3)
	local iText="??????????????????,?????????????,??????????????,?????????"..text1.."??????"..text2.."???????"..text3.."????????,??????????????,???????"
	return iText
end

missionmapATTACKfactoryTXT[004] = function(text1)
	local iText="???????"..text1.."???,??????????????"
	return iText
end

missionmapATTACKfactoryTXT[005] = function(text1)
	local iText="??????"..text1.."??????????????"..text1.."???????????,????????????????,????????"..text1.."??"
	return iText
end

missionattackLVTXTLVA01 = {}
missionattackLVTXTLVA01[001] = "?????"
missionattackLVTXTLVA01[002] = "????"
missionattackLVTXTLVA01[003] = "????"
missionattackLVTXTLVA01[004] = "?????"
missionattackLVTXTLVA01[005] = "????"


mapattackLVTXTLVA01 = {}
mapattackLVTXTLVA01[001] = "?????"
mapattackLVTXTLVA01[002] = "????"
mapattackLVTXTLVA01[003] = "????"
mapattackLVTXTLVA01[004] = "????????"
mapattackLVTXTLVA01[005] = "??????"

mapattackLVTXTLVA02 = {}
mapattackLVTXTLVA02[001] = "??????????????,????????????????????????"
mapattackLVTXTLVA02[002] = "???????????????????????,????????????"
mapattackLVTXTLVA02[003] = "??????????????????"
mapattackLVTXTLVA02[004] = "??????????????????????"
mapattackLVTXTLVA02[005] = "??????????????????????"


mapattackbattleLVTXTLVA01 = {}
mapattackbattleLVTXTLVA01[001] = "?????"
mapattackbattleLVTXTLVA01[002] = "????"
mapattackbattleLVTXTLVA01[003] = "????"
mapattackbattleLVTXTLVA01[004] = "????????"
mapattackbattleLVTXTLVA01[005] = "?????"

mapattackbattleLVTXTLVA02 = {}
mapattackbattleLVTXTLVA02[001] = "???"
mapattackbattleLVTXTLVA02[002] = "????"
mapattackbattleLVTXTLVA02[003] = "???"
mapattackbattleLVTXTLVA02[004] = "????"
mapattackbattleLVTXTLVA02[005] = "????"

mapattacksystemLVTXTLVA01 = {}
mapattacksystemLVTXTLVA01[001] = "??"
mapattacksystemLVTXTLVA01[002] = "??"
mapattacksystemLVTXTLVA01[003] = "??"
mapattacksystemLVTXTLVA01[004] = "????"
mapattacksystemLVTXTLVA01[005] = "????"

mapattacksystemLVTXTLVA02 = {}
mapattacksystemLVTXTLVA02[001] = "????"
mapattacksystemLVTXTLVA02[002] = "??"
mapattacksystemLVTXTLVA02[003] = "????"
mapattacksystemLVTXTLVA02[004] = "?????"
mapattacksystemLVTXTLVA02[005] = "????"
mapattacksystemLVTXTLVA02[006] = "???"

mapattackLVTXTLVA03 = {}
mapattackLVTXTLVA03[001] = "??????????"
mapattackLVTXTLVA03[002] = "??????"
mapattackLVTXTLVA03[003] = "?????????????????????"
mapattackLVTXTLVA03[004] = "?????"
mapattackLVTXTLVA03[005] = "????????"

mapattackTXT = {}
mapattackTXT[001] = function(text1,text2,text3,text4)
	local iText=""..text1.."??????,???"..text2.."?,"..text3..",????"..text4.."??????????"
	return iText
end



mapattackTXT[002] = function(text1,text2,text3)
	local iText="??"..text1.."????????,????"..text1.."?"..text2.."??,????????????????????,????????????????????"
	return iText
end

mapattackTXT[003] = function(text1,text2,text3)
	local iText="???????????,"..text1.."?????"..text2.."?????,??????????????,????"..text3.."???"..text1.."???????????"
	return iText
end

mapattackTXT[004] = function(text1,text2,text3)
	local iText="???????????,"..text1.."?????"..text2.."?????,??????????,?????"..text1.."?????????,???????????????????????"
	return iText
end


mapattackTXT[005] = function(text1)
	local iText="??"..text1.."?????,????????????????,????????????????????????????"
	return iText
end

mapattackTXT[006] = function(text1,text2)
	local iText="????????"..text1.."??,"..text2.."??????????,????????????"..text1.."??????"
	return iText
end

mapattackTXT[007] = function(text1,text2)
	local iText=""..text1.."????"..text2.."??????,?????"..text2.."?????????????"..text1.."?????????"..text2.."?????"
	return iText
end

mapattackTXT[008] = function(text1)
	local iText=""..text1.."???????,???????"
	return iText
end

mapattackTXT[009] = function(text1)
	local iText="?????????????,"..text1.."??????????,?????????????????????"
	return iText
end

mapattackTXT[010] = function(text1,text2)
	local iText="??"..text1.."????????,??????????"..text2.."?,?????????????"
	return iText
end

mapattackTXT[011] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16,text17,text18,text19,text20,text21,text22,text23,text24,text25,text26,text27,text28,text29,text30,text31,text32,text33,text34,text35)
	local iText="??"..text1.."????????,??????????"..text2.."?,????????"..text3..""..text4..""..text5..""..text6..""..text7..""..text8..""..text9..""..text10..""..text11..""..text12..""..text13..""..text14..""..text15..""..text16..""..text17..""..text18..""..text19..""..text20..""..text21..""..text22..""..text23..""..text24..""..text25..""..text26..""..text27..""..text28..""..text29..""..text30..""..text31..""..text32..""..text33..""..text34..""..text35..""
	return iText
end

mapattackTXT[012] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16,text17,text18,text19,text20,text21,text22,text23,text24,text25,text26,text27,text28,text29,text30,text31,text32,text33,text34,text35)
	local iText="??????????"..text3..""..text4..""..text5..""..text6..""..text7..""..text8..""..text9..""..text10..""..text11..""..text12..""..text13..""..text14..""..text15..""..text16..""..text17..""..text18..""..text19..""..text20..""..text21..""..text22..""..text23..""..text24..""..text25..""..text26..""..text27..""..text28..""..text29..""..text30..""..text31..""..text32..""..text33..""..text34..""..text35..""
	return iText
end

mapattackTXT[013] = function(text1,text2)
	local iText="?????????????"
	return iText
end

mapattackTXTEND = {}
mapattackTXTEND[001] = function(text1,text2,text3,text4,text5,text6,text7)
	local iText="??????"..text1.."???,????????"..text2..",??"..text3.."?"..text1.."?????"..text4.."???,??????????????"..text5.."??????"..text6.."???????"..text7.."????????"
	return iText
end

mapattackTXTEND[002] = function(text1,text2,text3)
	local iText="????????"..text1.."????????1?,???????"..text2.."???"..text3..""
	return iText
end

mapattackTXTEND[003] = function(text1)
	local iText="????????"..text1.."????????1?,?????????,???????????????"
	return iText
end

mapattackTXTEND[004] = function(text1,text2,text4,text5,text6,text7)
	local iText="??????"..text1.."???,????????"..text2..",??????"..text1.."?????"..text4.."???,??????????????"..text5.."??????"..text6.."???????"..text7.."????????"
	return iText
end

mapattackTXTEND[005] = function(text2,text3)
	local iText="?????????????"..text2.."???"..text3..""
	return iText
end

mapattackTXTEND[006] = function(text2,text3)
	local iText="?????????????"..text2.."???"..text3.."????????????????,???????????????"
	return iText
end


shipUITXT = {}
shipUITXT[000] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10)
	local iText="??"..text1.."??"..text2.."?????,"..text3.."?????,"..text4.."???"..text5..","..text6.."??????????,???????"..text7.."?????,"..text8.."??????,"..text9.."???"..text5..","..text10.."?????,????"
	return iText
end



shipUITXT[001] = function(text1,text2,text3)
	local iText=""..text1.."????????,?????????"..text2.."?,????????"..text3.."?"
	return iText
end

shipUITXT[002] = function(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11)
	local iText="??"..text1.."??"..text2.."?????,"..text3.."?????,"..text4.."???"..text5..","..text6.."??????1??????????,???????"..text7.."?????,"..text8.."??????,"..text9.."???"..text5..","..text10.."?????,"..text11.."???????,????"
	return iText
end

-------------------------------------------------------------------------------------------------

shipUIfighterTXT = {}
shipUIfighterTXT[001] = "??????????"
shipUIfighterTXT[002] = "??????????"
shipUIfighterTXT[003] = "???????"
shipUIfighterTXT[004] = "??????????"
shipUIfighterTXT[005] = "??????????"
shipUIfighterTXT[006] = "??????????"

shipUIzer_carrier1UITXT = {}
shipUIzer_carrier1UITXT[001] = "?????"
shipUIzer_carrier1UITXT[002] = "??????????"
shipUIzer_carrier1UITXT[003] = "AH????"
shipUIzer_carrier1UITXT[004] = "???????"
shipUIzer_carrier1UITXT[005] = "?????"
shipUIzer_carrier1UITXT[006] = "??????????"


shipUImodu_ND2carrierPoPo1UITXT = {}
shipUImodu_ND2carrierPoPo1UITXT[001] = "?????????"
shipUImodu_ND2carrierPoPo1UITXT[002] = "???????"
shipUImodu_ND2carrierPoPo1UITXT[003] = "??????????"
shipUImodu_ND2carrierPoPo1UITXT[004] = "????????"
shipUImodu_ND2carrierPoPo1UITXT[005] = "????????"

shipUImodu_carrier1UITXT = {}
shipUImodu_carrier1UITXT[001] = "?????"
shipUImodu_carrier1UITXT[002] = "????"
shipUImodu_carrier1UITXT[003] = "?????"
shipUImodu_carrier1UITXT[004] = "?????"
shipUImodu_carrier1UITXT[005] = "?????"

	shipUImodu_carrierMK21UITXT = {}
shipUImodu_carrierMK21UITXT[001] = "?????"
shipUImodu_carrierMK21UITXT[002] = "????"
shipUImodu_carrierMK21UITXT[003] = "?????"
shipUImodu_carrierMK21UITXT[004] = "?????"
shipUImodu_carrierMK21UITXT[005] = "?????"

shipUIbus_car031UITXT = {}
shipUIbus_car031UITXT[001] = "???????"
shipUIbus_car031UITXT[002] = "??T??????"
shipUIbus_car031UITXT[003] = "??T??????"
shipUIbus_car031UITXT[004] = "????"
shipUIbus_car031UITXT[005] = "???????"

shipUIxao_carrierheavyhuge1UITXT = {}
shipUIxao_carrierheavyhuge1UITXT[001] = "??????"
shipUIxao_carrierheavyhuge1UITXT[002] = "???3???"
shipUIxao_carrierheavyhuge1UITXT[003] = "??????"
shipUIxao_carrierheavyhuge1UITXT[004] = "?????"
shipUIxao_carrierheavyhuge1UITXT[005] = "?????"



shipUIzer_stardestroy_Lorenhild1UITXT = {}
shipUIzer_stardestroy_Lorenhild1UITXT[001] = "??XIV??"
shipUIzer_stardestroy_Lorenhild1UITXT[002] = "?????"
shipUIzer_stardestroy_Lorenhild1UITXT[003] = "??????????"
shipUIzer_stardestroy_Lorenhild1UITXT[004] = "????????"
shipUIzer_stardestroy_Lorenhild1UITXT[005] = "????????"

shipUIzer_stardestroy_Wagner1UITXT = {}
shipUIzer_stardestroy_Wagner1UITXT[001] = "?????"
shipUIzer_stardestroy_Wagner1UITXT[002] = "?????"
shipUIzer_stardestroy_Wagner1UITXT[003] = "AH????"
shipUIzer_stardestroy_Wagner1UITXT[004] = "???????"
shipUIzer_stardestroy_Wagner1UITXT[005] = "?????"
shipUIzer_stardestroy_Wagner1UITXT[006] = "??????????"


shipUImodu_carrierhugewitch1UITXT = {}
shipUImodu_carrierhugewitch1UITXT[001] = "???A?????"
shipUImodu_carrierhugewitch1UITXT[002] = "????"
shipUImodu_carrierhugewitch1UITXT[003] = "?????"
shipUImodu_carrierhugewitch1UITXT[004] = "????????"
shipUImodu_carrierhugewitch1UITXT[005] = "????????"

shipUIzer_carrierbattlewitch1UITXT = {}
shipUIzer_carrierbattlewitch1UITXT[001] = "??????"
shipUIzer_carrierbattlewitch1UITXT[002] = "?????C"
shipUIzer_carrierbattlewitch1UITXT[003] = "???"
shipUIzer_carrierbattlewitch1UITXT[004] = "?????"
shipUIzer_carrierbattlewitch1UITXT[005] = "?????"

shipUIxao_carrierLDN1UITXT = {}
shipUIxao_carrierLDN1UITXT[001] = "???????"
shipUIxao_carrierLDN1UITXT[002] = "??T??????"
shipUIxao_carrierLDN1UITXT[003] = "??T??????"
shipUIxao_carrierLDN1UITXT[004] = "??X?"
shipUIxao_carrierLDN1UITXT[005] = "???????"


shipUItai_battleshipD3carrier1UITXT = {}
shipUItai_battleshipD3carrier1UITXT[001] = "?????"
shipUItai_battleshipD3carrier1UITXT[002] = "?????"
shipUItai_battleshipD3carrier1UITXT[003] = "????"
shipUItai_battleshipD3carrier1UITXT[004] = "??T??????"
shipUItai_battleshipD3carrier1UITXT[005] = "??T??????"

shipUIxao_battleshipD3carrier1UITXT = {}
shipUIxao_battleshipD3carrier1UITXT[001] = "?????K1"
shipUIxao_battleshipD3carrier1UITXT[002] = "AN-1K??????"
shipUIxao_battleshipD3carrier1UITXT[003] = "????"
shipUIxao_battleshipD3carrier1UITXT[004] = "???????"
shipUIxao_battleshipD3carrier1UITXT[005] = "?????"



shipUIxao_stardesroyershipyard1UITXT = {}
shipUIxao_stardesroyershipyard1UITXT[001] = "???"
shipUIxao_stardesroyershipyard1UITXT[002] = "AN-1K??????"
shipUIxao_stardesroyershipyard1UITXT[003] = "??????????"
shipUIxao_stardesroyershipyard1UITXT[004] = "????????"
shipUIxao_stardesroyershipyard1UITXT[005] = "????????"


shipUImodu_resourcecontrollerhuge1UITXT = {}
shipUImodu_resourcecontrollerhuge1UITXT[001] = "?????????"
shipUImodu_resourcecontrollerhuge1UITXT[002] = "???????"
shipUImodu_resourcecontrollerhuge1UITXT[003] = "?????"
shipUImodu_resourcecontrollerhuge1UITXT[004] = "????????????"
shipUImodu_resourcecontrollerhuge1UITXT[005] = "???????"


shipUIalos_carrier_huge1UITXT = {}
shipUIalos_carrier_huge1UITXT[001] = "XFA27???"
shipUIalos_carrier_huge1UITXT[002] = "SU33???"
shipUIalos_carrier_huge1UITXT[003] = "MIG33???"
shipUIalos_carrier_huge1UITXT[004] = "?????"
shipUIalos_carrier_huge1UITXT[005] = "????????"

shipUIalos_carrier_super1UITXT = {}
shipUIalos_carrier_super1UITXT[001] = "unicornI???"
shipUIalos_carrier_super1UITXT[002] = "unicornII???"
shipUIalos_carrier_super1UITXT[003] = "unicornIII???"
shipUIalos_carrier_super1UITXT[004] = "?????"
shipUIalos_carrier_super1UITXT[005] = "?????"

shipUImodu_carriersuper1UITXT = {}
shipUImodu_carriersuper1UITXT[001] = "?????"
shipUImodu_carriersuper1UITXT[002] = "?????"
shipUImodu_carriersuper1UITXT[003] = "?????"
shipUImodu_carriersuper1UITXT[004] = "?????"
shipUImodu_carriersuper1UITXT[005] = "?????"

shipUImodu_carriersuperBlack1UITXT = {}
shipUImodu_carriersuperBlack1UITXT[001] = "??????"
shipUImodu_carriersuperBlack1UITXT[002] = "???????"
shipUImodu_carriersuperBlack1UITXT[003] = "???????"
shipUImodu_carriersuperBlack1UITXT[004] = "?????"
shipUImodu_carriersuperBlack1UITXT[005] = "?????"


shipUIvgr_battleshiplightcarrier1UITXT = {}
shipUIvgr_battleshiplightcarrier1UITXT[001] = "?????MK2"
shipUIvgr_battleshiplightcarrier1UITXT[002] = "?????MK2???"
shipUIvgr_battleshiplightcarrier1UITXT[003] = "?????"
shipUIvgr_battleshiplightcarrier1UITXT[004] = "???????"
shipUIvgr_battleshiplightcarrier1UITXT[005] = "??????"

shipUIzmodu_battershipheavggun1UITXT = {}
shipUIzmodu_battershipheavggun1UITXT[001] = "?????"
shipUIzmodu_battershipheavggun1UITXT[002] = "?????"
shipUIzmodu_battershipheavggun1UITXT[003] = "?????"
shipUIzmodu_battershipheavggun1UITXT[004] = "?????"
shipUIzmodu_battershipheavggun1UITXT[005] = "?????"


shipUIhgn_busnewship301UITXT = {}
shipUIhgn_busnewship301UITXT[001] = "?????"
shipUIhgn_busnewship301UITXT[002] = "?????"
shipUIhgn_busnewship301UITXT[003] = "?????"
shipUIhgn_busnewship301UITXT[004] = "?????"
shipUIhgn_busnewship301UITXT[005] = "?????"

shipUIhgn_busnewship311UITXT = {}
shipUIhgn_busnewship311UITXT[001] = "?????"
shipUIhgn_busnewship311UITXT[002] = "?????"
shipUIhgn_busnewship311UITXT[003] = "?????"
shipUIhgn_busnewship311UITXT[004] = "?????"
shipUIhgn_busnewship311UITXT[005] = "?????"

shipUIhgn_busnewship321UITXT = {}
shipUIhgn_busnewship321UITXT[001] = "?????"
shipUIhgn_busnewship321UITXT[002] = "?????"
shipUIhgn_busnewship321UITXT[003] = "?????"
shipUIhgn_busnewship321UITXT[004] = "?????"
shipUIhgn_busnewship321UITXT[005] = "?????"

shipUIvgr_carrierbattleship1UITXT = {}
shipUIvgr_carrierbattleship1UITXT[001] = "?????MK2"
shipUIvgr_carrierbattleship1UITXT[002] = "?????MK2??"
shipUIvgr_carrierbattleship1UITXT[003] = "?????"
shipUIvgr_carrierbattleship1UITXT[004] = "???????"
shipUIvgr_carrierbattleship1UITXT[005] = "??????"
shipUIvgr_carrierbattleship1UITXT[006] = "??????????"

shipUImodu_carrierheavy1UITXT = {}
shipUImodu_carrierheavy1UITXT[001] = "?????"
shipUImodu_carrierheavy1UITXT[002] = "?????"
shipUImodu_carrierheavy1UITXT[003] = "?????"
shipUImodu_carrierheavy1UITXT[004] = "?????"
shipUImodu_carrierheavy1UITXT[005] = "?????"


shipUIPil_carriersuper1UITXT = {}
shipUIPil_carriersuper1UITXT[001] = "???"
shipUIPil_carriersuper1UITXT[002] = "???"
shipUIPil_carriersuper1UITXT[003] = "???"
shipUIPil_carriersuper1UITXT[004] = "????"
shipUIPil_carriersuper1UITXT[005] = "???"

shipUIhgn_carrierheavyKZ1UITXT = {}
shipUIhgn_carrierheavyKZ1UITXT[001] = "??????"
shipUIhgn_carrierheavyKZ1UITXT[002] = "??"
shipUIhgn_carrierheavyKZ1UITXT[003] = "????"

shipUImodu_battleship14G1UITXT = {}
shipUImodu_battleship14G1UITXT[001] = "???"
shipUImodu_battleship14G1UITXT[002] = "???"
shipUImodu_battleship14G1UITXT[003] = "???"
shipUImodu_battleship14G1UITXT[004] = "???????"
shipUImodu_battleship14G1UITXT[005] = "?????"
shipUImodu_battleship14G1UITXT[006] = "??????????"


shipUIxao_carrierheavyathenaED1UITXT = {}
shipUIxao_carrierheavyathenaED1UITXT[001] = "????????"
shipUIxao_carrierheavyathenaED1UITXT[002] = "???"
shipUIxao_carrierheavyathenaED1UITXT[003] = "???????"
shipUIxao_carrierheavyathenaED1UITXT[004] = "?????"
shipUIxao_carrierheavyathenaED1UITXT[005] = "????????"

shipUIhgn_busnewship371UITXT = {}
shipUIhgn_busnewship371UITXT[001] = "???"
shipUIhgn_busnewship371UITXT[002] = "??"
shipUIhgn_busnewship371UITXT[003] = "???????"
shipUIhgn_busnewship371UITXT[004] = "?????"
shipUIhgn_busnewship371UITXT[005] = "?????"

shipUIhgn_busnewship381UITXT = {}
shipUIhgn_busnewship381UITXT[001] = "????"
shipUIhgn_busnewship381UITXT[002] = "???"
shipUIhgn_busnewship381UITXT[003] = "??????3"
shipUIhgn_busnewship381UITXT[004] = "?????"
shipUIhgn_busnewship381UITXT[005] = "?????"

shipUIxao_carrierheavyathena1UITXT = {}
shipUIxao_carrierheavyathena1UITXT[001] = "??????2"
shipUIxao_carrierheavyathena1UITXT[002] = "??????3"
shipUIxao_carrierheavyathena1UITXT[003] = "???"
shipUIxao_carrierheavyathena1UITXT[004] = "?????"
shipUIxao_carrierheavyathena1UITXT[005] = "?????"

shipUIxao_carrierheavyathena2UITXT = {}
shipUIxao_carrierheavyathena2UITXT[001] = "??????2"
shipUIxao_carrierheavyathena2UITXT[002] = "??????3"
shipUIxao_carrierheavyathena2UITXT[003] = "???"
shipUIxao_carrierheavyathena2UITXT[004] = "?????"
shipUIxao_carrierheavyathena2UITXT[005] = "?????"

shipUIxao_carrierheavyathena3UITXT = {}
shipUIxao_carrierheavyathena3UITXT[001] = "??????2"
shipUIxao_carrierheavyathena3UITXT[002] = "??????3"
shipUIxao_carrierheavyathena3UITXT[003] = "???"
shipUIxao_carrierheavyathena3UITXT[004] = "?????"
shipUIxao_carrierheavyathena3UITXT[005] = "?????"

shipUIxao_carrierheavyathena4UITXT = {}
shipUIxao_carrierheavyathena4UITXT[001] = "??????2"
shipUIxao_carrierheavyathena4UITXT[002] = "??????3"
shipUIxao_carrierheavyathena4UITXT[003] = "???"
shipUIxao_carrierheavyathena4UITXT[004] = "?????"
shipUIxao_carrierheavyathena4UITXT[005] = "?????"

shipUIvgr_carrierhuge1UITXT = {}
shipUIvgr_carrierhuge1UITXT[001] = "?????MK2"
shipUIvgr_carrierhuge1UITXT[002] = "?????"
shipUIvgr_carrierhuge1UITXT[003] = "?????"
shipUIvgr_carrierhuge1UITXT[004] = "?????"
shipUIvgr_carrierhuge1UITXT[005] = "????????"

shipUIvgr_carrierhuge2UITXT = {}
shipUIvgr_carrierhuge2UITXT[001] = "?????MK2"
shipUIvgr_carrierhuge2UITXT[002] = "?????"
shipUIvgr_carrierhuge2UITXT[003] = "?????"
shipUIvgr_carrierhuge2UITXT[004] = "?????"
shipUIvgr_carrierhuge2UITXT[005] = "????????"

shipUIvgr_carrierhuge3UITXT = {}
shipUIvgr_carrierhuge3UITXT[001] = "?????MK2"
shipUIvgr_carrierhuge3UITXT[002] = "?????"
shipUIvgr_carrierhuge3UITXT[003] = "?????"
shipUIvgr_carrierhuge3UITXT[004] = "?????"
shipUIvgr_carrierhuge3UITXT[005] = "????????"

shipUIvgr_carrierhuge4UITXT = {}
shipUIvgr_carrierhuge4UITXT[001] = "?????MK2"
shipUIvgr_carrierhuge4UITXT[002] = "?????"
shipUIvgr_carrierhuge4UITXT[003] = "?????"
shipUIvgr_carrierhuge4UITXT[004] = "?????"
shipUIvgr_carrierhuge4UITXT[005] = "????????"

shipUIxao_carrierheavyathenaBD1UITXT = {}
shipUIxao_carrierheavyathenaBD1UITXT[001] = "?????"
shipUIxao_carrierheavyathenaBD1UITXT[002] = "?????"
shipUIxao_carrierheavyathenaBD1UITXT[003] = "?????"
shipUIxao_carrierheavyathenaBD1UITXT[004] = "???????"
shipUIxao_carrierheavyathenaBD1UITXT[005] = "?????"
shipUIxao_carrierheavyathenaBD1UITXT[006] = "??????????"

shipUIxao_carrierheavyathenaBD2UITXT = {}
shipUIxao_carrierheavyathenaBD2UITXT[001] = "?????"
shipUIxao_carrierheavyathenaBD2UITXT[002] = "?????"
shipUIxao_carrierheavyathenaBD2UITXT[003] = "?????"
shipUIxao_carrierheavyathenaBD2UITXT[004] = "???????"
shipUIxao_carrierheavyathenaBD2UITXT[005] = "?????"
shipUIxao_carrierheavyathenaBD2UITXT[006] = "??????????"

shipUIxao_carrierheavyathenaBD3UITXT = {}
shipUIxao_carrierheavyathenaBD3UITXT[001] = "?????"
shipUIxao_carrierheavyathenaBD3UITXT[002] = "?????"
shipUIxao_carrierheavyathenaBD3UITXT[003] = "?????"
shipUIxao_carrierheavyathenaBD3UITXT[004] = "???????"
shipUIxao_carrierheavyathenaBD3UITXT[005] = "?????"
shipUIxao_carrierheavyathenaBD3UITXT[006] = "??????????"

shipUIxao_carrierheavyathenaBD4UITXT = {}
shipUIxao_carrierheavyathenaBD4UITXT[001] = "?????"
shipUIxao_carrierheavyathenaBD4UITXT[002] = "?????"
shipUIxao_carrierheavyathenaBD4UITXT[003] = "?????"
shipUIxao_carrierheavyathenaBD4UITXT[004] = "???????"
shipUIxao_carrierheavyathenaBD4UITXT[005] = "?????"
shipUIxao_carrierheavyathenaBD4UITXT[006] = "??????????"


shipUIvgr_superbattleshipP1UITXT = {}
shipUIvgr_superbattleshipP1UITXT[001] = "?????"
shipUIvgr_superbattleshipP1UITXT[002] = "??????"
shipUIvgr_superbattleshipP1UITXT[003] = "??????"
shipUIvgr_superbattleshipP1UITXT[004] = "??????"
shipUIvgr_superbattleshipP1UITXT[005] = "????????"

shipUIvgr_stardestroy1UITXT = {}
shipUIvgr_stardestroy1UITXT[001] = "?????"
shipUIvgr_stardestroy1UITXT[002] = "?????"
shipUIvgr_stardestroy1UITXT[003] = "????????"
shipUIvgr_stardestroy1UITXT[004] = "????"
shipUIvgr_stardestroy1UITXT[005] = "?????"

shipUImodu_supershipMK71UITXT = {}
shipUImodu_supershipMK71UITXT[001] = "?????"
shipUImodu_supershipMK71UITXT[002] = "?????"
shipUImodu_supershipMK71UITXT[003] = "?????"
shipUImodu_supershipMK71UITXT[004] = "?????"
shipUImodu_supershipMK71UITXT[005] = "?????"

shipUIhgn_busnewship211UITXT = {}
shipUIhgn_busnewship211UITXT[001] = "???"
shipUIhgn_busnewship211UITXT[002] = "???"
shipUIhgn_busnewship211UITXT[003] = "???"
shipUIhgn_busnewship211UITXT[004] = "???????"
shipUIhgn_busnewship211UITXT[005] = "??????????"
shipUIhgn_busnewship211UITXT[006] = "??????????"


shipUIhgn_busnewship391UITXT = {}
shipUIhgn_busnewship391UITXT[001] = "???D???"
shipUIhgn_busnewship391UITXT[002] = "???D???"
shipUIhgn_busnewship391UITXT[003] = "???"
shipUIhgn_busnewship391UITXT[004] = "????????"
shipUIhgn_busnewship391UITXT[005] = "????????"


shipUIxao_supercarrier1UITXT = {}
shipUIxao_supercarrier1UITXT[001] = "????????"
shipUIxao_supercarrier1UITXT[002] = "?????"
shipUIxao_supercarrier1UITXT[003] = "???"
shipUIxao_supercarrier1UITXT[004] = "???????"
shipUIxao_supercarrier1UITXT[005] = "?????"
shipUIxao_supercarrier1UITXT[006] = "??????????"


shipUImodu_battlecruiseradventure1UITXT = {}
shipUImodu_battlecruiseradventure1UITXT[001] = "?????"
shipUImodu_battlecruiseradventure1UITXT[002] = "?????"
shipUImodu_battlecruiseradventure1UITXT[003] = "??????"
shipUImodu_battlecruiseradventure1UITXT[004] = "????????"
shipUImodu_battlecruiseradventure1UITXT[005] = "????????"

shipUIvgr_supercarrier1UITXT = {}
shipUIvgr_supercarrier1UITXT[001] = "?????"
shipUIvgr_supercarrier1UITXT[002] = "??IX??"
shipUIvgr_supercarrier1UITXT[003] = "??XI?????"
shipUIvgr_supercarrier1UITXT[004] = "?????"
shipUIvgr_supercarrier1UITXT[005] = "??"

shipUImodu_battlecruiseradventure1UITXT = {}
shipUImodu_battlecruiseradventure1UITXT[001] = "?????"
shipUImodu_battlecruiseradventure1UITXT[002] = "????"
shipUImodu_battlecruiseradventure1UITXT[003] = "?????"
shipUImodu_battlecruiseradventure1UITXT[004] = "?????"
shipUImodu_battlecruiseradventure1UITXT[005] = "?????"



shipUIxao_dreadnaughtmissle1UITXT = {}
shipUIxao_dreadnaughtmissle1UITXT[001] = "???"
shipUIxao_dreadnaughtmissle1UITXT[002] = "?????"
shipUIxao_dreadnaughtmissle1UITXT[003] = "??????????"
shipUIxao_dreadnaughtmissle1UITXT[004] = "????????"
shipUIxao_dreadnaughtmissle1UITXT[005] = "????????"

shipUIhgn_busnewship781UITXT = {}
shipUIhgn_busnewship781UITXT[001] = "???????"
shipUIhgn_busnewship781UITXT[002] = "?????"
shipUIhgn_busnewship781UITXT[003] = "??????"
shipUIhgn_busnewship781UITXT[004] = "????????"
shipUIhgn_busnewship781UITXT[005] = "????????"


shipUIhgn_busnewship571UITXT = {}
shipUIhgn_busnewship571UITXT[001] = "??????"
shipUIhgn_busnewship571UITXT[002] = "????"
shipUIhgn_busnewship571UITXT[003] = "??????????"
shipUIhgn_busnewship571UITXT[004] = "????????"
shipUIhgn_busnewship571UITXT[005] = "????????"

shipUIhgn_busnewship671UITXT = {}
shipUIhgn_busnewship671UITXT[001] = "?????"
shipUIhgn_busnewship671UITXT[002] = "?????"
shipUIhgn_busnewship671UITXT[003] = "?????"
shipUIhgn_busnewship671UITXT[004] = "???????"
shipUIhgn_busnewship671UITXT[005] = "?????"

shipUIhgn_busnewship661UITXT = {}
shipUIhgn_busnewship661UITXT[001] = "?????"
shipUIhgn_busnewship661UITXT[002] = "?????"
shipUIhgn_busnewship661UITXT[003] = "?????"
shipUIhgn_busnewship661UITXT[004] = "?????"
shipUIhgn_busnewship661UITXT[005] = "?????"


shipUIhgn_busnewship481UITXT = {}
shipUIhgn_busnewship481UITXT[001] = "?????"
shipUIhgn_busnewship481UITXT[002] = "?????"
shipUIhgn_busnewship481UITXT[003] = "?????"
shipUIhgn_busnewship481UITXT[004] = "?????"
shipUIhgn_busnewship481UITXT[005] = "?????"


shipUImodu_supershipcarrierC1UITXT = {}
shipUImodu_supershipcarrierC1UITXT[001] = "???"
shipUImodu_supershipcarrierC1UITXT[002] = "???D??"
shipUImodu_supershipcarrierC1UITXT[003] = "???D??"
shipUImodu_supershipcarrierC1UITXT[004] = "???D??"
shipUImodu_supershipcarrierC1UITXT[005] = "???D??"

shipUImodu_supershipcarrier1UITXT = {}
shipUImodu_supershipcarrier1UITXT[001] = "???"
shipUImodu_supershipcarrier1UITXT[002] = "????????"
shipUImodu_supershipcarrier1UITXT[003] = "??????????"
shipUImodu_supershipcarrier1UITXT[004] = "???D???"
shipUImodu_supershipcarrier1UITXT[005] = "??"

shipUIxao_carrierheavyathenaQ1UITXT = {}
shipUIxao_carrierheavyathenaQ1UITXT[001] = "AN-1K??????"
shipUIxao_carrierheavyathenaQ1UITXT[002] = "K??????"
shipUIxao_carrierheavyathenaQ1UITXT[003] = "???????"
shipUIxao_carrierheavyathenaQ1UITXT[004] = "?????"
shipUIxao_carrierheavyathenaQ1UITXT[005] = "???????"

shipUIhgn_busnewship861UITXT = {}
shipUIhgn_busnewship861UITXT[001] = "??????????"
shipUIhgn_busnewship861UITXT[002] = "??????????"
shipUIhgn_busnewship861UITXT[003] = "??????????"
shipUIhgn_busnewship861UITXT[004] = "??????????"
shipUIhgn_busnewship861UITXT[005] = "??????????"

shipUIhgn_busnewship791UIAATXT = {}
shipUIhgn_busnewship791UIAATXT[001] = "???????-??"
shipUIhgn_busnewship791UIAATXT[002] = "??????-??"
shipUIhgn_busnewship791UIAATXT[003] = "??????-??"
shipUIhgn_busnewship791UIAATXT[004] = "??????-??"
shipUIhgn_busnewship791UIAATXT[005] = "???????-??"

shipUIhgn_busnewship791UIBOTXT = {}
shipUIhgn_busnewship791UIBOTXT[001] = "???????-??"
shipUIhgn_busnewship791UIBOTXT[002] = "??????-??"
shipUIhgn_busnewship791UIBOTXT[003] = "??????-??"
shipUIhgn_busnewship791UIBOTXT[004] = "??????-??"
shipUIhgn_busnewship791UIBOTXT[005] = "???????-??"

shipUIhgn_busnewship801UITXT = {}
shipUIhgn_busnewship801UITXT[001] = "???????-??"
shipUIhgn_busnewship801UITXT[002] = "???????-??"
shipUIhgn_busnewship801UITXT[003] = "??????-??"
shipUIhgn_busnewship801UITXT[004] = "??????-??"
shipUIhgn_busnewship801UITXT[005] = "???????-??"

mapattacksystemMAP = {}
mapattacksystemMAP[001] = "?????"
mapattacksystemMAP[002] = "?????"
mapattacksystemMAP[003] = "?????"
mapattacksystemMAP[004] = "???????"
mapattacksystemMAP[005] = "?????????"
mapattacksystemMAP[006] = "????????"
mapattacksystemMAP[007] = "???"
mapattacksystemMAP[008] = "???"
mapattacksystemMAP[009] = "?????"
mapattacksystemMAP[010] = "????"
mapattacksystemMAP[011] = "?142?????"
mapattacksystemMAP[012] = "?????"
mapattacksystemMAP[013] = "?????"
mapattacksystemMAP[014] = "???????"
mapattacksystemMAP[015] = "?????????"
mapattacksystemMAP[016] = "????????"
mapattacksystemMAP[017] = "??????????"
mapattacksystemMAP[018] = "??????????"
mapattacksystemMAP[019] = "?????—????"
mapattacksystemMAP[020] = "?????—??????"
mapattacksystemMAP[021] = "?????—????"
mapattacksystemMAP[022] = "??????????"
mapattacksystemMAP[023] = "?????????"
mapattacksystemMAP[024] = "?58???????"
mapattacksystemMAP[025] = "??????????"
mapattacksystemMAP[026] = "????"
mapattacksystemMAP[027] = "?????"
mapattacksystemMAP[028] = "?????—???????"
mapattacksystemMAP[029] = "???????????"
mapattacksystemMAP[030] = "????"
mapattacksystemMAP[031] = "?????????"
mapattacksystemMAP[032] = "????·???"
mapattacksystemMAP[033] = "????????"
mapattacksystemMAP[034] = "??"
mapattacksystemMAP[035] = "CPSR??????"

mapgoodsystemMAPname = {}
mapgoodsystemMAPname[000] = ""
mapgoodsystemMAPname[001] = "?????"
mapgoodsystemMAPname[002] = "?????"
mapgoodsystemMAPname[003] = "?????"
mapgoodsystemMAPname[004] = "???"
mapgoodsystemMAPname[005] = "???"
mapgoodsystemMAPname[006] = "?????"
mapgoodsystemMAPname[007] = "????"
mapgoodsystemMAPname[008] = "?142?????"
mapgoodsystemMAPname[009] = "??????"
mapgoodsystemMAPname[010] = "????????"
mapgoodsystemMAPname[011] = "???????????"
mapgoodsystemMAPname[012] = "???????"
mapgoodsystemMAPname[013] = "????????"
mapgoodsystemMAPname[014] = "?????"
mapgoodsystemMAPname[015] = "?????"
mapgoodsystemMAPname[016] = "????"
mapgoodsystemMAPname[017] = "????"
mapgoodsystemMAPname[018] = "???????"
mapgoodsystemMAPname[019] = "?????????"
mapgoodsystemMAPname[020] = "????????"
mapgoodsystemMAPname[021] = "????????"
mapgoodsystemMAPname[022] = "????????"
mapgoodsystemMAPname[023] = "??????"
mapgoodsystemMAPname[024] = "?????"
mapgoodsystemMAPname[025] = "????????"
mapgoodsystemMAPname[026] = "????????"
mapgoodsystemMAPname[027] = "??????"
mapgoodsystemMAPname[028] = "??????????"
mapgoodsystemMAPname[029] = "??????????"
mapgoodsystemMAPname[030] = "EDF???"
mapgoodsystemMAPname[031] = "???????"
mapgoodsystemMAPname[032] = "?????????"
mapgoodsystemMAPname[033] = "?????—????"
mapgoodsystemMAPname[034] = "?????—??????"
mapgoodsystemMAPname[035] = "?????—????"
mapgoodsystemMAPname[036] = "??????????"
mapgoodsystemMAPname[037] = "?????????"
mapgoodsystemMAPname[038] = "?58???????"
mapgoodsystemMAPname[039] = "??????????"
mapgoodsystemMAPname[040] = "?????????"
mapgoodsystemMAPname[041] = "????????"
mapgoodsystemMAPname[042] = "?????—???????"	
mapgoodsystemMAPname[043] = "?????—???????"
mapgoodsystemMAPname[044] = "???????????"
mapgoodsystemMAPname[045] = "????"
mapgoodsystemMAPname[046] = "?????????"
mapgoodsystemMAPname[047] = "????·???"
mapgoodsystemMAPname[048] = "????????"
mapgoodsystemMAPname[049] = "??"
mapgoodsystemMAPname[050] = "CPSR??????"

mapgoodsystemMAPnameTXT = {}
mapgoodsystemMAPnameTXT[000] = ","
mapgoodsystemMAPnameTXT[001] = ",?????"
mapgoodsystemMAPnameTXT[002] = ",?????"
mapgoodsystemMAPnameTXT[003] = ",?????"
mapgoodsystemMAPnameTXT[004] = ",???"
mapgoodsystemMAPnameTXT[005] = ",???"
mapgoodsystemMAPnameTXT[006] = ",?????"
mapgoodsystemMAPnameTXT[007] = ",????"
mapgoodsystemMAPnameTXT[008] = ",?142?????"
mapgoodsystemMAPnameTXT[009] = ",??????"
mapgoodsystemMAPnameTXT[010] = ",????????"
mapgoodsystemMAPnameTXT[011] = ",???????????"
mapgoodsystemMAPnameTXT[012] = ",???????"
mapgoodsystemMAPnameTXT[013] = ",????????"
mapgoodsystemMAPnameTXT[014] = ",?????"
mapgoodsystemMAPnameTXT[015] = ",?????"
mapgoodsystemMAPnameTXT[016] = ",????"
mapgoodsystemMAPnameTXT[017] = ",????"
mapgoodsystemMAPnameTXT[018] = ",???????"
mapgoodsystemMAPnameTXT[019] = ",?????????"
mapgoodsystemMAPnameTXT[020] = ",????????"
mapgoodsystemMAPnameTXT[021] = ",????????"
mapgoodsystemMAPnameTXT[022] = ",????????"
mapgoodsystemMAPnameTXT[023] = ",??????"
mapgoodsystemMAPnameTXT[024] = ",?????"
mapgoodsystemMAPnameTXT[025] = ",????????"
mapgoodsystemMAPnameTXT[026] = ",????????"
mapgoodsystemMAPnameTXT[027] = ",??????"
mapgoodsystemMAPnameTXT[028] = ",???????"
mapgoodsystemMAPnameTXT[029] = ",???????"
mapgoodsystemMAPnameTXT[030] = ",EDF???"
mapgoodsystemMAPnameTXT[031] = ",???????"
mapgoodsystemMAPnameTXT[032] = ",???????"
mapgoodsystemMAPnameTXT[033] = ",???????"
mapgoodsystemMAPnameTXT[034] = ",?????????"
mapgoodsystemMAPnameTXT[035] = ",???????"
mapgoodsystemMAPnameTXT[036] = ",?????"
mapgoodsystemMAPnameTXT[037] = ",??????"
mapgoodsystemMAPnameTXT[038] = ",?58????"
mapgoodsystemMAPnameTXT[039] = ",???????"
mapgoodsystemMAPnameTXT[040] = ",??????"
mapgoodsystemMAPnameTXT[041] = ",????????"
mapgoodsystemMAPnameTXT[042] = ",?????—???????"	
mapgoodsystemMAPnameTXT[043] = ",?????—???????"
mapgoodsystemMAPnameTXT[044] = ",???????????"
mapgoodsystemMAPnameTXT[045] = ",????"
mapgoodsystemMAPnameTXT[046] = ",?????????"
mapgoodsystemMAPnameTXT[047] = ",????·???"
mapgoodsystemMAPnameTXT[048] = ",????????"
mapgoodsystemMAPnameTXT[049] = ",??"
mapgoodsystemMAPnameTXT[050] = ",CPSR??????"

mapgoodsystemGOODname = {}
mapgoodsystemGOODname[001] = "????"
mapgoodsystemGOODname[002] = "????"
mapgoodsystemGOODname[003] = "??"
mapgoodsystemGOODname[004] = "??????"
mapgoodsystemGOODname[005] = "??????"
mapgoodsystemGOODname[006] = "????"
mapgoodsystemGOODname[007] = "????"
mapgoodsystemGOODname[008] = "????"
mapgoodsystemGOODname[009] = "????"
mapgoodsystemGOODname[010] = "????"
mapgoodsystemGOODname[011] = "????"
mapgoodsystemGOODname[012] = "???"
mapgoodsystemGOODname[013] = "????"
mapgoodsystemGOODname[014] = "???????"
mapgoodsystemGOODname[015] = "????"
mapgoodsystemGOODname[016] = "????"
mapgoodsystemGOODname[017] = "????"
mapgoodsystemGOODname[018] = "???"
mapgoodsystemGOODname[019] = "??????"
mapgoodsystemGOODname[020] = "??????"
mapgoodsystemGOODname[021] = "????"
mapgoodsystemGOODname[022] = "????"
mapgoodsystemGOODname[023] = "????"
mapgoodsystemGOODname[024] = "????"
mapgoodsystemGOODname[025] = "???"
mapgoodsystemGOODname[026] = "????"
mapgoodsystemGOODname[027] = "????"
mapgoodsystemGOODname[028] = "????"
mapgoodsystemGOODname[029] = "????"
mapgoodsystemGOODname[030] = "??????"
mapgoodsystemGOODname[031] = "???"
mapgoodsystemGOODname[032] = "????"
mapgoodsystemGOODname[033] = "????"
mapgoodsystemGOODname[034] = "????"
mapgoodsystemGOODname[035] = "????"
mapgoodsystemGOODname[036] = "??????"
mapgoodsystemGOODname[037] = "???"
mapgoodsystemGOODname[038] = "????"
mapgoodsystemGOODname[039] = "????"
mapgoodsystemGOODname[040] = "????"
mapgoodsystemGOODname[041] = "???"
mapgoodsystemGOODname[042] = "???"
mapgoodsystemGOODname[043] = "????"
mapgoodsystemGOODname[044] = "?????"
mapgoodsystemGOODname[045] = "????"
mapgoodsystemGOODname[046] = "????"
mapgoodsystemGOODname[047] = "??????"
mapgoodsystemGOODname[048] = "????"
mapgoodsystemGOODname[049] = "????"
mapgoodsystemGOODname[050] = "????????????"


mapfactorysystemfactoryname = {}
mapfactorysystemfactoryname[001] = "???????"
mapfactorysystemfactoryname[002] = "????????"
mapfactorysystemfactoryname[003] = "?????"
mapfactorysystemfactoryname[004] = "?????????"
mapfactorysystemfactoryname[005] = "?????????"
mapfactorysystemfactoryname[006] = "???????"
mapfactorysystemfactoryname[007] = "????"
mapfactorysystemfactoryname[008] = "???????"
mapfactorysystemfactoryname[009] = "????"
mapfactorysystemfactoryname[010] = "????"
mapfactorysystemfactoryname[011] = "????"
mapfactorysystemfactoryname[012] = "??????"
mapfactorysystemfactoryname[013] = "???????"
mapfactorysystemfactoryname[014] = "??????????"
mapfactorysystemfactoryname[015] = "???????"
mapfactorysystemfactoryname[016] = "???????"
mapfactorysystemfactoryname[017] = "????"
mapfactorysystemfactoryname[018] = "??????"
mapfactorysystemfactoryname[019] = "?????????"
mapfactorysystemfactoryname[020] = "?????????"
mapfactorysystemfactoryname[021] = "????"
mapfactorysystemfactoryname[022] = "????"
mapfactorysystemfactoryname[023] = "????"
mapfactorysystemfactoryname[024] = "???????"
mapfactorysystemfactoryname[025] = "??????"
mapfactorysystemfactoryname[026] = "???????"
mapfactorysystemfactoryname[027] = "???????"
mapfactorysystemfactoryname[028] = "???????"
mapfactorysystemfactoryname[029] = "???????"
mapfactorysystemfactoryname[030] = "??????"
mapfactorysystemfactoryname[031] = "??????"
mapfactorysystemfactoryname[032] = "???????"
mapfactorysystemfactoryname[033] = "???????"
mapfactorysystemfactoryname[034] = "????"
mapfactorysystemfactoryname[035] = "???????"
mapfactorysystemfactoryname[036] = "?????????"
mapfactorysystemfactoryname[037] = "??????"
mapfactorysystemfactoryname[038] = "????"
mapfactorysystemfactoryname[039] = "????"
mapfactorysystemfactoryname[040] = "????"
mapfactorysystemfactoryname[041] = "???????"
mapfactorysystemfactoryname[042] = "??????"
mapfactorysystemfactoryname[043] = "????"
mapfactorysystemfactoryname[044] = "????????"
mapfactorysystemfactoryname[045] = "??????"
mapfactorysystemfactoryname[046] = "????"
mapfactorysystemfactoryname[047] = "?????????"
mapfactorysystemfactoryname[048] = "???????"
mapfactorysystemfactoryname[049] = "????"
mapfactorysystemfactoryname[050] = "???????????????"

randomMAPsmallmissionshipTXT = {}
randomMAPsmallmissionshipTXT[001] = "?????"
randomMAPsmallmissionshipTXT[002] = "?????"
randomMAPsmallmissionshipTXT[003] = "?????"
randomMAPsmallmissionshipTXT[004] = "?????"
randomMAPsmallmissionshipTXT[005] = "????????"

randomMAPsmallmissionTPYETXT = {}
randomMAPsmallmissionTPYETXT[001] = "????"
randomMAPsmallmissionTPYETXT[002] = "????"
randomMAPsmallmissionTPYETXT[003] = "????"
randomMAPsmallmissionTPYETXT[004] = "?????"


randomMAPsmallmissionTYPEMIDTXT = {}
randomMAPsmallmissionTYPEMIDTXT[001] = "??????"
randomMAPsmallmissionTYPEMIDTXT[002] = ""
randomMAPsmallmissionTYPEMIDTXT[003] = "??????"
randomMAPsmallmissionTYPEMIDTXT[004] = "????????"

randomMAPsmallmissionTPYEENDTXT = {}
randomMAPsmallmissionTPYEENDTXT[001] = "(?????????????,?????????????????)"
randomMAPsmallmissionTPYEENDTXT[002] = "(?????????????,?????????????????)"
randomMAPsmallmissionTPYEENDTXT[003] = "(???????????????,????????????)"
randomMAPsmallmissionTPYEENDTXT[004] = "(??????????????????????????)"



goodLVoutTXT = {}
goodLVoutTXT[001] = ""
goodLVoutTXT[002] = "(??!!??????????????,???????????????????)"
goodLVoutTXT[003] = function(text1)
	local iText="????????????,????????????????,????????????????,???????"..text1..""
	return iText
end



randomMAPsmallmissionTXT = {}
randomMAPsmallmissionTXT[001] = function(text1,text2,text3,text4,text5,text6,text7)
	local iText="?????????,????"..text1.."???"..text2.."???"..text3..",????????????"..text4.."???,????,?????"..text5.."?????"..text4.."??????(??:????????,???"..text6.."?????,??????????,?????????"..text7.."???"..text4.."????????)"
	return iText
end

randomMAPsmallmissionTXT[002] = function(text1,text2,text3,text4,text5,text6)
	local iText="???????,???????"..text1.."?????"..text2.."?????"..text3.."????,?????????"..text4.."?????"..text5.."???"..text6.."????"
	return iText
end

randomMAPsmallmissionTXT[003] = function(text1,text2,text3,text4)
	local iText="??"..text1.."???????????"..text2.."??????,???????"..text3.."??,???????????"..text4.."??,???????(??:??????????????????????)"
	return iText
end
---------??XXX???????????XXXX??????--???????XXX?,???????????XXX?----???????--??--??????????????????????-------
randomMAPsmallmissionTXT[004] = function(text1,text2,text3)
	local iText="????"..text1.."???????,??????"..text2.."--?????"..text3.."????????????????????????,?????????????(???????????????????,????????????????)"
	return iText
end
 ---------???XXX???????--??????--?????XX??---?????????????????????,?????????????(???????????????????,????????????????)--
randomMAPsmallmissionTXT[005] = function(text1,text2,text3)
	local iText="???????????,????"..text1.."??????"..text2.."???(??????????)??????????,?????"..text3.."?????"
	return iText
end 
 
--???????-????--????XXXX??????XXX???(??????????)--randomMAPsmallmissionENDMONEYstart
--????????,?????XXX?????-- 
 
randomMAPsmallmissionTXT[006] = function(text1,text2,text3,text4,text5,text6,text7)
	local iText="?????????,?????"..text1.."???"..text2.."?????,?"..text3.."???????,??????????????"..text4.."???,???????"..text7.."??????????,?????"..text5.."?????"..text4.."??????(??:????????,???"..text6.."?????)\n(????????????????,???????????????????)"
	return iText
end 
 
randomMAPsmallmissionTXT[007] = function(text1,text2,text3,text4,text5)
	local iText="??"..text1.."?????????,???????"..text2.."??"..text3.."???"..text4.."??????????"..text5.."???"..text4..",????????(??,?????????????????)"
	return iText
end

randomMAPsmallmissionTXT[008] = function(text1)
	local iText="????"..text1.."???????,?????????????????????,?????????????(?????????????,?????????????????)"
	return iText
end

randomMAPsmallmissionTXT[009] = function(text1,text2,text3,text4)
	local iText="???????"..text4..",????"..text1.."??????"..text2.."???,??????????,?????"..text3.."?????"
	return iText
end 


randomMAPsmallmissionTXT[010] = function(text1,text2,text3,text4)
	local iText="?????????,????1?"..text1.."???"..text2..",????????????"..text3.."???,????,?????"..text4.."?????"..text3.."??????(??:????????????????,???????"..text3.."???????)"
	return iText
end

randomMAPsmallmissionTXT[011] = function(text1,text2)
	local iText="???????,???????"..text1.."????,?????????"..text2.."????"
	return iText
end


randomMAPsmallmissionTXT[012] = function(text1,text2,text3)
	local iText="??"..text1.."?????????????"..text2.."?????,??????,???????"..text3.."????????(?????????????)"
	return iText
end


randomMAPsmallmissionTXT[014] = function(text1,text2,text3,text4,text5)
	local iText="????"..text1.."???"..text2..","..text4..""..text5.." ?????????????????????,???????????"..text3..""
	return iText
end

randomMAPsmallmissionTXT[015] = function(text1,text2,text3,text4,text5,text6)
	local iText="?????????,?"..text1.."???????"..text2.."?"..text3.."???,?????"..text4.."???????,?????????,????????"..text5.."?????"..text6.."??????"
	return iText
end

randomMAPsmallmissionTXT[016] = function(text1)
	local iText="??????,???"..text1.."??????????"
	return iText
end

randomMAPsmallmissionTXT[017] = function(text1,text2)
	local iText="?????"..text1..","..text2.."????????????,??????????(?????????????????)"
	return iText
end


randomMAPsmallmissionTXT[018] = function(text1,text5,text6,text7)
	local iText="??????"..text1.."?????,??????????????"..text5.."??????"..text6.."???????"..text7.."????????,????"
	return iText
end

randomMAPsmallmissionTXT[019] = function(text1,text2)
	local iText="????????"..text1.."??,"..text2.."???????????????,?????????????"
	return iText
end


randomMAPsmallmissionTXT[020] = function(text1,text2,text3,text4)
	local iText="??????????,?????"..text1.."???"..text2..".\n?????????????????????,?????"..text3.."????"..text4.."?????,??????????(??:????????????????????,??????)"
	return iText
end


mapfactorysystemdefLV = {}
mapfactorysystemdefLV[001] = "????????"
mapfactorysystemdefLV[002] = "???????????????"
mapfactorysystemdefLV[003] = "????????????????"
mapfactorysystemdefLV[004] = "???????????????"
mapfactorysystemdefLV[005] = "????????????????"
mapfactorysystemdefLV[006] = "????????????????"

mapgoodsystemTXT = {}
mapgoodsystemTXT[001] = function(text1,text2,text3,text4,text5,text6)
	local iText=""..text1.."?????????????"..text2.."???"..text3..",?????????"..text3.."???????????????,????????????,??"..text4.."???"..text3.."????,"..text5.."????????????(??????"..text6.."????,??????????)"
	return iText
end

mapgoodsystemTXT[002] = function(text1,text2,text3,text4,text5,text6,text7)
	local iText=""..text1.."?????"..text2.."?????"..text3.."?,??????"..text4.."???"..text5..".???????"..text6.."?,"..text7..",????????????"
	return iText
end

mapgoodsystemTXT[003] = function(text1)
	local iText=""..text1.."?????????????10?,??????"
	return iText
end

mapgoodsystemTXT[004] = function(text1,text2,text3)
	local iText="??????"..text1.."????????????????"..text2.."?,?????"..text3.."??"
	return iText
end

mapgoodsystemTXT[005] = function(text1,text2,text3)
	local iText=""..text1.."???????????,?????"..text2.."?,??????????,????????"..text3.."?????"
	return iText
end

mapgoodsystemTXT[006] = function(text1,text2)
	local iText="??????,"..text1.."???????????"..text2.."???"
	return iText
end


mapgoodsystemTXT[007] = function(text1,text2)
	local iText=""..text1.."???"..text2.."??????10?,??????"
	return iText
end

mapgoodsystemTXT[008] = function(text1,text2,text3,text4)
	local iText="??????"..text1.."???"..text4.."?????????"..text2.."?,?????"..text3.."??"
	return iText
end


mapgoodsystemTXT[009] = function(text1,text2,text3,text4)
	local iText=""..text1.."???"..text4.."????,?????"..text2.."?,??????????,????????"..text3.."?????"
	return iText
end

mapgoodsystemTXT[010] = function(text1,text2,text3)
	local iText="??????,"..text1.."???"..text3.."????"..text2.."???"
	return iText
end


mapgoodsystemTXT[011] = function(text1,text2,text3)
	local iText=""..text1.."??????????.???????"..text2.."?,"..text3..",????????????"
	return iText
end

mapgoodsystemTXT[012] = function(text1,text2,text3,text4,text5)
	local iText=""..text1.."?????"..text2.."?????"..text3.."?,??????"..text4.."???"..text5..".???????(????????,????????????????)"
	return iText
end


