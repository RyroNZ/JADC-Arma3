/*

Author: Ryan Post
Date: 1:02 am 3/01/2015
Description: Get the RunSpeed from the player

*/

_player = _this select 0;
_runSpeed = speed _player;

if (_runSpeed < 0) then {
	_runSpeed = (_runSpeed * - 1); //Don't let walking backwards  be a negative value
};

_runSpeed