/*

Author: Ryan Post
Date: 7:42 pm 3/01/2015
Description: required to update the overcast setting in a dedicated server environment
*/



_overCast = _this select 0;
[_overCast] call BIS_fnc_setOvercast;