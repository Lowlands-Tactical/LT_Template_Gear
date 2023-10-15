/*

File: prepLoadout_Gear.sqf
Author: Brainless_Ben

Description:
To be included into every gear template for ease of use

*/

Diag_log "[LT-GM] (Gear) Gear is loading";
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat "[LT-GM] (Gear) Gear is loading";
};

// Define parameters
params[
	["_unit", objNull, [objNull]],
	["_nvg", "false", ["false"]],
	["_srRadio" , [], [[]]],
	["_roleRadio", [], [[]]],
	["_lt_camoTMP", 0, [0]]		//used in switchGear
];
_role = _unit getVariable ["LT_unit_role", "custom"];
_consumable = _unit getVariable ["LT_unit_gear", 1];
_roleItems = _unit getVariable ["LT_unit_item", 1];

// Default variables gear
#include "\lt_template_gear\Reference\BaseGear.sqf"

// Include base variable and select the gear/weapon sets
#include "\lt_template_gear\Loadout_GM\SwitchGearGM.sqf"

_itemsLink = ["ItemMap","gm_ge_army_conat2","gm_watch_kosei_80"];
_itemsRadio = ["ACRE_SEM52SL","ACRE_SEM70"];
_itemsUniform = ["ACE_fieldDressing","ACE_elasticBandage","ACE_tourniquet","ACE_morphine","ACE_splint","ACE_quikclot","ACE_CableTie"];
_itemUniformAmt = [5,5,2,2,2,2,1];
_itemsTrow = ["gm_handgrenade_frag_rgd5","gm_smokeshell_wht_gc","gm_smokeshell_grn_gc","gm_smokeshell_red_gc","gm_smokeshell_yel_gc","gm_smokeshell_blu_gc"];
_itemTrowAmt = [2,2,2,0,0,0];

_itemsRole = ["ACE_DAGR","ACE_Flashlight_XL50","ACE_EntrenchingTool","ACE_IR_Strobe_Item"];
_itemsDMR = ["ACE_RangeCard","ACE_SpottingScope", _itemsRadio select 0, _itemsRole select 0, _itemsRole select 2];
_itemsSpecial = ["gm_repairkit_01","ACE_M26_Clacker","ACE_wirecutter","gm_explosive_petn_charge","gm_explosive_plnp_charge","MineDetector","ACE_DefusalKit","ACE_marker_flags_red","ACE_marker_flags_green"];
_itemsSpecialAmt = [0,1,1,6,0,1,1,6,6];

_itemsPackMedic	= ["ACE_fieldDressing","ACE_elasticBandage","ACE_quikclot","ACE_tourniquet","ACE_splint","ACE_morphine","ACE_epinephrine","ACE_bloodIV","ACE_plasmaIV_500","ACE_salineIV_500","ACE_surgicalKit"];
_itemsPackMedicAmt = [50,50,10,12,15,30,20,6,6,2,1];

// Define role specific parameters
_rolePackSmall = ["com","sql","jtac","ftl","gren","rifl","dmr","comms","ar","vhco","vhgu","vhdr"];
_rolePackLarge = ["riflat","aar","eng"];
_roleCrew = ["vhco","vhgu","vhdr","pilot","crew","jet"];
_roleSpecial = ["eng","vhco","vhgu","vhdr","pilot"];
_roleColourSmoke = ["com","sql","ftl","comms"];

_backpackLVDW = selectRandomWeighted ["NLD_BigDickBag",0.7,"NLD_DickBag",0.3];
_lvdwTexture = "\lt_template_base\Logos\lvdwcamo.paa";
_parachute = "gm_backpack_rs9_parachute";

if (!isPlayer _unit) exitWith 
{
	// Define variables for vehicle loadout
	_itemsNVG = [(selectRandom _nvgs),_itemsRole select 1,_itemsRole select 3];
	_itemsRole = [_itemsRole select 0,"",_itemsRole select 2];
	_items = 
	[
		_itemsTrow, 
		_itemsPackMedic, 
		_itemsRadio, 
		_itemsSpecial, 
		_itemsRole, 
		_itemsNVG
	];

	#include "\lt_template_gear\Reference\LT_Items.sqf"
};

