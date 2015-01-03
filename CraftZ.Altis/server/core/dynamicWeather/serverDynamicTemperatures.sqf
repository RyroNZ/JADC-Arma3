
_currentWeather = PV_currentWeather;
_rain = _currentWeather select 0;

_airTemp = DEFAULT_AIR_TEMPERATURE;
_waterTemp = DEFAULT_WATER_TEMPERATURE;
_waterVariation = DEFAULT_WATER_DIFFERENTIAL_TEMP;

while {true} do {
//check we don't divide by zero if no rain
	if (_rain != 0) then {
		_airTemp = floor (_airTemp - ((_airTemp * (_currentWeather select 0)) - (random 5) ));
		_waterTemp = floor (_airTemp - _waterVariation);

		PV_currentTemperatures = [_airTemp, _waterTemp];
		publicVariable "PV_currentTemperatures";

	};
	sleep 30 + random 60;
};