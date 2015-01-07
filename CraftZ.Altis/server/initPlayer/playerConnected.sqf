/*

Author: Ryan Post
Date: 7:01 pm 2/01/2015
Description: Loads the required scripts for loading/generating new character

*/


"PV_ClientID" addPublicVariableEventHandler {

	_clientID = owner (_this select 1);
	_player = _this select 1;
	_profile = format[PLAYER_ID_PREFIX, getPlayerUID _player];
	[_clientID, _player, _profile] execVM  SERVER_EXEC_PLAYER_GET_DATA;
	
};
		