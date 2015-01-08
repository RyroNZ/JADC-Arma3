
_ui = _this select 0;
_playerThirst = _this select 1;

if (IsPlayerInitialized) then {

	if (_playerThirst >= GUI_THIRST_STEP_5) then {_ui ctrlSetText GUI_THIRST_ICON_5; _ui ctrlSetTextColor GUI_THIRST_COLOR_5; };
	if (_playerThirst >= GUI_THIRST_STEP_4 && _playerThirst < GUI_THIRST_STEP_5) then {_ui ctrlSetText GUI_THIRST_ICON_4; _ui ctrlSetTextColor GUI_THIRST_COLOR_4; };
	if (_playerThirst >= GUI_THIRST_STEP_3 && _playerThirst < GUI_THIRST_STEP_4) then {_ui ctrlSetText GUI_THIRST_ICON_3; _ui ctrlSetTextColor GUI_THIRST_COLOR_3; };
	if (_playerThirst >= GUI_THIRST_STEP_2 && _playerThirst < GUI_THIRST_STEP_3) then {_ui ctrlSetText GUI_THIRST_ICON_2; _ui ctrlSetTextColor GUI_THIRST_COLOR_2; };
	if (_playerThirst >= GUI_THIRST_STEP_1 && _playerThirst < GUI_THIRST_STEP_2) then {_ui ctrlSetText GUI_THIRST_ICON_1; _ui ctrlSetTextColor GUI_THIRST_COLOR_1; };
	if (_playerThirst < GUI_THIRST_STEP_1) then {_ui ctrlSetTextColor GUI_COLOR_EMPTY; };


};