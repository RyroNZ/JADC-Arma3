SERVER_ID = "testServer_01";
PLAYER_ID_PREFIX = "PlayerID_%1";
PLAYER_PATH = "player\init.sqf";
SERVER_PATH = "server\init.sqf";

SERVER_STATUS_MONITOR_REFRESH = 10;
SERVER_SAVE_DATA_REFRESH = 30;
SERVER_PLAYER_SAVE_REFRESH = 2.5;
CLIENT_GUI_REFRESH = 2;

PLAYER_SPAWN_POINTS = ["spawnPoint_1","spawnPoint_2","spawnPoint_3","spawnPoint_4","spawnPoint_5","spawnPoint_6","spawnPoint_7","spawnPoint_8","spawnPoint_9","spawnPoint_10","spawnPoint_11","spawnPoint_12","spawnPoint_13","spawnPoint_14","spawnPoint_15", "spawnPoint_16"];

PLAYER_HUNGER_LEVEL_IDC = "hungerLevel";
PLAYER_THIRST_LEVEL_IDC = "thirstLevel";
PLAYER_TEMP_LEVEL_IDC = "tempLevel";
PLAYER_TOXICITY_LEVEL_IDC = "toxicityLevel";
PLAYER_IMMUNITY_LEVEL_IDC = "immunityLevel";


PLAYER_MAX_TOXICITY = 50;
PLAYER_MAX_THIRST = 2000;
PLAYER_MAX_HUNGER = 4500;
PLAYER_MAX_TEMP = 50;
PLAYER_MAX_IMMUNITY = 1000;

PLAYER_START_TOXICITY = 0;
PLAYER_START_THIRST = 1500;
PLAYER_START_HUNGER = 3000;
PLAYER_START_TEMP = 37.5;
PLAYER_START_IMMUNITY = 0;

PLAYER_IDLE_HUNGER_TICK = 0.075 * SERVER_STATUS_MONITOR_REFRESH;
PLAYER_IDLE_THIRST_TICK = 0.1 * SERVER_STATUS_MONITOR_REFRESH;

PLAYER_RUN_HUNGER_TICK = 0.02 * SERVER_STATUS_MONITOR_REFRESH;
PLAYER_RUN_THIRST_TICK = 0.05 * SERVER_STATUS_MONITOR_REFRESH;

PLAYER_DAMAGE_HUNGER = 0.001 * SERVER_STATUS_MONITOR_REFRESH;
PLAYER_DAMAGE_THIRST = 0.002 * SERVER_STATUS_MONITOR_REFRESH;
PLAYER_DAMAGE_FREEZE = 0.002 * SERVER_STATUS_MONITOR_REFRESH;
PLAYER_DAMAGE_OVERHEAT = 0.003 * SERVER_STATUS_MONITOR_REFRESH;

PLAYER_TEMP_WATER_HEAT_LOSS = 0.0138 * SERVER_STATUS_MONITOR_REFRESH;
PLAYER_TEMP_AIR_HEAT_LOSS = 0.0064 * SERVER_STATUS_MONITOR_REFRESH;
PLAYER_TEMP_CAR_HEAT_GAIN = 0.025 * SERVER_STATUS_MONITOR_REFRESH;
PLAYER_TEMP_RUN_HEAT_GAIN = 0.0001 * SERVER_STATUS_MONITOR_REFRESH;

PLAYER_CAN_HEAL_WHILE_SICK = true;
PLAYER_THIRST_REQUIRED_HEAL = 1500;
PLAYER_HUNGER_REQUIRED_HEAL = 4000;
PLAYER_HUNGER_STARVATION = 0;
PLAYER_THIRST_STARVATION = 0;
PLAYER_TOXICITY_SICK = 25;

PLAYER_TEMP_FREEZE = 25;
PLAYER_TEMP_HYPOTHERMIA = 30;
PLAYER_TEMP_OVERHEAT = 41;
PLAYER_TEMP_EQUILLIBRIUM = 37.5;

