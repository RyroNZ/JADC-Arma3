
if (!isServer) exitWith {};
	
while {true} do {
		{
			if (isPlayer _x  && alive _x && ((damage _x) != 1) && _x in readyUnits) then {
				_profile		= format["PlayerID_%1", getPlayerUID _x];
				_player = _x;
				if (getPlayerUID _x != "") then {
					//============	Save Stats
					
					//PLAYER
					[_profile, "playerData", "name", name _x] call iniDB_write;
					[_profile, "playerData", "location", position _x] call iniDB_write;
					[_profile, "playerData", "oxygen", getOxygenRemaining _x] call iniDB_write;
					[_profile, "playerData", "health", damage _x] call iniDB_write;

					//INVENTORY
					[_profile, "playerData", "weapons", weapons _x] call iniDB_write;
					[_profile, "playerData", "primWeaponAttachments", primaryWeaponItems _x] call iniDB_write;
					[_profile, "playerData", "secWeaponAttachments", secondaryWeaponItems _x] call iniDB_write;

					[_profile, "playerData", "backpack", backpack _x] call iniDB_write;
					[_profile, "playerData", "backpackGear", backpackItems _x] call iniDB_write;	

					[_profile, "playerData", "vest", vest _x] call iniDB_write;		
					[_profile, "playerData", "vestGear", vestItems _x] call iniDB_write;

					[_profile, "playerData", "uniform", uniform _x] call iniDB_write;
					[_profile, "playerData", "uniformGear", uniformItems _x] call iniDB_write;


					[_profile, "playerData", "gadgets", assignedItems _x] call iniDB_write;
					[_profile, "playerData", "headgear", headgear _x] call iniDB_write;
					[_profile, "playerData", "goggles", goggles _x] call iniDB_write;
					
					
					//EXTRA

					[_profile, "customPlayerData", "hunger", _x getVariable "hungerLevel"] call iniDB_write;
					[_profile, "customPlayerData", "thirst", _x getVariable "thirstLevel"] call iniDB_write;
					[_profile, "customPlayerData", "money", _x getVariable "cMoney"] call iniDB_write;
					[_profile, "customPlayerData", "temperature", _x getVariable "temperatureLevel"] call iniDB_write;
					[_profile, "customPlayerData", "immunity", _x getVariable "immunity"] call iniDB_write;
					[_profile, "customPlayerData", "toxicity", _x getVariable "toxicity"] call iniDB_write;

					//[_profile, "customPlayerData", "food", _x getVariable "canfood"] call iniDB_write;
					//[_profile, "customPlayerData", "water", _x getVariable "water"] call iniDB_write;
					//[_profile, "customPlayerData", "medkits", _x getVariable "medkits"] call iniDB_write;
					//[_profile, "customPlayerData", "fuel", _x getVariable "fuel"] call iniDB_write;
					//[_profile, "customPlayerData", "repairkits", _x getVariable "repairkits"] call iniDB_write;
					//[_profile, "customPlayerData", "fullfuel", _x getVariable "fuelFull"] call iniDB_write;
					//[_profile, "customPlayerData", "emptyfuel", _x getVariable "fuelEmpty"] call iniDB_write;
					//[_profile, "customPlayerData", "spawnbeacons", _x getVariable "spawnBeacon"] call iniDB_write;
					//[_profile, "customPlayerData", "camonets", _x getVariable "camonet"] call iniDB_write;
				};

				
				if (verboseDebug) then { diag_log format["Player stats saved for %1", name _x]; };
			};
			sleep 2.5;
		} forEach readyUnits;
};
