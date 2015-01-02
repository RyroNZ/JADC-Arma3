_OBJECTS = _this select 0;

while (true) do {
	player groupChat format["%1", _x];
} forEach _OBJECTS;
