/*

Author: Ryan Post
Date: 8:47 pm 2/01/2015
Description: This script is run locally on clients machine when they are respawned
*/

removeAllAssignedItems player;
removeVest player;  
removeUniform player;  
removeHeadgear player;  
removeGoggles player;  
removeAllWeapons player; 

diag_log format["[onPlayerRespawn.sqf]: Player: %1 PlayerHasDied? %2", name player, str playerHasDied];
if (playerHasDied) then {
	playerHasDied = false;
 
	[] execVM "init.sqf";
};