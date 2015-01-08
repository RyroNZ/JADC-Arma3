hint "spawner";

fn_spawnLoot = 
{	
	private ["_lootPos", "_itemsToSpawn", "_junkLoot", "_foodLoot", "_waterLoot", "_healthLoot", "_weaponLoot", "_uniformLoot", "_buildingLoot", "_militaryLoot", "_militaryWeaponsLoot"];

	_lootPos = _this select 0;	
	_itemsToSpawn = [];

	_junkLoot = LOOT_SPAWN_CHANCE select 0;
	_backpackLoot = LOOT_SPAWN_CHANCE select 1;
	_generalLoot = LOOT_SPAWN_CHANCE select 2;
	_weaponLoot = LOOT_SPAWN_CHANCE select 3;
	_uniformLoot = LOOT_SPAWN_CHANCE select 4;
	_buildingLoot = LOOT_SPAWN_CHANCE select 5;
	_militaryLoot = LOOT_SPAWN_CHANCE select 6;
	_militaryWeaponsLoot = LOOT_SPAWN_CHANCE select 7;

	currentItemPos_array pushBack (_lootPos);	
	_selectCat = random 100;
	switch (true) do
	{
		case (_selectCat > _militaryWeaponsLoot):
		{

			_weaponChoice = (LOOT_MILITARY_WEAPONS_ARRAY call BIS_fnc_selectRandom);
			_weapon = _weaponChoice Select 0;
			_mag = _weaponChoice select 1;
			_magAmount = (random LOOT_MAX_MAGS_TO_SPAWN);
			[_weapon, _mag, _magAmount, _lootPos ] call fn_spawnWeapon;
		};

		case (_selectCat > _militaryLoot): 
		{
			for [{_x=0},{_x <=floor (random LOOT_MAX_ITEMS_TO_SPAWN)},{_x=_x+1}] do 
			{
				_item = LOOT_MILITARY_ARRAY call BIS_fnc_selectRandom;
				_itemsToSpawn set [_x, _item];
			};
			[_itemsToSpawn, _lootPos ] call fn_spawnItems;
		};

		case (_selectCat > _buildingLoot):
		{
			for [{_x=0},{_x <=floor (random LOOT_MAX_ITEMS_TO_SPAWN)},{_x=_x+1}] do 
			{
				_item = LOOT_BUILDING_SUPPLIES_ARRAY call BIS_fnc_selectRandom;
				_itemsToSpawn set [_x, _item];
			};
			[_itemsToSpawn, _lootPos ] call fn_spawnItems;
		};

		case (_selectCat > _weaponLoot):
		{	
			_weaponChoice = (LOOT_WEAPONS_ARRAY call BIS_fnc_selectRandom);
			_weapon = _weaponChoice Select 0;
			_mag = _weaponChoice select 1;
			_magAmount = (random LOOT_MAX_MAGS_TO_SPAWN);
			[_weapon, _mag, _magAmount, _lootPos ] call fn_spawnWeapon;

		};

		case (_selectCat > _generalLoot):
		{
			for [{_x=0},{_x <=floor (random LOOT_MAX_ITEMS_TO_SPAWN)},{_x=_x+1}] do 
			{
				_item = LOOT_GENERAL_ARRAY call BIS_fnc_selectRandom;
				_itemsToSpawn set [_x, _item];
			};
			[_itemsToSpawn, _lootPos ] call fn_spawnItems;
		};

		case (_selectCat > _junkLoot):
		{
			for [{_x=0},{_x <=floor (random LOOT_MAX_ITEMS_TO_SPAWN)},{_x=_x+1}] do 
			{
				_item = LOOT_JUNK_ARRAY call BIS_fnc_selectRandom;
				_itemsToSpawn set [_x, _item];
			};
			[_itemsToSpawn, _lootPos ] call fn_spawnItems;
		};

		case (_selectCat > _backpackLoot):
		{
			_backpackToSpawn = (LOOT_BACKPACK_ARRAY call BIS_fnc_selectRandom);
			[_backpackToSpawn, _lootPos ] call fn_spawnBackpack;
		};
		default 
		{
			[[] ,_lootPos] spawn fn_spawnItems;
		};

	};
};

fn_spawnWeapon = 
{
	private ["_weapon", "_mag", "_magAmountToSpawn", "_pos", "_loot"];
	_weapon = _this select 0;
	_mag = _this select 1;
	_magAmountToSpawn = _this select 2;
	_pos = _this select 3;
	systemChat format["Adding %1", str _weapon];
	_loot = createVehicle [LOOT_GROUNDWEAPON_HOLDER, _pos, [], 0, "CAN_COLLIDE"];
	_loot addWeaponCargoGlobal [_weapon, 1];
	_loot addMagazineCargoGlobal [_mag, _magAmountToSpawn];
	_loot setPos _pos;
	_loot setDir (random 360);
	[_loot, _pos] spawn fn_itemDespawner;

};

fn_spawnBackpack = {

	private ["_backpack" , "_pos", "_loot"];
	_backpack = _this select 0;
	_pos = _this select 1;
	systemChat format["Adding %1", str _backpack];
	_loot = createVehicle [LOOT_GROUNDWEAPON_HOLDER, _pos, [], 0, "CAN_COLLIDE"];
	_loot addBackpackCargoGlobal [_backpack, 1];
	_loot setPos _pos;
	_loot setDir (random 360);
	[_loot, _pos] spawn fn_itemDespawner;
};

fn_spawnItems = 
{
	private ["_itemsToSpawn", "_amountToSpawn", "_pos", "_loot"];
	_itemsToSpawn = _this select 0;
	_pos = _this select 1;
	
	_loot = createVehicle [LOOT_GROUNDWEAPON_HOLDER, _pos, [], 0, "CAN_COLLIDE"];
	{
		systemChat format["Adding %1 of %2", str _x, str (count _itemsToSpawn)];
		_loot addItemCargoGlobal [_x, 1];
		_loot setDir (random 360);
	} forEach _itemsToSpawn;

	[_loot, _pos] spawn fn_itemDespawner;
};