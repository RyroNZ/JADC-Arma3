class CfgPatches
{
	class jadc_core
	{
		requiredaddons[] = {"A3_Data_F", "A3_UI_F", "A3_Anims_F", "A3_Anims_F_Config_Sdr", "A3_Weapons_F"};
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
	};
};
/*extern*/ class Default;
/*extern*/ class CA_Magazine;
/*extern*/ class Mode_SemiAuto;
/*extern*/ class Mode_Burst;
/*extern*/ class Mode_FullAuto;
/*extern*/ class SlotInfo;
/*extern*/ class CowsSlot;
/*extern*/ class PointerSlot;
/*extern*/ class ebr_base_f;
/*extern*/ class ItemCore;
/*extern*/ class InventoryItem_Base_F;
/*extern*/ class InventoryMuzzleItem_Base_F;
/*extern*/ class InventoryFlashLightItem_Base_F;
/*extern*/ class InventoryOpticsItem_Base_F;
/*extern*/ class GrenadeLauncher;

class CfgMagazines {

	
	class 1Rnd_Soda: CA_Magazine {
		picture = "\jadc\images\soda.paa";
		displayName = "Dietetic Dr Pepper";
		scope = 2;
		descriptionShort = "There's nothing diet about it.\n\nUse: Decrease Thirst";
		count = 1;
		mass = 5;
		useable = true;
		useable_attributes[] = {0, 250, 0, 0, 0, 0 , "", 0}; //hunger, thirst, toxicity, immunity, blood, temperature, createItem, fix broken bones
	};
	
	class 1Tent_Pole: CA_Magazine {
		picture = "\jadc\images\tent_pole.paa";
		displayName = "Fibreglass Tent Pole";
		scope = 2;
		descriptionShort = "create a new pole by trimming the sections to the appropriate length\nand threading together with the length of shock cord.";
		count = 1;
		mass = 1;
	};
	class 1Shock_Cord: CA_Magazine {
		picture = "\jadc\images\shock_cord.paa";
		displayName = "Shock Cord";
		scope = 2;
		descriptionShort = "A cord made of rubber strands bound in woven casing\nand used as landing shock absorbers on small airplanes.";
		count = 1;
		mass = 1;
	};
	class 1Tent: CA_Magazine {
		picture = "\jadc\images\tent.paa";
		displayName = "Small Camping Tent";
		scope = 2;
		descriptionShort = "This tent features two defend set up options, allowing you to pitch the whole tent for long, cold stays.\n\nUse: Pitch Tent";
		count = 1;
		mass = 25;
		craftable = true;
		required_items[] = {{"1Tent_Pole", 4}, {"1Shock_Cord", 2}};
		useable = true;
		useable_attributes[] = {0, 0, 0, 0, 0, 0, "Land_TentA_F", 0}; //hunger, thirst, toxicity, immunity, blood, temperature, createItem, fix broken bones
	};
	class 1Rnd_Beans: CA_Magazine {
		picture = "\jadc\images\beans.paa";
		displayName = "Beinz Beanz";
		scope = 2;
		descriptionShort = "Beanz Meanz Heinz.\n\nUse: Decrease Hunger";
		count = 1;
		mass = 5;
		useable = true;
		useable_attributes[] = {400, 0, 0, 0, 0, 0, "", 0}; //hunger, thirst, toxicity, immunity, blood, temperature, createItem, fix broken bones
	};
	class 1Rnd_ColdPack: CA_Magazine {
		picture = "\jadc\images\cold_pack.paa";
		displayName = "Instant Cold Pack";
		scope = 2;
		descriptionShort = "Consists of two bags; one containing water, inside a bag containing ammonium nitrate.\n\nUse: Decrease Temperature";
		count = 1;
		mass = 2;
		useable = true;
		useable_attributes[] = {0, 0, 0, 0, 0, -2, "", 0}; //hunger, thirst, toxicity, immunity, blood, temperature, createItem, fix broken bones
	};
	class 1Rnd_HotPack: CA_Magazine {
		picture = "\jadc\images\hot_pack.paa";
		displayName = "Instant Heat Pack";
		scope = 2;
		descriptionShort = "Disposable chemical pads employ a one-time exothermic chemical reaction.\n\nUse: Increase Temperature";
		count = 1;
		mass = 2;
		useable = true;
		useable_attributes[] = {0, 0, 0, 0, 0, 2, "", 0}; //hunger, thirst, toxicity, immunity, blood, temperature, createItem, fix broken bones
	};
	class 1Rnd_ImmunityBooster: CA_Magazine {
		picture = "\jadc\images\immunity_booster.paa";
		displayName = "Dr. Oz's 14 Natural Immunity Boosters";
		scope = 2;
		descriptionShort = "Disclaimer: May not work as advertised (or at all).\n\nUse: Increase Immunity";
		count = 1;
		mass = 2;
		useable = true;
		useable_attributes[] = {0, 0, 0, 10, 0, 0, "", 0}; //hunger, thirst, toxicity, immunity, blood, temperature, createItem, fix broken bones
	};
	class 1Rnd_Iodine: CA_Magazine {
		picture = "\jadc\images\iodine.paa";
		displayName = "Liquid Iodine Forte";
		scope = 2;
		descriptionShort = "Reduces Toxicitity and stuff.\n\nUse: Reduce Toxicity";
		count = 1;
		mass = 2;
		useable = true;
		useable_attributes[] = {0, 0, -10, 0, 0, 0, "", 0}; //hunger, thirst, toxicity, immunity, blood, temperature, createItem, fix broken bones
	};
	class 1Empty_Bottle: CA_Magazine {
		picture = "\jadc\images\waterbottle.paa";
		displayName = "Empty Bottle";
		scope = 2;
		descriptionShort = "A regular empty bottle";
		count = 1;
		mass = 1;
	};
	class hatchet_swing: CA_Magazine {
		scope = 2;
		displayName = "Swing";
		picture = "\jadc\images\equip_swing_ca.paa";
		ammo = "B_Hatchet";
		count = 1000;
		initSpeed = 100;
		tracersEvery = 0;
		lastRoundsTracer = 9999;
		descriptionShort = "Swing";
		mass = 0;
	};
};

