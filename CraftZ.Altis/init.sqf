[] call compile preprocessFileLineNumbers "constants.sqf";



playerHasDied = false;

_path = switch (true) do {
	case isServer: {SERVER_PATH};
	case !isDedicated: {PLAYER_PATH};
};

if (isServer) then {
	[] call compile preprocessFileLineNumbers "server\compile.sqf";
} 
else {
	[] call compile preprocessFileLineNumbers "player\compile.sqf";
};

[] execVM _path;
