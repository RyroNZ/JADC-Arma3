
_ui = _this select 0;
_playerTemp = _this select 1;

if (isPlayerInitialized) then {

	if (_playerTemp >= GUI_TEMP_STEP_4) then {_ui ctrlSetText GUI_TEMP_ICON_4; _ui ctrlSetTextColor GUI_TEMP_COLOR_4; };
	if (_playerTemp >= GUI_TEMP_STEP_3 && _playerTemp < GUI_TEMP_STEP_4) then {_ui ctrlSetText GUI_TEMP_ICON_3; _ui ctrlSetTextColor GUI_TEMP_COLOR_3; };
	if (_playerTemp >= GUI_TEMP_STEP_2 && _playerTemp < GUI_TEMP_STEP_3) then {_ui ctrlSetText GUI_TEMP_ICON_2; _ui ctrlSetTextColor GUI_TEMP_COLOR_2; };
	if (_playerTemp >= GUI_TEMP_STEP_1 && _playerTemp < GUI_TEMP_STEP_2) then {_ui ctrlSetText GUI_TEMP_ICON_1; _ui ctrlSetTextColor GUI_TEMP_COLOR_1; };
	if (_playerTemp < GUI_TEMP_STEP_1) then {_ui ctrlSetTextColor GUI_COLOR_EMPTY; };

};
