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

PV_playerLoaded = false;
[] execVM "player\core\dynamicWeather\clientDynamicWeather.sqf";

diag_log format["REMOVING GEAR FOR %1", name player];

cutText ["LOADING CHARACTER", "BLACK FADED"];
sleep 10;


10 fadeSound 0.3;
10 fadeMusic 0.5;

PV_clientID = player;
publicVariableServer "PV_clientID";

{waitUntil sleep 5; PV_playerLoaded == true};

titleCut ["CHARACTER LOADED", "BLACK IN", 5];