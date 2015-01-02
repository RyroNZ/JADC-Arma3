_clientID = _this select 0;
_player = _this select 1;

	//PV_playerData = [];

	_player groupChat format["Removing existing items from ", name _player];

	removeBackpack _player;
	removeVest _player;
	removeUniform _player;
	removeHeadgear _player;
	removeGoggles _player;
	removeAllWeapons _player;
	removeAllItems _player;

	_player setPos playerPos;
	localize format["Moving %1 to playerPos: %2", name _player, str playerPos];
	/*
	_player setDamage playerHealth;
	_player setOxygenRemaining playerOxygen;
		
	_player addBackpack playerBackpack;
	{_player addItemToBackpack _x;} forEach playerBackpackGear;

	_player addVest playerVest;
	{_player addItemToVest _x;} forEach playerVestGear;

	_player addUniform playerUniform;
	{_player addItemToUniform _x;} forEach playerUniformGear;

	{_player linkItem _x;} forEach playerGadgets;
	_player addHeadgear playerHeadgear;
	_player addGoggles playerGoggles;

	{ _player addWeapon _x;} forEach playerWep;
	removeAllPrimaryWeaponItems _player;
	removeAllHandgunItems _player;

	{ _player addPrimaryWeaponItem _x;} forEach playerPrimWepAttach;
	{ _player addSecondaryWeaponItem _x;} forEach playerSecWepAttach;
	

	localize format["Loaded data to player %1", name _player];

//_clientID publicVariableClient "PV_playerData"; 
*/