PLAYER_TEMP_AIR_RESISTANCE_UNIFORM = 0.6; //40% reduction in heat loss in water when wearing uniform
PLAYER_TEMP_AIR_RESISTANCE_VEST = 0.9; //10% reduction in heat loss in air when wearing vest
PLAYER_TEMP_WATER_RESISTANCE_WETSUIT = 0.1; //90% reduction in heat loss in water when wearing wetsuit
PLAYER_TEMP_WATER_RESISTANCE_UNIFORM = 1; //0% reduction in heat loss in water when wearing uniform
PLAYER_TEMP_WATER_RESISTANCE_VEST = 1;//0% reduction in heat loss in water when wearing vest

GUI_COLOR_EMPTY = [0,0,0,0];
GUI_TEMP_COLOR_4 = [0.79,0.07,0,1];
GUI_TEMP_COLOR_3 = [0.99,0.45,0.01,1];
GUI_TEMP_COLOR_2 = [0.99,0.58,0.23,1];
GUI_TEMP_COLOR_1 = [0.04,0.74,0.93,1];

GUI_TEMP_ICON_4 = "gui\status\temp\status_temp_4_ca.paa";
GUI_TEMP_ICON_3 = "gui\status\temp\status_temp_3_ca.paa";
GUI_TEMP_ICON_2 = "gui\status\temp\status_temp_2_ca.paa";
GUI_TEMP_ICON_3 = "gui\status\temp\status_temp_1_ca.paa";
GUI_TEMP_ICON_4 = "gui\status\temp\status_temp_0_ca.paa";

GUI_TEMP_STEP_4 = 41;
GUI_TEMP_STEP_3 = 38;
GUI_TEMP_STEP_2 = 31;
GUI_TEMP_STEP_1 = 26;

GUI_BLOOD_COLOR_6 = [0.54,0.03,0.16,1];
GUI_BLOOD_COLOR_5 = [0.54,0.03,0.16,1];
GUI_BLOOD_COLOR_4 = [0.54,0.03,0.16,1];
GUI_BLOOD_COLOR_3 = [0.54,0.03,0.16,1];
GUI_BLOOD_COLOR_2 = [0.54,0.03,0.16,1];
GUI_BLOOD_COLOR_1 = [0.54,0.03,0.16,1];

GUI_BLOOD_ICON_6 = "gui\status\blood\status_blood_inside_6_ca.paa";
GUI_BLOOD_ICON_5 = "gui\status\blood\status_blood_inside_5_ca.paa";
GUI_BLOOD_ICON_4 = "gui\status\blood\status_blood_inside_4_ca.paa";
GUI_BLOOD_ICON_3 = "gui\status\blood\status_blood_inside_3_ca.paa";
GUI_BLOOD_ICON_2 = "gui\status\blood\status_blood_inside_2_ca.paa";
GUI_BLOOD_ICON_1 = "gui\status\blood\status_blood_inside_1_ca.paa";

GUI_BLOOD_STEP_6 = 0.1;
GUI_BLOOD_STEP_5 = 0.2;
GUI_BLOOD_STEP_4 = 0.35;
GUI_BLOOD_STEP_3 = 0.6;
GUI_BLOOD_STEP_2 = 0.8;
GUI_BLOOD_STEP_1 = 0.9;

GUI_HUNGER_ICON_5 = "gui\status\hunger\status_food_inside_4_ca.paa";
GUI_HUNGER_ICON_4 = "gui\status\hunger\status_food_inside_3_ca.paa";
GUI_HUNGER_ICON_3 = "gui\status\hunger\status_food_inside_2_ca.paa";
GUI_HUNGER_ICON_2 = "gui\status\hunger\status_food_inside_1_ca.paa";
GUI_HUNGER_ICON_1 = "gui\status\hunger\status_food_inside_0_ca.paa";

GUI_HUNGER_COLOR_5 = [0,0.57,0.06,1];
GUI_HUNGER_COLOR_4 = [0,0.57,0.06,1];
GUI_HUNGER_COLOR_3 = [0,0.57,0.06,1];
GUI_HUNGER_COLOR_2 = [0,0.57,0.06,1];
GUI_HUNGER_COLOR_1 = [0,0.57,0.06,1];

GUI_HUNGER_STEP_5 = 4000;
GUI_HUNGER_STEP_4 = 2750;
GUI_HUNGER_STEP_3 = 1750;
GUI_HUNGER_STEP_2 = 500;
GUI_HUNGER_STEP_1 = 40;

