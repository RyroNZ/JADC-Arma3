/*

Author: Ryan Post
Date: 2:52 AM 4/01/2015
Description: initalizes the player locally and loads the required gear etc from the server.
*/
if (!isServer && (player != player)) then { waitUntil {player == player}; waitUntil {time > 10};}; //Check to make sure player is valid


[] execVM CLIENT_EXEC_START_DYNAMIC_WEATHER;

"PV_playerLoaded" addPublicVariableEventHandler {
	[] call fnc_print_environment;
	[] call fnc_reset_gun;

};

[] call fnc_get_character;
