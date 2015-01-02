/*

Author: Ryan Post
Date: 10:10 pm 2/01/2015
Description: Run any scripts required after new/existing player has been setup

*/

_clientID = _this select 0;
_player = _this select 1;


readyUnits set [count readyUnits, _player];

[_player] execVM "server\player\statusMonitor.sqf";

PV_playerLoaded = true;
_clientID publicVariableClient "PV_playerLoaded";