private ["_player", "_playerDataWeapons_array" , "_playerPrimWepAttach", "_playerSecWepAttach"];

_player = _this select 0;
_playerDataWeapons_array = _this select 1;

_playerWep = _playerDataWeapons_array select 0;
_playerPrimWepAttach = _playerDataWeapons_array select 1;
_playerSecWepAttach = _playerDataWeapons_array select 2;

{ 
	_player addWeaponGlobal _x;
} forEach (_playerWep);
[[[],{removeAllPrimaryWeaponItems player;}],"BIS_fnc_spawn",_player,false,true] call BIS_fnc_MP;
[[[],{removeAllHandgunItems player;}],"BIS_fnc_spawn",_player,false,true] call BIS_fnc_MP;



{ 
		if (_x != "") then {

			[[[_x],{_primaryWeaponItem=_this select 0;player addPrimaryWeaponItem _primaryWeaponItem;}],"BIS_fnc_spawn",_player,false,true] call BIS_fnc_MP;
	};

} forEach (_playerPrimWepAttach);
{ 
		if (_x != "") then {

		[[[_x],{_secWeaponItem=_this select 0; player addPrimaryWeaponItem _secWeaponItem;}],"BIS_fnc_spawn",_player,false,true] call BIS_fnc_MP;
	};
} forEach (_playerSecWepAttach);

sleep 1;