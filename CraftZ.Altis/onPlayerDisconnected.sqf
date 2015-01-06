_playerName = _this select 1;
_playerUID = _this select 2;
_profile = format[PLAYER_ID_PREFIX, _playerUID];
_playerExists = _profile call iniDB_exists; // If profile exists, the player hasn't been killed... delete the body.

{ 
	if (!isPlayer _x) then {

		playerPos = [_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_LOCATION,"ARRAY"] call iniDB_read;

		if (_playerExists) then {
		deleteVehicle _x;
		};
		readyUnits = readyUnits - [_x]; 

		diag_log format["[onPlayerDisconnected.sqf]: Removing profile for player (%1) from readyUnits", _playerName]; 
	};
} forEach readyUnits;

