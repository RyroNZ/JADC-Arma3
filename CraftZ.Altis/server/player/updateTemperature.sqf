/*

Author: Ryan Post
Date: 11:49 am 3/01/2015
Description: Manage the players temperature

*/


_player = _this select 0;
_runSpeed = _this select 1;
_playerTemp = _player getVariable "temperatureLevel";

//Default temperatures in degrees for death or hypothermina. Player can also overheat from infection
_defaultFreeze = 25;
_defaultHypothermia = 30;
_defaultOverheatTemp = 40;
_defaultTempEquillibrium = 37.5;

//Damage taken from overheating or freezing
_defaultDamageOverheating = 0.03* STATUS_MONITOR_REFRESH;
_defaultDamageFreezing= 0.02 * STATUS_MONITOR_REFRESH;

//Temperature increase per 2 seconds from being in a vehicle
_defaultCarTempGain = 0.025 * STATUS_MONITOR_REFRESH;
//Temprature increase per each KPH in speed you are running
_defaultRunTempGain = 0.00001 * STATUS_MONITOR_REFRESH;

//Heat loss per second. Water Default: 0.138 (300 seconds in 1ºc water) Air Default: 0.0064 (7500 seconds (125 minutes) in 1ºc Air)
_defaultWaterHeatLoss = 0.138 * STATUS_MONITOR_REFRESH;
_defaultAirHeatLoss = 0.0064 * STATUS_MONITOR_REFRESH;

_airTemp = PV_currentTemperatures select 0;
_waterTemp = PV_currentTemperatures select 1;

_waterHeatLoss = _defaultWaterHeatLoss;
_airHeatLoss = _defaultAirHeatLoss;

if (_waterTemp != 0) then {
	_waterHeatLoss = (_defaultWaterHeatLoss / _waterTemp);
};

if (_airTemp != 0) then {
	_airHeatLoss = (_defaultAirHeatLoss / _airTemp);
};

if (_waterHeatLoss < 0) then { _waterHeatLoss = _defaultWaterHeatLoss};
if (_airHeatLoss < 0 ) then { _airHeatLoss = _defaultAirHeatLoss };


if (!isNil "_playerTemp") then {

		if ((vehicle _player != _player) && (_playerTemp < _defaultTempEquillibrium) && (isEngineOn (VEHICLE _player))) then {
			_playerTemp = _playerTemp + _defaultCarTempGain; // Check Cair is on and player is in vehicle, increase players temperature as player is freezing
		};

		if ((vehicle _player != _player) && (_playerTemp > _defaultTempEquillibrium) && (isEngineOn (VEHICLE _player))) then {
			_playerTemp = _playerTemp - _defaultCarTempGain; // Check Cair is on and player is in vehicle, decrease players temperature as player is overheating
		};

		if (_playerTemp < _defaultTempEquillibrium) then {
				_playerTemp = _playerTemp + ((_defaultRunTempGain * _runSpeed));
			};

		if (surfaceIsWater position _player) then {

				if (_waterTemp < _playerTemp) then {

					_playerTemp = _playerTemp - _waterHeatLoss; //Decrease Player Temperature in water

				} else {
					_playerTemp = _playerTemp + _waterHeatLoss; //Increase Player Temperature in water
			};

				} else {

				if (_airTemp < _playerTemp) then {

						_playerTemp = _playerTemp - _airHeatLoss; //Decrease Player Temperature in air

				} else {

						_playerTemp = _playerTemp + _airHeatLoss; //Increase Player Temperature in air
			};
		};	

	if (_playerTemp >= _defaultOverheatTemp) then {
			_player setDamage ((damage _player) + (_defaultDamageOverheating * (_playerTemp - _defaultOverheatTemp)));
		};
	if (_playerTemp <= _defaultFreeze) then {
		_player setDamage ((damage _player) + (_defaultDamageFreezing * ((_playerTemp - _defaultFreeze) * - 1 )));
	};

};



_player setVariable["temperatureLevel", _playerTemp, true];