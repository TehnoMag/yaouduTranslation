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
