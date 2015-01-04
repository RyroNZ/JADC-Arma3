
_currentWeather = PV_currentWeather;

_rain = _currentWeather select 0;
_overCast = _currentWeather select 2;

_defaultAirTemp = 31;
_defaultWaterTempVariation = random 15;

_airTemp = _defaultAirTemp;
_waterTemp = _airTemp - _defaultWaterTempVariation;

//check we don't divide by zero if no rain
if ((_rain != 0) && (_overCast != 0)) then {
	_airTemp = floor (_defaultAirTemp - (_overCast * random 10) - (_rain * random 10));
	_waterTemp = floor (_airTemp - _defaultWaterTempVariation);

	if (_airTemp < 1) then {
		_airTemp = 1;
	};

	if (_waterTemp < 1) then {
		_waterTemp = 1;
	};

	PV_currentTemperatures = [_airTemp, _waterTemp];
	publicVariable "PV_currentTemperatures";

};