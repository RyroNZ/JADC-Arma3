_zombieSpawnPos = _this select 0;

if (random 1 < ZOMBIE_SPAWN_CHANCE) then {
	_count = 0;
	_nearZombies = (_zombieSpawnPos) nearEntities ["Civilian", 500];
	{
	if (((typeOf _x) in AI_ZOMBIE_CHARS)) then 
			{
				_count = _count + 1;
			};
	} forEach _nearZombies;
	if (_count < MAX_ZOMBIES_IN_AREA) then {
		[_zombieSpawnPos] call fn_createZombie;
	};
};

