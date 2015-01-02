verboseDebug = true;
publicVariable "verboseDebug";

playerHasDied = false;
playerPath = "player\init.sqf";
serverPath = "server\init.sqf";
_path = switch (true) do {
	case isServer: {serverPath};
	case !isDedicated: {playerPath};
};

hint format["%1, %2, %3, %4", _path, "CraftZ v0.01 11:47 am 01/01/2015", player, getPlayerUID player];

[] execVM _path;
