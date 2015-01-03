/*

Author: Ryan Post
Date: 2:52 AM 4/01/2015
Description: initalizes the player locally and loads the required gear etc from the server.
*/



if (!isServer && (player != player)) then { waitUntil {player == player}; waitUntil {time > 10}; }; //Check to make sure player is valid

"PV_playerLoaded" addPublicVariableEventHandler {

	_hour = date select 3;
	_minute = date select 4;

	

	_amPmTime = switch (true) do {
		case (_hour < 12): {"am"}; // add am if before 12
		case (_minute >= 12): {"pm"}; // add pm if after 12
	};
	_minuteFormat = switch (true) do {
		case (_minute < 10): {"0" + (str _minute)}; //ie. 12:4 PM goes to 12:04 PM
		case (_minute >= 10): {str _minute}; //ie. 12:14 PM stays 12:14 PM
	};
	_hourFormat = switch (true) do {
	case (_hour > 12): {str (_minute-12)};// ie. 13:00 goes to 1:00
	case (_hour <= 12): {str _minute}; //ie. 7:00 stays 7:00
};

	systemChat format["Time: %1:%2 %3", _hourFormat, _minuteFormat, _amPmTime];
	
};

PV_playerLoaded = false;

removeBackpack player;  
removeVest player;  
removeUniform player;  
removeHeadgear player;  
removeGoggles player;  
removeAllWeapons player;  
removeAllAssignedItems player;

cutText ["LOADING CHARACTER", "BLACK FADED"];
sleep 10;
[] execVM "player\core\dynamicWeather\clientDynamicWeather.sqf";


10 fadeSound 0.3;
10 fadeMusic 0.5;

PV_clientID = player;
publicVariableServer "PV_clientID";

{waitUntil sleep 1; (_this select 1) == true};
titleCut ["CHARACTER LOADED", "BLACK IN", 5];