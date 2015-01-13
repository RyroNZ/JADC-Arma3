_zombieSpawnPos = _this select 0;

if (random 1 < ZOMBIE_SPAWN_CHANCE) then {
	[_zombieSpawnPos] call fn_createZombie;
};

