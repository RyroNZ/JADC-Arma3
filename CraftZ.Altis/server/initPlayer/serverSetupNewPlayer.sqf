/*

Author: Ryan Post
Date: 7:23 pm 2/01/2015
Description: Sets parameters for a new player on the server (ie. character that has no database entry, or setting them to spawn points).
*/


_player = _this select 0;


_randSpawnNum = (floor (count spawnPoints -1 )); 
_selectRandSpawn = spawnPoints select _randSpawnNum;
_player setPos ( getMarkerPos (_selectRandSpawn));

localize format["Selected spawnPoint %1 at %2", str _randSpawnNum, str getMarkerPos (_selectRandSpawn)];
