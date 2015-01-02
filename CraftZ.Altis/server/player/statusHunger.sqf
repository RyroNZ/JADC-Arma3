/*

Author: Ryan Post
Date: 10:14 pm 2/01/2015
Description: Manage the players hunger

*/

_player = _this select 0;

_hungerLevel = _player getVariable "hungerLevel";

if (!isNil "_hungerLevel" && (_hungerLevel > 0)) then {
	_hungerLevel = _hungerLevel - 10;
	_player setVariable ["hungerLevel", _hungerLevel, true];

};

if (_hungerLevel <= 0) then {
	_hungerLevel = 0;
	_player setDamage ((damage _player) + 0.01);
	_player setvariable["hungerLevel", _hungerLevel, true];

};