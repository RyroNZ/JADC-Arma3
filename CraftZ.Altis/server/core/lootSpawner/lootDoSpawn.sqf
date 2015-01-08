fn_spawnLoot = {	

_lootPos = _this select 0;	

_junkLoot = LOOT_SPAWN_CHANCE select 0;
_foodLoot = LOOT_SPAWN_CHANCE select 1;
_waterLoot = LOOT_SPAWN_CHANCE select 2;
_healthLoot = LOOT_SPAWN_CHANCE select 3;
_weaponLoot = LOOT_SPAWN_CHANCE select 4;
_uniformLoot = LOOT_SPAWN_CHANCE select 5;
_buildingLoot = LOOT_SPAWN_CHANCE select 6;
_militaryLoot = LOOT_SPAWN_CHANCe select 6;

	currentItemPos_array pushBack (_lootPos);	
	_selectCat = random 1;

	if (_selectCat > _militaryLoot) then {

	};
};


/*			_item = LOOT_WEAPONS_ARRAY select 0;
			_itemMag = LOOT_WEAPONS_ARRAY select 1;
			_loot = "groundWeaponHolder" createVehicle _lootPos;
			_loot addWeaponCargoGlobal [_item, 1];
			_loot addMagazineCargoGlobal [_itemMag, (random 5)];
			_loot setPos _lootPos;
			_loot setdir (random 360);
			[_loot, _lootPos] spawn fn_itemDespawner;
*/