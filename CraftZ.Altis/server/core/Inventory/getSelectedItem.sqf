handle = [] spawn {
    fnc_test = { 
        _idc = ctrlIDC (_this select 0);
        _selectedIndex = _this select 1;
        _Data = lbData [_idc, _selectedIndex];
        _text = lbText [_idc, _selectedIndex];
        _value = lbValue [_idc, _selectedIndex];
        _pic = lbPicture [_idc, _selectedIndex]; 
        hint format["Selected Uniform Index: %1\n%2%3%4%5",_selectedIndex,_data,_text,_value,_pic];
        
        [_data, _text, _value, _pic] call fn_createCscMenu;

        false
    };
    while {true} do {
        waituntil {!(isnull (finddisplay 602))};
        hint "Inventory has been opened\nAdding event to uniform listbox";
        ((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "_this call fnc_test"];
        waituntil {isnull (finddisplay 602)};
    };
}; 

fn_createCscMenu = {


    _slItemData = _this select 0;
    _slItemDesc = _this select 1;
    _slItemValue = _this select 2;
    _slItemPicture = _this select 3;


    if (_slItemData in UI_USEABLE_ITEMS) then {
        createDialog "InvMenu";
        _idc = uiNamespace getVariable "InvMenu";



        _slPicFrame = _idc displayCtrl 6001;
        _slDescFrame = _idc displayCtrl 6002;

        _slPicFrame ctrlSetText _slItemPicture;
        _slDescFrame ctrlSetText _slItemDesc;

        _slPicFrame ctrlCommit 0;
        _slDescFrame ctrlCommit 0;
    } else { hint format["%1 is not a useable item", str _slItemData]};
};