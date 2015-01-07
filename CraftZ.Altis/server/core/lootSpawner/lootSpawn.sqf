while {true} do {
	systemChat "Updating Loot";
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
				_item = LOOT_FOOD_ARRAY call BIS_fnc_selectRandom;
				_loot = createVehicle [_item, _x, [], 0, "CAN_COLLIDE"];
				systemChat str _loot;
				systemChat format["Creating item: %1 at %2", str _loot, str _x];
				currentItems pushBack [_loot, _x, false];
			} forEach _x; // position in building
		} forEach _lootPositions_array;// building		
	} forEach allUnits;
	sleep 10;
};