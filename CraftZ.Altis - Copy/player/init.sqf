if (!isServer && (player != player)) then { waitUntil {player == player}; waitUntil {time > 10}; }; //Check to make sure player is valid

fnc_player_connected = compile preprocessFileLineNumbers "player\initPlayer\clientSetupPlayer.sqf";
nul = [] call fnc_player_connected;