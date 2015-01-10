private ["_playerStats_array", "_bloodBorder_array", "_bloodBorderColor_array" , "_playerThirst", "_playerTemp", "_playerToxicity", "_playerBlood", "_bloodBorder", "_bloodBorder_3_sick_down", "_bloodBorder_2_sick_down", "_bloodBorder_1_sick_down", "_bloodBorder_color_sick", "_bloodBorder_color_ok"];


_ui = _this select 0;
_playerStats_array = _this select 1;

_playerHunger = _playerStats_array select 0;
_playerThirst = _playerStats_array select 1;
_playerTemp = _playerStats_array select 2;
_playerToxicity = _playerStats_array select 3;
_playerBlood = _playerStats_array select 4;

diag_log "start";

if (isPlayerInitialized) then {

		if (_playerTemp <= PLAYER_TEMP_FREEZE || _playerTemp >= PLAYER_TEMP_OVERHEAT) then {
			diag_log "1";
			if (_playerHunger <= PLAYER_HUNGER_STARVATION || _playerThirst <= PLAYER_THIRST_STARVATION) then {
				diag_log "2";
				if (_playerToxicity > PLAYER_TOXICITY_SICK) then {
					diag_log "3";
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_3_SICK; _ui ctrlSetTextColor GUI_BLOOD_BORDER_SICK_COLOR;
				} else {
				diag_log "4";
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_2; _ui ctrlSetTextColor GUI_BLOOD_BORDER_HEALTHY_COLOR;
					//draw two bars down
				};
			} else {
			diag_log "5";
				if (_playerToxicity > PLAYER_TOXICITY_SICK) then {
					diag_log "6";
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_2_SICK; _ui ctrlSetTextColor GUI_BLOOD_BORDER_SICK_COLOR;
				} else {
				diag_log "7";
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_1; _ui ctrlSetTextColor GUI_BLOOD_BORDER_HEALTHY_COLOR;
				};
				
			};

		} else {
			if (_playerHunger <= PLAYER_HUNGER_STARVATION || _playerThirst <= PLAYER_THIRST_STARVATION) then {
				diag_log "8";
				if (_playerToxicity > PLAYER_TOXICITY_SICK) then {
					diag_log "9";
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_2_SICK; _ui ctrlSetTextColor GUI_BLOOD_BORDER_SICK_COLOR;
				} else {
				diag_log "10";
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_1; _ui ctrlSetTextColor GUI_BLOOD_BORDER_HEALTHY_COLOR;
				};
			};
		};
	
		if (_playerTemp > PLAYER_TEMP_FREEZE && _playerTemp < PLAYER_TEMP_OVERHEAT && _playerHunger > PLAYER_HUNGER_STARVATION && _playerThirst > PLAYER_THIRST_STARVATION) then {
			diag_log "11";
				if (_playerToxicity > PLAYER_TOXICITY_SICK) then {
					diag_log "12";
					_ui ctrlSetText GUI_BLOOD_BORDER_DOWN_1_SICK; _ui ctrlSetTextColor GUI_BLOOD_BORDER_SICK_COLOR;
				} else {
				diag_log "13";
					_ui ctrlSetText GUI_BLOOD_BORDER; _ui ctrlSetTextColor GUI_BLOOD_BORDER_HEALTHY_COLOR;
				};

			if (_playerHunger > PLAYER_HUNGER_REQUIRED_HEAL || _playerThirst > PLAYER_THIRST_REQUIRED_HEAL) then {
				diag_log "14";
				if (_playerToxicity > PLAYER_TOXICITY_SICK) then {
					diag_log "15";
					_ui ctrlSetText GUI_BLOOD_BORDER_SICK; _ui ctrlSetTextColor GUI_BLOOD_BORDER_SICK_COLOR;
				} else {
				diag_log "16";
					_ui ctrlSetText GUI_BLOOD_BORDER_UP_1; _ui ctrlSetTextColor GUI_BLOOD_BORDER_HEALTHY_COLOR;
				};
			};

			if (_playerHunger > PLAYER_HUNGER_REQUIRED_HEAL && _playerThirst > PLAYER_THIRST_REQUIRED_HEAL) then {
				diag_log "17";
				if (_playerToxicity > PLAYER_TOXICITY_SICK) then {
					diag_log "18";
					_ui ctrlSetText GUI_BLOOD_BORDER_UP_1_SICK; _ui ctrlSetTextColor GUI_BLOOD_BORDER_SICK_COLOR;
				} else {
				diag_log "19";
					_ui ctrlSetText GUI_BLOOD_BORDER_UP_2; _ui ctrlSetTextColor GUI_BLOOD_BORDER_HEALTHY_COLOR;
				};
			};

		};
};

diag_log "20";
diag_log "end";
_ui ctrlCommit 0;
