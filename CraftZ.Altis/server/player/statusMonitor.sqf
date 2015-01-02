/*

Author: Ryan Post
Date: 8:13 pm 2/01/2015
Description: Monitor the players health information (ie. hunger, thirst, temperature)

*/

fnc_status_hunger = compile preprocessFileLineNumbers "server\player\updateHunger.sqf";
fnc_status_thirst = compile preprocessFileLineNumbers "server\player\updateThirst.sqf";
fnc_status_run_speed = compile preprocessFileLineNumbers "server\player\runSpeed.sqf";
_player = _this select 0;

while {true} do {

	if (_player in readyUnits) then {

	_runSpeed = [_player] call fnc_status_run_speed;
	[_player, _runSpeed] call fnc_status_hunger;
	[_player, _runSpeed] call fnc_status_thirst;
	

	
	diag_log format["%1 KPH", str _runSpeed];
	diag_log format["Hunger: %1, Thirst: %2, Temperature: %3, Immunity: %4, Toxicity: %5", _player getVariable "hungerLevel", 
	_player getVariable "thirstLevel", _player getVariable "temperatureLevel", _player getVariable "immunity", _player getVariable "toxicity"];
	
	};
	sleep 2;
	

};


