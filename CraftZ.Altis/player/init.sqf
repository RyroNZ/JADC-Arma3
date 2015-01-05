/*

Author: Ryan Post
Date: 2:52 AM 4/01/2015
Description: initalizes the player locally and loads the required gear etc from the server.
*/
[] call compile preprocessFileLineNumbers "player\compile.sqf";

if (!isServer && (player != player)) then { waitUntil {player == player}; waitUntil {time > 10}; }; //Check to make sure player is valid


"PV_playerLoaded" addPublicVariableEventHandler {
	[] call fnc_display_time;
	[] call fnc_reset_gun;

};

[] call fnc_receive_character;