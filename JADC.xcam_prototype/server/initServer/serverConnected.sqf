/*

Author: Ryan Post
Date: 5:10 pm 3/01/2015
Description: Loads the required scripts etc for the server

*/

_server = SERVER_ID;
_profile = format["%1", _server];


if (_profile call iniDB_exists) then {

		diag_log format["[server\initServer\serverConnected.sqf]: Profile exists for server. ProfileID: %2", _profile];


	} else {
		diag_log format["[server\initServer\serverConnected.sqf]: Setting up new profile for server. ProfileID: %2", _profile];
};
[_server, _profile] call fnc_load_data;