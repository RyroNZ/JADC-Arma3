_player = _this select 0;

_selectRandSpawn = floor (count spawnPoints);
_player setPos (spawnPoints select _selectRandSpawn);
