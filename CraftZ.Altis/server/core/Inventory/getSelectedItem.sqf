handle = [] spawn {
    fnc_test = { 
        _idc = ctrlIDC (_this select 0);
        _selectedIndex = _this select 1;
        currentData = format ["Data\n%1\n________\n",lbData [_idc, _selectedIndex]];
        _text = format ["Text\n%1\n________\n",lbText [_idc, _selectedIndex]];
        _value = format ["Value\n%1\n________\n",lbValue [_idc, _selectedIndex]];
        _pic = format ["Picture\n%1\n________\n",lbPicture [_idc, _selectedIndex]]; 
        hint format["Selected Uniform Index: %1\n%2%3%4%5",_selectedIndex,_data,_text,_value,_pic];
        _idc ctrlAddEventHandler["onMouseButtonDblClick", (hint format["Clicked on %1", currentData])];
        false
    };
    while {true} do {
        waituntil {!(isnull (finddisplay 602))};
        hint "Inventory has been opened\nAdding event to uniform listbox";
        ((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBSelChanged", "_this call fnc_test"];
        waituntil {isnull (finddisplay 602)};
    };
}; 