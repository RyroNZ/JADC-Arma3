/*

Author: Ryan Post
Date: 7:42 pm 3/01/2015
Description: Loads the information about the server from the DB and sets this for the clients
*/


fn_get_items = {
	_subCatagory = _this select 0;
	_count = 0;
	_rtnObjects = [];
	while {true} do {
		_object = [_profile, DB_CATAGORY_SAVED_OBJECTS, (format["%1_%2", _subCatagory, _count]), DB_TYPE_ARRAY] call iniDB_read;
		if (!inidb_errno) exitWith {hint format["Loaded %1 tents", _count];};
		_rtnObjects pushback _object;
		_count = _count + 1;
		
	};
	_rtnObjects
		
};
_server = _this select 0;
_profile = _this select 1;
_serverReadFailed = false;

_serverRain = [_profile, DB_CATAGORY_WEATHER, DB_SUB_CATAGORY_RAIN,DB_TYPE_SCALAR] call iniDB_read;
if (!inidb_errno) then {_serverReadFailed = true};
_serverOvercast = [_profile, DB_CATAGORY_WEATHER, DB_SUB_CATAGORY_OVERCAST, DB_TYPE_SCALAR] call iniDB_read;
if (!inidb_errno) then {_serverReadFailed = true};
_serverFog = [_profile, DB_CATAGORY_WEATHER, DB_SUB_CATAGORY_FOG, DB_TYPE_SCALAR] call iniDB_read;
if (!inidb_errno) then {_serverReadFailed = true};
_serverWind = [_profile, DB_CATAGORY_WEATHER, DB_SUB_CATAGORY_WIND, DB_TYPE_ARRAY] call iniDB_read;
if (!inidb_errno) then {_serverReadFailed = true};
_serverDateTime = [_profile, DB_CATAGORY_DATETIME, DB_SUB_CATAGORY_DATETIME, DB_TYPE_ARRAY] call iniDB_read;
if (!inidb_errno) then {_serverReadFailed = true};
_serverAirTemp = [_profile, DB_CATAGORY_TEMP, DB_SUB_CATAGORY_AIR_TEMP, DB_TYPE_SCALAR] call iniDB_read;
if (!inidb_errno) then {_serverReadFailed = true};
_serverWaterTemp = [_profile, DB_CATAGORY_TEMP, DB_SUB_CATAGORY_WATER_TEMP, DB_TYPE_SCALAR] call iniDB_read;
if (!inidb_errno) then {_serverReadFailed = true};
_currentVehicles = [DB_SUB_CATAGORY_VEHICLES] call fn_get_items;
_currentTents = [DB_SUB_CATAGORY_TENTS] call fn_get_items;


PV_currentWeather = [_serverRain, _serverFog, _serverOvercast, _serverWind, _serverDateTime];
PV_currentTemperatures = [_serverAirTemp, _serverWaterTemp];
//[_currentVehicles] call fnc_spawn_saved_objects;
[_currentTents] call fnc_spawn_saved_objects;

if (_serverReadFailed) then {
	[_server] call fnc_new_data;
};

[_server] call fnc_ready_data;




