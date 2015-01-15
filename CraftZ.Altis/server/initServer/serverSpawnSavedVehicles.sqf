_currentVehicles = (_this select 0) + (_this select 1) + (_this select 2);

{
	_veh = createVehicle [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];
	_veh setDir (_x select 2);

} forEach _currentVehicles;