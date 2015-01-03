/*

Author: Ryan Post
Date: 8:13 pm 2/01/2015
Description: Sets parameters for a new player on the server (ie. character that has no database entry, or setting them to spawn points).

*/

_player = _this select 0;


_randSpawnNum = (floor (random (count SPAWN_POINTS - 1))); //a number between 0 and maximum spawn points
_selectRandSpawn = SPAWN_POINTS select _randSpawnNum; //choose the spawn from the array
_player setPos ( getMarkerPos (_selectRandSpawn)); // set the player to this spawn point

diag_log format["[server\initPlayer\serverPlayerNew.sqf]: Using spawn point %1 for (%2). ProfileID: %3", _randSpawnNum, name _player ,_profile];


_player SetVariable ["hungerLevel", DEFAULT_START_HUNGER, true];
_player SetVariable ["thirstLevel", DEFAULT_START_THIRST, true];
_player SetVariable ["temperatureLevel", DEFAULT_START_TEMPERATURE, true];
_player SetVariable ["Immunity", DEFAULT_START_IMMUNITY, true];
_player SetVariable ["Toxicity", DEFAULT_START_TOXICITY, true];
_player SetVariable ["cMoney", DEFAULT_START_CMONEY, true];

