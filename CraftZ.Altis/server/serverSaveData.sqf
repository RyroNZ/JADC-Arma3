
if (!isServer) exitWith {};
	
while {true} do {
		{
			if (isPlayer _x ) then {
				sleep 1;
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

					//[_profile, "playerData", "hunger", _x getVariable hungerLevel] call iniDB_write;
					//[_profile, "playerData", "thirst", _x getVariable thirstLevel] call iniDB_write;

					//[_profile, "playerData", "money", _x getVariable "cmoney"] call iniDB_write;
					//[_profile, "playerData", "food", _x getVariable "canfood"] call iniDB_write;
					//[_profile, "playerData", "water", _x getVariable "water"] call iniDB_write;
					//[_profile, "playerData", "medkits", _x getVariable "medkits"] call iniDB_write;
					//[_profile, "playerData", "fuel", _x getVariable "fuel"] call iniDB_write;
					//[_profile, "playerData", "repairkits", _x getVariable "repairkits"] call iniDB_write;
					//[_profile, "playerData", "fullfuel", _x getVariable "fuelFull"] call iniDB_write;
					//[_profile, "playerData", "emptyfuel", _x getVariable "fuelEmpty"] call iniDB_write;
					//[_profile, "playerData", "spawnbeacons", _x getVariable "spawnBeacon"] call iniDB_write;
					//[_profile, "playerData", "camonets", _x getVariable "camonet"] call iniDB_write;
				};

				sleep 1;
				if (verboseDebug) then { localize format["Player stats saved for %1", name _x]; };
			};
		} forEach readyUnits;
};
