/*

Author: Ryan Post
Date: 7:01 pm 2/01/2015
Description: Sets required variables, EventHandlers and scripts to run on the server at startup
*/


{
	_x setMarkerAlpha 0;
} forEach PLAYER_SPAWN_POINTS;

//init Variables
readyUnits = [];
serverReady = false;
onPlayerDisconnected SERVER_EVENT_ON_PLAYER_DISCONNECTED;

//EventHandlers
[] execVM SERVER_EXEC_EVENT_PLAYER_DIED;

//Core
[] execVM SERVER_EXEC_PLAYER_SAVE;
[] execVM SERVER_EXEC_DATA_SAVE;
[] execVM SERVER_EXEC_PLAYER_CONNECTED;
[] execVM SERVER_EXEC_INIT_SERVER;





