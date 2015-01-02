if (!isServer && (player != player)) then { waitUntil {player == player}; waitUntil {time > 10}; }; //Check to make sure player is valid

"PV_playerLoaded" addPublicVariableEventHandler {

	player groupChat format["Profile loaded for %1", name player];

	
};



cutText ["LOADING CHARACTER", "BLACK FADED"];

10 fadeSound 1;
10 fadeMusic 0.5;

sleep 5;
PV_clientID = player;
publicVariableServer "PV_clientID";
sleep 5;

titleCut ["", "BLACK IN", 5];


