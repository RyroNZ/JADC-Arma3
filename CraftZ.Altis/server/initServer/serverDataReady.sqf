/*

Author: Ryan Post
Date: 7:42 pm 3/01/2015
Description: Sets server ready for saving/additonal scripts after loading data/new data
*/

[] execVM "server\core\serverDynamicWeather.sqf";

diag_log format["Current Date: %1", str date];
diag_log str PV_currentWeather;
serverReady = true;
