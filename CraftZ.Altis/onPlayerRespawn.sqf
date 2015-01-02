/*

Author: Ryan Post
Date: 8:47 pm 2/01/2015
Description: This script is run locally on clients machine when they are respawned
*/

removeBackpack player;  
removeVest player;  
removeUniform player;  
removeHeadgear player;  
removeGoggles player;  
removeAllWeapons player;  
removeAllAssignedItems player;

diag_log format["PlayerHasDied? %1", str playerHasDied];
if (playerHasDied) then {
	playerHasDied = false;
	[] execVM playerPath;
};