/*

Author: Ryan Post
Date: 8:13 pm 2/01/2015
Description: This script is run locally on clients machine when they are killed
*/

_player = _this select 0;
_killer = _this select 1;
_respawn = _this select 2;
_respawnDelay = _this select 3;

playerKilled_array = [_player, _killer, _respawn, _respawnDelay];
publicVariableServer "playerKilled_array";

