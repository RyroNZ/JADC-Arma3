/*

Author: Ryan Post
Date: 11:49 am 3/01/2015
Description: Save the players state for any players that have loaded in succesfully and are not dead

*/
if (!isServer) exitWith {};
	
while {true} do {
		{
				_profile		= format[PLAYER_ID_PREFIX, getPlayerUID _x];
				_player = _x;
				if (getPlayerUID _x != "") then {
					//============	Save Stats
					
					//PLAYER
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_NAME, name _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_LOCATION, position _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_OXYGEN, getOxygenRemaining _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_HEALTH, damage _x] call iniDB_write;
					//INVENTORY
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_WEAPONS, weapons _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_WEAPON_ATTACH_PRIM, primaryWeaponItems _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_WEAPON_ATTACH_SEC, secondaryWeaponItems _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_MAGAZINES, magazinesAmmoFull _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_BACKPACK, backpack _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_BACKPACK_GEAR, backpackItems _x] call iniDB_write;	
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_VEST, vest _x] call iniDB_write;		
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_VEST_GEAR, vestItems _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_UNIFORM, uniform _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_UNIFORM_GEAR, uniformItems _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_GADGETS, assignedItems _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_HEADGEAR, headgear _x] call iniDB_write;
					[_profile, DB_CATAGORY_PLAYER_DATA, DB_SUB_CATAGORY_GOGGLES, goggles _x] call iniDB_write;
					
					//EXTRA

					[_profile, DB_CATAGORY_CUSTOM_VARIABLES, DB_SUB_CATAGORY_HUNGER, _x getVariable PLAYER_HUNGER_LEVEL_IDC] call iniDB_write;
					[_profile, DB_CATAGORY_CUSTOM_VARIABLES, DB_SUB_CATAGORY_THIRST, _x getVariable PLAYER_THIRST_LEVEL_IDC] call iniDB_write;
					[_profile, DB_CATAGORY_CUSTOM_VARIABLES, DB_SUB_CATAGORY_TEMP, _x getVariable PLAYER_TEMP_LEVEL_IDC] call iniDB_write;
					[_profile, DB_CATAGORY_CUSTOM_VARIABLES, DB_SUB_CATAGORY_IMMUNITY, _x getVariable PLAYER_IMMUNITY_LEVEL_IDC] call iniDB_write;
					[_profile, DB_CATAGORY_CUSTOM_VARIABLES, DB_SUB_CATAGORY_TOXICITY, _x getVariable PLAYER_TOXICITY_LEVEL_IDC] call iniDB_write;

					//[_profile, DB_CATAGORY_CUSTOM_VARIABLES, "food", _x getVariable "canfood"] call iniDB_write;
					//[_profile, DB_CATAGORY_CUSTOM_VARIABLES, "water", _x getVariable "water"] call iniDB_write;
					//[_profile, DB_CATAGORY_CUSTOM_VARIABLES, "medkits", _x getVariable "medkits"] call iniDB_write;
					//[_profile, DB_CATAGORY_CUSTOM_VARIABLES, "fuel", _x getVariable "fuel"] call iniDB_write;
					//[_profile, DB_CATAGORY_CUSTOM_VARIABLES, "repairkits", _x getVariable "repairkits"] call iniDB_write;
					//[_profile, DB_CATAGORY_CUSTOM_VARIABLES, "fullfuel", _x getVariable "fuelFull"] call iniDB_write;
					//[_profile, DB_CATAGORY_CUSTOM_VARIABLES, "emptyfuel", _x getVariable "fuelEmpty"] call iniDB_write;
					//[_profile, DB_CATAGORY_CUSTOM_VARIABLES, "spawnbeacons", _x getVariable "spawnBeacon"] call iniDB_write;
					//[_profile, DB_CATAGORY_CUSTOM_VARIABLES, "camonets", _x getVariable "camonet"] call iniDB_write;

				
				diag_log format["[server\core\serverPlayerSave.sqf]: Saving profile for player (%1)", name _x];
			};
			sleep SERVER_PLAYER_SAVE_REFRESH;
			
		} forEach readyUnits;

	};
