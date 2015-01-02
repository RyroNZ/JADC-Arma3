/*

Author: Ryan Post
Date: 7:01 pm 2/01/2015
Description: Loads the required scripts for loading/generating new character

*/


fnc_load_player = compile preprocessFileLineNumbers "server\initPlayer\serverLoadPlayer.sqf";
fnc_set_player_data = compile preprocessFileLineNumbers "server\initPlayer\serverSetPlayerData.sqf";
fnc_setup_new_player = compile preprocessFileLineNumbers "server\initPlayer\serverSetupNewPlayer.sqf";
fnc_player_ready = compile preprocessFileLineNumbers "server\initPlayer\serverPlayerReady.sqf";


"PV_ClientID" addPublicVariableEventHandler {

	_clientID = owner (_this select 1);
	_player = PV_clientID;
	_profile = format["PlayerID_%1", getPlayerUID _player];

	if (_profile call iniDB_exists) then {

		localize format["%1 exists!", _profile];

		[_clientID, _player, _profile] call fnc_load_player;
		[_clientID, _player] call fnc_set_player_data;


	} else {
		localize format["%1 does not exist! Setting up new profile", _profile];
		[_player] call fnc_setup_new_player;

	};
	//Player must have either existing loadout or new loadout
	[_player] call fnc_player_ready;
	


};
		