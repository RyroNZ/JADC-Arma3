/*

Author: Ryan Post
Date: 7:01 pm 2/01/2015
Description: Sets required variables, EventHandlers and scripts to run on the server at startup
*/


call compile preProcessFile "\inidbi\init.sqf";

//EventHandlers
[] execVM "server\eventHandlers\playerDied.sqf";

//Static Variables

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




SPAWN_POINTS = ["spawnPoint_1","spawnPoint_2","spawnPoint_3","spawnPoint_4","spawnPoint_5","spawnPoint_6","spawnPoint_7","spawnPoint_8","spawnPoint_9","spawnPoint_10","spawnPoint_11","spawnPoint_12","spawnPoint_13","spawnPoint_14","spawnPoint_15"];

//init Variables
readyUnits = [];

[] execVM "server\serverSaveData.sqf";
[] execVM "server\initPlayer\serverSetupPlayer.sqf";


