-- This file contains all the UIScreens that will be loaded on
--  startup of the app and on startup of the game.

-- Currently the UI only supports one style sheet, support for multiple stylesheets may
--  be supported in the future if needed.
StyleSheets = {
	HW2StyleSheet = {
		filename = "DATA:\\UI\\NewUI\\Styles\\HWRMStyles.lua",
	},
}

-- These screens will be loaded in order of listing...
FrontEndScreens = {
	;
	{
		name = "Background",
		filename = "DATA:\\UI\\NewUI\\Main\\Background.lua",
		activated = 0,
	},
	
	-- This is the name identifier for the screen.
	{
		-- This is the LuaScript that has the code for the screen
		name = "NewMainMenu",
		filename = "DATA:\\UI\\NewUI\\Main\\NewMainMenu.lua",
		activated =0, -- Activate on front end startup (default is zero)
		type = "MainMenu",  -- Type of menu (default is UIScreen)
	},
		
	{
		name = "Achievement",
		filename = "DATA:\\UI\\NewUI\\Achievement.lua",
		activated = 0,
		--type = "Achievement",
	},
	{
		name = "UserProfile",
		filename = "DATA:\\UI\\NewUI\\SinglePlayer\\SPUserProfile.lua",
		activated = 0,
		type = "UserProfile",
	},
	
	{
		name = "NewProfile",
		filename = "DATA:\\UI\\NewUI\\SinglePlayer\\SPNewProfile.lua",
		activated = 0,
		type = "NewProfile",
	},
	
	{
		name = "MissionSelect",
		filename = "DATA:\\UI\\NewUI\\Shared\\MissionSelect.lua",
		activated = 0,
		type = "SPMissionSelect",
	},
	
	{
		name = "PlayerSetup",
		filename = "DATA:\\UI\\NewUI\\Shared\\PlayerSetup.lua",
		activated = 0,
		type = "PlayerSetup",
	},
	
	{
		name = "EmblemSelect",
		filename = "DATA:\\UI\\NewUI\\Shared\\EmblemSelect.lua",
		activated = 0,
		type = "EmblemSelect",
	},
	
	{
		name = "LobbyScreen",
		filename = "DATA:\\UI\\NewUI\\GameRoom.lua",
		activated = 0,
		type = "LobbyScreen",
	},	

	{
		name = "GameTypeInfo",
		filename = "DATA:\\UI\\NewUI\\Shared\\GameTypeInfo.lua",
		activated = 0,
		type = "GameTypeInfo",
	},

	{
		name = "CreateGameScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\CreateGameScreen.lua",
		activated = 0,
		type = "CreateGameScreen",
	},		

	{
		name = "LobbyTitleRoom",
		filename = "DATA:\\UI\\NewUI\\ServerLobby.lua",
		activated = 0,
		type = "LobbyTitleRoom",
	},		

	--{
	--	name = "PasswordScreen",
	--	filename = "DATA:\\UI\\NewUI\\Shared\\PasswordScreen.lua",
	--	activated = 0,
	--},	

	{
		name = "Stats",
		filename = "DATA:\\UI\\NewUI\\Stats.lua",
		activated = 0,
		type = "Statistics",
	},
	
	{
		name = "GameSetup",
		filename = "DATA:\\UI\\NewUI\\Shared\\GameSetup.lua",		
		activated = 0,
		type = "GameSetup",
	},
	
	{
		name = "DirectConnection", -- req'd for ConnectionType
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\DirectConnection.lua",
		activated = 0,
		type = "DirectConnectionScreen",
	},
	{
		name = "IPConnect", -- req'd for ConnectionType
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\IPConnect.lua",
		activated = 0,
		type = "UIDialog",
	},	
	
	-- Warning: DirectConnection and IPConnect must be loaded before this screen
	{
		name = "ConnectionType",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\ConnectionType.lua",
		activated = 0,
		type = "ConnectionType",
	},
	{
		name = "BetaPopupScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\BetaPopupScreen.lua",
		activated = 0,
		type = "BetaPopupScreen",
	},
	--{
	--	name = "StyleSheetTestScreen",
	--	filename = "DATA:\\UI\\NewUI\\Styles\\StyleSheetTestScreen.lua",
	--	activated = 0,
	--},
	{
		name = "FEGameOptions",
		filename = "DATA:\\UI\\NewUI\\FEGameOptions.lua",
		activated = 0,
		type = "FEGameOptions",
	},
	{
		name = "GameInfoScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\GameInfoScreen.lua",
		activated = 0,
		type = "GameInfoScreen",
	},	
	{
		name = "GameFilterScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\GameFilterScreen.lua",
		activated = 0,
		type = "GameFilterScreen",
	},	
		
	-- DIALOGS
	{
		name = "YesNoDialog",
		filename = "DATA:\\UI\\NewUI\\YesNoDialog.lua",
		activated = 0,
		type = "UIDialog",
	},
	{
		name = "ErrorMessage",
		filename = "DATA:\\UI\\NewUI\\ErrorMessage.lua",
		activated = 0,
		type = "ErrorMessage",
	},
	{
		name = "WaitMessage",
		filename = "DATA:\\UI\\NewUI\\WaitMessage.lua",
		activated = 0,
		type = "WaitMessage",
	},
	
	{
		name = "SaveLoadDialog",
		filename = "DATA:\\UI\\NewUI\\Shared\\SaveLoadDialog.lua",
		activated = 0,
		type = "SaveLoadDialog",
	},

	{
		name = "SubtitleScreen",
		filename = "DATA:\\UI\\NewUI\\Subtitle.lua",
		activated = 0,
		type = "SubtitleScreen",
	},
	
	{
		name = "PlayMoviesScreen",
		filename = "DATA:\\UI\\NewUI\\PlayMoviesScreen.lua",
		activated = 0,
		type = "PlayMoviesScreen",
	},
		
	{
		-- This is the LuaScript that has the code for the screen
		name = "PropertyEditorScreen",
		filename = "DATA:\\UI\\NewUI\\Developer\\PropertyEditorScreen.lua",
		activated =0, -- Activate on front end startup (default is zero)
		type = "PropertyEditorScreen",  -- Type of menu (default is UIScreen)
	},
	{
		-- This is the LuaScript that has the code for the screen
		name = "FEChatScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\FEChatScreen.lua",
		activated =0, -- Activate on front end startup (default is zero)
		type = "FEChatScreen",  -- Type of menu (default is UIScreen)
	},
}

