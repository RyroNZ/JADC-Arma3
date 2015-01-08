/*

Author: Ryan Post
Date: 2:52 AM 4/01/2015
Description: Takes the information from the server and updates the client FX with the new weather.
*/

currentWeatherStart = true;

"PV_currentWeather" addPublicVariableEventHandler {

	_currentWeather = _this select 1;
	_newOverCast = _currentWeather select 2;


	60 setRain (_currentWeather select 0);
	60 setFog (_currentWeather select 1);
	setWind (_currentWeather select 3);
	setDate (_currentWeather select 4);


	//If overcast varies to much by server desync, reset it when updating other variables. DUE TO THE REQUIRED USE OF SIMULWEATHERSYNC THIS CAUSES LAG..
	if (((overCast - _newOverCast) > 0.03) || ((overCast - _newOverCast) < - 0.03)) then {
		[_newOverCast] execVM CLIENT_EXEC_UPDATE_OVERCAST;
	};
	
	diag_log format["[player\core\dynamicWeather\clientDynamicWeather.sqf]: Received weather information from server. Rain: %1, Fog: %2, Overcast: %3, Wind: %4, Time: %5:%6", 
	str (_currentWeather select 0), str (_currentWeather select 1), str (_currentWeather select 2), str (_currentWeather select 3), ((_currentWeather select 4) select 3), ((_currentWeather select 4) select 4)];
	
	
};
