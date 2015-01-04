/*

Author: Ryan Post
Date: 10:10 pm 2/01/2015
Description: Sets parameters for an existing player on the server (ie. reads from database entry and assigns equipment to them)

*/

_clientID = _this select 0;
_player = _this select 1;

diag_log format["[server\initPlayer\serverPlayerSetData.sqf]: Setting data from database to player (%1). ProfileID: %2", name _player ,_profile];

_playerData = [];

_playerData set [0, getPlayerUID _player];
_playerData set [1, playerPos]; 
_playerData set [2, playerHealth];
_playerData set [3, playerOxygen];

_playerData set[10, playerBackpack];
_playerData set[11, playerBackpackGear];

_playerData set[12, playerVest];
_playerData set[13, playerVestGear];

_playerData set[14, playerUniform];
_playerData set[15, playerUniformGear];

_playerData set[16, playerGadgets];
_playerData set[17, playerHeadgear];
_playerData set[18, playerGoggles];

_playerData set[20, playerWep];
_playerData set[21, playerPrimWepAttach];
_playerData set[22, playerSecWepAttach];
_playerData set[23, playerMagazines];

_playerData set[30, playerHungerLevel];
_playerData set[31, playerThirstLevel];
_playerData set[32, playerMoney];
_playerData set[33, playerTemperature];
_playerData set[34, playerImmunity];
_playerData set[35, playerToxicity];


//Set Player Position
_player setPos (_playerData select 1);
//Set Player Health/Oxygen
_player setDamage (_playerData select 2);
_player setOxygenRemaining (_playerData select 4);
//Set players complete inventory	
_player addBackpackGlobal (_playerData select 10);
{if ( !isClass (configFile >> "CFGMagazines" >> _)) then {_player addItemToBackpack _x;};} forEach (_playerData select 11);
_player addVest (_playerData select 12);
{if ( !isClass (configFile >> "CFGMagazines" >> _x)) then {_player addItemToVest _x;};} forEach (_playerData select 13);
_player addUniform (_playerData select 14);
{if ( !isClass (configFile >> "CFGMagazines" >> _x)) then {_player addItemToUniform _x;};} forEach (_playerData select 15);
{_player linkItem _x;} forEach (_playerData select 16);
_player addHeadgear (_playerData select 17);
_player addGoggles (_playerData select 18);
{_player addMagazine [(_x select 0), (_x select 1)];} forEach (_playerData select 23);

{ 
	_player addWeaponGlobal _x;
} forEach (_playerData select 20);
removeAllPrimaryWeaponItems _player;
removeAllHandgunItems _player;
{ 
		if (_x != "") then {

			[[[_x],{_primaryWeaponItem=_this select 0;player addPrimaryWeaponItem _primaryWeaponItem;}],"BIS_fnc_spawn",_player,false,true] call BIS_fnc_MP;
	};

} forEach (_playerData select 22);
{ 
		if (_x != "") then {

		[[[_x],{_primaryWeaponItem=_this select 0;player addPrimaryWeaponItem _primaryWeaponItem;}],"BIS_fnc_spawn",_player,false,true] call BIS_fnc_MP;
	};
} forEach (_playerData select 21);


diag_log format["[server\initPlayer\serverPlayerSetData.sqf]: Profile: %1 (%2). Setting secondary weapon attachments: %3", _profile, name _player, str (_playerData select 1)];
//Set players custom variables (hunger etc)
_player SetVariable ["hungerLevel", (_playerData select 30), true];
_player SetVariable ["thirstLevel", (_playerData select 31), true];
_player SetVariable ["temperatureLevel", (_playerData select 33), true];
_player SetVariable ["immunity", (_playerData select 34), true];
_player SetVariable ["toxicity", (_playerData select 35), true];
_player SetVariable ["cMoney", (_playerData select 32), true];
diag_log format["[server\initPlayer\serverPlayerSetData.sqf]: Set data successfully for player (%1). ProfileID: %2", name _player ,_profile];
