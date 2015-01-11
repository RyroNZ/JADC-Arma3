disableSerialization;


fn_createCraftMenu = {

	_handle = createDialog "craftMenu";
	waitUntil {dialog};
	_idc = uiNamespace getVariable "craftMenu";

	_comboBox = _idc displayCtrl 7001;

	{
		_comboBox lbAdd (_x select 0);

	} forEach CRAFTMENU_CRAFTING_RECIPES;

};

[] call fn_createCraftMenu;
