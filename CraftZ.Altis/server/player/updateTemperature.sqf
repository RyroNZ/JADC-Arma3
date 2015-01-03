/*

Author: Ryan Post
Date: 11:49 am 3/01/2015
Description: Manage the players temperature

*/


_player = _this select 0;
_runSpeed = _this select 1;
_temperatureLevel = _player getVariable "temperatureLevel";

_airTemp = PV_currentTemperatures select 0;
_waterTemp = PV_currentTemperatures select 1;

_waterHeatLoss = (DEFAULT_WATER_HEAT_LOSS / _waterTemp);
_airHeatLoss = (DEFAULT_AIR_HEAT_LOSS / _airTemp);

if (_waterHeatLoss < 0) then { _waterHeatLoss = _waterHeatLoss * - 1 };
if (_airHeatLoss < 0 ) then { _airHeatLoss = _airHeatLoss * -1 };


if (!isNil "_temperatureLevel" && (_temperatureLevel > 25)) then {

		if (_temperatureLevel > DEFAULT_OVERHEAT_TEMPERATURE) then {
			_player setDamage ((damage _player) + (DEFAULT_DAMAGE_OVERHEATING * (_temperatureLevel - DEFAULT_OVERHEAT_TEMPERATURE)));
		};

		if (vehicle _player != _player) then {
			_temperatureLevel = _temperatureLevel + DEFAULT_CAR_TEMPERATURE_GAIN;
		} else {

			if (_temperatureLevel < 37.8) then {
				_temperatureLevel = _temperatureLevel + ((DEFAULT_RUN_TEMPERATURE_GAIN * _runSpeed));
			};

			if (surfaceIsWater position _player) then {
				_temperatureLevel = _temperatureLevel - _waterHeatLoss;

			} else {
				_temperatureLevel = _temperatureLevel - _airHeatLoss;
		};	
	};

};

if (_temperatureLevel <= DEFAULT_FREEZE_TEMPERATURE) then {
		_player setDamage ((damage _player) + (DEFAULT_DAMAGE_FREEZING / _temperatureLevel));
	};


_player setVariable["temperatureLevel", _temperatureLevel, true];