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
		};
	};

	[] execVM "server\core\dynamicWeather\serverDynamicTemperatures.sqf";