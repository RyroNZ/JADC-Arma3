//hint "despawner";
fn_itemDespawner = {
	private["_loot", "_lootPos", "_noPlayersNearby"];
	_noPlayersNearby = true;
	_loot = _this select 0;
	_lootPos = _this select 1;
	private ["_noPlayersNearby"];



	//systemChat "item spawned";
	sleep LOOT_SPAWN_RESET;
	//systemChat "item spawned can now be removed";

	while {true} do {
	
		{

		if ((_x distance _lootPos) > LOOT_DESPAWN_DISTANCE) then {
				_noPlayersNearby = true;
			} else { _noPlayersNearby = false;}

		} forEach readyUnits;

		if (_noPlayersNearby) exitWith {
			currentItemPos_array = currentItemPos_array - [_lootPos];
			deletevehicle _loot;
		};
	};
	sleep 5;
};

fn_dummyItemDespawner = {
	private["_lootPos", "_noPlayersNearby"];
	private ["_noPlayersNearby"];
	_noPlayersNearby = true;
	_lootPos = _this select 0;
	sleep LOOT_SPAWN_RESET; 
	while {true} do {
		{
			
			if ((_x distance _lootPos) > LOOT_DESPAWN_DISTANCE) then {
				_noPlayersNearby = true;
			} else { _noPlayersNearby = false;};

		} forEach readyUnits; 

		if (_noPlayersNearby) exitWith {
			currentItemPos_array = currentItemPos_array - [_loot];
		};
	};
	sleep 5;
};