TransientScreens = {
	;

	{
		name = "LoadingScreen",
		filename = "DATA:UI/NewUI/LoadingScreen.lua",
		activated = 0,
	},	
	
}

GameScreens = {
	;
			{
		name = "LaunchMenu01",
		filename = "DATA:\\UI\\NewUI\\LaunchMenu01.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuMIDmapmenu",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuMIDmapmenu.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenumissionsystemmenu",
		filename = "DATA:\\UI\\NewUI\\LaunchMenumissionsystemmenu.lua",
		activated = 0,
	},	
	{
		name = "LaunchMenuMapgoodsystemfactory",
		filename = "DATA:\\UI\\NewUI\\factorysystem\\LaunchMenuMapgoodsystemfactory.lua",
		activated = 0,
	},			
							{
		name = "LaunchMenufactorysystemfactorybattleMAP",
		filename = "DATA:\\UI\\NewUI\\factorysystem\\LaunchMenufactorysystemfactorybattleMAP.lua",
		activated = 0,
	},		
							{
		name = "LaunchMenubuildsystemstart",
		filename = "DATA:\\UI\\NewUI\\factorysystem\\LaunchMenubuildsystemstart.lua",
		activated = 0,
	},	
								{
		name = "LaunchMenufactorysystemmissionTXT",
		filename = "DATA:\\UI\\NewUI\\factorysystem\\LaunchMenufactorysystemmissionTXT.lua",
		activated = 0,
	},		
								{
		name = "LaunchMenufactorysystemstart",
		filename = "DATA:\\UI\\NewUI\\factorysystem\\LaunchMenufactorysystemstart.lua",
		activated = 0,
	},	
								{
		name = "LaunchMenufactorysystemstartMAP",
		filename = "DATA:\\UI\\NewUI\\factorysystem\\LaunchMenufactorysystemstartMAP.lua",
		activated = 0,
	},		
								{
		name = "LaunchMenufactorysystemfleet",
		filename = "DATA:\\UI\\NewUI\\factorysystem\\LaunchMenufactorysystemfleet.lua",
		activated = 0,
	},			
								{
		name = "LaunchMenuRPGmissionM01",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM01.lua",
		activated = 0,
	},		
								{
		name = "LaunchMenuRPGmissionM02",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM02.lua",
		activated = 0,
	},	
								{
		name = "LaunchMenuRPGmissionM03",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM03.lua",
		activated = 0,
	},	
								{
		name = "LaunchMenuRPGmissionM04",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM04.lua",
		activated = 0,
	},	
								{
		name = "LaunchMenuRPGmissionM05",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM05.lua",
		activated = 0,
	},		
								{
		name = "LaunchMenuRPGmissionM06",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM06.lua",
		activated = 0,
	},		
								{
		name = "LaunchMenuRPGmissionM07",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM07.lua",
		activated = 0,
	},	
								{
		name = "LaunchMenuRPGmissionM08",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM08.lua",
		activated = 0,
	},	
								{
		name = "LaunchMenuRPGmissionM09",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM09.lua",
		activated = 0,
	},		
								{
		name = "LaunchMenuRPGmissionM12",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM12.lua",
		activated = 0,
	},		
								{
		name = "LaunchMenuRPGmissionM13",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM13.lua",
		activated = 0,
	},	
								{
		name = "LaunchMenuRPGmissionM15",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM15.lua",
		activated = 0,
	},
								{
		name = "LaunchMenuRPGmissionM18",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM18.lua",
		activated = 0,
	},		
									{
		name = "LaunchMenuRPGmissionM19",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM19.lua",
		activated = 0,
	},	
									{
		name = "LaunchMenuRPGmissionM24",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM24.lua",
		activated = 0,
	},		
									{
		name = "LaunchMenuRPGmissionM27",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM27.lua",
		activated = 0,
	},		
									{
		name = "LaunchMenuRPGmissionM28",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM28.lua",
		activated = 0,
	},	
									{
		name = "LaunchMenuRPGmissionM29",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM29.lua",
		activated = 0,
	},			
									{
		name = "LaunchMenuRPGmissionM31",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM31.lua",
		activated = 0,
	},		
									{
		name = "LaunchMenuRPGmissionM32",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM32.lua",
		activated = 0,
	},	
									{
		name = "LaunchMenuRPGmissionM33",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM33.lua",
		activated = 0,
	},		
									{
		name = "LaunchMenuRPGmissionM34",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM34.lua",
		activated = 0,
	},		
									{
		name = "LaunchMenuRPGmissionM35",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM35.lua",
		activated = 0,
	},	
									{
		name = "LaunchMenuRPGmissionM37",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM37.lua",
		activated = 0,
	},	
									{
		name = "LaunchMenuRPGmissionM40",
		filename = "DATA:\\UI\\NewUI\\RPGmission\\LaunchMenuRPGmissionM40.lua",
		activated = 0,
	},						
								{
		name = "LaunchMenuRPGsystemmenu",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuRPGsystemmenu.lua",
		activated = 0,
	},
								{
		name = "LaunchMenufactroyGATE",
		filename = "DATA:\\UI\\NewUI\\LaunchMenufactroyGATE.lua",
		activated = 0,
	},		
							{
		name = "LaunchMenubuildsystemLV10",
		filename = "DATA:\\UI\\NewUI\\LaunchMenubuildsystemLV10.lua",
		activated = 0,
	},	
  {
		name = "LaunchMenuxao_carrierheavyathenaQ1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_carrierheavyathenaQ1.lua",
		activated = 0,
	},		
  {
		name = "LaunchMenuhgn_busnewship861",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuhgn_busnewship861.lua",
		activated = 0,
	},	
  {
		name = "LaunchMenuhgn_busnewship791start",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuhgn_busnewship791start.lua",
		activated = 0,
	},		
  {
		name = "LaunchMenuhgn_busnewship791AA",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuhgn_busnewship791AA.lua",
		activated = 0,
	},		
  {
		name = "LaunchMenuhgn_busnewship791BO",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuhgn_busnewship791BO.lua",
		activated = 0,
	},		
  {
		name = "LaunchMenuhgn_busnewship801",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuhgn_busnewship801.lua",
		activated = 0,
	},				
  {
		name = "LaunchMenuzer_carrier1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuzer_carrier1.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenumodu_carrierMK21",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenumodu_carrierMK21.lua",
		activated = 0,
	},				
	{
		name = "LaunchMenuvgr_battleshiplightcarrier1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuvgr_battleshiplightcarrier1.lua",
		activated = 0,
	},	
	{
		name = "LaunchMenumodu_carrierheavy1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenumodu_carrierheavy1.lua",
		activated = 0,
	},		
	{
		name = "LaunchMenubus_car031",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenubus_car031.lua",
		activated = 0,
	},		
					{
		name = "LaunchMenuzer_stardestroy_Lorenhild1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuzer_stardestroy_Lorenhild1.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenuzer_stardestroy_Wagner1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuzer_stardestroy_Wagner1.lua",
		activated = 0,
	},		
					{
		name = "LaunchMenumodu_carrierhugewitch1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenumodu_carrierhugewitch1.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenuzer_carrierbattlewitch1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuzer_carrierbattlewitch1.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenuxao_carrierLDN1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuxao_carrierLDN1.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenumodu_ND2carrierPoPo1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenumodu_ND2carrierPoPo1.lua",
		activated = 0,
	},		
					{
		name = "LaunchMenutai_battleshipD3carrier1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenutai_battleshipD3carrier1.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenuxao_battleshipD3carrier1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuxao_battleshipD3carrier1.lua",
		activated = 0,
	},			
					{
		name = "LaunchMenuxao_stardesroyershipyard1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_stardesroyershipyard1.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenumodu_resourcecontrollerhuge1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenumodu_resourcecontrollerhuge1.lua",
		activated = 0,
	},		
					{
		name = "LaunchMenuhgn_carrierheavyKZ1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuhgn_carrierheavyKZ1.lua",
		activated = 0,
	},	
	
					{
		name = "LaunchMenumodu_supershipMK71",
		filename = "DATA:\\UI\\NewUI\\LaunchMenumodu_supershipMK71.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenuxao_supercarrier1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_supercarrier1.lua",
		activated = 0,
	},		
					{
		name = "LaunchMenuvgr_supercarrier1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuvgr_supercarrier1.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenuvgr_mothershipMK21",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuvgr_mothershipMK21.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenuxao_dreadnaughtmissle1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuxao_dreadnaughtmissle1.lua",
		activated = 0,
	},		
					{
		name = "LaunchMenumodu_battlecruiseradventure1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenumodu_battlecruiseradventure1.lua",
		activated = 0,
	},			
					{
		name = "LaunchMenuvgr_stardestroy1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuvgr_stardestroy1.lua",
		activated = 0,
	},	
				{
		name = "LaunchMenuvgr_superbattleshipP1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuvgr_superbattleshipP1.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenuvgr_superbattleshipP2",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuvgr_superbattleshipP2.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenumodu_carrier1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenumodu_carrier1.lua",
		activated = 0,
	},	
					{
		name = "LaunchMenumodu_carriership1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenumodu_carriership1.lua",
		activated = 0,
	},
						{
		name = "LaunchMenuhgn_busnewship301",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuhgn_busnewship301.lua",
		activated = 0,
	},	
						{
		name = "LaunchMenuhgn_busnewship781",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuhgn_busnewship781.lua",
		activated = 0,
	},			
						{
		name = "LaunchMenuhgn_busnewship30",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuhgn_busnewship30.lua",
		activated = 0,
	},	
	{
		name = "LaunchMenuhgn_busnewship311",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuhgn_busnewship311.lua",
		activated = 0,
	},		
	{
		name = "LaunchMenuhgn_busnewship321",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuhgn_busnewship321.lua",
		activated = 0,
	},		
						{
		name = "LaunchMenuhgn_busnewship31",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuhgn_busnewship31.lua",
		activated = 0,
	},	
						{
		name = "LaunchMenuhgn_busnewship661",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuhgn_busnewship661.lua",
		activated = 0,
	},		
						{
		name = "LaunchMenuhgn_busnewship671",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuhgn_busnewship671.lua",
		activated = 0,
	},			
							{
		name = "menuIMAPM01",
		filename = "DATA:\\UI\\map\\menuIMAPM01.lua",
		activated = 0,
	},	
						{
		name = "LaunchMenuhgn_busnewship32",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuhgn_busnewship32.lua",
		activated = 0,
	},	
						{
		name = "LaunchMenualos_carrier_huge1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenualos_carrier_huge1.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenualos_carrier_super1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenualos_carrier_super1.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenumodu_carriersuper1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenumodu_carriersuper1.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenumodu_carriersuperBlack1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenumodu_carriersuperBlack1.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenumodu_supershipcarrier1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenumodu_supershipcarrier1.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenumodu_supershipcarrierC1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenumodu_supershipcarrierC1.lua",
		activated = 0,
	},		
						{
		name = "LaunchMenuvgr_carrierbattleship1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuvgr_carrierbattleship1.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuPil_carriersuper1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuPil_carriersuper1.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenumodu_battleship14G1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenumodu_battleship14G1.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuxao_carrierheavyathenaED1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_carrierheavyathenaED1.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuhgn_busnewship371",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuhgn_busnewship371.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuhgn_busnewship481",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuhgn_busnewship481.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuhgn_busnewship571",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuhgn_busnewship571.lua",
		activated = 0,
	},				
							{
		name = "LaunchMenuhgn_busnewship381",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuhgn_busnewship381.lua",
		activated = 0,
	},	
						{
		name = "LaunchMenuxao_carrierheavyathena1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_carrierheavyathena1.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuxao_carrierheavyathena2",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_carrierheavyathena2.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuxao_carrierheavyathena3",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_carrierheavyathena3.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuxao_carrierheavyathena4",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_carrierheavyathena4.lua",
		activated = 0,
	},	
	
						{
		name = "LaunchMenuvgr_carrierhuge1",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuvgr_carrierhuge1.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuvgr_carrierhuge2",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuvgr_carrierhuge2.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuvgr_carrierhuge3",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuvgr_carrierhuge3.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuvgr_carrierhuge4",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuvgr_carrierhuge4.lua",
		activated = 0,
	},	
						{
		name = "LaunchMenuxao_carrierheavyhuge1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_carrierheavyhuge1.lua",
		activated = 0,
	},	
	{
		name = "LaunchMenuxao_carrierheavyathenaBD1",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_carrierheavyathenaBD1.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuxao_carrierheavyathenaBD2",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_carrierheavyathenaBD2.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuxao_carrierheavyathenaBD3",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_carrierheavyathenaBD3.lua",
		activated = 0,
	},	
							{
		name = "LaunchMenuxao_carrierheavyathenaBD4",
		filename = "DATA:\\UI\\NewUI\\shipUI\\LaunchMenuxao_carrierheavyathenaBD4.lua",
		activated = 0,
	},	
	{
		name = "LaunchMenuhgn_busnewship211",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuhgn_busnewship211.lua",
		activated = 0,
	},	
	{
		name = "LaunchMenuhgn_busnewship391",
		filename = "DATA:\\UI\\NewUI\\LaunchMenuhgn_busnewship391.lua",
		activated = 0,
	},		
	{
		name = "Pointer",
		filename = "DATA:\\UI\\NewUI\\Pointer.lua",
		type = "Pointer",
		activated = 1,
	},
	{
		name = "GenericScreen",
		filename = "DATA:\\UI\\NewUI\\Generic.lua",
		activated = 0,
	},	
	--{
	--	name = "ResourceStatsMenu",
	--	filename = "DATA:\\UI\\NewUI\\Resource.lua",
	--	activated = 0,
	--},	
	{
		name = "PlayerDestroyedScreen",
		filename = "DATA:\\UI\\NewUI\\PlayerDestroyedScreen.lua",
		activated = 0,		
	},
	{
		name = "UnitCapInfoPopup",
		type = "UnitCapInfoPopup",
		filename = "DATA:\\UI\\NewUI\\UnitCapInfoPopup.lua",
		activated = 0,
	},
	
	{
		name = "UnitsMenu",
		filename = "DATA:\\UI\\NewUI\\Units.lua",
		activated = 0,
	},
	
	{
		name = "ObjectivesList",
		filename = "DATA:\\UI\\NewUI\\ObjectivesList.lua",
		activated = 0,
		type = "ObjectivesList",
	},
	
	-- Build menu must be loaded before the research menu
	{
		name = "NewBuildMenu",
		filename = "DATA:\\UI\\NewUI\\Build\\FinalBuild.lua",
		activated = 0,
		type = "FinalBuildMenu",	
	},
	
	{
		name = "NewLaunchMenu",
		filename = "DATA:\\UI\\NewUI\\NewLaunch.lua",
		activated = 0,
		type = "NewLaunchMenu",
	},
	
	{
		name = "NewResearchMenu",
		filename = "DATA:\\UI\\NewUI\\Research\\Research.lua",
		activated = 0,
		type = "NewResearchMenu",		
	},
	
	{
		name = "BuildInfo",
		filename = "DATA:\\UI\\NewUI\\Build\\BuildInfo.lua",
		activated = 0,
		type = "BuildInfo",
	},
	
	{
		name = "ResearchInfo",
		filename = "DATA:\\UI\\NewUI\\Research\\ResearchInfo.lua",
		activated = 0,
		type = "ResearchInfo",
	},			
	{
		name = "NewTaskbar",
		filename = "DATA:\\UI\\NewUI\\NewTaskbar.lua",
		activated = 0,
		type = "NewTaskbar",
	},
	{
		name = "NewTaskbarRecover",
		filename = "DATA:\\UI\\NewUI\\NewTaskbar.lua",
		activated = 0,		
	},
	{
		name = "ResourceMenu",
		filename = "DATA:\\UI\\NewUI\\Resource.lua",
		activated = 0,
		--type = "ResourceMenu",
	},	
		{
		name = "fairyMenu01",
		filename = "DATA:\\UI\\NewUI\\fairyMenu01.lua",
		activated = 0,
	},	
			{
		name = "fairyMenu02",
		filename = "DATA:\\UI\\NewUI\\fairyMenu02.lua",
		activated = 0,
	},	
	{
		name = "factoryworkersUI",
		filename = "DATA:\\UI\\NewUI\\factoryworkersUI.lua",
		activated = 0,
	},		
	{
		name = "midmapseleltUI",
		filename = "DATA:\\UI\\NewUI\\midmapseleltUI.lua",
		activated = 0,
	},	
	{
		name = "ENDmission",
		filename = "DATA:\\UI\\NewUI\\ENDmission.lua",
		activated = 0,
	},
	{
		name = "ENDrandomtime",
		filename = "DATA:\\UI\\NewUI\\ENDrandomtime.lua",
		activated = 0,
	},		
	{
		name = "ENDremoveship",
		filename = "DATA:\\UI\\NewUI\\ENDremoveship.lua",
		activated = 0,
	},	
	{
		name = "STARTmissionTRP",
		filename = "DATA:\\UI\\NewUI\\STARTmissionTRP.lua",
		activated = 0,
	},	
	{
		name = "missionmenuITRP09",
		filename = "DATA:\\UI\\NewUI\\missionmenuITRP09.lua",
		activated = 0,
	},
	{
		name = "missionmenuITRP0902",
		filename = "DATA:\\UI\\NewUI\\missionmenuITRP0902.lua",
		activated = 0,
	},		
	{
		name = "ENDattack",
		filename = "DATA:\\UI\\NewUI\\ENDattack.lua",
		activated = 0,
	},	
	{
		name = "ENDshop",
		filename = "DATA:\\UI\\NewUI\\ENDshop.lua",
		activated = 0,
	},		
		{
		name = "carrierNOfighter",
		filename = "DATA:\\UI\\NewUI\\carrierNOfighter.lua",
		activated = 0,
	},	
		{
		name = "buildsystemneed",
		filename = "DATA:\\UI\\NewUI\\buildsystemneed.lua",
		activated = 0,
	},			
				{
		name = "LW_goodsexchange",
		filename = "DATA:\\UI\\NewUI\\LW_goodsexchange.lua",
		activated = 0,
	},	
	{
		name = "EventsScreen",
		filename = "DATA:\\UI\\NewUI\\EventsScreen.lua",
		activated = 0,
		type = "EventsScreen",
	},	

	{
		name = "RightClickMenu",
		filename = "DATA:\\UI\\NewUI\\RightClickMenu.lua",
		activated = 0,
		type = "RightClickMenu",
	},
	{
		name = "DiplomacyScreen",
		filename = "DATA:\\UI\\NewUI\\DiplomacyScreen.lua",
		activated = 0,
		type = "DiplomacyScreen",
	},
	
	{
		name = "InGameMenu",
		filename = "DATA:\\UI\\NewUI\\InGameMenu.lua",
		activated = 0,
		type = "GameMenu",
	},
	
	{
		name = "FleetMenu",
		filename = "DATA:\\UI\\NewUI\\FleetMenu.lua",
		activated = 0,
	},
	
	{	
		name = "TacticsMenu",
		filename = "DATA:\\UI\\NewUI\\TacticsMenu.lua",
		activated = 0,
	},
	
	{
		name = "StrikeGroupsMenu",
		filename = "DATA:\\UI\\NewUI\\StrikeGroupsMenu.lua",
		activated = 0,
	},
	
	{
		name = "BuildQueueMenu",
		filename = "DATA:\\UI\\NewUI\\BuildQueueMenu.lua",
		activated = 0,
		type = "BuildQueueMenu",
	},
	
	{
		name = "ChatScreen",
		filename = "DATA:\\UI\\NewUI\\ChatScreen.lua",
		activated = 0,
		type = "ChatScreen",
	},
	
	{
		name = "ChatFloating",
		filename = "DATA:\\UI\\NewUI\\ChatFloating.lua",
		activated = 1,
	},
	
	{
		name = "PlayerLaggingScreen",
		filename = "DATA:\\UI\\NewUI\\PlayerLaggingScreen.lua",
		activated = 0,
		type = "PlayerLaggingScreen",
	},
	
	{
		name = "SMFiltersMenu",
		filename = "DATA:\\UI\\NewUI\\SMFiltersMenu.lua",
		activated = 0,
		type = "SMFiltersMenu",
	},
	
	{
		name = "SpeechRecall",
		filename = "DATA:\\UI\\NewUI\\SpeechRecall.lua",
		activated = 0,
		type = "SpeechRecall",
	},
	
	{
		name = "PauseScreen",
		filename = "DATA:\\UI\\NewUI\\Shared\\PauseScreen.lua",
		activated = 0,
	},
	
	{
		name = "InGameOptions",
		filename = "DATA:\\UI\\NewUI\\InGameOptions.lua",
		activated = 0,
		type = "InGameOptions",
	},
	
	{
		name = "SaveLoadDialog",
		filename = "DATA:\\UI\\NewUI\\Shared\\SaveLoadDialog.lua",
		activated = 0,
		type = "SaveLoadDialog",
	},
	
	{
		name = "GameOverScreen",
		filename = "DATA:\\UI\\NewUI\\GameOverScreen.lua",
		activated = 0,
		type = "GameOverScreen",
	},	
	{
		name = "bentusidialog",
		filename = "DATA:\\UI\\NewUI\\BentusiDialog.lua",
		activated = 0,
	},	

	{
		name = "PlaybackMenu",
		filename = "DATA:\\UI\\NewUI\\Playback\\PlaybackMenu.lua",
		activated = 0,
		type = "PlaybackMenu",
	},
	
	{
		name = "NotForPublicDisplay",
		filename = "DATA:\\UI\\NewUI\\NotForPublicDisplay.lua",
		activated = 0,
		--type = "NotForPublicDisplay",
	},	
	
	{
		name = "SubtitleScreen",
		filename = "DATA:\\UI\\NewUI\\Subtitle.lua",
		activated = 0,
		type = "SubtitleScreen",
	},

	{
		name = "SubtitleInputScreen",
		filename = "DATA:\\UI\\NewUI\\SubtitleInput.lua",
		activated = 0,
	},


	-- DIALOGS
	{
		name = "YesNoDialog",
		filename = "DATA:\\UI\\NewUI\\YesNoDialog.lua",
		activated = 0,
		type = "UIDialog",
	},	
	{
		name = "ErrorMessage",
		filename = "DATA:\\UI\\NewUI\\ErrorMessage.lua",
		activated = 0,
		type = "ErrorMessage",
	},
	{
		name = "GateMenu1",
		filename = "DATA:\\UI\\NewUI\\GateMenu1.lua",
		activated = 0,
	},
	{
		name = "GateMenu2",
		filename = "DATA:\\UI\\NewUI\\GateMenu2.lua",
		activated = 0,
	},
		{
		name = "gatemenuICON",
		filename = "DATA:\\UI\\NewUI\\gatemenuICON.lua",
		activated = 0,
	},
		{
		name = "gatemenuICONM0101",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONM0101.lua",
		activated = 0,
	},	
	{
		name = "gatemenuICONM0102",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONM0102.lua",
		activated = 0,
	},	
	{
		name = "gatemenuICONM0103",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONM0103.lua",
		activated = 0,
	},		
		{
		name = "gatemenuICONM4001",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONM4001.lua",
		activated = 0,
	},	
		{
		name = "gatemenuICONM4002",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONM4002.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONM4003",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONM4003.lua",
		activated = 0,
	},	
	{
		name = "gatemenuICONM4004",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONM4004.lua",
		activated = 0,
	},
	{
		name = "gatemenuICONM4005",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONM4005.lua",
		activated = 0,
	},	
	{
		name = "gatemenuICONM4006",
		filename = "DATA:\\UI\\NewUI\\mapshipicon\\map40\\gatemenuICONM4006.lua",
		activated = 0,
	},		
	{
		name = "gatemenuICONM4801",
		filename = "DATA:\\UI\\NewUI\\mapshipicon\\map48\\gatemenuICONM4801.lua",
		activated = 0,
	},		
		{
		name = "gatemenuICONMM4201",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONMM4201.lua",
		activated = 0,
	},			
		{
		name = "gatemenuICONM3101",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONM3101.lua",
		activated = 0,
	},
			{
		name = "gatemenuICONM3201",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONM3201.lua",
		activated = 0,
	},	
		{
		name = "gatemenuICONM3102",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONM3102.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONM3103",
		filename = "DATA:\\UI\\NewUI\\gatemenuICONM3103.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP01",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP01.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP02",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP02.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP03",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP03.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP04",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP04.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP05",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP05.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP06",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP06.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP07",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP07.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP08",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP08.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP09",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP09.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP10",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP10.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP11",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP11.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP12",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP12.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP13",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP13.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP14",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP14.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP15",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP15.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP16",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP16.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP17",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP17.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP18",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP18.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP19",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP19.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP20",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP20.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP21",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP21.lua",
		activated = 0,
	},		
			{
		name = "gatemenuICONMAP22",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP22.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP23",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP23.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP24",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP24.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP25",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP25.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP26",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP26.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP27",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP27.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP28",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP28.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP29",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP29.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP30",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP30.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP31",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP31.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP32",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP32.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP33",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP33.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP34",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP34.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP35",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP35.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP36",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP36.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP37",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP37.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP38",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP38.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP39",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP39.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP40",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP40.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP41",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP41.lua",
		activated = 0,
	},		
			{
		name = "gatemenuICONMAP42",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP42.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP43",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP43.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP44",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP44.lua",
		activated = 0,
	},		
			{
		name = "gatemenuICONMAP45",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP45.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP46",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP46.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP47",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP47.lua",
		activated = 0,
	},		
			{
		name = "gatemenuICONMAP48",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP48.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP49",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP49.lua",
		activated = 0,
	},	
			{
		name = "gatemenuICONMAP50",
		filename = "DATA:\\UI\\NewUI\\map\\gatemenuICONMAP50.lua",
		activated = 0,
	},														
	{
		name = "shipGateMenu01",
		filename = "DATA:\\UI\\NewUI\\shipGateMenu01.lua",
		activated = 0,
	},	
	{
		name = "ModMenu",
		filename = "DATA:\\UI\\NewUI\\ModMenu.lua",
		activated = 0,
	},
	{
		name = "MusicMenu",
		filename = "DATA:\\UI\\NewUI\\MusicPlayer.lua",
		activated = 0,
	},
	{
		name = "MusicListMenu",
		filename = "DATA:\\UI\\NewUI\\MusicList.lua",
		activated = 0,
	},
	{
		name = "GoodsMenu",
		filename = "DATA:\\UI\\NewUI\\GoodsMenu.lua",
		activated = 0,
	},
	{
		name = "TradeMenu",
		filename = "DATA:\\UI\\NewUI\\TradeMenu.lua",
		activated = 0,
	},
	{
		name = "TradeMenu2",
		filename = "DATA:\\UI\\NewUI\\TradeMenu2.lua",
		activated = 0,
	},
	{
		name = "ChooseTypeMenu",
		filename = "DATA:\\UI\\NewUI\\typechoose.lua",
		activated = 0,
	},
	{
		name = "ChangeTypeMenu",
		filename = "DATA:\\UI\\NewUI\\typechange.lua",
		activated = 0,
	},
	{
		name = "BuyShipConfirmMenu",
		filename = "DATA:\\UI\\NewUI\\BuyShipConfirm.lua",
		activated = 0,
	},
	{
		name = "GoodLoadMenu",
		filename = "DATA:\\UI\\NewUI\\GoodLoad.lua",
		activated = 0,
	},
	{
		name = "FXLF_FleetMenu",
		filename = "DATA:\\UI\\NewUI\\LF_FleetBuy.lua",
		activated = 0,
	},

	---- Debug Screens -----
	{
		name = "DebugScreen",
		filename = "DATA:\\UI\\NewUI\\Developer\\DebugScreen.lua",
		activated = 0,
	},	

	{
		-- This is the LuaScript that has the code for the screen
		name = "PropertyEditorScreen",
		filename = "DATA:\\UI\\NewUI\\Developer\\PropertyEditorScreen.lua",
		activated =0, -- Activate on front end startup (default is zero)
		type = "PropertyEditorScreen",  -- Type of menu (default is UIScreen)
	},
	{ 
	--DT MOD 单机关卡所用开场介绍字幕界面
		name = "LocationMenu", 
		filename = "DATA:\\UI\\NewUI\\Location.lua", 
		activated = 0, 
	}, 
	
	{ 
		name = "LW_shipmake", 
		filename = "DATA:\\UI\\NewUI\\LW_shipmake.lua", 
		activated = 0, 
	}, 
	
	-- Patched by TehnoMag
	{
		name = "midmapSalvage",
		filename = "DATA:\\UI\\NewUI\\midmapsalvage.lua",
		activated = 0
	}
}
