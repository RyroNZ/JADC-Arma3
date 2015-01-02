call compile preProcessFile "\inidbi\init.sqf";

readyUnits = [];
spawnPoints = ["spawnPoint_1","spawnPoint_2","spawnPoint_3","spawnPoint_4","spawnPoint_5","spawnPoint_6","spawnPoint_7","spawnPoint_8","spawnPoint_9","spawnPoint_10","spawnPoint_11","spawnPoint_12","spawnPoint_13","spawnPoint_14","spawnPoint_15"];

[] execVM "server\serverSaveData.sqf";
[] execVM "server\initPlayer\serverSetupPlayer.sqf";


