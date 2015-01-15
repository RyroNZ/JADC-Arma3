/*

Author: Ryan Post
Date: 11:49 am 3/01/2015
Description: Manage the players temperature

*/

private["_waterTemp", "_airTemp", "_airHeatLoss", "_waterHeatLoss", "_playerTemp"];
_player = _this select 0;
_runSpeed = _this select 1;
_playerTemp = _player getVariable PLAYER_TEMP_LEVEL_IDC;

_airTemp = PV_currentTemperatures select 0;
_waterTemp = PV_currentTemperatures select 1;

_waterHeatLoss = PLAYER_TEMP_WATER_HEAT_LOSS;
_airHeatLoss = PLAYER_TEMP_AIR_HEAT_LOSS;

_playerUniform = uniform _player;

if (_waterTemp != 0) then {
	_waterHeatLoss = (PLAYER_TEMP_WATER_HEAT_LOSS / _waterTemp);
};

if (_airTemp != 0) then {
	_airHeatLoss = (PLAYER_TEMP_AIR_HEAT_LOSS / _airTemp);
};

if (_waterHeatLoss < 0) then { _waterHeatLoss = PLAYER_TEMP_WATER_HEAT_LOSS};
if (_airHeatLoss < 0 ) then { _airHeatLoss = PLAYER_TEMP_AIR_HEAT_LOSS };


if (!isNil "_playerTemp") then {

		if (uniform _player != "") then {
			if (_playerUniform == "U_B_Wetsuit" || _playerUniform == "U_I_Wetsuit" || _playerUniform == "U_O_Wetsuit") then {
				_waterHeatLoss = PLAYER_TEMP_WATER_HEAT_LOSS * PLAYER_TEMP_WATER_RESISTANCE_WETSUIT;
			} else {
			_waterHeatLoss = PLAYER_TEMP_WATER_HEAT_LOSS * PLAYER_TEMP_WATER_RESISTANCE_UNIFORM;
			_airHeatLoss = PLAYER_TEMP_AIR_HEAT_LOSS * PLAYER_TEMP_AIR_RESISTANCE_UNIFORM;
			};

		};
		if (vest _player != "") then {
			_airHeatLoss = PLAYER_TEMP_AIR_HEAT_LOSS * PLAYER_TEMP_AIR_RESTISTANCE_VEST;
			_waterHeatLoss = PLAYER_TEMP_WATER_HEAT_LOSS * PLAYER_TEMP_WATER_RESISTANCE_VEST;
		};

		if ((vehicle _player != _player) && (_playerTemp < PLAYER_TEMP_EQUILLIBRIUM) && (isEngineOn (VEHICLE _player))) then {
			_playerTemp = _playerTemp + PLAYER_TEMP_CAR_HEAT_GAIN; // Check Cair is on and player is in vehicle, increase players temperature as player is freezing
		};

		if ((vehicle _player != _player) && (_playerTemp > PLAYER_TEMP_EQUILLIBRIUM) && (isEngineOn (VEHICLE _player))) then {
			_playerTemp = _playerTemp - PLAYER_TEMP_CAR_HEAT_GAIN; // Check Cair is on and player is in vehicle, decrease players temperature as player is overheating
		};

		if (_playerTemp < PLAYER_TEMP_EQUILLIBRIUM) then {
				_playerTemp = _playerTemp + ((PLAYER_TEMP_RUN_HEAT_GAIN * _runSpeed));
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

	if (_playerTemp >= PLAYER_TEMP_OVERHEAT) then {
			_player setDamage ((damage _player) + (PLAYER_DAMAGE_OVERHEAT * (_playerTemp - PLAYER_TEMP_OVERHEAT)));
		};
	if (_playerTemp <= PLAYER_TEMP_FREEZE) then {
		_player setDamage ((damage _player) + (PLAYER_DAMAGE_FREEZE * ((_playerTemp - PLAYER_TEMP_FREEZE) * - 1 )));
	};

};



_player setVariable[PLAYER_TEMP_LEVEL_IDC, _playerTemp, true];