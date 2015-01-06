/*

Author: Ryan Post
Date: 10:10 pm 2/01/2015
Description: Sets parameters for an existing player on the server (ie. reads from database entry and assigns equipment to them)

*/
private ["_clientID", "_player", "_playerDataArray"];

_clientID = _this select 0;
_player = _this select 1;
_profile = format[PLAYER_ID_PREFIX, getPlayerUID _player];
_playerDataArray = _this select 2;

_playerDataStats_array = [(_playerDataArray select 0), (_playerDataArray select 1), (_playerDataArray select 2), 
(_playerDataArray select 16), (_playerDataArray select 17), (_playerDataArray select 18), (_playerDataArray select 19),(_playerDataArray select 20) , (_playerDataArray select 21)];

_playerDataInventory_array = [(_playerDataArray select 3), (_playerDataArray select 4), (_playerDataArray select 5), (_playerDataArray select 6), (_playerDataArray select 7), 
(_playerDataArray select 8), (_playerDataArray select 9), (_playerDataArray select 10), (_playerDataArray select 11)];

_playerDataMagazines_array = [(_playerDataArray select 15)];

_palyerDataWeapons_array = [(_playerDataArray select 12), (_playerDataArray select 13), (_playerDataArray select 14)];

diag_log format["[server\initPlayer\serverPlayerSetData.sqf]: Setting data from database to player (%1). ProfileID: %2", name _player ,_profile];

[_player, _playerDataStats_array] call fnc_setup_player_stats;
[_player, _playerDataInventory_array] call fnc_setup_add_inventory;
[_player, _palyerDataWeapons_array] call fnc_setup_add_weapons;
[_player, _playerDataMagazines_array] call fnc_setup_add_magazines;

diag_log format["[server\initPlayer\serverPlayerSetData.sqf]: Set data successfully for player (%1). ProfileID: %2", name _player ,_profile];
[_clientID, _player, _profile] call fnc_player_ready;
