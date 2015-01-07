
private["_loot", "_lootPos", "_player"];
while {true} do {
	diag_log "Updating Loot";
	{
		_player = _x;
		_lootPositions_array = [];
		_buildingsNearby_array = nearestObjects [_x, ["house"], LOOT_SPAWN_DISTANCE];
		//Get the buildings nearby

		{
			_lootPositions_array pushBack ([_x] call BIS_fnc_buildingPositions);
			//add the positions for each building as +x in each building array

		} forEach _buildingsNearby_array;

		{
			{	
				_nearLoot = nearestObjects [_x, LOOT_COMPLETE_ARRAY , LOOT_MUST_SPAWN_M_APART];
				diag_log format["Object is attemping to spawn near: %1", str _nearLoot];
				if (count _nearLoot < 1) then {
					if (random (LOOT_SPAWN_CHANCE SELECT 0) > random 1) then {
					_item = LOOT_FOOD_ARRAY call BIS_fnc_selectRandom;
					_loot = createVehicle [_item, _x, [], 0, "CAN_COLLIDE"];
					//diag_log str _loot;
					diag_log format["Creating food item: %1 at %2", str _loot, str _x];
					currentItemPos_array pushBack (_x);	
					} else {
						_item = LOOT_WEAPONS_ARRAY select 0;
						_itemMag = LOOT_WEAPONS_ARRAY select 1;
						_loot = "groundWeaponHolder" createVehicle _x;
						_loot addWeaponCargoGlobal [_item, 1];
						_loot addMagazineCargoGlobal [_itemMag, (random 5)];
						_loot setPos _x;
						_loot setdir (random 360);

					};

					[_loot, _x ,_player] spawn {
						private["_loot", "_lootPos", "_player", "_firstRun"];
						_loot = _this select 0;
						_lootPos = _this select 1;
						_player = _this select 2;
						_firstRun = true;
						while {true} do {
							_noPlayersNearby = false;
							if (_firstRun) then {sleep LOOT_SPAWN_RESET;};
							{
								if ((_x distance _loot) > LOOT_DESPAWN_DISTANCE) then {
									_noPlayersNearby = true;
								} else { _noPlayersNearby = false;}
							} forEach readyUnits;
							if (_noPlayersNearby) then {
								diag_log format["Removing item: %1", _loot];
								deleteVehicle _loot;
							};
							sleep 5;
						};
						
					}; 
				};
			} forEach _x; // position in building
		} forEach _lootPositions_array;// building		
	} forEach readyUnits;
	sleep LOOT_RESPAWN_TIME;
};