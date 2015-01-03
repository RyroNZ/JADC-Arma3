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


//Default temperatures for death or hypothermina. Player can also overheat from infection
DEFAULT_FREEZE_TEMPERATURE = 25;
DEFAULT_HYPO_TEMPERATURE = 30;
DEFAULT_OVERHEAT_TEMPERATURE = 40;

//Damage taken from overheating or freezing
DEFAULT_DAMAGE_OVERHEATING = 0.03;
DEFAULT_DAMAGE_FREEZING = 0.02;

//Temperature increase per 2 seconds from being in a vehicle
DEFAULT_CAR_TEMPERATURE_GAIN = 0.025;
//Temprature increase per each KPH in speed you are running
DEFAULT_RUN_TEMPERATURE_GAIN = 0.0001;

//Heat loss per second. Water Default: 0.138 (300 seconds in 1ºc water) Air Default: 0.0016 (7500 seconds (125 minutes) in 1ºc Air)
DEFAULT_WATER_HEAT_LOSS = 0.0832;
DEFAULT_AIR_HEAT_LOSS = 0.0032;

DEFAULT_START_HUNGER = 4500;
DEFAULT_START_THIRST = 2000;
DEFAULT_START_TEMPERATURE = random 1 + 36.5;
DEFAULT_START_IMMUNITY = 0;
DEFAULT_START_TOXICITY = 0;
DEFAULT_START_CMONEY = 0;

DEFAULT_START_WEATHER = "RAIN";
DEFAULT_WEATHER_SYNC_DELAY = 60;
DEFAULT_DELAY_BETWEEN_FORECAST_UPDATES = 2700;
RANDOM_ADDITIONAL_DELAY_FORECAST = 900;

//Temperature in degrees
DEFAULT_AIR_TEMPERATURE = 14 + random 10;
DEFAULT_WATER_TEMPERATURE = 3;
DEFAULT_WATER_DIFFERENTIAL_TEMP = random 10 + 5;


SPAWN_POINTS = ["spawnPoint_1","spawnPoint_2","spawnPoint_3","spawnPoint_4","spawnPoint_5","spawnPoint_6","spawnPoint_7","spawnPoint_8","spawnPoint_9","spawnPoint_10","spawnPoint_11","spawnPoint_12","spawnPoint_13","spawnPoint_14","spawnPoint_15"];

//init Variables
readyUnits = [];
serverReady = false;

//EventHandlers
[] execVM "server\eventHandlers\playerDied.sqf";

//Core

[] execVM "server\core\databaseSaving\serverPlayerSave.sqf";
[] execVM "server\core\databaseSaving\serverDataSave.sqf";
[] execVM "server\initPlayer\serverPlayerConnected.sqf";
[] execVM "server\initServer\serverConnected.sqf";




