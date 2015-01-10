
_ui = _this select 0;
_playerBlood = _this select 1;

if (isPlayerInitialized) then {

	if (_playerBlood <= GUI_BLOOD_STEP_6) then {_ui ctrlSetText GUI_BLOOD_ICON_6; _ui ctrlSetTextColor GUI_BLOOD_COLOR_6; };
	if (_playerBlood <= GUI_BLOOD_STEP_5 && _playerBlood > GUI_BLOOD_STEP_6) then {_ui ctrlSetText GUI_BLOOD_ICON_5; _ui ctrlSetTextColor GUI_BLOOD_COLOR_5; };
	if (_playerBlood <= GUI_BLOOD_STEP_4 && _playerBlood > GUI_BLOOD_STEP_5) then {_ui ctrlSetText GUI_BLOOD_ICON_4; _ui ctrlSetTextColor GUI_BLOOD_COLOR_4; };
	if (_playerBlood <= GUI_BLOOD_STEP_3 && _playerBlood > GUI_BLOOD_STEP_4) then {_ui ctrlSetText GUI_BLOOD_ICON_3; _ui ctrlSetTextColor GUI_BLOOD_COLOR_3; };
	if (_playerBlood <= GUI_BLOOD_STEP_2 && _playerBlood > GUI_BLOOD_STEP_3) then {_ui ctrlSetText GUI_BLOOD_ICON_2; _ui ctrlSetTextColor GUI_BLOOD_COLOR_2; };
	if (_playerBlood <= GUI_BLOOD_STEP_1 && _playerBlood > GUI_BLOOD_STEP_2) then {_ui ctrlSetText GUI_BLOOD_ICON_1; _ui ctrlSetTextColor GUI_BLOOD_COLOR_1; };
	if (_playerBlood > GUI_BLOOD_STEP_1) then {_ui ctrlSetTextColor GUI_COLOR_EMPTY; };

};