
_currentWeather = PV_currentWeather;

_rain = _currentWeather select 0;
_overCast = _currentWeather select 2;

_airTemp = TEMPERATURE_DEFAULT_AIR_TEMP;
_waterTemp = _airTemp - (random TEMPERATURE_MAX_WATER_TEMP_VARIATION);

//check we don't divide by zero if no rain
if ((_rain != 0) && (_overCast != 0)) then {
	_airTemp = floor (TEMPERATURE_DEFAULT_AIR_TEMP - (overCast * random TEMPERATURE_OVERCAST_EFFECT_ON_TEMP) - (rain * random TEMPERATURE_RAIN_EFFECT_ON_TEMP));
	_waterTemp = floor (_airTemp - _waterTemp);

	if (_airTemp < 1) then {
		_airTemp = 1;
	};

	if (_waterTemp < 1) then {
		_waterTemp = 1;
	};

	PV_currentTemperatures = [_airTemp, _waterTemp];
	publicVariable "PV_currentTemperatures";

};