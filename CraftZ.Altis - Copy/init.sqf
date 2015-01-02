verboseDebug = true;
publicVariable "verboseDebug";


_path = switch (true) do {
	case isServer: {"server\init.sqf"};
	case !isDedicated: {"player\init.sqf"};
};

hint format["%1, %2, %3, %4", _path, "CraftZ v0.01 11:47 am 01/01/2015", player, getPlayerUID player];

[] execVM _path;

