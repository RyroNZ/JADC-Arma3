private["_veh"];

_currentVehicleAmount = count vehicles;
_currentVehicles = vehicles;

_currentLandCount = 0;
_currentSeaCount = 0;
_currentAirCount = 0;

{
	switch (true) do {
		case (typeOf _x in VEHICLES_LAND):
		{
			_currentLandCount = _currentLandCount + 1;
		};
		case (typeOf _x in VEHICLES_SEA):	
		{
			_currentSeaCount = _currentSeaCount + 1;
		};
		case (typeOf _x in VEHICLES_AIR):
		{
			_currentAirCount = _currentAirCount + 1;
		}
	};
} forEach _currentVehicles;


while {(_currentLandCount <= VEHICLE_MAX_LAND) && (_currentSeaCount <= VEHICLE_MAX_SEA) && (_currentAirCount <= VEHICLE_MAX_AIR) } do {
	if (_currentLandCount < VEHICLE_MAX_LAND) then 
		{
			_veh = createVehicle [(VEHICLES_LAND call BIS_fnc_selectRandom), (getMarkerPos (VEHICLE_LAND_SPAWN call BIS_fnc_selectRandom)), [], 30, "NONE"];

			_currentLandCount = _currentLandCount + 1;
			systemChat format["Spawning %1", _veh];
		};

	if (_currentSeaCount < VEHICLE_MAX_SEA) then
		{
			_veh = createVehicle [(VEHICLES_SEA call BIS_fnc_selectRandom), (getMarkerPos (VEHICLE_SEA_SPAWN call BIS_fnc_selectRandom)), [], 30, "NONE"];
			_currentSeaCount = _currentSeaCount + 1;
			systemChat format["Spawning %1", _veh];
		};

	if (_currentAirCount < VEHICLE_MAX_AIR) then
		{
			_veh = createVehicle [(VEHICLES_AIR call BIS_fnc_selectRandom), (getMarkerPos (VEHICLE_AIR_SPAWN call BIS_fnc_selectRandom)), [], 30, "NONE"];
			_currentAirCount = _currentAirCount + 1;
			systemChat format["Spawning %1", _veh];
		};

		clearItemCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
};