GUI_THIRST_COLOR_5 = [0.08,0.61,0.94,1];
GUI_THIRST_COLOR_4 = [0.08,0.61,0.94,1];
GUI_THIRST_COLOR_3 = [0.08,0.61,0.94,1];
GUI_THIRST_COLOR_2 = [0.08,0.61,0.94,1];
GUI_THIRST_COLOR_1 = [0.08,0.61,0.94,1];

GUI_THIRST_ICON_5 = "gui\status\thirst\status_thirst_inside_4_ca.paa";
GUI_THIRST_ICON_4 = "gui\status\thirst\status_thirst_inside_3_ca.paa";
GUI_THIRST_ICON_3 = "gui\status\thirst\status_thirst_inside_2_ca.paa";
GUI_THIRST_ICON_2 = "gui\status\thirst\status_thirst_inside_1_ca.paa";
GUI_THIRST_ICON_1 = "gui\status\thirst\status_thirst_inside_0_ca.paa";

GUI_THIRST_STEP_5 = 1750;
GUI_THIRST_STEP_4 = 1350;
GUI_THIRST_STEP_3 = 900;
GUI_THIRST_STEP_2 = 275;
GUI_THIRST_STEP_1 = 40;

GUI_BLOOD_BORDER_HEALTHY_COLOR = [0,0.38,0.5,1];
GUI_BLOOD_BORDER_SICK_COLOR = [0,0.27,0,1];

GUI_BLOOD_BORRDER = "gui\status\blood\status_blood_border_CA.paa";
GUI_BLOOD_BORDER_DOWN_1 = "gui\status\blood\status_blood_border_down1_ca.paa";
GUI_BLOOD_BORDER_DOWN_2 = "gui\status\blood\status_blood_border_down2_ca.paa";
GUI_BLOOD_BORDER_DOWN_3 = "gui\status\blood\status_blood_border_down3_ca.paa";
GUI_BLOOD_BORDER_UP_1 = "gui\status\blood\status_blood_border_up1_ca.paa";
GUI_BLOOD_BORDER_UP_2 = "gui\status\blood\status_blood_border_up2_ca.paa";
GUI_BLOOD_BORDER_UP_3 = "gui\status\blood\status_blood_border_up3_ca.paa";

GUI_BLOOD_BORDER_SICK = "gui\status\blood\status_blood_border_sick_ca.paa";
GUI_BLOOD_BORDER_DOWN_1_SICK = "gui\status\blood\status_blood_border_down1_sick_ca.paa";
GUI_BLOOD_BORDER_DOWN_2_SICK = "gui\status\blood\status_blood_border_down2_sick_ca.paa";
GUI_BLOOD_BORDER_DOWN_3_SICK = "gui\status\blood\status_blood_border_down3_sick_ca.paa";
GUI_BLOOD_BORDER_UP_1_SICK = "gui\status\blood\status_blood_border_up1_sick_ca.paa";
GUI_BLOOD_BORDER_UP_2_SICK = "gui\status\blood\status_blood_border_up2_sick_ca.paa";
GUI_BLOOD_BORDER_UP_3_SICK = "gui\status\blood\status_blood_border_up3_sick_ca.paa";

WEATHER_DEFAULT_START = "RAIN";
WEATHER_FORECAST_DELAY_MAX = 4000;
WEATHER_SYNC_DELAY = 60;

TEMPERATURE_DEFAULT_AIR_TEMP = 31;
TEMPERATURE_MAX_WATER_TEMP_VARIATION = 15;
TEMPERATURE_OVERCAST_EFFECT_ON_TEMP = 12;
TEMPERATURE_RAIN_EFFECT_ON_TEMP = 20;

