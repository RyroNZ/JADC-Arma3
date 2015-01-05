private ["_player", "_playerDataMagazines_array" , "_playerMagazines"];

_player = _this select 0;
_playerDataMagazines_array = _this select 1;
_playerMagazines = _playerDataMagazines_array select 0;


{	
	if ((_x select 4) == "Backpack") then {
		(unitBackpack _player) addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
	} else {
		_player addMagazine [(_x select 0), (_x select 1)];
	};
} forEach _playerMagazines;

sleep 1;