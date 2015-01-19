/*

Author: Ryan Post
Date: 7:42 pm 3/01/2015
Description: Saves the server information to a database, will be reloaded once server is started
*/


fn_delete_objects = {
	_didDelete = [_profile, DB_CATAGORY_SAVED_OBJECTS] call iniDB_deletesection;
};

fn_save_tents = {

	_profile = _this select 0;
	[] call fn_delete_objects;

	_tentItems = [];
	_tentMags = [];
	_tentWeps = [];
	_tentBackpacks = [];
	_currentTents = [];
	{
		_currentTentsNearPlayer = (getPos _x) nearObjects ["Land_TentA_F", 2500];
		{
			if (!(_x in _currentTents)) then {
				_currentTents pushback _x;
			};
		} forEach _currentTentsNearPlayer;


	} forEach AllUnits;

	_toSaveTents = [];
	_count = 0;
	{

		_tentGWH = _x getVariable "_gwh";
		if (!isNil "_tentGWH") then {
			_tentItems = getItemCargo _tentGWH;
			_tentMags = getMagazineCargo _tentGWH;
			_tentWeps = getWeaponCargo _tentGWH;
			_tentBackpacks = getBackpackCargo _tentGWH;
		};
		if (alive _x) then {
			_tentComplete = [typeOf _x, getPos _x, getDir _x,  _tentItems, _tentMags, _tentWeps, _tentBackpacks];
			[_profile, DB_CATAGORY_SAVED_OBJECTS, (format["%1_%2", DB_SUB_CATAGORY_TENTS, _count]), _tentComplete] call iniDB_write;
			_count = _count + 1;
		};
	} forEach _currentTents;
	
};

fn_save_vehicles = {
	_currentVehicles = vehicles;

	_count = 0;
	{
		if (typeOf _x in VEHICLES_AIR || typeOf _x in VEHICLES_LAND || typeOf _x in VEHICLES_SEA && alive _x) then {
			_vehicleItems = [];
			_vehicleMags = [];
			_vehicleWeps = [];
			_vehicleBackpacks = [];

			_vehicleItems = getItemCargo _x;
			_vehicleMags = getMagazineCargo _x;
			_vehicleWeps = getWeaponCargo _x;
			_vehicleBackpacks = getBackpackCargo _x;

			_vehicleComplete = [typeOf _x, getPos _x, getDir _x, _vehicleItems, _vehicleMags, _vehicleWeps, _vehicleBackpacks];
			[_profile, DB_CATAGORY_SAVED_OBJECTS, (format["%1_%2", DB_SUB_CATAGORY_VEHICLES, _count]), _vehicleComplete] call iniDB_write;
			_count = _count + 1;
		};
		

	} forEach _currentVehicles;

};

while {true} do {


	



	if (serverReady) then {
		_server = SERVER_ID;
		_profile = format["%1", _server];
		diag_log format["[server\initServer\serverDataSave.sqf]: Saving profile for server. ProfileID: (%1)", _profile];

		[_profile, DB_CATAGORY_WEATHER, DB_SUB_CATAGORY_RAIN, (PV_currentWeather select 0) ] call iniDB_write;
		[_profile, DB_CATAGORY_WEATHER, DB_SUB_CATAGORY_FOG, (PV_currentWeather select 1)] call iniDB_write;
		[_profile, DB_CATAGORY_WEATHER, DB_SUB_CATAGORY_OVERCAST, (PV_currentWeather select 2)] call iniDB_write;
		[_profile, DB_CATAGORY_WEATHER, DB_SUB_CATAGORY_WIND, [((PV_currentWeather select 3) select 0), ((PV_currentWeather select 3) select 1), false]] call iniDb_write; // [x,y, forced direction]
		[_profile, DB_CATAGORY_DATETIME, DB_SUB_CATAGORY_DATETIME, date] call iniDB_write;
		[_profile, DB_CATAGORY_TEMP, DB_SUB_CATAGORY_AIR_TEMP, (PV_currentTemperatures select 0)] call iniDB_write;
		[_profile, DB_CATAGORY_TEMP, DB_SUB_CATAGORY_WATER_TEMP, (PV_currentTemperatures select 1)] call iniDB_write;
		[_profile] call fn_save_tents;
		[_profile] call fn_save_vehicles;
		
	};
	sleep SERVER_SAVE_DATA_REFRESH;
};

