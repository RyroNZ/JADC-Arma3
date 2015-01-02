/*

Author: Ryan Post
Date: 8:13 pm 2/01/2015
Description: Sets parameters for a new player on the server (ie. character that has no database entry, or setting them to spawn points).

*/

_player = _this select 0;


_randSpawnNum = (floor (random (count spawnPoints - 1))); //a number between 0 and maximum spawn points
_selectRandSpawn = spawnPoints select _randSpawnNum; //choose the spawn from the array
_player setPos ( getMarkerPos (_selectRandSpawn)); // set the player to this spawn point

localize format["Selected spawnPoint %1 at %2", str _randSpawnNum, str getMarkerPos (_selectRandSpawn)];


_player SetVariable ["hungerLevel", 5000, true];
_player SetVariable ["thirstLevel", 2000, true];
_player SetVariable ["temperatureLevel", 37.0, true];
_player SetVariable ["Immunity", 0, true];
_player SetVariable ["Toxicity", 0, true];
_player SetVariable ["cMoney", 0, true];

