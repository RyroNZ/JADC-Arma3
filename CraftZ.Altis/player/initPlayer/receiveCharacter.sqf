player allowDamage false;
PV_playerLoaded = false;
isPlayerInitialized = false;
_startLoadTime = time;
PV_clientID = player;

0 fadeSound 0;
0 fadeMusic 0;
0 fadeRadio 0;
0 fadeSpeech 0;
cutText [CLIENT_INIT_LOADING_TEXT, "BLACK FADED", 100];
sleep 5;

publicVariableServer "PV_clientID";

waitUntil{ PV_playerLoaded || time - _startLoadTime > CLIENT_INIT_MAX_RECIEVE_PLAYER_TIME};
if (PV_playerLoaded) then {
	titleCut [CLIENT_INIT_FINISH_LOAD_TEXT, "BLACK IN", 5];
	isPlayerInitialized = true;
	10 fadeSound 1;
	10 fadeMusic 1;
	player allowDamage true;
	[] execVM CLIENT_EXEC_SETUP_GUI;
}	
else {
	titleCut [CLIENT_INIT_FAIL_LOAD_TEXT, "BLACK FADED", 100];
	sleep 5;
	[CLIENT_INIT_FAIL_LOAD_TEXT, false, false] call BIS_fnc_endMission;

};

