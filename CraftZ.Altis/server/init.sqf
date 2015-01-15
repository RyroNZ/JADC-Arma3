/*

Author: Ryan Post
Date: 7:01 pm 2/01/2015
Description: Sets required variables, EventHandlers and scripts to run on the server at startup
*/



//init Variables
readyUnits = [];
currentZombieAgent_array = [];
serverReady = false;
onPlayerDisconnected SERVER_EVENT_ON_PLAYER_DISCONNECTED;

//EventHandlers
[] execVM SERVER_EXEC_EVENT_PLAYER_DIED;

//Core
[] execVM SERVER_EXEC_PLAYER_SAVE;
[] execVM SERVER_EXEC_DATA_SAVE;
[] execVM SERVER_EXEC_PLAYER_CONNECTED;
[] execVM SERVER_EXEC_INIT_SERVER;
[] execVM "server\core\receiveFromDialog\receiveItemUsed.sqf";
[] execVM "server\core\receiveFromDialog\receiveItemCrafted.sqf";



PLAYER_SPAWN_POINTS = [];
VEHICLE_SEA_SPAWN = [];
VEHICLE_LAND_SPAWN = [];
VEHICLE_AIR_SPAWN = [];

{
	switch(true) do 
	{
		case (["spawnPoint", _x] call BIS_fnc_inString):
		{
			PLAYER_SPAWN_POINTS pushback _x;
		};
		case (["seaSpawn", _x] call BIS_fnc_inString):
		{
			VEHICLE_SEA_SPAWN pushback _x;
		};
		case (["landSpawn", _x] call BIS_fnc_inString):
		{
			VEHICLE_LAND_SPAWN pushback _x;
		};
		case (["airSpawn", _x] call BIS_fnc_inString):
		{
			VEHICLE_AIR_SPAWN pushback _x;
		};
	};
} forEach allMapMarkers;

{
	_x setMarkerAlpha 0;
} forEach PLAYER_SPAWN_POINTS;