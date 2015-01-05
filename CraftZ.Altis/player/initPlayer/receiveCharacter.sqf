PV_playerLoaded = false;
_startLoadTime = time;
cutText ["LOADING CHARACTER", "BLACK FADED", 100];
sleep 5;
PV_clientID = player;
publicVariableServer "PV_clientID";

0 fadeSound 0;
0 fadeMusic 0;
0 fadeRadio 0;
0 fadeSpeech 0;

waitUntil{ PV_playerLoaded || time - _startLoadTime > 60};

if (PV_playerLoaded) then {
titleCut ["CHARACTER LOADED", "BLACK IN", 5];
10 fadeSound 1;
10 fadeMusic 1;
player allowDamage true;
} else {
	titleCut ["CHARACTER FAILED TO LOAD.", "BLACK FADED", 100];
	sleep 5;
	["Load Failed", false, false] call BIS_fnc_endMission;

};