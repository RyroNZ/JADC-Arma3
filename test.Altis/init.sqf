call compile preProcessFile "\inidbi\init.sqf";
cfgweapons = configFile >> "cfgWeapons"; 
cfgVehicles = configFile >> "cfgVehicles";
cfgMagazines = configFile >> "cfgMagazines";
rifle_array = [];
pistol_array = [];
clothes_array = [];
backpacks_array = [];
magazines_array = [];


for "_i" from 0 to (count cfgWeapons)-1 do
{
	_cfgweapons = configFile >> "cfgWeapons"; 
	_cur_item = _cfgWeapons select _i;
	if (isClass _cur_item ) then {
		_wepName = (((_cfgWeapons select _i >> "_generalMacro")) call BIS_fnc_getCfgData);
		_wepType = (((_cfgweapons select _i) >> "type") call BIS_fnc_getCfgData); 
		if (!isNil "_wepType" && !isNil "_wepName") then {
			if (str _wepType == str 1  && !(_wepName in rifle_array)) then {
				rifle_array = rifle_array + [_wepName]
			};
		};
	};
};


for "_i" from 0 to (count cfgWeapons)-1 do
{
	_cfgweapons = configFile >> "cfgWeapons"; 
	_cur_item = _cfgWeapons select _i;
	if (isClass _cur_item ) then {
		_wepName = (((_cfgWeapons select _i >> "_generalMacro")) call BIS_fnc_getCfgData);
		_wepType = (((_cfgweapons select _i) >> "type") call BIS_fnc_getCfgData); 
		if (!isNil "_wepType" && !isNil "_wepName") then {
			if (str _wepType == str 2  && !(_wepName in pistol_array)) then {
				pistol_array = pistol_array + [_wepName]
			};
		};
	};
};
for "_i" from 0 to (count cfgWeapons)-1 do
{
	_cfgweapons = configFile >> "cfgWeapons"; 
	_cur_item = _cfgWeapons select _i;
	if (isClass _cur_item ) then {
		_wepName = (((_cfgWeapons select _i >> "_generalMacro")) call BIS_fnc_getCfgData);
		_wepType = (((_cfgweapons select _i) >> "type") call BIS_fnc_getCfgData); 
		if (!isNil "_wepType" && !isNil "_wepName") then {
			if (str _wepType == str 131072 && !(_wepName in clothes_array)) then {
				clothes_array = clothes_array + [_wepName]
			};
		};
	};
};
for "_i" from 0 to (count cfgVehicles)-1 do
{
	_cfgweapons = configFile >> "cfgVehicles"; 
	_cur_item = _cfgWeapons select _i;
	if (isClass _cur_item ) then {
		_wepName = (((_cfgWeapons select _i >> "_generalMacro")) call BIS_fnc_getCfgData);
		_wepType = (((_cfgweapons select _i) >> "VehicleClass") call BIS_fnc_getCfgData); 
		if (!isNil "_wepType" && !isNil "_wepName") then {
			if (str _wepType == str "Backpacks" && !(_wepName in backpacks_array)) then {
				backpacks_array = backpacks_array + [_wepName]
			};
		};
	};
};
for "_i" from 0 to (count cfgMagazines)-1 do
{
	_cfgweapons = configFile >> "cfgMagazines"; 
	_cur_item = _cfgWeapons select _i;
	if (isClass _cur_item ) then {
		_wepName = (configName(_cfgWeapons select _i));
		_wepType = (((_cfgweapons select _i) >> "type") call BIS_fnc_getCfgData); 
		if (!isNil "_wepType" && !isNil "_wepName") then {
			if (!(_wepName in magazines_array)) then {
				magazines_array = magazines_array + [_wepName]
			};
		};
	};
};



["classNames", "Weapons", "rifles", rifle_array] call iniDB_write;
["classNames", "Weapons", "Pistols", pistol_array] call iniDB_write;
["classNames", "General", "Clothes", clothes_array] call iniDB_write;
["classNames", "General", "Backpacks", backpacks_array] call iniDB_write;
["classNames", "Weapons", "Magazines", magazines_array] call iniDB_write;