// (Re)set unit traits
_unit setUnitTrait ["audibleCoef", 0.2];
_unit setUnitTrait ["camouflageCoef", 0.2];
_unit setUnitTrait ["loadCoef", 0.5];
_unit setUnitTrait ["UAVHacker", false];
_unit setUnitTrait ["medic", false];
_unit setUnitTrait ["engineer", false];
_unit setUnitTrait ["explosiveSpecialist", false];
_unit ForceFlagTexture "";

// Deletes the special radiopack from roleArray
{_rolePackSmall deleteAt (_rolePackSmall find _x)}forEach _roleRadio;
{_rolePackLarge deleteAt (_rolePackLarge find _x)}forEach _roleRadio;

// Remove everything start from fresh
removeUniform _unit;
removeVest _unit;
removeHeadgear _unit;
removeBackpackGlobal _unit;
removeAllAssignedItems _unit;

// Add goggles if none are set and check optional medic gear
if ((goggles _unit) == "") then {_unit addGoggles (selectRandom _goggles)};
if ((_unifMedic select 0) == "") then {_unifMedic = _unif;};
if ((_vestMedic select 0) == "") then {_vestMedic = _vest;};
if ((_helmMedic select 0) == "") then {_helmMedic = _helm;};

// Add gear
if (_role IN _roleCrew) then 
{
	switch (_role) do 
	{
		case "pilot": 
		{
			_unifHeliPilot = (selectRandom _unifHeliP);
			if (_unit isUniformAllowed _unifHeliPilot) then 
			{
				_unit addUniform _unifHeliPilot
			}else
			{
				_unit forceAddUniform _unifHeliPilot
			};
			_unit addVest (selectRandom _vestHeli);
			_unit addHeadgear (selectRandom _helmHeli);
			_unit addBackpackGlobal _parachute;
		};
		case "crew": 
		{
			_unifHeliCrew = (selectRandom _unifHeliC);
			if (_unit isUniformAllowed _unifHeliCrew) then 
			{
				_unit addUniform _unifHeliCrew
			}else
			{
				_unit forceAddUniform _unifHeliCrew
			};
			_unit addVest (selectRandom _vestHeli);
			_unit addHeadgear (selectRandom _helmHeli);
			_unit addBackpackGlobal _parachute;
		};
		case "jet": 
		{
			_unifJetPilot = (selectRandom _unifJet);
			if (_unit isUniformAllowed _unifJetPilot) then 
			{
				_unit addUniform _unifJetPilot
			}else
			{
				_unit forceAddUniform _unifJetPilot
			};
			_unit addHeadgear (selectRandom _helmJet);
			_unit addBackpackGlobal _parachute;
		};
		default 
		{
			_unifVehCrew = (selectRandom _unifCrew);
			if (_unit isUniformAllowed _unifVehCrew) then 
			{
				_unit addUniform _unifVehCrew
			}else
			{
				_unit forceAddUniform _unifVehCrew
			};
			_unit addVest (selectRandom _vestCrew);
			_unit addHeadgear (selectRandom _helmCrew);
		};
	};
} else 
{
	if (_role == "medic") then 
	{
		_uniform = (selectRandom _unifMedic);
		if (_unit isUniformAllowed _uniform) then 
		{
			_unit addUniform _uniform
		}else
		{
			_unit forceAddUniform _uniform
		};
		_unit addVest (selectRandom _vestMedic);
		_unit addHeadgear (selectRandom _helmMedic);
	} else 
	{
		_uniform = (selectRandom _unif);
		if (_unit isUniformAllowed _uniform) then 
		{
			_unit addUniform _uniform
		}else
		{
			_unit forceAddUniform _uniform
		};
		_unit addVest (selectRandom _vest);
		_unit addHeadgear (selectRandom _helm);
	};
};

