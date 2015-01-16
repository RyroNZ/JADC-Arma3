private["_obj", "_gwh"];
sleep 3;
_currentObjects = _this select 0;



{
	_objectType = _x select 0;
	_objectPos = _x select 1;
	_objectDir = _x select 2;
	_objectItems = _x select 3;
	_objectMags = _x select 4;
	_objectWeps = _x select 5;
	_objectBackpacks = _x select 6;
	_obj = createVehicle [(_objectType), (_objectPos), [], 0, "CAN_COLLIDE"];
	_obj setDir (_objectDir);
	if (_objectType == "Land_TentA_F") then {
		_gwh = createVehicle ["GroundWeaponHolder", [0,0,0], [], 0, "NONE"];
		_gwh attachTo [_obj, [0,0,0]];
		_gwh setVectorUp vectorUp _obj;
		_obj setVariable ["_gwh", _gwh, true];
		_obj = _gwh;
	};

	//clearItemCargoGlobal _obj;
	//clearMagazineCargoGlobal _obj;
	//clearWeaponCargoGlobal _obj;
	//clearBackpackCargoGlobal _obj;

	

	for "_i" from 0 to ((count (_objectItems select 0)) - 1) do {
		_objectItem = (_objectItems select 0) select _i;
		_objectItemCount = (_objectItems select 1) select _i;
		_gwh addItemCargoGlobal [_objectItem, _objectItemCount];
	};
	for "_i" from 0 to ((count (_objectMags select 0)) - 1) do {
		_objectMag = (_objectMags select 0) select _i;
		_objectMagCount = (_objectMags select 1) select _i;
		_gwh addMagazineCargoGlobal [_objectMag, _objectMagCount];
	};

	for "_i" from 0 to ((count (_objectWeps select 0)) - 1) do {
		_objectWep = (_objectWeps select 0) select _i;
		_objectWepCount = (_objectWeps select 1) select _i;
		_gwh addWeaponCargoGlobal [_objectWep, _objectWepCount];
	};

	for "_i" from 0 to ((count (_objectBackpacks select 0)) - 1) do {
		_objectBackpack = (_objectBackpacks select 0) select _i;
		_objectBackpackCount = (_objectBackpacks select 1) select _i;
		_gwh addItemCargoGlobal [_objectBackpack, _objectBackpackCount];
	};



} forEach _currentObjects;