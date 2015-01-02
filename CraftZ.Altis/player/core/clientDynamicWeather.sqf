currentWeatherStart = true;

"PV_currentWeather" addPublicVariableEventHandler {

	_currentWeather = PV_currentWeather;
	diag_log "Setting weather for player";
	diag_log str _currentWeather;

	
	if (currentWeatherStart) then {
		currentWeatherStart = false;

		skipTime -24;
		86400 setRain (_currentWeather select 0);
		86400 setFog (_currentWeather select 1);
		86400 setOvercast (_currentWeather select 2);
		skipTime 24;
		simulWeatherSync;
		setWind (_currentWeather select 3);
		setDate (_currentWeather select 4);
	} else {
		86400 setRain (_currentWeather select 0);
		86400 setFog (_currentWeather select 1);
		86400 setOvercast (_currentWeather select 2);
		setWind (_currentWeather select 3);
		setDate (_currentWeather select 4);

	};
};
