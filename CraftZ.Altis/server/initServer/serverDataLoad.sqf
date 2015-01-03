/*

Author: Ryan Post
Date: 7:42 pm 3/01/2015
Description: Loads the information about the server from the DB and sets this for the clients
*/


_server = _this select 0;
_profile = _this select 1;

serverRain = [_profile, "serverWeather", "currentRain","SCALAR"] call iniDB_read;
serverOvercast = [_profile, "serverWeather", "currentOvercast", "SCALAR"] call iniDB_read;
serverFog = [_profile, "serverWeather", "currentFog", "SCALAR"] call iniDB_read;
serverWind = [_profile, "serverWeather", "currentWind", "ARRAY"] call iniDB_read;
serverDateTime = [_profile, "serverDateTime", "currentDate", "ARRAY"] call iniDB_read;

PV_currentWeather = [serverRain, serverOverCast, serverFog, serverWind, serverDateTime];

setDate serverDateTime;


