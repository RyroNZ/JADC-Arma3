/*

Author: Ryan Post
Date: 2:52 AM 4/01/2015
Description: Sets the current weather in the game, and updates this for all the players in the game
*/



[DEFAULT_WEATHER_SYNC_DELAY] spawn {
private["_timesync"];
_timesync = _this select 0;

	while { true } do {
		PV_currentWeather set [4, date];
		publicVariable "PV_currentWeather";
		_currentWeather = PV_currentWeather;
		diag_log format["[server\core\serverDynamicWeather.sqf]: Sending weather information to all players. Rain: %1, Fog: %2, Overcast: %3, Wind: %4, Time: %5:%6", 
			str (_currentWeather select 0), str (_currentWeather select 1), str (_currentWeather select 2), str (_currentWeather select 3), ((_currentWeather select 4) select 3), ((_currentWeather select 4) select 4)];

		sleep _timesync;
	};
};

_lastrain = 0;
_rain = 0;
_overcast = 0;
_fog = 0;

while {true} do {

	[] execVM "server\core\dynamicWeather\serverDynamicTemperatures.sqf";
	sleep DEFAULT_DELAY_BETWEEN_FORECAST_UPDATES + random RANDOM_ADDITIONAL_DELAY_FORECAST;

	_overcast = random 1;
	if (_overcast >= 0.7) then {
		_rain = random 1;
	} else {
		if (_overcast > 0.2) then {
			_rain = random 0.5;
		} else {
		_rain = 0;
		};
	};

	if ((_lastRain >= 0.6) && ((date select 3) < 10) && (_rain < 0.2)) then {
		_fog = random 1;
	} else {
		_fog = random 0.05;
	};

	_wind = [random 3, random 3, false];

	_lastRain = _rain;

	PV_currentWeather = [_rain, _fog, _overcast, _wind, date];
	diag_log format["[server\core\serverDynamicWeather.sqf]: New weather information generated. Rain: %1, Fog: %2, Overcast: %3, Wind: %4, Time: %5:%6", _rain, _fog, _overcast, _wind, (date select 3), (date select 4)];
	
};
