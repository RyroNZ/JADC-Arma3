if (!isServer) exitWith {};

_clientID = _this select 0;
_player = _this select 1;
_profile = _this select 2;

localize format["Loading player %1", name _player];
	
//============	Load Stats

//PLAYER
playerPos = 			[_profile, "playerData", "location","ARRAY"] call iniDB_read;
playerHealth =		[_profile, "playerData", "health", "SCALAR"] call iniDB_read;
playerOxygen =		[_profile, "playerData", "oxygen", "SCALAR"] call iniDB_read;

//INVENTORY

playerBackpack = 	[_profile, "playerData", "backpack", "STRING"] call iniDB_read;
playerBackpackGear = [_profile, "playerData", "backpackGear", "ARRAY"] call iniDB_read;

playerVest =			[_profile, "playerData", "vest", "STRING"] call iniDB_read;
playerVestGear =		[_profile, "playerData", "vestGear", "ARRAY"] call iniDB_read;

playerUniform =		[_profile, "playerData", "uniform", "STRING"] call iniDB_read;
playerUniformGear = 	[_profile, "playerData", "uniformGear", "ARRAY"] call iniDB_read;


playerGadgets = 		[_profile, "playerData", "gadgets", "ARRAY"] call iniDB_read;
playerHeadgear =		[_profile, "playerData", "headgear", "STRING"] call iniDB_read;
playerGoggles =		[_profile, "playerData", "goggles", "STRING"] call iniDB_read;

playerWep = 			[_profile, "playerData", "weapons", "ARRAY"] call iniDB_read;
playerPrimWepAttach =[_profile, "playerData", "primWeaponAttachments", "ARRAY"] call iniDB_read;
playerSecWepAttach = [_profile, "playerData", "secWeaponAttachments", "ARRAY"]  call iniDB_read;	

//EXTRA

playerHunger =		[_profile, "playerData", "hunger", "SCALAR"] call iniDB_read;
playerThirst = 		[_profile, "playerData", "thirst", "SCALAR"] call iniDB_read;
playerMoney = 		[_profile, "playerData", "money", "SCALAR"] call iniDB_read;
playerFood = 		[_profile, "playerData", "food", "ARRAY"] call iniDB_read;
playerWater = 		[_profile, "playerData", "water", "ARRAY"] call iniDB_read;
playerMedkits = 		[_profile, "playerData", "medkits", "ARRAY"] call iniDB_read;
playerFuel = 		[_profile, "playerData", "fuel", "ARRAY"] call iniDB_read;
playerRepairkits = 	[_profile, "playerData", "repairkits", "ARRAY"] call iniDB_read;
playeFullFuel = 	[_profile, "playerData", "fullfuel", "ARRAY"] call iniDB_read;
playerEmptyFuel =	[_profile, "playerData", "emptyfuel", "ARRAY"] call iniDB_read;
playerSpawnBeacons =	[_profile, "playerData", "spawnbeacons", "ARRAY"] call iniDB_read;
playerCamoNets =		[_profile, "playerData", "camonets", "ARRAY"] call iniDB_read;

localize format["%1\n%2\n%2\n%4\n%5\%6", str playerPos,  str playerHealth, str playerOxygen, str playerBackpack, str playerBackpackGear, str playerVest]



		

