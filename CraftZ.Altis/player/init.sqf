/*

Author: Ryan Post
Date: 2:52 AM 4/01/2015
Description: initalizes the player locally and loads the required gear etc from the server.
*/



if (!isServer && (player != player)) then { waitUntil {player == player}; waitUntil {time > 10}; }; //Check to make sure player is valid

"PV_playerLoaded" addPublicVariableEventHandler {

	

	_amPmTime = switch (true) do {
		case ((date select 3) < 12): {"am"};
		case ((date select 3) >= 12): {"pm"};
	};
	_minuteFormat = switch (true) do {
		case ((date select 4) < 10): {"0" + (str (date select 4))}; //ie. 12:4 PM goes to 12:04 PM
		case ((date select 4) >= 10): {str (date select 4)}; //ie. 12:14 PM stays 12:14 PM
	};
	_hourFormat = switch (true) do {
	case ((date select 3) > 12): {str ((date select 3)-12)};
	case ((date select 3) <= 12): {str (date select 3)};
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

{waitUntil sleep 1; PV_playerLoaded == true};
titleCut ["CHARACTER LOADED", "BLACK IN", 5];