class CfgAmmo {
	/*extern*/ class BulletBase;
	class B_Hatchet: BulletBase {
		hit = 3;
		indirectHit = 0;
		indirectHitRange = 0;
		cartridge = "FxCartridge_9mm";
		caliber = 2.600000;
		deflecting = 45;
		visibleFire = 5;
		audibleFire = 9;
		cost = 100;
		typicalSpeed = 10;
		airFriction = -0.001800;
		muzzleEffect = "";
		minRange = 1;
		minRangeProbab = 0.800000;
		midRange = 2;
		midRangeProbab = 1.500000;
		maxRange = 3;
		maxRangeProbab = 2.500000;
		explosive = 0;
		simulationStep = 0.001000;
		timeToLive = 0.030000;
		soundHit[] = {"", "db-90", 1};
		soundEngine[] = {"", "db-80", 4};
	};

	class B_Swing: BulletBase {
		hit = 8;
		indirectHit = 0;
		indirectHitRange = 0;
		cartridge = "FxCartridge_9mm";
		simulation = "shotRocket";
		effectsMissileInit = "";
		effectsMissile = "EmptyEffect";
		model = "\jadc\objects\swing_box.p3d";
		caliber = 0.260000;
		deflecting = 0;
		visibleFire = 0.100000;
		audibleFire = 1;
		cost = 100;
		typicalSpeed = 275;
		airFriction = -0.001800;
		minRange = 1;
		minRangeProbab = 0.800000;
		midRange = 2;
		midRangeProbab = 1.500000;
		maxRange = 3;
		maxRangeProbab = 2.500000;
		explosive = 0;
		simulationStep = 0.001000;
		timeToLive = 0.003000;
		soundHit[] = {"", "db-90", 1};
		soundEngine[] = {"", "db-80", 4};
	};
};

class CfgGesturesMale {
	skeletonName = "OFP2_ManSkeleton";

	class ManActions {
	};

	class Actions {

