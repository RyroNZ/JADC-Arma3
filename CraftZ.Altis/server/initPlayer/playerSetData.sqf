/*

Author: Ryan Post
Date: 10:10 pm 2/01/2015
Description: Sets parameters for an existing player on the server (ie. reads from database entry and assigns equipment to them)

*/


_playerReadFailed = _this select 0;
_clientID = _this select 1;
_player = _this select 2;
_profile = _this select 3;
_playerData_array = _this select 4;

if (_playerReadFailed) then {
	diag_log format["[server\initPlayer\serverPlayerConnected.sqf]: Read Failed. Setting up new profile for (%1). ProfileID: %2", name _player ,_profile];
	[_clientID, _player] call fnc_setup_new_player;
} else {
	diag_log format["[server\initPlayer\serverPlayerConnected.sqf]: Profile exists for (%1). ProfileID: %2", name _player ,_profile];	
	diag_log format["[server\initPlayer\serverPlayerSetData.sqf]: Setting data from database to player (%1). ProfileID: %2", name _player ,_profile];

	_playerDataStats_array = [(_playerData_array select 0), (_playerData_array select 1), (_playerData_array select 2), (_playerData_array select 16), (_playerData_array select 17), (_playerData_array select 18), (_playerData_array select 18),(_playerData_array select 19) , (_playerData_array select 20)];
	_playerDataInventory_array = [(_playerData_array select 3), (_playerData_array select 4), (_playerData_array select 5), (_playerData_array select 6), (_playerData_array select 7), 
	(_playerData_array select 8), (_playerData_array select 9), (_playerData_array select 10), (_playerData_array select 11)];
	_playerDataMagazines_array = [(_playerData_array select 15)];
	_playerDataWeapons_array = [(_playerData_array select 12), (_playerData_array select 13), (_playerData_array select 14)];

	[_player, _playerDataStats_array] call fnc_setup_player_stats;
	[_player, _playerDataInventory_array] call fnc_setup_add_inventory;
	[_player, _playerDataWeapons_array] call fnc_setup_add_weapons;
	[_player, _playerDataMagazines_array] call fnc_setup_add_magazines;

	diag_log format["[server\initPlayer\serverPlayerSetData.sqf]: Set data successfully for player (%1). ProfileID: %2", name _player ,_profile];
};

[_clientID, _player, _profile] call fnc_player_ready;