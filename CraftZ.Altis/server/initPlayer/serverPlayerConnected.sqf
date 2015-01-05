/*

Author: Ryan Post
Date: 7:01 pm 2/01/2015
Description: Loads the required scripts for loading/generating new character

*/


"PV_ClientID" addPublicVariableEventHandler {

	_clientID = owner (_this select 1);
	_player = _this select 1;
	_profile = format["PlayerID_%1", getPlayerUID _player];


	if (_profile call iniDB_exists) then {

		diag_log format["[server\initPlayer\serverPlayerConnected.sqf]: Profile exists for (%1). ProfileID: %2", name _player ,_profile];

		_playerDataArray = [_clientID, _player, _profile] call fnc_load_player;
		[_clientID, _player, _playerDataArray] execVM "server\initPlayer\serverPlayerSetData.sqf";


	} else {
		diag_log format["[server\initPlayer\serverPlayerConnected.sqf]: Setting up new profile for (%1). ProfileID: %2", name _player ,_profile];
		[_clientID, _player] execVM "server\initPlayer\serverPlayerNew.sqf";

	};

	
};
		