

while {true} do {
	systemChat "Despawning Loot";
	{
		if (count currentItems > 0) then {
			_player = _x;
			_noPlayersNearby = false;
			{
				_currentItemIndex = _forEachIndex;
				_currentItem = _x;
				if ((_player distance (_x select 1)) > LOOT_DESPAWN_DISTANCE) then {
					systemChat format["%1 marked for deletion", str (currentItems select _currentItemIndex)];
					deleteVehicle ((currentItems select _currentItemIndex) select 0);
					currentItems set [_currentItemIndex, -1];
					currentItems = currentItems - [-1]
				} else {
					_noPlayersNearby = false;
				};
			} forEach currentItems;
		};
	} forEach allUnits;
	sleep 5;
};