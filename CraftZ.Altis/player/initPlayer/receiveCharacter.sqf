PV_playerLoaded = false;
cutText ["LOADING CHARACTER", "BLACK FADED", 100];
sleep 5;
_startLoadTime = time;
PV_clientID = player;
publicVariableServer "PV_clientID";

0 fadeSound 0;
0 fadeMusic 0;
0 fadeRadio 0;
0 fadeSpeech 0;

waitUntil{ PV_playerLoaded || time - _startLoadTime > 300};

if (PV_playerLoaded) then {
	titleCut ["CHARACTER LOADED", "BLACK IN", 5];
	10 fadeSound 1;
	10 fadeMusic 1;
	player allowDamage true;
	[] execVM "player\initPlayer\setupGUI.sqf";
	} else {
	titleCut ["CHARACTER FAILED TO LOAD.", "BLACK FADED", 100];
	sleep 5;
	["Load Failed", false, false] call BIS_fnc_endMission;

};

