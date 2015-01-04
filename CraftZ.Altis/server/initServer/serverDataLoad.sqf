/*

Author: Ryan Post
Date: 7:42 pm 3/01/2015
Description: Loads the information about the server from the DB and sets this for the clients
*/


_server = _this select 0;
_profile = _this select 1;

_serverRain = [_profile, "serverWeather", "currentRain","SCALAR"] call iniDB_read;
_serverOvercast = [_profile, "serverWeather", "currentOvercast", "SCALAR"] call iniDB_read;
_serverFog = [_profile, "serverWeather", "currentFog", "SCALAR"] call iniDB_read;
_serverWind = [_profile, "serverWeather", "currentWind", "ARRAY"] call iniDB_read;
_serverDateTime = [_profile, "serverDateTime", "currentDate", "ARRAY"] call iniDB_read;
_serverAirTemp = [_profile, "serverTemperatures", "currentAirTemp", "SCALAR"] call iniDB_read;
_serverWaterTemp = [_profile, "serverTemperatures", "currentWaterTemp", "SCALAR"] call iniDB_read;

PV_currentWeather = [_serverRain, _serverFog, _serverOvercast, _serverWind, _serverDateTime];
PV_currentTemperatures = [_serverAirTemp, _serverWaterTemp];


setDate _serverDateTime;


