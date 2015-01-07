while {true} do {
	systemChat "Despawning Loot";
	{
		_player = _x;
		_noPlayersNearby = false;
		{
			_currentItemIndex = _forEachIndex;
			_currentItem = _x;
			if ((_player distance (_x select 1)) > LOOT_DESPAWN_DISTANCE) then {
				(currentItems select _currentItemIndex) set [2, true];
			} else {
				_noPlayersNearby = false;
			};
		} forEach currentItems;
	} forEach allUnits;
	sleep 5;
};