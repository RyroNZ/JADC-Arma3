/*

Author: Ryan Post
Date: 10:14 pm 2/01/2015
Description: Manage the players hunger

*/

_player = _this select 0;
_runSpeed = _this select 1;
_hungerLevel = _player getVariable PLAYER_HUNGER_LEVEL_IDC;
_airTemp = PV_currentTemperatures select 0;

if (!isNil "_hungerLevel" && (_hungerLevel > 0)) then {

	if (_hungerLevel > PLAYER_MAX_HUNGER) then {
		_hungerLevel = PLAYER_MAX_HUNGER;
	};

	if (vehicle _player != _player) then {
		_hungerLevel = _hungerLevel - (PLAYER_IDLE_HUNGER_TICK);
	} else {
		_hungerLevel = _hungerLevel - ((PLAYER_RUN_HUNGER_TICK * _runSpeed) + PLAYER_IDLE_HUNGER_TICK);
	};

	

};

if (_hungerLevel <= PLAYER_HUNGER_STARVATION) then {
	_hungerLevel = PLAYER_HUNGER_STARVATION;
	_player setDamage ((damage _player) + PLAYER_DAMAGE_HUNGER);
};

if (_hungerLevel > PLAYER_HUNGER_REQUIRED_HEAL) then {
	_player setDamage ((damage _player) - (PLAYER_DAMAGE_HUNGER / 3));
};

_player setVariable[PLAYER_HUNGER_LEVEL_IDC, _hungerLevel, true];