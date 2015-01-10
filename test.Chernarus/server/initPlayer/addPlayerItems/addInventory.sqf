private ["_player", "_playerDataInventory_array" ,"_playerBackpack", "_playerVest", "_playerUniform", "_playerGadget", "_playerHeadgear", "_playerGoggles", "_playerBackpackGear", "_playerVestGear", "_playerUniformGear"];

_player = _this select 0;
_playerDataInventory_array = _this select 1;

_playerBackpack = _playerDataInventory_array select 0;
_playerBackpackGear = _playerDataInventory_array select 1;
_playerVest = _playerDataInventory_array select 2;
_playerVestGear = _playerDataInventory_array select 3;
_playerUniform = _playerDataInventory_array select 4;
_playerUniformGear = _playerDataInventory_array select 5;
_playerGadgets = _playerDataInventory_array select 6;
_playerGoggles = _playerDataInventory_array select 7;
_playerHeadgear = _playerDataInventory_array select 8;





_playerInventory = _playerBackpackGear + _playerVestGear + _playerUniformGear;

//Set players complete inventory	
_player addBackpackGlobal _playerBackpack;
_player addVest _playerVest;
_player addUniform _playerUniform;
{_player linkItem _x;} forEach _playerGadgets;
_player addHeadgear _playerHeadgear;
_player addGoggles _playerGoggles;



sleep 1;

{
	if ( !isClass (configFile >> "CFGMagazines" >> _x)) then 
	{
			if (_player canAdd _x) then 
			{
				_player addItem _x;
			} else {
				(unitBackpack _player) addItemCargoGlobal [_x, 1];
			};
	};
} forEach _playerInventory;