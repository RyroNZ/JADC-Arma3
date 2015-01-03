/*

Author: Ryan Post
Date: 7:42 pm 3/01/2015
Description: Sets server ready for saving/additonal scripts after loading data/new data
*/

[] execVM "server\core\dynamicWeather\serverDynamicWeather.sqf";
[] execVM "server\core\dynamicWeather\serverDynamicTemperatures.sqf";

diag_log format["[server\initServer\serverDataReady.sqf]: Server is now ready."];
serverReady = true;
