disableSerialization;
_thirstColor_4 = [0.08,0.61,0.94,1];

_thirstIcon_4 = "gui\status\thirst\status_thirst_inside_4_ca.paa";
_thirstIcon_3 = "gui\status\thirst\status_thirst_inside_3_ca.paa";
_thirstIcon_2 = "gui\status\thirst\status_thirst_inside_2_ca.paa";
_thirstIcon_1 = "gui\status\thirst\status_thirst_inside_1_ca.paa";
_thirstIcon_0 = "gui\status\thirst\status_thirst_inside_0_ca.paa";

_hungerColor_4 = [0,0.57,0.06,1];

_hungerIcon_4 = "gui\status\hunger\status_food_inside_4_ca.paa";
_hungerIcon_3 = "gui\status\hunger\status_food_inside_3_ca.paa";
_hungerIcon_2 = "gui\status\hunger\status_food_inside_2_ca.paa";
_hungerIcon_1 = "gui\status\hunger\status_food_inside_1_ca.paa";
_hungerIcon_0 = "gui\status\hunger\status_food_inside_0_ca.paa";

_tempColor_4 = [0.79,0.07,0,1];
_tempColor_3 = [0.99,0.45,0.01,1];
_tempColor_2 = [0.99,0.58,0.23,1];
_tempColor_1 = [0.04,0.74,0.93,1];
_tempColor_0 = [0,0.27,0.53,1];

_tempIcon_4 = "gui\status\temp\status_temp_4_ca.paa";
_tempIcon_3 = "gui\status\temp\status_temp_3_ca.paa";
_tempIcon_2 = "gui\status\temp\status_temp_2_ca.paa";
_tempIcon_1 = "gui\status\temp\status_temp_1_ca.paa";
_tempIcon_0 = "gui\status\temp\status_temp_0_ca.paa";

_bloodColor_4 = [0.54,0.03,0.16,1];

_bloodIcon_6 = "gui\status\blood\status_blood_inside_6_ca.paa";
_bloodIcon_5 = "gui\status\blood\status_blood_inside_5_ca.paa";
_bloodIcon_4 = "gui\status\blood\status_blood_inside_4_ca.paa";
_bloodIcon_3 = "gui\status\blood\status_blood_inside_3_ca.paa";
_bloodIcon_2 = "gui\status\blood\status_blood_inside_2_ca.paa";
_bloodIcon_1 = "gui\status\blood\status_blood_inside_1_ca.paa";
_bloodBorder_1 = "gui\status\blood\status_blood_border_CA.paa";
_bloodBorder_2 = "gui\status\blood\status_blood_border_sick_ca.paa";
_bloodBorder_color_1 = [0,0.38,0.5,1];
_bloodBorder_color_2 = [0,0.27,0,1];

cutRsc["playerHUD", "PLAIN"];

