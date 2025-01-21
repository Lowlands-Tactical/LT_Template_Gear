/*

File: prepLoadout_Gear.sqf
Author: Brainless_Ben

Description:
To be included into every gear template for ease of use

*/

Diag_log "[LT] (Gear) Gear is loading";
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat "[LT] (Gear) Gear is loading";
};

// Define parameters
params [
	["_unit", objNull, [objNull]],
	["_nvg", "false", ["false"]],
	["_srRadio", [], [[]]],
	["_roleRadio", [], [[]]],
	["_lt_camoTMP", 0, [0]],		//used in switchGear
	["_lt_loadout", "BASE", ["BASE"]]
];
_role = _unit getVariable ["LT_unit_role", "custom"];
_consumable = _unit getVariable ["LT_unit_gear", 1];
_roleItems = _unit getVariable ["LT_unit_item", 1];

// Default variables gear
#include "\lt_template_gear\Reference\BaseGear.sqf"

// Select gear textures
_loadout = 0;
switch (_lt_loadout) do 
{
	case "BASE": {
		#include "\lt_template_gear\Loadout_BASE\SwitchGearBASE.sqf"
	};
	case "GM": {
		_loadout = 1;
		#include "\lt_template_gear\Loadout_GM\SwitchGearGM.sqf"
	};
	case "VN": {
		_loadout = 2;
		#include "\lt_template_gear\Loadout_VN\SwitchGearVN.sqf"
	};
};

// Include base variable and select the gear/weapon sets
_itemsLink = [_loadout, "Link"] call LT_fnc_gearItems;
_itemsRadio = [_loadout, "Radio"] call LT_fnc_gearItems;
_itemsUniform =	[_loadout, "Uniform"] call LT_fnc_gearItems;
_itemUniformAmt = [_loadout, "UniformAmt"] call LT_fnc_gearItems;
_itemsTrow = [_loadout, "Trow"] call LT_fnc_gearItems;
_itemTrowAmt = [_loadout, "TrowAmt"] call LT_fnc_gearItems;
_itemsRole = [_loadout, "Role"] call LT_fnc_gearItems;
_itemsDMR =	[_loadout, "DMR"] call LT_fnc_gearItems;
_itemsSpecial =	[_loadout, "Special"] call LT_fnc_gearItems;
_itemsSpecialAmt = [_loadout, "SpecialAmt"] call LT_fnc_gearItems;
_itemEngExpl = [_loadout, "Expl"] call LT_fnc_gearItems;
_itemEngMine = [_loadout, "Mine"] call LT_fnc_gearItems;
_itemsPackMedic = [_loadout, "Medic"] call LT_fnc_gearItems;
_itemsPackMedicAmt = [_loadout, "MedicAmt"] call LT_fnc_gearItems;

// Define role specific parameters
_rolePackSmall = ["Small"] call LT_fnc_rolesArray;
_rolePackLarge = ["Large"] call LT_fnc_rolesArray;
_roleCrew = ["Crew"] call LT_fnc_rolesArray;
_roleSpecial = ["Special"] call LT_fnc_rolesArray;
_roleColourSmoke = ["Colour"] call LT_fnc_rolesArray;

_uavTerminal = "";
_backpackJTAC = "";
if (_lt_loadout == "BASE") then 
{
	_uavTerminal = switch (side _unit) do 
	{
		case west: {"B_UavTerminal"};
		case east: {"O_UavTerminal"};
		case resistance: {"I_UavTerminal"};
	};
	_backpackJTAC = if (isClass(configFile >> "CfgPatches" >> "BB_RQ11B_Raven")) then 
	{
		"BB_RQ11B_Backpack";
	}else
	{
		switch (side _unit) do 
		{
			case west: {"B_UAV_01_backpack_F"};
			case east: {"O_UAV_01_backpack_F"};
			case resistance: {"I_UAV_01_backpack_F"};
		};
	};
};

_gpsLinkOrItem = ((_itemsRole select 0) == "ACE_DAGR");
_backpackLVDW = selectRandomWeighted ["NAF_BigDigBag_extra",0.7,"NAF_Digbag_extra",0.3];
_lvdwTexture = "\lt_template_base\Logos\lvdwcamo.paa";
_parachute = [_loadout, "Parachute"] call LT_fnc_gearItems;

