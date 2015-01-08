hint "spawner";

fn_spawnLoot = {	
private ["_lootPos", "_junkLoot", "_foodLoot", "_waterLoot", "_healthLoot", "_weaponLoot", "_uniformLoot", "_buildingLoot", "_militaryLoot", "_militaryWeaponsLoot"];

_lootPos = _this select 0;	

_junkLoot = LOOT_SPAWN_CHANCE select 0;
_foodLoot = LOOT_SPAWN_CHANCE select 1;
_waterLoot = LOOT_SPAWN_CHANCE select 2;
_healthLoot = LOOT_SPAWN_CHANCE select 3;
_weaponLoot = LOOT_SPAWN_CHANCE select 4;
_uniformLoot = LOOT_SPAWN_CHANCE select 5;
_buildingLoot = LOOT_SPAWN_CHANCE select 6;
_militaryLoot = LOOT_SPAWN_CHANCE select 7;
_militaryWeaponsLoot = LOOT_SPAWN_CHANCE select 8;

	currentItemPos_array pushBack (_lootPos);	
	_selectCat = random 1;

	if (_selectCat > _militaryWeaponsLoot) exitWith {
		_weaponChoice = (LOOT_MILITARY_WEAPONS_ARRAY call BIS_fnc_selectRandom);
		_weapon = _weaponChoice Select 0;
		_mag = _weaponChoice select 1;
		_magAmount = (random LOOT_MAX_MAGS_TO_SPAWN);
		[_weapon, _mag, _magAmount, _lootPos ] call fn_spawnWeapon;
	};
	if (_selectCat > _militaryLoot) exitWith {
		for [{_x=0},{_x<=random LOOT_MAX_ITEMS_TO_SPAWN},{_x=_x+1}] do {
			_itemsToSpawn set [_x, LOOT_MILITARY_ARRAY call BIS_fnc_selectRandom];
		};
		[_itemsToSpawn, _lootPos ] call fn_spawnWeapon;
	};
};

fn_spawnWeapon = {
	private ["_weapon", "_mag", "_magAmountToSpawn", "_pos", "_loot"];
	_weapon = _this select 0;
	_mag = _this select 1;
	_magAmountToSpawn = _this select 2;
	_pos = _this select 3;

	_loot = LOOT_GROUNDWEAPON_HOLDER createVehicle _pos;
	_loot addWeaponCargoGlobal [_weapon, 1];
	_loot addMagazineCargoGlobal [_mag, _magAmountToSpawn];
	_loot setPos _pos;
	_loot setDir (random 360);
	[_loot, _pos] spawn fn_itemDespawner;

};

fn_spawnItems = {
	private ["_itemsToSpawn", "_amountToSpawn", "_pos", "_loot"];
	_itemsToSpawn = _this select 0;
	_pos = _this select 1;

	_loot = LOOT_GROUNDWEAPON_HOLDER createVehicle _pos;
	{
		_loot addItemCargoGlobal [_x, 1];
		_loot setDir (random 360);
	} forEach _itemsToSpawn;

	[_loot, _pos] spawn fn_itemDespawner;
};