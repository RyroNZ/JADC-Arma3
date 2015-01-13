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

	private ["_idc", "_exitCode", "_cfgName"];

	_idc = _this select 0;
	_exitCode = _this select 1;
	_cfgName = (ctrlText (_idc displayCtrl 7019));

	if (_exitCode == 1) then {	
		PV_itemCrafted = [player, _cfgName];
		publicVariableServer "PV_itemCrafted";
	};
	
};

fn_drawRequiredMaterials = {

	private ["_idc", "_selectedIndex", "_displayIDC", "_cfgMagazines", "_reqItems_array", "_cfgName", "_craftMenu_data", "_requiredMaterials", "_playerItems"];
	private ["_reqItemCfgName", "_reqItemCount", "_playerItemsCount", "_reqPic", "_reqTooltip", "_reqItemCountDisplay"];
	_idc = ctrlIDC(_this select 0);
	_selectedIndex = _this select 1;
	_displayIDC = uiNamespace getVariable "craftMenu";

	_cfgMagazines = configFile >> "CfgMagazines";

	_reqItems_array = [];
	
	_cfgName = lbData [_idc, _selectedIndex];

	_craftMenu_data = _displayIDC displayCtrl 7019;
	_craftMenu_data ctrlSetText (_cfgName);
	_craftMenu_data ctrlCommit 0;

	_requiredMaterials = ((_cfgMagazines >> _cfgName >> "required_items") call BIS_fnc_getCfgData);
	_playerItems = (uniformItems player) + (vestItems player) + (backpackItems player);

	_count = 1;
	{
		_reqItemCfgName = _x select 0;
		_reqItemCount = _x select 1;
		_playerItemsCount = 0;

		{
			if (_x == _reqItemCfgName) then 
			{
				_playerItemsCount = _playerItemsCount + 1;
			};
		} forEach _playerItems;

		

		for "_i" from 0 to (_reqItemCount) do 
		{
			_reqItems_array pushBack (_reqItemCfgName);
		};

		_reqPic = ((_cfgMagazines >> _reqItemCfgName >> "picture") call BIS_fnc_getCfgData);
		_reqTooltip = ((_cfgMagazines >> _reqItemCfgName >> "displayName") call BIS_fnc_getCfgData);
		_reqItemCountDisplay = format['%1/%2', _playerItemsCount, _reqItemCount];

		switch (_count) do
		{

			case 1:
			{
				_itemPicFrame_1 = _displayIDC displayCtrl 7002;
				_itemCountFrame_1 = _displayIDC displayCtrl 7003;
				_itemPicFrame_1 ctrlSetText _reqPic;
				_itemPicFrame_1 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_1 ctrlSetText (_reqItemCountDisplay);
				_itemPicFrame_1 ctrlCommit 0;
				_itemCountFrame_1 ctrlCommit 0;

			};
			case 2:
			{
				_itemPicFrame_2 = _displayIDC displayCtrl 7004;
				_itemCountFrame_2 = _displayIDC displayCtrl 7005;
				_itemPicFrame_2 ctrlSetText _reqPic;
				_itemPicFrame_2 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_2 ctrlSetText (_reqItemCountDisplay);
				_itemPicFrame_2 ctrlCommit 0;
				_itemCountFrame_2 ctrlCommit 0;
			};
			case 3:
			{
				_itemPicFrame_3 = _displayIDC displayCtrl 7006;
				_itemCountFrame_3 = _displayIDC displayCtrl 7007;
				_itemPicFrame_3 ctrlSetText _reqPic;
				_itemPicFrame_3 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_3 ctrlSetText (_reqItemCountDisplay);
				_itemPicFrame_3 ctrlCommit 0;
				_itemCountFrame_3 ctrlCommit 0;
			};
			case 4:
			{
				_itemPicFrame_4 = _displayIDC displayCtrl 7008;
				_itemCountFrame_4 = _displayIDC displayCtrl 7009;
				_itemPicFrame_4 ctrlSetText _reqPic;
				_itemPicFrame_4 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_4 ctrlSetText (_reqItemCountDisplay);
				_itemPicFrame_4 ctrlCommit 0;
				_itemCountFrame_4 ctrlCommit 0;
			};
			case 5:
			{
				_itemPicFrame_5 = _displayIDC displayCtrl 7010;
				_itemCountFrame_5 = _displayIDC displayCtrl 7011;
				_itemPicFrame_5 ctrlSetText _reqPic;
				_itemPicFrame_5 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_5 ctrlSetText (_reqItemCountDisplay);
				_itemPicFrame_5 ctrlCommit 0;
				_itemCountFrame_5 ctrlCommit 0;
			};
			case 6:
			{
				_itemPicFrame_6 = _displayIDC displayCtrl 7012;
				_itemCountFrame_6 = _displayIDC displayCtrl 7013;
				_itemPicFrame_6 ctrlSetText _reqPic;
				_itemPicFrame_6 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_6 ctrlSetText (_reqItemCountDisplay);
				_itemPicFrame_6 ctrlCommit 0;
				_itemCountFrame_6 ctrlCommit 0;
			};
			case 7:
			{
				_itemPicFrame_7 = _displayIDC displayCtrl 7014;
				_itemCountFrame_7 = _displayIDC displayCtrl 7015;
				_itemPicFrame_7 ctrlSetText _reqPic;
				_itemPicFrame_7 ctrlSetTooltip _reqTooltip;
				_itemCountFrame_7 ctrlSetText (_reqItemCountDisplay);
				_itemPicFrame_7 ctrlCommit 0;
				_itemCountFrame_7 ctrlCommit 0;
			};
			

		};
		_count = _count + 1;
	} forEach _requiredMaterials;
};

[] call fn_createCraftMenu;

