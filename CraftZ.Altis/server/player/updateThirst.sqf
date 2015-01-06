/*

Author: Ryan Post
Date: 10:14 pm 2/01/2015
Description: Manage the players thirst

*/

_defaultMaxThirst = 2000;
_defaulThirstMul = 0.1 * STATUS_MONITOR_REFRESH;
_defaulThirstIdle = -0.05 * STATUS_MONITOR_REFRESH;
_defaulDamageThirst = 0.02 * STATUS_MONITOR_REFRESH;

_player = _this select 0;
_runSpeed = _this select 1;
_thirstLevel = _player getVariable "thirstLevel";

if (!isNil "_thirstLevel" && (_thirstLevel > 0)) then {

	if (_thirstLevel > _defaultMaxThirst) then {
		_thirstLevel = _defaultMaxThirst;
	};

	if (vehicle _player != _player) then {

		_thirstLevel = _thirstLevel - (_defaultThirstIdle * -1);

	} else {
		_thirstLevel = _thirstLevel - ((_defaulThirstMul * _runSpeed) - _defaulThirstIdle);
};
	
};

if (_thirstLevel <= 0) then {
	_thirstLevel = 0;
	_player setDamage ((damage _player) + _defaulDamageThirst);

};

_player setVariable["thirstLevel", _thirstLevel, true];

