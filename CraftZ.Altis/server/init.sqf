/*

Author: Ryan Post
Date: 7:01 pm 2/01/2015
Description: Sets required variables, EventHandlers and scripts to run on the server at startup
*/

call compile preProcessFile "\inidbi\init.sqf";
[] call compile preprocessFileLineNumbers "server\compile.sqf";

//Static Variables

SERVER_ID = "testServer_01";
//Default Tick for Hunger/Food multiplied by runspeed, or idle


DEFAULT_START_WEATHER = "RAIN";
DEFAULT_WEATHER_SYNC_DELAY = 60;
DEFAULT_DELAY_BETWEEN_FORECAST_UPDATES = 2700;
RANDOM_ADDITIONAL_DELAY_FORECAST = 900;


SPAWN_POINTS = ["spawnPoint_1","spawnPoint_2","spawnPoint_3","spawnPoint_4","spawnPoint_5","spawnPoint_6","spawnPoint_7","spawnPoint_8","spawnPoint_9","spawnPoint_10","spawnPoint_11","spawnPoint_12","spawnPoint_13","spawnPoint_14","spawnPoint_15", "spawnPoint_16"];
{
	_x setMarkerAlpha 0;
} forEach SPAWN_POINTS;

//init Variables
readyUnits = [];
serverReady = false;
onPlayerDisconnected "[_id, _name, _uid] execVM ""onPlayerDisconnected.sqf"";";

//EventHandlers
[] execVM "server\eventHandlers\playerDied.sqf";

//Core

[] execVM "server\core\databaseSaving\serverPlayerSave.sqf";
[] execVM "server\core\databaseSaving\serverDataSave.sqf";
[] execVM "server\initPlayer\serverPlayerConnected.sqf";
[] execVM "server\initServer\serverConnected.sqf";




