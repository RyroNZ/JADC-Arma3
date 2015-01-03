
_currentWeather = PV_currentWeather;

skipTime -24;
86400 setRain (_currentWeather select 0);
86400 setFog (_currentWeather select 1);
86400 setOvercast (_currentWeather select 2);
skipTime 24;
simulWeatherSync;
setWind (_currentWeather select 3);
setDate (_currentWeather select 4);


[DEFAULT_WEATHER_SYNC_DELAY] spawn {
private["_timesync"];
_timesync = _this select 0;

	while { true } do {
		PV_currentWeather set [4, date];
		publicvariable "PV_currentWeather";
		sleep _timesync;
	};

	_lastrain = 0;
	_rain = 0;
	_overcast = 0;



	while {true} do {
		_overcast = random 1;
		if(_overcast >= 0.68) then {
			_rain = random 1;
		} else if (_overcast > 0.2) then {
			_rain = random 0.5;
		};

		if ((_lastRain >= 0.6) && ((date select 3) < 10) && (_rain < 0.02)) then {
			_fog = random 1;
		} else {
			_fog = random 0.1;
		};

		_wind = [random 3, random 3, false];

		_lastRain = _rain;

		PV_currentWeather = [_rain, _fog, _overcast, _wind, date];
		90 setRain (wcweather select 0);
		90 setfog (wcweather select 1);
		90 setOvercast (wcweather select 2);
		setwind (wcweather select 3);
		publicVariable "PV_currentWeather";

		sleep DEFAULT_DELAY_BETWEEN_FORECAST_UPDATES;
	};
