/*

Author: Ryan Post
Date: 7:42 pm 3/01/2015
Description: Saves the server information to a database, will be reloaded once server is started
*/


while {true} do {

	_currentVehicles = vehicles;
	_vehicleLand = [];
	_vehicleSea = [];
	_vehicleAir = [];
	{
	switch (true) do {
		case (typeOf _x in VEHICLES_LAND):
		{
			_vehicleLand pushback [typeOf _x, position _x, getDir _x];
		};
		case (typeOf _x in VEHICLES_SEA):	
		{
			_vehicleSea pushback [typeOf _x, position _x, getDir _x];
		};
		case (typeOf _x in VEHICLES_AIR):
		{
			_vehicleAir pushback [typeOf _x, position _x, getDir _x];
		}
	};
} forEach _currentVehicles;



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
		[_profile, DB_CATAGORY_VEHICLES, DB_SUB_CATAGORY_LAND_VEHICLES, _vehicleLand] call iniDB_write;
		[_profile, DB_CATAGORY_VEHICLES, DB_SUB_CATAGORY_SEA_VEHICLES, _vehicleSea] call iniDB_write;
		[_profile, DB_CATAGORY_VEHICLES, DB_SUB_CATAGORY_AIR_VEHICLES, _vehicleAir] call iniDB_write;
	};
	sleep SERVER_SAVE_DATA_REFRESH;
};

