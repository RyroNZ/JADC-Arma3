verboseDebug = true;
publicVariable "verboseDebug";

playerHasDied = false;
playerPath = "player\init.sqf";
serverPath = "server\init.sqf";
_path = switch (true) do {
	case isServer: {serverPath};
	case !isDedicated: {playerPath};
};

[] execVM _path;
