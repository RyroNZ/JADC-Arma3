fnc_print_environment = compile preprocessFileLineNumbers "player\core\printEnvironmentToChat.sqf";
fnc_reset_gun = compile preprocessFileLineNumbers "player\initPlayer\resetPrimaryWeapon.sqf";
fnc_get_character = compile preprocessFileLineNumbers "player\initPlayer\getCharacterFromServer.sqf";
fnc_set_keydown_handler = compile preprocessFileLineNumbers "player\eventHandlers\keyDown.sqf";

fnc_gui_update_blood_border = compile preprocessFileLineNumbers "player\core\gui\updateBloodBorderGUI.sqf";
fnc_gui_update_blood_inside = compile preprocessFileLineNumbers "player\core\gui\updateBloodGUI.sqf";
fnc_gui_update_hunger_inside = compile preprocessFileLineNumbers "player\core\gui\updateHungerGUI.sqf";
fnc_gui_update_thirst_inside = compile preprocessFileLineNumbers "player\core\gui\updateThirstGUI.sqf";
fnc_gui_update_temp_inside = compile preprocessFileLineNumbers "player\core\gui\updateTempGUI.sqf";