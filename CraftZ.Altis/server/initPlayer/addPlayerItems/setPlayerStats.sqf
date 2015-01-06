private ["_player", "_playerDataStats_array" , "_playerPos", "_playerHealth", "_playerOxygen", "_playerHungerLevel", "_playerThirstLevel", "_playerMoney", "_playerTemperature", "_playerImmunity", "_playerToxicity"];

_player = _this select 0;
_playerDataStats_array = _this select 1;
_playerPos = _playerDataStats_array select 0;
_playerHealth = _playerDataStats_array  select 1;
_playerOxygen = _playerDataStats_array  select 2;
_playerHungerLevel = _playerDataStats_array  select 3;
_playerThirstLevel = _playerDataStats_array  select 4;
_playerMoney = _playerDataStats_array  select 5;
_playerTemperature = _playerDataStats_array  select 6;
_playerImmunity = _playerDataStats_array  select 7;
_playerToxicity = _playerDataStats_array  select 8;


//Set Player Position
_player setPos playerPos;
//Set Player Health/Oxygen
_player setDamage playerHealth;
_player setOxygenRemaining playerOxygen;

_player SetVariable ["hungerLevel", _playerHungerLevel, true];
_player SetVariable ["thirstLevel", _playerThirstLevel, true];
_player SetVariable ["temperatureLevel", _playerTemperature, true];
_player SetVariable ["immunityLevel", _playerImmunity, true];
_player SetVariable ["toxicityLevel", _playerToxicity, true];
_player SetVariable ["cMoney", _playerMoney, true];

sleep 1;
