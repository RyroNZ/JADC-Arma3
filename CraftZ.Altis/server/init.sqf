/*

Author: Ryan Post
Date: 7:01 pm 2/01/2015
Description: Sets required variables, EventHandlers and scripts to run on the server at startup
*/

call compile preProcessFile "\inidbi\init.sqf";

//Static Variables

SERVER_ID = "testServer_01";
//Default Tick for Hunger/Food multiplied by runspeed, or idle
DEFAULT_HUNGER_RATE_MULTI = 0.075;
DEFAULT_HUNGER_RATE_IDLE = -0.2;

DEFAULT_THIRST_RATE_MULTI = 0.1;
DEFAULT_THIRST_RATE_IDLE = -0.3;

DEFAULT_DAMAGE_HUNGER = 0.01;
DEFAULT_DAMAGE_THIRST = 0.02;

DEFAULT_MAX_HUNGER = 4500;
DEFAULT_MAX_THIRST = 2000;

DEFAULT_START_HUNGER = 4500;
DEFAULT_START_THIRST = 2000;
DEFAULT_START_TEMPERATURE = 37;
DEFAULT_START_IMMUNITY = 0;
DEFAULT_START_TOXICITY = 0;
DEFAULT_START_CMONEY = 0;

DEFAULT_START_WEATHER = "RAIN";
DEFAULT_WEATHER_SYNC_DELAY = 60;
DEFAULT_DELAY_BETWEEN_FORECAST_UPDATES = 2700;
RANDOM_ADDITIONAL_DELAY_FORECAST = 900;

//Temperature in degrees
DEFAULT_AVERAGE__AIR_TEMPERATURE = 20;
DEFAULT_AVERAGE_TEMPERATURE_VARIATION = 9;

SPAWN_POINTS = ["spawnPoint_1","spawnPoint_2","spawnPoint_3","spawnPoint_4","spawnPoint_5","spawnPoint_6","spawnPoint_7","spawnPoint_8","spawnPoint_9","spawnPoint_10","spawnPoint_11","spawnPoint_12","spawnPoint_13","spawnPoint_14","spawnPoint_15"];

//init Variables
readyUnits = [];
serverReady = false;

//EventHandlers
[] execVM "server\eventHandlers\playerDied.sqf";

//Core

[] execVM "server\core\databaseSaving\serverPlayerSave.sqf";
[] execVM "server\core\databasingSaving\serverDataSave.sqf";
[] execVM "server\initPlayer\serverPlayerConnected.sqf";
[] execVM "server\initServer\serverConnected.sqf";




