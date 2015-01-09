hint "spawner";

fn_spawnLoot = 
{	
	private ["_lootPos", "_itemsToSpawn", "_junkLoot", "_foodLoot", "_waterLoot", "_healthLoot", "_weaponLoot", "_uniformLoot", "_buildingLoot", "_militaryLoot", "_militaryWeaponsLoot"];

	_lootPos = _this select 0;	
	_building = _this select 1;
	_itemsToSpawn = [];

	currentItemPos_array pushBack (_lootPos);	
	systemChat format["Nearest Building: %1", _building];
	systemChat str ((configFile >> "cfgVehicles" >> (typeOf _building) >> "vehicleClass") call BIS_fnc_GetCfgData);
	if (random 100 < LOOT_SPAWN_CHANCE) then {
		switch ((configFile >> "cfgVehicles" >> (typeOf _building) >> "vehicleClass") call BIS_fnc_GetCfgData) do
		{

			case "Wreck":
			{
				for [{_x=0},{_x <=floor (random LOOT_MAX_ITEMS_TO_SPAWN)},{_x=_x+1}] do 
				{
					_item = LOOT_STRUCTURE_WRECK call BIS_fnc_selectRandom;
					_itemsToSpawn set [_x, _item];
				};
				[_itemsToSpawn, _lootPos ] call fn_spawnItems;
			};
			case "Structures_Village":
			{
				for [{_x=0},{_x <=floor (random LOOT_MAX_ITEMS_TO_SPAWN)},{_x=_x+1}] do 
				{
					_item = LOOT_STRUCTURE_WRECK call BIS_fnc_selectRandom;
					_itemsToSpawn set [_x, _item];
				};
				[_itemsToSpawn, _lootPos ] call fn_spawnItems;

			};
			case "Structures_Transport":
			{
				for [{_x=0},{_x <=floor (random LOOT_MAX_ITEMS_TO_SPAWN)},{_x=_x+1}] do 
				{
					_item = LOOT_STRUCTURE_WRECK call BIS_fnc_selectRandom;
					_itemsToSpawn set [_x, _item];
				};
				[_itemsToSpawn, _lootPos ] call fn_spawnItems;
			};
			case "Structures_Town":
			{
				for [{_x=0},{_x <=floor (random LOOT_MAX_ITEMS_TO_SPAWN)},{_x=_x+1}] do 
				{
					_item = LOOT_STRUCTURE_WRECK call BIS_fnc_selectRandom;
					_itemsToSpawn set [_x, _item];
				};
				[_itemsToSpawn, _lootPos ] call fn_spawnItems;
			};
			case "Structures_Military":
			{
				for [{_x=0},{_x <=floor (random LOOT_MAX_ITEMS_TO_SPAWN)},{_x=_x+1}] do 
				{
					_item = LOOT_STRUCTURE_WRECK call BIS_fnc_selectRandom;
					_itemsToSpawn set [_x, _item];
				};
				[_itemsToSpawn, _lootPos ] call fn_spawnItems;
			};
			case "Structures_Infrastructure":
			{
				for [{_x=0},{_x <=floor (random LOOT_MAX_ITEMS_TO_SPAWN)},{_x=_x+1}] do 
				{
					_item = LOOT_STRUCTURE_WRECK call BIS_fnc_selectRandom;
					_itemsToSpawn set [_x, _item];
				};
				[_itemsToSpawn, _lootPos ] call fn_spawnItems;
			};
			case "Structures_Cultural":
			{
				for [{_x=0},{_x <=floor (random LOOT_MAX_ITEMS_TO_SPAWN)},{_x=_x+1}] do 
				{
					_item = LOOT_STRUCTURE_WRECK call BIS_fnc_selectRandom;
					_itemsToSpawn set [_x, _item];
				};
				[_itemsToSpawn, _lootPos ] call fn_spawnItems;
			};
			case "Structures_Industrial":
			{
				for [{_x=0},{_x <=floor (random LOOT_MAX_ITEMS_TO_SPAWN)},{_x=_x+1}] do 
				{
					_item = LOOT_STRUCTURE_WRECK call BIS_fnc_selectRandom;
					_itemsToSpawn set [_x, _item];
				};
				[_itemsToSpawn, _lootPos ] call fn_spawnItems;
			};

			default 
			{
				[[], _lootPos] call	fn_spawnItems;
			};

		};
	} else {
		[[], _lootPos] call	fn_spawnItems;
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
		if ( isClass (configFile >> "CFGVehicles" >> _x)) then {
			[_x, _pos] call fn_spawnBackpack;
		} else {
		systemChat format["Adding %1 of %2", str _x, str (count _itemsToSpawn)];
		_loot addItemCargoGlobal [_x, 1];
		_loot setDir (random 360);
		};
	} forEach _itemsToSpawn;

	[_loot, _pos] spawn fn_itemDespawner;
};