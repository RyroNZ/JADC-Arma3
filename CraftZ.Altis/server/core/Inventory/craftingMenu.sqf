disableSerialization;


fn_createCraftMenu = {
	//sleep 5;
	_craftableItems = [] call fn_getCraftableItems;
	systemChat str _craftableItems;
	_handle = createDialog "craftMenu";
	waitUntil {dialog};
	_idc = uiNamespace getVariable "craftMenu";

	_comboBox = _idc displayCtrl 7001;

	{
		_comboBox lbAdd (_x);

	} forEach _craftableItems;

};

fn_getCraftableItems = {
	private ["_craftableItems", "_cfgMagazines", "_curItem", "_craftable"];
	_craftableItems = [];
	_cfgMagazines = configFile >> "CfgMagazines";
	for "_i" from 0 to (count _cfgMagazines)-1 do {
	    _curItem = _cfgMagazines select _i;

	    if (isClass _curItem) then {
	        _craftable = ((_curItem >> "craftable") call BIS_fnc_getCfgData);
	        if (!(isNil "_craftable")) then {
	        	if (_craftable == "true") then {
	        		 _craftableItems pushBack (configName _curItem);
	        	};
	    	};
	    };
	};
	_craftableItems
};

[] call fn_createCraftMenu;

