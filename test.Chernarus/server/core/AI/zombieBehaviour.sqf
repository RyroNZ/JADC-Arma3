fn_createZombie = {
	
	_zombieCreatePos = _this select 0;
	_agent = createAgent [AI_ZOMBIE_CHARS select 0, _zombieCreatePos, [], 40, "NONE"];
	
	_agent disableAI "FSM";
	_agent setBehaviour "CARELESS";	
	_agent setCombatMode "RED";
	_agent setSkill 0;

	_agent execFSM "server\core\AI\zombieNormal.fsm";

	_agent

};

fn_zombieWander = {
	private ["_newXPos", "_newYPos"];
	_agent = _this select 0;
	_startPos = _this select 1;
	_agent forceSpeed 1;

	if (random 1 >= 0.5) then {
		_newXPos = (_startPos select 0) + random 15;
		_newYPos = (_startPos select 1) + random 15;
	} else {
		_newXPos = (_startPos select 0) - random 15;
		_newYPos = (_startPos select 1) - random 15;
	};

	_newPos = [_newXPos, _newYPos, _startPos select 2];

	if (_agent distance _startPos < AI_MAX_WANDER) then {
		_agent moveTo _newPos;
	} else {
		_agent moveTo _startPos;
	};

	_newPos

};

fn_zombieChase = {};

fn_zombieFindTarget = {

	_agent = _this select 0;
	_prevTarget = _this select 1;
	_agentPos = getPos _agent;
	_target = ObjNull;

	_agentEyeDirection = eyeDirection _agent;

	_targets = _agent nearEntities ["Civilian", 50];

	if (!(isNil "_prevTarget")) then 
	{
		
		{	
			if (_prevTarget in _targets) exitWith {_target = _prevTarget;};
			if (!((typeOf _x) in AI_ZOMBIE_CHARS)) then 
			{
				_target = _x;
			};
		} forEach _targets;
	} else {
		{	
			if (!((typeOf _x) in AI_ZOMBIE_CHARS)) then 
			{
				_target = _x;
			};
		} forEach _targets;
	};
	if (!isNull _target) then {
		_agent moveTo getPos _target;
		_agent forceSpeed 150;
	};
	_target

};