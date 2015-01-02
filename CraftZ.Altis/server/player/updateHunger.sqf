/*

Author: Ryan Post
Date: 10:14 pm 2/01/2015
Description: Manage the players hunger

*/

_player = _this select 0;
_runSpeed = _this select 1;
_hungerLevel = _player getVariable "hungerLevel";



if (!isNil "_hungerLevel" && (_hungerLevel > 0)) then {

	if (_hungerLevel > DEFAULT_MAX_HUNGER) then {
		_hungerLevel = DEFAULT_MAX_HUNGER;
	};

	_hungerLevel = _hungerLevel - ((DEFAULT_HUNGER_RATE_MULTI * _runSpeed) - DEFAULT_HUNGER_RATE_IDLE);

};

if (_hungerLevel <= 0) then {
	_hungerLevel = 0;
	_player setDamage ((damage _player) + DEFAULT_DAMAGE_HUNGER);
};

_player setVariable["hungerLevel", _hungerLevel, true];