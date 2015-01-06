	_weapon = primaryWeapon player;
	_ammo = player ammo _weapon;
	player forceWeaponFire [_weapon, "single"];