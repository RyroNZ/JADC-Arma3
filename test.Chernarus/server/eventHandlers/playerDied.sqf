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
	_playerDeleted = false;

	readyUnits = readyUnits -  [_player];
	diag_log format["[server\eventHandlers\playerDied.sqf]: Removing profile for player (%1)", name _player];

	_profile = format[PLAYER_ID_PREFIX, getPlayerUID _player];
	while {!_playerDeleted} do {

	_playerDeleted = _profile call iniDB_delete;
	diag_log format["[server\eventHandlers\playerDied.sqf]: Player: %1 PlayerDeleted? %2 Profile? %3", name _player , _playerDeleted, _profile];
		
	};



};