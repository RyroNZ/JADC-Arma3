"PV_itemCrafted" addPublicVariableEventHandler {

	private ["_canCreateItem", "_itemCrafted", "_player", "_cfgName", "_reqItemCfgName", "_reqItemCount", "_playerItemsCount"];

	_itemCrafted = _this select 1;

	_player = _itemCrafted select 0;
	_cfgName = _itemCrafted select 1;
	diag_log str _itemCrafted;
	diag_log format["player: %1 item: %2", _player, _cfgName];	

	_requiredMaterials = ((configFile >> "CfgMagazines" >> _cfgName >> "required_items") call BIS_fnc_getCfgData);
	_playerItems = (uniformItems _player) + (vestItems _player) + (backpackItems _player);
	diag_log str _playerItems;
	diag_log str _requiredMaterials;


	
	{	
		_reqItemCfgName = _x select 0;
		_reqItemCount = _x select 1;
		_playerItemsCount = 0;
		{
			if (_x == _reqItemCfgName) then 
			{
				_playerItemsCount = _playerItemsCount + 1;
			};
		} forEach _playerItems;
		if (_playerItemsCount >= _reqItemCount) then 
		{
			_canCreateItem = true;
		} 
		else 
		{
			_canCreateItem = false;
		};

	} forEach _requiredMaterials;


	if (_canCreateItem) then 
	{
		{
			_reqItemCfgName = _x select 0;
			_reqItemCount = _x select 1;
			for "_i" from 0 to (_reqItemCount - 1) do 
			{
				_player removeItem _reqItemCfgName;
				diag_log format["Removing: %1 from %2", _reqItemCfgName, _player];
			};
		} forEach _requiredMaterials;
		diag_log format["Adding: %1 from %2", _cfgName, _player];
		_player addItem _cfgName;
	};
};