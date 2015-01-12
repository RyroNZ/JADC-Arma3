disableSerialization;


fn_createCraftMenu = {
	_craftableItems = [] call fn_getCraftableItems;
	systemChat str _craftableItems;
	_handle = createDialog "craftMenu";
	waitUntil {dialog};
	_idc = uiNamespace getVariable "craftMenu";
	_cfgMagazines = configFile >> "CfgMagazines";

	_comboBox = _idc displayCtrl 7001;

	{
		systemChat format["Getting %1 displayName", _x];
		_itemName = ((configFile >> "CfgMagazines">> _x >> "displayName") call BIS_fnc_getCfgData);
		_index = _comboBox lbAdd (_itemName);
		_comboBox lbSetData [_index, _x];

	} forEach _craftableItems;

	_idc displaySetEventHandler ["Unload", "_this call fn_craftSelectedItem"];
	_comboBox ctrlSetEventHandler ["LBSelChanged", "_this call fn_drawRequiredMaterials"];

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

fn_craftSelectedItem = {
	
};

fn_drawRequiredMaterials = {

	private ["_count"];
	_displayIDC = uiNamespace getVariable "craftMenu";
	_idc = ctrlIDC(_this select 0);
	_selectedIndex = _this select 1;
	_cfgMagazines = configFile >> "CfgMagazines";
	
	_cfgName = lbData [_idc, _selectedIndex];

	_requiredMaterials = ((_cfgMagazines >> _cfgName >> "required_items") call BIS_fnc_getCfgData);
	systemChat format["Item: %1, Required Materials: %2", _cfgName, _requiredMaterials];
	_count = 1;
	{
		_reqItemCfgName = _x select 0;
		_reqItemCount = _x select 1;

		_reqPic = ((_cfgMagazines >> _reqItemCfgName >> "picture") call BIS_fnc_getCfgData);
		_reqTooltip = ((_cfgMagazines >> _reqItemCfgName >> "displayName") call BIS_fnc_getCfgData);

		switch (_count) do
		{


			case 1:
			{
				_itemPicFrame_1 = _displayIDC displayCtrl 7002;
				_itemCountFrame_1 = _displayIDC displayCtrl 7003;

				_itemPicFrame_1 ctrlSetText _reqPic;
				_itemPicFrame_1 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_1 ctrlSetText (str _reqItemCount);


				_itemPicFrame_1 ctrlCommit 0;
				_itemCountFrame_1 ctrlCommit 0;

			};

			case 2:
			{
				_itemPicFrame_2 = _displayIDC displayCtrl 7004;
				_itemCountFrame_2 = _displayIDC displayCtrl 7005;

				_itemPicFrame_2 ctrlSetText _reqPic;
				_itemPicFrame_2 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_2 ctrlSetText (str _reqItemCount);


				_itemPicFrame_2 ctrlCommit 0;
				_itemCountFrame_2 ctrlCommit 0;

			};
			case 3:
			{
				_itemPicFrame_3 = _displayIDC displayCtrl 7006;
				_itemCountFrame_3 = _displayIDC displayCtrl 7007;

				_itemPicFrame_3 ctrlSetText _reqPic;
				_itemPicFrame_3 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_3 ctrlSetText (str _reqItemCount);


				_itemPicFrame_3 ctrlCommit 0;
				_itemCountFrame_3 ctrlCommit 0;
			};
			case 4:
			{
				_itemPicFrame_4 = _displayIDC displayCtrl 7008;
				_itemCountFrame_4 = _displayIDC displayCtrl 7009;

				_itemPicFrame_4 ctrlSetText _reqPic;
				_itemPicFrame_4 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_4 ctrlSetText (str _reqItemCount);


				_itemPicFrame_4 ctrlCommit 0;
				_itemCountFrame_4 ctrlCommit 0;
			};
			case 5:
			{
				_itemPicFrame_5 = _displayIDC displayCtrl 7010;
				_itemCountFrame_5 = _displayIDC displayCtrl 7011;

				_itemPicFrame_5 ctrlSetText _reqPic;
				_itemPicFrame_5 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_5 ctrlSetText (str _reqItemCount);


				_itemPicFrame_5 ctrlCommit 0;
				_itemCountFrame_5 ctrlCommit 0;
			};
			case 6:
			{
				_itemPicFrame_6 = _displayIDC displayCtrl 7012;
				_itemCountFrame_6 = _displayIDC displayCtrl 7013;

				_itemPicFrame_6 ctrlSetText _reqPic;
				_itemPicFrame_6 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_6 ctrlSetText (str _reqItemCount);


				_itemPicFrame_6 ctrlCommit 0;
				_itemCountFrame_6 ctrlCommit 0;
			};
			case 7:
			{
				_itemPicFrame_7 = _displayIDC displayCtrl 7014;
				_itemCountFrame_7 = _displayIDC displayCtrl 7015;

				_itemPicFrame_7 ctrlSetText _reqPic;
				_itemPicFrame_7 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_7 ctrlSetText (str _reqItemCount);


				_itemPicFrame_7 ctrlCommit 0;
				_itemCountFrame_7 ctrlCommit 0;
			};
			

		};
		_count = _count + 1;
	} forEach _requiredMaterials;
};

[] call fn_createCraftMenu;

