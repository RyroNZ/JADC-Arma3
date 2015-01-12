
"PV_itemUsed" addPublicVariableEventHandler {
    _stats_update = _this select 1;  

    _player = _stats_update select 0;
    _stats = _stats_update select 1;
    _itemToRemove = _stats_update select 2;

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
    _itemTemp = _stats select 5;
    _itemToCreate = _stats select 6;

    
    if (_itemToCreate != "") then {
        _createPos = [(eyePos _player select 0) + ((eyeDirection _player select 0) * 2), (eyePos _player select 1) + ((eyeDirection _player select 1)*2),  0];
        _item = createVehicle [_itemToCreate, _createPos, [], 0, "CAN_COLLIDE"];
        _item setDir (getDir _player);
        _item setPos (getPos _item);


    };

    _player setVariable [PLAYER_HUNGER_LEVEL_IDC, _currentHunger + _itemHunger, true ];
    _player setVariable [PLAYER_THIRST_LEVEL_IDC, _currentThirst + _itemThirst, true];
    _player setVariable [PLAYER_TEMP_LEVEL_IDC, _currentTemp + _itemTemp, true ];
    _player setVariable [PLAYER_TOXICITY_LEVEL_IDC, _currentToxicity + _itemToxicity, true ];
    _player setVariable [PLAYER_IMMUNITY_LEVEL_IDC, _currentImmunity + _itemImmunity, true ];

    _player removeItem _itemToRemove;
};