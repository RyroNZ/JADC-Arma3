currentWeatherStart = true;

"PV_currentWeather" addPublicVariableEventHandler {

	
	
	if (currentWeatherStart) then {
		currentWeatherStart = false;
		diag_log format["Syncing weather for first time"];
		skipTime -24;
		[(_currentWeather select 2)] 
		86400 setRain (_currentWeather select 0);
		86400 setFog (_currentWeather select 1);
		skipTime 24;
		simulWeatherSync;
		setWind (_currentWeather select 3);
		setDate (_currentWeather select 4);
	} else {
		diag_log format["Syncing weather after first sync"];
		60 setRain (_currentWeather select 0);
		60 setFog (_currentWeather select 1);
		[_currentWeather select 2] spawn {
			[_this select 0] call BIS_fnc_setOvercast;
		};
};
	
		setWind (_currentWeather select 3);
		setDate (_currentWeather select 4);

	};
	


	_currentWeather = PV_currentWeather;
	diag_log format["[player\core\clientDynamicWeather.sqf]: Received weather information from server. Rain: %1, Fog: %2, Overcast: %3, Wind: %4, Time: %5:%6", 
	str (_currentWeather select 0), str (_currentWeather select 1), str (_currentWeather select 2), str (_currentWeather select 3), ((_currentWeather select 4) select 3), ((_currentWeather select 4) select 4)];
	
	
};
