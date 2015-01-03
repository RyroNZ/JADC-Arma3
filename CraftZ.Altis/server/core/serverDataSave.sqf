/*

Author: Ryan Post
Date: 7:42 pm 3/01/2015
Description: Saves the server information to a database, will be reloaded once server is started
*/


while {true} do {

	if (serverReady) then {
		_server = SERVER_ID;
		_profile = format["%1", _server];
		diag_log _profile;

		[_profile, "serverWeather", "currentRain", rain ] call iniDB_write;
		[_profile, "serverWeather", "currentOvercast", overcast] call iniDB_write;
		[_profile, "serverWeather", "currentFog", fog] call iniDB_write;
		[_profile, "serverWeather", "currentWind", [wind select 0, wind select 1, false]] call iniDb_write; // [x,y, forced direction]
		[_profile, "serverDateTime", "currentDate", date] call iniDB_write;
	};
	sleep 10;
};