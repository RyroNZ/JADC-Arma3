/*

Author: Ryan Post
Date: 10:14 pm 2/01/2015
Description: Manage the players thirst

*/

_player = _this select 0;
_runSpeed = _this select 1;
_thirstLevel = _player getVariable "thirstLevel";

if (!isNil "_thirstLevel" && (_thirstLevel > 0)) then {

	if (_thirstLevel > DEFAULT_MAX_THIRST) then {
		_thirstLevel = DEFAULT_MAX_THIRST;
	};

	if (vehicle _player != _player) then {

		_thirstLevel = _thirstLevel - (DEFAULT_HUNGER_RATE_IDLE * -1);

	} else {
		_thirstLevel = _thirstLevel - ((DEFAULT_THIRST_RATE_MULTI * _runSpeed) - DEFAULT_THIRST_RATE_IDLE);
};
	
};

if (_thirstLevel <= 0) then {
	_thirstLevel = 0;
	_player setDamage ((damage _player) + DEFAULT_DAMAGE_THIRST);

};

_player setVariable["thirstLevel", _thirstLevel, true];