// Add backpack to the right roles
if (_role IN _rolePackSmall) then 
{
	_unit addBackpackGlobal (selectRandom _backpackSmall);
};
if (_role IN _rolePackLarge) then 
{
	_unit addBackpackGlobal (selectRandom _backpackLarge);
};
if (_role IN _srRadio) then 
{
	if !("NONE" IN _srRadio) then 
	{
		(uniformContainer _unit) addItemCargoGlobal [_itemsRadio select 0, 1];
	};
};
if (_role IN _roleRadio) then 
{
	_unit addBackpackGlobal (selectRandom _backpackRadio);
	_unit linkItem (_itemsRole select 0);
	(uniformContainer _unit) addItemCargoGlobal [_itemsRadio select 1, 1];
};
if (_role IN _roleCrew) then 
{
	_unit linkItem (_itemsRole select 0);
	_unit setUnitTrait ["engineer", true];
	if !("NONE" IN _roleRadio) then 
	{
		(uniformContainer _unit) addItemCargoGlobal [_itemsRadio select 1, 1];
	};
};
if (_role == "lvdw") then 
{
	_unit addBackpackGlobal _backpackLVDW;
	_unit ForceFlagTexture _lvdwTexture;
};
if (_role == "medic" && (backpack _unit) == "") then 
{
	_unit addBackpackGlobal (selectRandom _backpackMedic);
};

// Clear uniform/vest and backpack and resize gear
clearAllItemsFromBackpack _unit;


// Add basic items
if (_nvg == "True") then 
{
	_buildinNVG = [(headgear _unit)] call LT_fnc_buildinNVG;
	if (!_buildinNVG) then 
	{
		_unit linkItem (selectRandom _nvgs);
	};
	(uniformContainer _unit) addItemCargoGlobal [_itemsRole select 1, 1];
	(vestContainer _unit) addItemCargoGlobal [_itemsRole select 3, 3];
};
{_unit linkItem _x;}forEach _itemsLink;

if (_consumable == 1) then 
{
	{
		(uniformContainer _unit) addItemCargoGlobal [_x, _itemUniformAmt select _forEachIndex];
	}forEach _itemsUniform;
	
	{
		(vestContainer _unit) addItemCargoGlobal [_x, _itemTrowAmt select _forEachIndex];
	}forEach _itemsTrow;
	if (_role IN _roleColourSmoke) then 
	{
		_itemTrowAmt = [0,0,2,2,1,1];
		{
			(backpackContainer _unit) addItemCargoGlobal [_x, _itemTrowAmt select _forEachIndex];
		}forEach _itemsTrow;
	};
};

// Add medic gear
if (_role == "medic") then 
{
	_unit setUnitTrait ["medic", true];
	[backpackContainer _unit, 350] remoteExec ["LT_fnc_resetMaxLoad"];
	if (_roleItems == 1) then 
	{
		_itemTrowAmt = [0,2,2,0,2,2];
		{
			(vestContainer _unit) addItemCargoGlobal [_x, _itemTrowAmt select _forEachIndex];
		}forEach _itemsTrow;
		{
			(backpackContainer _unit) addItemCargoGlobal [_x, _itemsPackMedicAmt select _forEachIndex];
		}forEach _itemsPackMedic;
	};
};

// Add special gear
if (_role == "dmr") then 
{
	{
		(backpackContainer _unit) addItemCargoGlobal [_x, 1];
	}forEach _itemsDMR;
};
if (_role IN _roleSpecial) then 
{
	_unit setUnitTrait ["engineer", true];
	(backpackContainer _unit) addItemCargoGlobal [(_itemsSpecial select 0), 1];
	if (_role == "eng") then 
	{
		[backpackContainer _unit, 400] remoteExec ["LT_fnc_resetMaxLoad"];
		_unit setUnitTrait ["explosiveSpecialist", true];
		if (_roleItems == 1) then 
		{
			{
				(backpackContainer _unit) addItemCargoGlobal [_x, _itemsSpecialAmt select _forEachIndex];
			}forEach _itemsSpecial;
		};
	};
};

[uniformContainer _unit, 50] remoteExec ["LT_fnc_resetMaxLoad"];
[vestContainer _unit, 200] remoteExec ["LT_fnc_resetMaxLoad"];
if (_role in _roleSpecial OR _role == "medic") then 
{
	[backpackContainer _unit, 400] remoteExec ["LT_fnc_resetMaxLoad"];
} else 
{
	[backpackContainer _unit, 300] remoteExec ["LT_fnc_resetMaxLoad"];
};

Diag_log "[LT-GM] (Gear) Gear is finished";
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat "[LT-GM] (Gear) Gear is finished";
};
