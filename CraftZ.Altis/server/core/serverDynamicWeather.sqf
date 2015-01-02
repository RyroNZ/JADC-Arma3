	switch(toUpper(DEFAULT_START_WEATHER)) do {
		case "CLEAR": {
			PV_currentWeather = [0, 0, 0, [random 3, random 3, true], date];
		};
		
		case "CLOUDY": {
			PV_currentWeather = [0, 0, 0.6, [random 3, random 3, true], date];
		};
		
		case "RAIN": {
			PV_currentWeather = [1, 0, 1, [random 3, random 3, true], date];
		};

		default {
			// clear
			PV_currentWeather = [0, 0, 0, [random 3, random 3, true], date];
			diag_log "Real weather: wrong starting weather";
		};
	};

		[DEFAULT_WEATHER_SYNC_DELAY] spawn {
		private["_timesync"];
		_timesync = _this select 0;

		while { true } do {
			PV_currentWeather set [4, date];
			publicvariable "PV_currentWeather";
			sleep _timesync;
		};
	};