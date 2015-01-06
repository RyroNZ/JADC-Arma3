/*

Author: Ryan Post
Date: 2:52 AM 4/01/2015
Description: initalizes the player locally and loads the required gear etc from the server.
*/
if (!isServer && (player != player)) then { waitUntil {player == player}; waitUntil {time > 30};}; //Check to make sure player is valid


[] execVM CLIENT_EXEC_START_DYNAMIC_WEATHER;
"PV_playerLoaded" addPublicVariableEventHandler {
	[] call fnc_display_time;
	[] call fnc_reset_gun;

};

[] call fnc_receive_character;