while {true} do {

	diag_log "Updating HUD";


	_ui = uiNameSpace getVariable "playerHUD";
	_thirstInside = _ui displayCtrl 5000;
	_foodInside = _ui displayCtrl 5001;
	_tempInside = _ui displayCtrl 5002;
	_bloodInside = _ui displayCtrl 5003;
	_bloodBorder = _ui displayCtrl 5004;


	_playerHunger = player getVariable "hungerLevel";
	_playerThirst = player getVariable "thirstLevel";
	_playerTemp = player getVariable "temperatureLevel";
	_playerToxicity = player getVariable "toxicityLevel";
	_playerBlood = damage player;

	if (!isNil "_playerHunger" && !isNil "_foodInside") then {

		if (_playerHunger > 4000 ) then {_foodInside ctrlSetText _hungerIcon_4; _foodInside ctrlSetTextColor _hungerColor_4; _foodInside ctrlCommit 0;};
		if (_playerHunger > 2750 && _playerHunger < 4000 ) then {_foodInside ctrlSetText _hungerIcon_3; _foodInside ctrlSetTextColor _hungerColor_4; _foodInside ctrlCommit 0;};
		if (_playerHunger > 1750 && _playerHunger < 2750 ) then {_foodInside ctrlSetText _hungerIcon_2; _foodInside ctrlSetTextColor _hungerColor_4; _foodInside ctrlCommit 0;};
		if (_playerHunger > 500 && _playerHunger < 1750 ) then {_foodInside ctrlSetText _hungerIcon_1; _foodInside ctrlSetTextColor _hungerColor_4; _foodInside ctrlCommit 0;};
		if (_playerHunger < 500 ) then {_foodInside ctrlSetText _hungerIcon_0; _foodInside ctrlSetTextColor _hungerColor_4; _foodInside ctrlCommit 0; hint "food <<<< 4000";};

	};

	if (!isNil "_playerThirst" && !isNil "_thirstInside") then {

		if (_playerThirst > 1750) then {_thirstInside ctrlSetText _thirstIcon_4; _thirstInside ctrlSetTextColor _thirstColor_4; _thirstInside ctrlCommit 0;};
		if (_playerThirst > 1350 && _playerThirst < 1750) then {_thirstInside ctrlSetText _thirstIcon_3; _thirstInside ctrlSetTextColor _thirstColor_4; _thirstInside ctrlCommit 0;};
		if (_playerThirst > 900 && _playerThirst < 1350) then {_thirstInside ctrlSetText _thirstIcon_2; _thirstInside ctrlSetTextColor _thirstColor_4; _thirstInside ctrlCommit 0;};
		if (_playerThirst > 275 && _playerThirst < 900) then {_thirstInside ctrlSetText _thirstIcon_1; _thirstInside ctrlSetTextColor _thirstColor_4; _thirstInside ctrlCommit 0;};
		if (_playerThirst < 275) then {_thirstInside ctrlSetText _thirstIcon_0; _thirstInside ctrlSetTextColor _thirstColor_4; _thirstInside ctrlCommit 0;};

	};

	if (!isNil "_playerTemp" && !isNil "_tempInside") then {

		if (_playerTemp > 41) then {_tempInside ctrlSetText _tempIcon_4; _tempInside ctrlSetTextColor _tempColor_4; _tempInside ctrlCommit 0;};
		if (_playerTemp > 38 && _playerTemp < 41) then {_tempInside ctrlSetText _tempIcon_3; _tempInside ctrlSetTextColor _tempColor_3; _tempInside ctrlCommit 0;};
		if (_playerTemp > 36 && _playerTemp < 38) then {_tempInside ctrlSetText _tempIcon_2; _tempInside ctrlSetTextColor _tempColor_2; _tempInside ctrlCommit 0;};
		if (_playerTemp > 30 && _playerTemp < 36) then {_tempInside ctrlSetText _tempIcon_1; _tempInside ctrlSetTextColor _tempColor_1; _tempInside ctrlCommit 0;};
		if (_playerTemp < 30) then {_tempInside ctrlSetText _tempIcon_0; _tempInside ctrlSetTextColor _tempColor_0; _tempInside ctrlCommit 0;};

	};

	if (!isNil "_playerToxicity") then {

		if (_playerToxicity > 1) then {_bloodBorder ctrlSetText _bloodBorder_2; _bloodBorder ctrlSetTextColor _bloodBorder_color_2; _bloodBorder ctrlCommit 0;};
		if (_playerToxicity < 1) then {_bloodBorder ctrlSetText _bloodBorder_1; _bloodBorder ctrlSetTextColor _bloodBorder_color_1; _bloodBorder  ctrlCommit 0;}; 


	};

	if (!isNil "_playerBlood") then {

		if (_playerBlood < 0.1) then {_bloodInside ctrlSetText _bloodIcon_6; _bloodInside ctrlSetTextColor _bloodColor_4; _bloodInside ctrlCommit 0;};
		if (_playerBlood < 0.25 && _playerBlood > 0.1) then {_bloodInside ctrlSetText _bloodIcon_5; _bloodInside ctrlSetTextColor _bloodColor_4; _bloodInside ctrlCommit 0;};
		if (_playerBlood < 0.5 && _playerBlood > 0.25) then {_bloodInside ctrlSetText _bloodIcon_4; _bloodInside ctrlSetTextColor _bloodColor_4; _bloodInside ctrlCommit 0;};
		if (_playerBlood < 0.75 && _playerBlood > 0.5) then {_bloodInside ctrlSetText _bloodIcon_3; _bloodInside ctrlSetTextColor _bloodColor_4; _bloodInside ctrlCommit 0;};
		if (_playerBlood < 0.9 && _playerBlood > 0.75) then {_bloodInside ctrlSetText _bloodIcon_2; _bloodInside ctrlSetTextColor _bloodColor_4; _bloodInside ctrlCommit 0;};
		if (_playerBlood < 1 && _playerBlood > 0.9) then {_bloodInside ctrlSetText _bloodIcon_1; _bloodInside ctrlSetTextColor _bloodColor_4; _bloodInside ctrlCommit 0;};


	};


	sleep 10;
};
