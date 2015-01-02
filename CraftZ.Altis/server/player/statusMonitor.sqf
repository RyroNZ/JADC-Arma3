/*

Author: Ryan Post
Date: 8:13 pm 2/01/2015
Description: Monitor the players health information (ie. hunger, thirst, temperature)

*/

fnc_status_hunger = compile preprocessFileLineNumbers "server\player\statusHunger.sqf";
fnc_status_thirst = compile preprocessFileLineNumbers "server\player\statusThirst.sqf";
_player = _this select 0;

while {true} do {

	
	[_player] call fnc_status_hunger;
	[_player] call fnc_status_thirst;

	sleep 10;
	localize format["Hunger: %1, Thirst: %2, Temperature: %3, Immunity: %4, Toxicity: %5", _player getVariable "hungerLevel", 
	_player getVariable "thirstLevel", _player getVariable "temperatureLevel", _player getVariable "immunity", _player getVariable "toxicity"];

	

};


