

_ui = _this select 0;
_playerHunger = _this select 1;

if (isPlayerInitialized) then {

			if (_playerHunger >= GUI_HUNGER_STEP_5 ) then {_ui ctrlSetText GUI_HUNGER_ICON_5; _ui ctrlSetTextColor GUI_HUNGER_COLOR_5; };
			if (_playerHunger >= GUI_HUNGER_STEP_4 && _playerHunger < GUI_HUNGER_STEP_5) then {_ui ctrlSetText GUI_HUNGER_ICON_4; _ui ctrlSetTextColor GUI_HUNGER_COLOR_4; };
			if (_playerHunger >= GUI_HUNGER_STEP_3 && _playerHunger < GUI_HUNGER_STEP_4 ) then {_ui ctrlSetText GUI_HUNGER_ICON_3; _ui ctrlSetTextColor GUI_HUNGER_COLOR_3; };
			if (_playerHunger >= GUI_HUNGER_STEP_2 && _playerHunger < GUI_HUNGER_STEP_3 ) then {_ui ctrlSetText GUI_HUNGER_ICON_2; _ui ctrlSetTextColor GUI_HUNGER_COLOR_2; };
			if (_playerHunger >= GUI_HUNGER_STEP_1 && _playerHunger < GUI_HUNGER_STEP_2) then {_ui ctrlSetText GUI_HUNGER_ICON_1; _ui ctrlSetTextColor GUI_HUNGER_COLOR_1; };
			if (_playerHunger < GUI_HUNGER_STEP_1) then {_ui ctrlSetTextColor GUI_COLOR_EMPTY; };
};