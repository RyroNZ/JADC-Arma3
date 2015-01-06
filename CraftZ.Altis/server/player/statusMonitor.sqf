/*

Author: Ryan Post
Date: 8:13 pm 2/01/2015
Description: Monitor the players health information (ie. hunger, thirst, temperature)

*/

_player = _this select 0;
_clientID = _this select 1;

STATUS_MONITOR_REFRESH = 10;





while {true} do {

	if (_player in readyUnits) then {

	_runSpeed = [_player] call fnc_status_run_speed;
	[_player, _runSpeed] call fnc_status_hunger;
	[_player, _runSpeed] call fnc_status_thirst;
	[_player, _runSpeed] call fnc_status_temperature;



	diag_log format["[server/player/statusMonitor.sqf]: Current statistics for (%1) : playerTemp: %2, playerHunger: %3, playerThirst: %4, PlayerInWater: %5, playerDamage: %6, airTemp: %7, waterTemp: %8, Rain: %9", 
	(name _player), (_player getVariable "temperatureLevel"), (_player getVariable "hungerLevel"), (_player getVariable "thirstLevel"), (surfaceIsWater position _player), (damage _player), (PV_currentTemperatures select 0), (PV_currentTemperatures select 1), (PV_currentWeather select 0)];
	
	};
	sleep STATUS_MONITOR_REFRESH;
	

};


