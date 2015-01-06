/*

Author: Ryan Post
Date: 10:14 pm 2/01/2015
Description: Manage the players thirst

*/
_player = _this select 0;
_runSpeed = _this select 1;
_thirstLevel = _player getVariable "thirstLevel";
_airTemp = PV_currentTemperatures select 0;

if (!isNil "_thirstLevel" && (_thirstLevel > 0)) then {

	if (_thirstLevel > PLAYER_MAX_THIRST) then {
		_thirstLevel = PLAYER_MAX_THIRST;
	};

	if (vehicle _player != _player) then {

		_thirstLevel = _thirstLevel - (PLAYER_IDLE_THIRST_TICK);

	} else {
		_thirstLevel = _thirstLevel - ((PLAYER_RUN_THIRST_TICK * _runSpeed) + PLAYER_IDLE_THIRST_TICK);
};
	
};

if (_thirstLevel <= PLAYER_THIRST_STARVATION) then {
	_thirstLevel = PLAYER_THIRST_STARVATION;
	_player setDamage ((damage _player) + PLAYER_DAMAGE_THIRST);

};

if (_thirstLevel > PLAYER_THIRST_REQUIRED_HEAL) then {
	_player setDamage ((damage _player) - (PLAYER_DAMAGE_THIRST / 3));
};

 _player setVariable[PLAYER_THIRST_LEVEL_IDC, _thirstLevel, true];

