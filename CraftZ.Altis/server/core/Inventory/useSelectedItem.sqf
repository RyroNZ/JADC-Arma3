handle = [] spawn {
    fn_inventoryOpened = { 
        _idc = ctrlIDC (_this select 0);
        _selectedIndex = _this select 1;
        _cfgName = lbData [_idc, _selectedIndex];
        _name = lbText [_idc, _selectedIndex];
        _value = lbValue [_idc, _selectedIndex];
        _pic = lbPicture [_idc, _selectedIndex]; 
        
        [_cfgName, _name, _value, _pic] call fn_createUseMenu;

        false
    };
    while {true} do {
        waituntil {!(isnull (finddisplay 602))};
        ((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "_this call fn_inventoryOpened"];
        waituntil {isnull (finddisplay 602)};
    };
}; 

fn_createUseMenu = {
    private ["_useable", "_slItemData", "_slItemName", "_slItemValue", "_slItemPicture"];
    private ["_idc", "_slPicFrame", "_slDescFrame", "_slItemDesc"];

    _slItemCfgName = _this select 0;
    _slItemName = _this select 1;
    _slItemValue = _this select 2;
    _slItemPicture = _this select 3;

    _useableItems = [] call fn_getUseableItems;
   
    if (_slItemCfgName in _useableItems) then {
        _useable = true;
    };


    if (_useable) then {
        createDialog "InvMenu";
        _idc = uiNamespace getVariable "InvMenu";

        _slPicFrame = _idc displayCtrl 6001;
        _slDescFrame = _idc displayCtrl 6002;
        _slCfgNameFrame = _idc displayCtrl 6005;
        _slItemDesc = ((configFile >> "CfgMagazines" >> _slItemData >> "descriptionShort") call BIS_fnc_getCfgData);

        _slPicFrame ctrlSetText _slItemPicture;
        _slDescFrame ctrlSetText format["%1\n%2", _slItemName, _slItemDesc];
        _slCfgNameFrame ctrlSetText _slItemCfgName;

        _slPicFrame ctrlCommit 0;
        _slDescFrame ctrlCommit 0;
        _slCfgNameFrame ctrlCommit 0;

        _idc displaySetEventHandler ["Unload", "_this call fn_useSelectedItem"];

    };

};

fn_getUseableItems = {
    private ["_useableItems", "_cfgMagazines", "_useable", "_curItem"];
    _useableItems = [];
    _cfgMagazines = configFile >> "CfgMagazines";
    for "_i" from 0 to (count _cfgMagazines)-1 do {
        _curItem = _cfgMagazines select _i;

        if (isClass _curItem) then {

            _useable = ((_curItem >> "useable") call BIS_fnc_getCfgData);

        };
        if (!isNil "_useable" && _useable == "true") then {
            _useableItems pushBack (configName _curItem);
        };
    

    };
    _useableItems
};

fn_useSelectedItem = {
    
    _idc = _this select 0;
    _exitCode = _this select 1;

    systemChat format["Exiting with: %1", str _exitCode];
    if (_exitCode == 1) then {
       _slCfgNameFrame = _idc displayCtrl 6005;
       _slItemCfgName = ctrlText _slCfgNameFrame;

       
        _slUseAttrib = ((configFile >> "CfgMagazines" >> _slItemCfgName >> "useable_attributes") call BIS_fnc_getCfgData);

        _stats_update = [player, _slUseAttrib];
        //publicVariableServer stats_update;

        _player = _stats_update select 0;
        _stats = _stats_update select 1;
        systemChat str _stats_update;

        _currentHunger = _player getVariable PLAYER_HUNGER_LEVEL_IDC;
        _currentThirst = _player getVariable PLAYER_THIRST_LEVEL_IDC;
        _currentTemp = _player getVariable PLAYER_TEMP_LEVEL_IDC;
        _currentToxicity = _player getVariable PLAYER_TOXICITY_LEVEL_IDC;
        _currentImmunity = _player getVariable PLAYER_IMMUNITY_LEVEL_IDC;

        _itemHunger = _stats select 0;
        _itemThirst = _stats select 1;
        _itemToxicity = _stats select 2;
        _itemImmunity = _stats select 3;
        _itemBlood = _stats select 4;
        _itemTemperature = _stats select 5;
        _itemToCreate = _stats select 6;

        systemChat format ["About to Create: %1", _itemToCreate];
        if (_itemToCreate != "") then {

            systemChat format["Creating: %1", _itemToCreate];
            _itemToCreate createVehicle (getPos _player);

        };

        _player setVariable [PLAYER_HUNGER_LEVEL_IDC, _currentHunger + _itemHunger ];
        _player setVariable [PLAYER_THIRST_LEVEL_IDC, _currentThirst + _itemThirst];
        _player setVariable [PLAYER_TEMP_LEVEL_IDC, _currentTemp + _itemTemp];
        _player setVariable [PLAYER_TOXICITY_LEVEL_IDC, _currentToxicity + _itemToxicity];
        _player setVariable [PLAYER_IMMUNITY_LEVEL_IDC, _currentImmunity + _itemImmunity];
    };
    
};