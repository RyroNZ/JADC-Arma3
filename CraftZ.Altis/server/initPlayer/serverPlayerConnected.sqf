/*

Author: Ryan Post
Date: 7:01 pm 2/01/2015
Description: Loads the required scripts for loading/generating new character

*/


fnc_load_player = compile preprocessFileLineNumbers "server\initPlayer\serverPlayerLoad.sqf";
fnc_set_player_data = compile preprocessFileLineNumbers "server\initPlayer\serverPlayerSetData.sqf";
fnc_setup_new_player = compile preprocessFileLineNumbers "server\initPlayer\serverPlayerNew.sqf";
fnc_player_ready = compile preprocessFileLineNumbers "server\initPlayer\serverPlayerReady.sqf";


"PV_ClientID" addPublicVariableEventHandler {

	_clientID = owner (_this select 1);
	_player = PV_clientID;
	_profile = format["PlayerID_%1", getPlayerUID _player];

	if (_profile call iniDB_exists) then {

		diag_log format["[server\initPlayer\serverPlayerConnected.sqf]: Profile exists for (%1). ProfileID: %2", name _player ,_profile];

		[_clientID, _player, _profile] call fnc_load_player;
		[_clientID, _player] call fnc_set_player_data;


	} else {
		diag_log format["[server\initPlayer\serverPlayerConnected.sqf]: Setting up new profile for (%1). ProfileID: %2", name _player ,_profile];
		[_player] call fnc_setup_new_player;

	};
	//Player must have either existing loadout or new loadout
	[_clientID, _player, _profile] call fnc_player_ready;
	


};
		