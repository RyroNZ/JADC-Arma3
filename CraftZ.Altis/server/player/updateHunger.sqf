/*

Author: Ryan Post
Date: 10:14 pm 2/01/2015
Description: Manage the players hunger

*/

_player = _this select 0;
_runSpeed = _this select 1;
_hungerLevel = _player getVariable "hungerLevel";

_defaultMaxHunger = 4500;
_defaultHungerRateMul = 0.075 * STATUS_MONITOR_REFRESH;
_defaultHungerRateIdle = -0.2 * STATUS_MONITOR_REFRESH;
_defaultDamageHunger= 0.01 * STATUS_MONITOR_REFRESH;



if (!isNil "_hungerLevel" && (_hungerLevel > 0)) then {

	if (_hungerLevel > _defaultMaxHunger) then {
		_hungerLevel = _defaultMaxHunger;
	};

	if (vehicle _player != _player) then {
		_hungerLevel = _hungerLevel - (_defaultHungerRateIdle * -1);
	} else {
		_hungerLevel = _hungerLevel - ((_defaultHungerRateMul * _runSpeed) - _defaultHungerRateIdle);
	};

	

};

if (_hungerLevel <= 0) then {
	_hungerLevel = 0;
	_player setDamage ((damage _player) + DEFAULT_DAMAGE_HUNGER);
};

_player setVariable["hungerLevel", _hungerLevel, true];