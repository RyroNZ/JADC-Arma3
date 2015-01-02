/*

Author: Ryan Post
Date: 10:10 pm 2/01/2015
Description: Sets parameters for an existing player on the server (ie. reads from database entry and assigns equipment to them)

*/

_clientID = _this select 0;
_player = _this select 1;

localize format["ClientID: %1, PlayerID: %2", _clientID, _player];

playerData = [];

playerData set [0, getPlayerUID _player];
playerData set [1, playerPos]; 
playerData set [2, playerHealth];
playerData set [3, playerOxygen];

playerData set[10, playerBackpack];
playerData set[11, playerBackpackGear];

playerData set[12, playerVest];
playerData set[13, playerVestGear];

playerData set[14, playerUniform];
playerData set[15, playerUniformGear];

playerData set[16, playerGadgets];
playerData set[17, playerHeadgear];
playerData set[18, playerGoggles];

playerData set[20, playerWep];
playerData set[21, playerPrimWepAttach];
playerData set[22, playerSecWepAttach];

playerData set[30, playerHungerLevel];
playerData set[31, playerThirstLevel];
playerData set[32, playerMoney];
playerData set[33, playerTemperature];
playerData set[34, playerImmunity];
playerData set[35, playerToxicity];


localize format["%1", str playerData];


//Set Player Position
_player setPos (playerData select 1);

//Set Player Health/Oxygen
_player setDamage (playerData select 2);
_player setOxygenRemaining (playerData select 4);

//Set players complete inventory	
_player addBackpack (playerData select 10);
{_player addItemToBackpack _x;} forEach (playerData select 11);

_player addVest (playerData select 12);
{_player addItemToVest _x;} forEach (playerData select 13);

_player addUniform (playerData select 14);
{_player addItemToUniform _x;} forEach (playerData select 15);

{_player linkItem _x;} forEach (playerData select 16);
_player addHeadgear (playerData select 17);
_player addGoggles (playerData select 18);

{ _player addWeaponGlobal _x;} forEach (playerData select 20);
removeAllPrimaryWeaponItems _player;
removeAllHandgunItems _player;

{ 
		if (_x != "") then {

			[[[_x],{_primaryWeaponItem=_this select 0;player addPrimaryWeaponItem _primaryWeaponItem;}],"BIS_fnc_spawn",_player,false,true] call BIS_fnc_MP;
	};
} forEach (playerData select 21);

{ 
		if (_x != "") then {

		[[[_x],{_primaryWeaponItem=_this select 0;player addPrimaryWeaponItem _primaryWeaponItem;}],"BIS_fnc_spawn",_player,false,true] call BIS_fnc_MP;
	};
} forEach (playerData select 22);

//Set players custom variables (hunger etc)
_player SetVariable ["hungerLevel", (playerData select 30), true];
_player SetVariable ["thirstLevel", (playerData select 31), true];
_player SetVariable ["temperatureLevel", (playerData select 33), true];
_player SetVariable ["immunity", (playerData select 34), true];
_player SetVariable ["toxicity", (playerData select 35), true];
_player SetVariable ["cMoney", (playerData select 32), true];

localize format["Setting data to player %1", name _player];
_clientID publicVariableClient "PV_playerLoaded"; 