		class NoActions {
			turnSpeed = 0;
			upDegree = 0;
			limitFast = 1;
			useFastMove = 0;
			stance = "ManStanceUndefined";
		};
	};

	class Default {
		actions = "NoActions";
		file = "";
		looped = 1;
		speed = 0.500000;
		relSpeedMin = 0.500000;
		relSpeedMax = 1;
		soundEnabled = 0;
		soundOverride = "";
		soundEdge[] = {0.500000, 1};
		terminal = 0;
		ragdoll = 0;
		equivalentTo = "";
		connectAs = "";
		connectFrom[]  = {};
		connectTo[]  = {};
		interpolateWith[]  = {};
		interpolateTo[]  = {};
		interpolateFrom[]  = {};
		mask = "empty";
		interpolationSpeed = 6;
		interpolationRestart = 0;
		preload = 0;
		disableWeapons = 1;
		enableOptics = 0;
		showWeaponAim = 1;
		enableMissile = 1;
		enableBinocular = 1;
		showItemInHand = 0;
		showItemInRightHand = 0;
		showHandGun = 0;
		canPullTrigger = 1;
		Walkcycles = 1;
		headBobMode = 0;
		headBobStrength = 0;
		leftHandIKBeg = 0;
		leftHandIKEnd = 0;
		rightHandIKBeg = 0;
		rightHandIKEnd = 0;
		leftHandIKCurve[] = {1};
		rightHandIKCurve[] = {1};
		forceAim = 0;
	};

	class States {

		class GestureSwing0: Default {
			file = "\jadc\animations\hatch_swing1.rtm";
			looped = 0;
			speed = -0.600000;
			mask = "handsWeapon_pst";
			headBobStrength = 0.200000;
			headBobMode = 2;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};

		class GestureSwing1: Default {
			file = "\jadc\animations\hatch_swing2.rtm";
			looped = 0;
			speed = -0.600000;
			mask = "handsWeapon_pst";
			headBobStrength = 0.200000;
			headBobMode = 2;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};

		class GestureSwing2: Default {
			file = "\jadc\animations\hatch_swing3.rtm";
			looped = 0;
			speed = -0.600000;
			mask = "handsWeapon_pst";
			headBobStrength = 0.200000;
			headBobMode = 2;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};
	};
		class BlendAnims {
		handsWeapon_pst[] = {"head", 1, "neck1", 1, "neck", 1, "launcher", 1, "LeftShoulder", 1, "LeftArm", 1, "LeftArmRoll", 1, "LeftForeArm", 1, "LeftForeArmRoll", 1, "LeftHand", 1, "LeftHandRing", 1, "LeftHandPinky1", 1, "LeftHandPinky2", 1, "LeftHandPinky3", 1, "LeftHandRing1", 1, "LeftHandRing2", 1, "LeftHandRing3", 1, "LeftHandMiddle1", 1, "LeftHandMiddle2", 1, "LeftHandMiddle3", 1, "LeftHandIndex1", 1, "LeftHandIndex2", 1, "LeftHandIndex3", 1, "LeftHandThumb1", 1, "LeftHandThumb2", 1, "LeftHandThumb3", 1, "RightShoulder", 1, "RightArm", 1, "RightArmRoll", 1, "RightForeArm", 1, "RightForeArmRoll", 1, "RightHand", 1, "RightHandRing", 1, "RightHandPinky1", 1, "RightHandPinky2", 1, "RightHandPinky3", 1, "RightHandRing1", 1, "RightHandRing2", 1, "RightHandRing3", 1, "RightHandMiddle1", 1, "RightHandMiddle2", 1, "RightHandMiddle3", 1, "RightHandIndex1", 1, "RightHandIndex2", 1, "RightHandIndex3", 1, "RightHandThumb1", 1, "RightHandThumb2", 1, "RightHandThumb3", 1, "Spine", 1, "Spine1", 1, "Spine2", 1, "Spine3", 1, "pelvis", "MaskStart"};
	};
};
class CfgWeapons {
	/*extern*/ class InventoryItem_Base_F;
	/*extern*/ class ItemCore;
	/*extern*/ class Pistol;
	class Pistol_Base_F: Pistol {
		/*extern*/ class WeaponSlotsInfo;
	};

