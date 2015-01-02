/*

Author: Ryan Post
Date: 10:14 pm 2/01/2015
Description: Manage the players thirst

*/

_player = _this select 0;

_thirstLevel = _player getVariable "thirstLevel";

if (!isNil "_thirstLevel" && (_thirstLevel > 0)) then {
	_thirstLevel = _thirstLevel - 15;
	_player setVariable["thirstLevel", _thirstLevel, true];


};

if (_thirstLevel <= 0) then {
	_thirstLevel = 0;
	_player setDamage ((damage _player) + 0.02);
	_player setVariable["thirstLevel", thirstLevel, true];

};

