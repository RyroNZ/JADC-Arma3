/*

Author: Ryan Post
Date: 8:13 pm 2/01/2015
Description: Load players profile from database

*/

if (!isServer) exitWith {};

_clientID = _this select 0;
_player = _this select 1;
_profile = _this select 2;

	
//============	Load Stats

//PLAYER
playerPos = 			[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_LOCATION, DB_TYPE_ARRAY] call iniDB_read;
playerHealth =		[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_HEALTH, DB_TYPE_SCALAR] call iniDB_read;
playerOxygen =		[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_OXYGEN, DB_TYPE_SCALAR] call iniDB_read;

//INVENTORY

playerBackpack = 	[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_BACKPACK, DB_TYPE_STRING] call iniDB_read;
playerBackpackGear = [_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_BACKPACK_GEAR, DB_TYPE_ARRAY] call iniDB_read;
playerVest =			[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_VEST, DB_TYPE_STRING] call iniDB_read;
playerVestGear =		[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_VEST_GEAR, DB_TYPE_ARRAY] call iniDB_read;
playerUniform =		[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_UNIFORM, DB_TYPE_STRING] call iniDB_read;
playerUniformGear = 	[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_UNIFORM_GEAR, DB_TYPE_ARRAY] call iniDB_read;
playerGadgets = 		[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_GADGETS, DB_TYPE_ARRAY] call iniDB_read;
playerHeadgear =		[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_HEADGEAR, DB_TYPE_STRING] call iniDB_read;
playerGoggles =		[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_GOGGLES, DB_TYPE_STRING] call iniDB_read;
playerWep = 			[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_WEAPONS, DB_TYPE_ARRAY] call iniDB_read;
playerPrimWepAttach =[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_WEAPON_ATTACH_PRIM, DB_TYPE_ARRAY] call iniDB_read;
playerSecWepAttach = [_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_WEAPON_ATTACH_SEC, DB_TYPE_ARRAY]  call iniDB_read;	
playerMagazines = [_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_MAGAZINES, DB_TYPE_ARRAY] call iniDB_read;

//EXTRA

playerHungerLevel =		[_profile, DB_CATAGORY_CUSTOM_VARIABLES, DB_SUB_CATAGORY_HUNGER, DB_TYPE_SCALAR] call iniDB_read;
playerThirstLevel = 		[_profile, DB_CATAGORY_CUSTOM_VARIABLES, DB_SUB_CATAGORY_THIRST, DB_TYPE_SCALAR] call iniDB_read;
playerTemperature = [_profile, DB_CATAGORY_CUSTOM_VARIABLES, DB_SUB_CATAGORY_TEMP, DB_TYPE_SCALAR] call iniDB_read;
playerImmunity = [_profile, DB_CATAGORY_CUSTOM_VARIABLES, DB_SUB_CATAGORY_IMMUNITY, DB_TYPE_SCALAR] call iniDB_read;
playerToxicity = [_profile, DB_CATAGORY_CUSTOM_VARIABLES, DB_SUB_CATAGORY_TOXICITY, DB_TYPE_SCALAR] call iniDB_read;

//playerFood = 		[_profile, DB_CATAGORY_PLAYER_DATA, "food", DB_TYPE_ARRAY] call iniDB_read;
//playerWater = 		[_profile, DB_CATAGORY_PLAYER_DATA, "water", DB_TYPE_ARRAY] call iniDB_read;
//playerMedkits = 		[_profile, DB_CATAGORY_PLAYER_DATA, "medkits", DB_TYPE_ARRAY] call iniDB_read;
//playerFuel = 		[_profile, DB_CATAGORY_PLAYER_DATA, "fuel", DB_TYPE_ARRAY] call iniDB_read;
//playerRepairkits = 	[_profile, DB_CATAGORY_PLAYER_DATA, "repairkits", DB_TYPE_ARRAY] call iniDB_read;
//playeFullFuel = 	[_profile, DB_CATAGORY_PLAYER_DATA, "fullfuel", DB_TYPE_ARRAY] call iniDB_read;
//playerEmptyFuel =	[_profile, DB_CATAGORY_PLAYER_DATA, "emptyfuel", DB_TYPE_ARRAY] call iniDB_read;
//playerSpawnBeacons =	[_profile, DB_CATAGORY_PLAYER_DATA, "spawnbeacons", DB_TYPE_ARRAY] call iniDB_read;
//playerCamoNets =		[_profile, DB_CATAGORY_PLAYER_DATA, "camonets", DB_TYPE_ARRAY] call iniDB_read;

_playerDataArray = [playerPos, playerHealth, playerOxygen, playerBackpack, playerBackpackGear, playerVest, 
playerVestGear, playerUniform, playerUniformGear, playerGadgets, playerHeadgear, playerGoggles, playerWep, playerPrimWepAttach, playerSecWepAttach, playerMagazines, 
playerHungerLevel, playerThirstLevel, playerMoney, playerTemperature, playerImmunity, playerToxicity];

_playerDataArray



		

