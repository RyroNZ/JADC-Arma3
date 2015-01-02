call compile preProcessFile "\inidbi\init.sqf";

readyUnits = [];

[] execVM "server\serverSaveData.sqf";
[] execVM "server\initPlayer\serverSetupPlayer.sqf";


