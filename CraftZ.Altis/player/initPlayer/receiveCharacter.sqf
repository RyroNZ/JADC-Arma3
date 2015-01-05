PV_playerLoaded = false;
_startLoadTime = time;
[] execVM "player\core\dynamicWeather\clientDynamicWeather.sqf";

diag_log format["REMOVING GEAR FOR %1", name player];


cutText ["LOADING CHARACTER", "BLACK FADED", 100];
PV_clientID = player;
publicVariableServer "PV_clientID";

1000 fadeSound 0;
1000 fadeMusic 0;

waitUntil{ PV_playerLoaded || time - _startLoadTime > 60} ;
hint "player loaded";

if (PV_playerLoaded) then {
titleCut ["CHARACTER LOADED", "BLACK IN", 5];
10 fadeSound 1;
10 fadeMusic 1;
} else {
	titleCut ["CHARACTER FAILED TO LOAD.", "BLACK FADED", 100];
	sleep 5;
	["Load Failed", false, false] call BIS_fnc_endMission;

};