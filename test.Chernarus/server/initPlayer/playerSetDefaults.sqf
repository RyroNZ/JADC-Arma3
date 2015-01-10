/*

Author: Ryan Post
Date: 8:13 pm 2/01/2015
Description: Sets parameters for a new player on the server (ie. character that has no database entry, or setting them to spawn points).

*/

_clientID = _this select 0;
_player = _this select 1;
_profile = format[PLAYER_ID_PREFIX, getPlayerUID _player];

_randSpawnNum = (floor (random (count PLAYER_SPAWN_POINTS - 1))); //a number between 0 and maximum spawn points
_selectRandSpawn = PLAYER_SPAWN_POINTS select _randSpawnNum; //choose the spawn from the array
_player setPos ( getMarkerPos (_selectRandSpawn)); // set the player to this spawn point

diag_log format["[server\initPlayer\serverPlayerNew.sqf]: Using spawn point %1 for (%2). ProfileID: %3", _randSpawnNum, name _player ,_profile];

_player setVariable [PLAYER_HUNGER_LEVEL_IDC, PLAYER_START_HUNGER, true];
_player SetVariable [PLAYER_THIRST_LEVEL_IDC, PLAYER_START_THIRST, true];
_player SetVariable [PLAYER_TEMP_LEVEL_IDC, PLAYER_START_TEMP, true];
_player SetVariable [PLAYER_IMMUNITY_LEVEL_IDC, PLAYER_START_IMMUNITY, true];
_player SetVariable [PLAYER_TOXICITY_LEVEL_IDC, PLAYER_START_TOXICITY, true];