if (!isPlayer _unit) exitWith 
{
	// Define variables for vehicle loadout
	_itemsNVG = [(selectRandom _nvgs),_itemsRole #1,_itemsRole #3];
	_itemsRole = [_itemsRole #0,_uavTerminal,_itemsRole #2,_itemsRole #4,_backpackJTAC];
	_items = 
	[
		_itemsNVG,
		[20,20,40],
		_itemsRole
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

if ((_unifMedic select 0) == "") then {_unifMedic = _unif};
if ((_vestMedic select 0) == "") then {_vestMedic = _vest};
if ((_helmMedic select 0) == "") then {_helmMedic = _helm};

Diag_log format["[LT] (Gear) default gear is -%1/-%2/-%3/-%4", _unif, _vest, _helm, _backpackSmall];
Diag_log format["[LT] (Gear) medic gear is -%1/-%2/-%3/-%4", _unifMedic, _vestMedic, _helmMedic, _backpackMedic];
Diag_log format["[LT] (Gear) crew gear is -%1/-%2/-%3/-%4", _unifCrew, _vestCrew, _helmCrew, _backpackLarge];
Diag_log format["[LT] (Gear) aircrew gear is -%1/-%2/-%3/-%4", _unifHeliP, _unifHeliC, _vestHeli, _helmHeli];
Diag_log format["[LT] (Gear) gear/radiopack is -%1/-%2/-%3", _nvgs, _goggles, _backpackRadio];
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat format["[LT] (Gear) default gear is -%1/-%2/-%3/-%4", _unif, _vest, _helm, _backpackSmall];
	systemChat format["[LT] (Gear) medic gear is -%1/-%2/-%3/-%4", _unifMedic, _vestMedic, _helmMedic, _backpackMedic];
	systemChat format["[LT] (Gear) crew gear is -%1/-%2/-%3/-%4", _unifCrew, _vestCrew, _helmCrew, _backpackLarge];
	systemChat format["[LT] (Gear) aircrew gear is -%1/-%2/-%3/-%4", _unifHeliP, _unifHeliC, _vestHeli, _helmHeli];
	systemChat format["[LT] (Gear) gear/radiopack is -%1/-%2/-%3", _nvgs, _goggles, _backpackRadio];
};

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
	if (_gpsLinkOrItem) then 
	{
		(uniformContainer _unit) addItemCargoGlobal [_itemsRole select 0, 1];
	}else
	{
		_unit linkItem (_itemsRole select 0);
	};
	(uniformContainer _unit) addItemCargoGlobal [_itemsRadio select 1, 1];
};
if (_role IN _roleCrew) then 
{
	if (_gpsLinkOrItem) then 
	{
		(uniformContainer _unit) addItemCargoGlobal [_itemsRole select 0, 1];
	}else
	{
		_unit linkItem (_itemsRole select 0);
	};
	if (_role == "vhdr") then
	{
		_unit setUnitTrait ["medic", true];
	};
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

if (_role == "jtac") then 
{
	_unit setUnitTrait ["UAVHacker", true];
	if (_roleItems == 1) then 
	{
		_backpackJTAC createVehicle (position _unit);
		if !("NONE" IN _roleRadio) then 
		{
			(uniformContainer _unit) addItemCargoGlobal [_itemsRadio select 1, 1];
			(uniformContainer _unit) addItemCargoGlobal [_itemsRole select 4, 4];
		};
		_itemTrowAmt = [0,4,6,6,6,6];
		{
			(backpackContainer _unit) addItemCargoGlobal [_x, _itemTrowAmt select _forEachIndex];
		}forEach _itemsTrow;
		_unit linkItem _uavTerminal;
	};
};

// Add medic gear
if (_role == "medic") then 
{
	_unit setUnitTrait ["medic", true];
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
	if (_roleItems == 1) then 
	{
		{
			(backpackContainer _unit) addItemCargoGlobal [_x, 1];
		}forEach _itemsDMR;
	};	
};

if (_role IN _roleSpecial) then 
{
	_unit setUnitTrait ["engineer", true];
	(backpackContainer _unit) addItemCargoGlobal [(_itemsSpecial select 0), 1];
	if (_role == "eng") then 
	{
		_unit setUnitTrait ["explosiveSpecialist", true];
		if (_roleItems == 1) then 
		{
			(backpackContainer _unit) addItemCargoGlobal [_itemEngExpl select 0, 6];
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

Diag_log "[LT] (Gear) Gear is finished";
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat "[LT] (Gear) Gear is finished";
};