SERVER_EXEC_EVENT_PLAYER_DIED = "server\eventHandlers\playerDied.sqf";
SERVER_EVENT_ON_PLAYER_DISCONNECTED = "[_id, _name, _uid] execVM ""onPlayerDisconnected.sqf"";";
SERVER_EXEC_PLAYER_SET_DATA = "server\initPlayer\PlayerSetData.sqf";
SERVER_EXEC_PLAYER_NEW_DATA = "server\initPlayer\PlayerSetDefaults.sqf";
SERVER_EXEC_PLAYER_SAVE = "server\core\databaseSaving\serverPlayerSave.sqf";
SERVER_EXEC_DATA_SAVE = "server\core\databaseSaving\serverDataSave.sqf";
SERVER_EXEC_PLAYER_CONNECTED = "server\initPlayer\PlayerConnected.sqf";
SERVER_EXEC_INIT_SERVER = "server\initServer\serverConnected.sqf";
SERVER_EXEC_DYNAMIC_WEATHER = "server\core\dynamicWeather\serverDynamicTemperatures.sqf";

CLIENT_EXEC_START_DYNAMIC_WEATHER = "player\core\dynamicWeather\clientDynamicWeather.sqf";
CLIENT_EXEC_UPDATE_OVERCAST = "player\core\dynamicWeather\updateOverCast.sqf";
CLIENT_EXEC_SETUP_GUI = "player\core\gui\setupGUI.sqf";
CLIENT_EXEC_PLAYER_DEAD = "player\eventHandlers\playerDead.sqf";

CLIENT_INIT_LOADING_TEXT = "LOADING CHARACTER";
CLIENT_INIT_FINISH_LOAD_TEXT = "CHARACTER LOADED";
CLIENT_INIT_FAIL_LOAD_TEXT = "CHARACTER FAILED TO LOAD";
CLIENT_INIT_MAX_RECIEVE_PLAYER_TIME = 300;

CLIENT_DEAD_TEXT = "You are dead.";

DB_TYPE_ARRAY = "ARRAY";
DB_TYPE_SCALAR = "SCALAR";
DB_TYPE_STRING = "STRING";

DB_CATAGORY_WEATHER = "serverWeather";
DB_CATAGORY_TEMP = "serverTemperature";
DB_CATAGORY_DATETIME = "serverTime";

DB_SUB_CATAGORY_RAIN = "currentRain";
DB_SUB_CATAGORY_FOG = "currentFog";
DB_SUB_CATAGORY_OVERCAST = "currentOvercast";
DB_SUB_CATAGORY_WIND = "currentWind";
DB_SUB_CATAGORY_DATETIME = "currentDate";
DB_SUB_CATAGORY_AIR_TEMP = "currentAirTemp";
DB_SUB_CATAGORY_WATER_TEMP = "currentWaterTemp";

DB_CATAGORY_PLAYER_DATA = "playerData";
DB_CATAGORY_CUSTOM_VARIABLES = "customVariables";

DB_SUB_CATAGORY_NAME = "name";
DB_SUB_CATAGORY_LOCATION = "location";
DB_SUB_CATAGORY_OXYGEN = "oxygen";
DB_SUB_CATAGORY_HEALTH = "health";
DB_SUB_CATAGORY_WEAPONS = "weapons";
DB_SUB_CATAGORY_WEAPON_ATTACH_PRIM = "primWeaponAttachments";
DB_SUB_CATAGORY_WEAPON_ATTACH_SEC = "secWeaponAttachments";
DB_SUB_CATAGORY_MAGAZINES = "magazines";
DB_SUB_CATAGORY_BACKPACK = "backpack";
DB_SUB_CATAGORY_BACKPACK_GEAR = "backpackGear";
DB_SUB_CATAGORY_VEST = "vest";
DB_SUB_CATAGORY_VEST_GEAR = "vestGear";
DB_SUB_CATAGORY_UNIFORM = "uniform";
DB_SUB_CATAGORY_UNIFORM_GEAR = "uniformGear";
DB_SUB_CATAGORY_GADGETS = "gadgets";
DB_SUB_CATAGORY_HEADGEAR = "headgear";
DB_SUB_CATAGORY_GOGGLES = "goggles";

DB_SUB_CATAGORY_HUNGER = "hunger";
DB_SUB_CATAGORY_THIRST = "thirst";
DB_SUB_CATAGORY_TEMP = "temperature";
DB_SUB_CATAGORY_IMMUNITY = "immunity";
DB_SUB_CATAGORY_TOXICITY = "toxicity";

