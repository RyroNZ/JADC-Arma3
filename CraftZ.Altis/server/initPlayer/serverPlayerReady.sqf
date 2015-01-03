/*

Author: Ryan Post
Date: 10:10 pm 2/01/2015
Description: Run any scripts required after new/existing player has been setup

*/

_clientID = _this select 0;
_player = _this select 1;
_profile = _this select 2;

diag_log format["[server\initServer\serverDataReady.sqf]: Player (%1) is now ready. ProfileID: %2", name _player, _profile];
readyUnits set [count readyUnits, _player];

[_player] execVM "server\player\statusMonitor.sqf";
publicvariable "PV_currentWeather";

PV_playerLoaded = true;


_clientID publicVariableClient "PV_playerLoaded";
_clientID publicVariableClient "PV_currentWeather";

