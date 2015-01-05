fnc_load_player = compile preprocessFileLineNumbers "server\initPlayer\serverPlayerLoad.sqf";
fnc_set_player_data = compile preprocessFileLineNumbers "server\initPlayer\serverPlayerSetData.sqf";
fnc_setup_new_player = compile preprocessFileLineNumbers "server\initPlayer\serverPlayerNew.sqf";

fnc_setup_player_stats = compile preprocessFileLineNumbers "server\initPlayer\addPlayerItems\setPlayerStats.sqf";
fnc_setup_add_inventory = compile preprocessFileLineNumbers "server\initPlayer\addPlayerItems\addInventory.sqf";
fnc_setup_add_magazines = compile preprocessFileLineNumbers "server\initPlayer\addPlayerItems\addMagazines.sqf";
fnc_setup_add_weapons = compile preprocessFileLineNumbers "server\initPlayer\addPlayerItems\addWeapons.sqf";


fnc_load_data = compile preprocessFileLineNumbers "server\initServer\serverDataLoad.sqf";
fnc_new_data = compile preprocessFileLineNumbers "server\initServer\serverDataNew.sqf";
fnc_ready_data = compile preprocessFileLineNumbers "server\initServer\serverDataReady.sqf";

fnc_player_ready = compile preprocessFileLineNumbers "server\initPlayer\serverPlayerReady.sqf";

fnc_status_hunger = compile preprocessFileLineNumbers "server\player\updateHunger.sqf";
fnc_status_thirst = compile preprocessFileLineNumbers "server\player\updateThirst.sqf";
fnc_status_run_speed = compile preprocessFileLineNumbers "server\player\runSpeed.sqf";
fnc_status_temperature = compile preprocessFileLineNumbers "server\player\updateTemperature.sqf";
