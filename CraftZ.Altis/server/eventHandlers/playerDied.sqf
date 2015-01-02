/*

Author: Ryan Post
Date: 7:23 pm 2/01/2015
Description: Perform any cleanup required after a player has died
*/

"playerKilled_array" addPublicVariableEventHandler {

	_player = playerKilled_array select 0;
	_killer = playerKilled_array select 1;
	_respawn = playerKilled_array select 2;
	_respawnDelay = playerKilled_array select 3;

	_profile = format["PlayerID_%1", getPlayerUID _player];
	_profile call iniDB_delete;

	readyUnits = readyUnits -  [_player];
	localize format["Removing %1 from readyUnits", str readyUnits];

};