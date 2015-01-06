private ["_playerStats_array", "_bloodBorder_array", "_bloodBorderColor_array" , "_playerThirst", "_playerTemp", "_playerToxicity", "_playerBlood", "_bloodBorder", "_bloodBorder_3_sick_down", "_bloodBorder_2_sick_down", "_bloodBorder_1_sick_down", "_bloodBorder_color_sick", "_bloodBorder_color_ok"];


_ui = _this select 0;
_playerStats_array = _this select 1;

_playerHunger = _playerStats_array select 0;
_playerThirst = _playerStats_array select 1;
_playerTemp = _playerStats_array select 2;
_playerToxicity = _playerStats_array select 3;
_playerBlood = _playerStats_array select 4;



if (isPlayerInitialized) then {
		if (_playerTemp <= PLAYER_TEMP_FREEZE || _playerTemp >= PLAYER_TEMP_OVERHEAT) then {
			if (_playerHunger <= PLAYER_HUNGER_STARVATION || _playerThirst < PLAYER_THIRST_STARVATION) then {
				if (_playerToxicity > PLAYER_TOXICITY_SICK) then {
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_3_SICK; _ui ctrlSetTextColor GUI_BLOOD_BORDER_SICK_COLOR;
				} else {
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_2; _ui ctrlSetTextColor GUI_BLOOD_BORDER_HEALTHY_COLOR;
					//draw two bars down
			} else {
				if (_playerToxicity > PLAYER_TOXCITY_SICK) then {
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_2_SICK; _ui ctrlSetTextColor GUI_BLOOD_BORDER_SICK_COLOR;
				} else {
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_1; _ui ctrlSetTextColor GUI_BLOOD_BORDER_HEALTHY_COLOR;
				};
				
			};

		} else {
			if (_playerHunger <= PLAYER_HUNGER_STARVATION || _playerThirst <= PLAYER_THIRST_STARVATION) then {

				if (_playerToxicity > PLAYER_TOXICITY_SICK) then {
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_2_SICK; _ui ctrlSetTextColor GUI_BLOOD_BORDER_SICK_COLOR;
				} else {
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_1; _ui ctrlSetTextColor GUI_BLOOD_BORDER_HEALTHY_COLOR;
				};
			};
		};
		if (_playerTemp > PLAYER_TEMP_FREEZE && _playerTemp < PLAYER_TEMP_OVERHEAT && _playerHunger > PLAYER_HUNGER_STARVATION && _playerThirst > PLAYER_THIRST_STARVATION) then {
				if (_playerToxicity > PLAYER_TOXICITY_SICK) then {
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_1_SICK; _ui ctrlSetTextColor GUI_BLOOD_BORDER_SICK_COLOR;
				} else {
					_ui ctrlSetText GUI_BLOOD_BORDER; _ui ctrlSetTextColor GUI_BLOOD_BORDER_HEALTHY_COLOR;
				};

			if (_playerHunger > PLAYER_HUNGER_REQUIRED_HEAL || _playerThirst > PLAYER_THIRST_REQUIRED_HEAL) then {
				if (_playerToxicity > PLAYER_TOXICITY_SICK) then {
					_ui ctrlSetText GUI_BLOOD_BORDER_SICK; _ui ctrlSetTextColor GUI_BLOOD_BORDER_SICK_COLOR;
				} else {
					_ui ctrlSetText GUI_BLOOD_BORDER_UP_1; _ui ctrlSetTextColor GUI_BLOOD_BORDER_HEALTHY_COLOR;
				};
			};
			if (_playerHunger > PLAYER_HUNGER_REQUIRED_HEAL && _playerThirst > PLAYER_THIRST_REQUIRED_HEAL) then {
				if (_playerToxicity > PLAYER_TOXICITY_SICK) then {
					_ui ctrlSetText GUI_BLOOD_BORDER_UP_1_SICK; _ui ctrlSetTextColor GUI_BLOOD_BORDER_SICK_COLOR;
				} else {
					_ui ctrlSetText GUI_BLOOD_BORDER_UP_2; _ui ctrlSetTextColor GUI_BLOOD_BORDER_HEALTHY_COLOR;
				};
			};

			};
	};
};


_ui ctrlCommit 0;
