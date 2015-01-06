/*

Author: Ryan Post
Date: 8:13 pm 2/01/2015
Description: Sets parameters for a new player on the server (ie. character that has no database entry, or setting them to spawn points).

*/

_clientID = _this select 0;
_player = _this select 1;
_profile = format["PlayerID_%1", getPlayerUID _player];

_randSpawnNum = (floor (random (count SPAWN_POINTS - 1))); //a number between 0 and maximum spawn points
_selectRandSpawn = SPAWN_POINTS select _randSpawnNum; //choose the spawn from the array
_player setPos ( getMarkerPos (_selectRandSpawn)); // set the player to this spawn point

diag_log format["[server\initPlayer\serverPlayerNew.sqf]: Using spawn point %1 for (%2). ProfileID: %3", _randSpawnNum, name _player ,_profile];

_player SetVariable ["hungerLevel", 4500, true];
_player SetVariable ["thirstLevel", 2000, true];
_player SetVariable ["temperatureLevel", 36.5 + random 1, true];
_player SetVariable ["immunityLevel", 0, true];
_player SetVariable ["toxicityLevel", 0, true];
_player SetVariable ["cMoney", 0, true];

[_clientID, _player, _profile] call fnc_player_ready;