	class Hatchet: Pistol_Base_F {
		scope = 2;
		model = "\jadc\objects\hatchet.p3d";
		picture = "\jadc\images\hatchet_icon.paa";
		magazines[] = {"hatchet_swing"};
		displayname = "Hatchet";
		descriptionShort = "Hatchet";
		cursor = "EmptyCursor";
		cursorAim = "throw";
		cursorSize = 1;
		weaponInfoType = "RscWeaponEmpty";
		handanim[] ={"OFP2_ManSkeleton","\jadc\animations\hatch_hold.rtm"};

		class WeaponSlotsInfo {
			mass = 20;
		};
	};
};

class CfgMovesBasic
{
	class Default
	{
		GetOutPara = "";
		weaponLowered = 0;
		canBlendStep = 0;
		idle = "idleDefault";
		access = 3;
		actions = "NoActions";
		file = "";
		looped = 1;
		speed = 0.5;
		disableWeapons = 0;
		enableOptics = 0;
		disableWeaponsLong = 0;
		showWeaponAim = 1;
		enableMissile = 0;
		enableBinocular = 0;
		showItemInHand = 0;
		showItemInRightHand = 0;
		showHandGun = 0;
		onLandBeg = 0;
		onLandEnd = 0;
		onLadder = 0;
		canPullTrigger = 1;
		canReload = 1;
		duty = -0.5;
		visibleSize = 0.75012;
		aimPrecision = 1;
		camShakeFire = 1;
		relSpeedMin = 1;
		relSpeedMax = 1;
		soundEnabled = 1;
		soundOverride = "";
		soundEdge[] = {0.5,1};
		terminal = 0;
		ragdoll = 0;
		limitGunMovement = 1;
		variantsPlayer[] = {};
		variantsAI[] = {""};
		equivalentTo = "";
		connectAs = "";
		variantAfter[] = {5,10,20};
		connectFrom[] = {};
		connectTo[] = {};
		interpolateWith[] = {};
		interpolateTo[] = {};
		interpolateFrom[] = {};
		ignoreMinPlayTime[] = {"Unconscious"};
		aiming = "aimingDefault";
		aimingBody = "aimingUpDefault";
		leaning = "leaningDefault";
		legs = "legsDefault";
		head = "headDefault";
		leaningFactorBeg = 0;
		leaningFactorEnd = 0;
		leaningFactorZeroPoint = -1;
		interpolationSpeed = 6;
		interpolationRestart = 0;
		enableDirectControl = 1;
		headBobMode = 0;
		headBobStrength = 0;
		collisionShape = "A3\anims_f\Data\Geom\Sdr\Perc_Wrfl.p3d";
		hasCollShapeSafe = 0;
		collisionShapeSafe = "";
		boundingSphere = 1.0;
		enableAutoActions = 0;
		leftHandIKEnd = 0;
		leftHandIKBeg = 0;
		rightHandIKBeg = 0;
		rightHandIKEnd = 0;
		leftHandIKCurve[] = {};
		rightHandIKCurve[] = {};
		weaponIK = 0;
		preload = 0;
		Walkcycles = 1;
		forceAim = 0;
		adjstance = "m";
	};
	class ManActions
	{

		GestureSwing0 = "";
		GestureSwing1 = "";
		GestureSwing2 = "";
	};
	class Actions
	{
		class NoActions: ManActions
		{
			GestureSwing0[] = {"GestureSwing0","Gesture"};
			GestureSwing1[] = { "GestureSwing1", "Gesture" };
			GestureSwing2[] = { "GestureSwing2", "Gesture" };
		};
		
	};
	class BlendAnims
	{
		aimingDefault[] = {};
		aimingKneelUnarmedDefault = "";
		legsDefault[] = {};
		headDefault[] = {};
		aimingNo[] = {};
		legsNo[] = {};
		headNo[] = {};
		aimingUpDefault[] = {};
		empty[] = {};
	};
};
