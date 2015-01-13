

fn_createMainDialog = {
	createDialog "mainDialog";
	waitUntil{dialog};
	_idc = uiNamespace getVariable "mainDialog";
	_idc displaySetEventHandler ["Unload", "_this call fn_menuSelected"];

};

fn_menuSelected = {

	_idc = _this select 0;
	_exitCode = _this select 1;
	systemChat str _exitCode;

	if (_exitCode == 1) then 
	{
		[] execVM "player\core\dialogs\craftingMenu.sqf";
	};
	
};

sleep 0.05;
findDisplay 46 displayAddEventHandler ["KeyDown", {if ((_this select 1) == 21) then {_this call fn_createMainDialog}}];