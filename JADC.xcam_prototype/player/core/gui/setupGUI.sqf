disableSerialization;
cutRsc["playerHUD", "PLAIN"];

while {true} do {

	diag_log "Updating HUD";


	_ui = uiNameSpace getVariable "playerHUD";
	_thirstInside = _ui displayCtrl 5000;
	_foodInside = _ui displayCtrl 5001;
	_tempInside = _ui displayCtrl 5002;
	_bloodInside = _ui displayCtrl 5003;
	_bloodBorder = _ui displayCtrl 5004;


	_playerHunger = player getVariable PLAYER_HUNGER_LEVEL_IDC;
	_playerThirst = player getVariable PLAYER_THIRST_LEVEL_IDC;
	_playerTemp = player getVariable PLAYER_TEMP_LEVEL_IDC;
	_playerToxicity = player getVariable PLAYER_TOXICITY_LEVEL_IDC;
	_playerBlood = damage player;

	_playerStats_array = [_playerHunger, _playerThirst, _playerTemp, _playerToxicity, _playerBlood];

	[_foodInside, _playerHunger] call fnc_gui_update_hunger_inside;
	[_thirstInside, _playerThirst] call fnc_gui_update_thirst_inside;
	[_tempInside, _playerTemp] call fnc_gui_update_temp_inside;
	[_bloodInside, _playerBlood] call fnc_gui_update_blood_inside;
	[_bloodBorder, _playerStats_array] call fnc_gui_update_blood_border;

	sleep CLIENT_GUI_REFRESH;
};