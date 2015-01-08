_lootPositions_array = [];
currentItemPos_array = [nil];



while {true} do {
	
	systemChat format["updating loot"];
	{	
			private["_loot", "_lootPos", "_player"];
			_player = _x;
			_lootPositions_array = [];
			_buildingsNearby_array = nearestObjects [_player, ["house"], LOOT_SPAWN_DISTANCE];
			//Get the buildings nearby

		{		
			_buildingPositions = ([_x] call BIS_fnc_buildingPositions);
			{	
				if (!(_x in currentItemPos_array)) then {
					[_x] call fn_spawnLoot;
				};
				//sleep 0.001;
			} forEach _buildingPositions;
			diag_log format["[%1 Items] current items", str (count currentItemPos_array)];
			diag_log format["current Loot positions %1", str _lootPositions_array];
		} forEach _buildingsNearby_array;


	} forEach readyUnits;
	sleep LOOT_RESPAWN_TIME;
};




/* Things the loot spawner must do

Spawn loot for player around a distance.. frequently check this
Despawn loot after player has left that distance for a certain time diag_frame
Only spawn loot in some locations // not every single location should have loot
Once loot has spawned, stop checking that area for loot for specified time frame



Get buildings nearby of player
spawn loot for player
attach despawner to loot
