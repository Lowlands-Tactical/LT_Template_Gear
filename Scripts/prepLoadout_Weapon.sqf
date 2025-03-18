/*

File: prepLoadout_Weapon.sqf
Author: Brainless_Ben

Description:
To be included into every weapon template for ease of use

*/

Diag_log "[LT] (Weapon) Weapon is loading";
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat "[LT] (Weapon) Weapon is loading";
};

// Define parameters
params [
	["_unit", objNull, [objNull]],
	["_nvg", "false", ["false"]],
	["_rifleAttImp", "0", ["0"]],
	["_rifleScImp", "True", ["True"]],
	["_lt_wpnTMP", 0, [0]],		//used in switchGear
	["_lt_loadout", "BASE", ["BASE"]]
];
_role = _unit getVariable ["LT_unit_role", "custom"];
_consumable = _unit getVariable ["LT_unit_gear", 1];
_roleItems = _unit getVariable ["LT_unit_item", 1];

// Default variables weapons
//#include "\lt_template_gear\Reference\BaseWeapon.sqf"
_rifle = [""];
_rifleGL = [""];
_rifle_Mags	= "";
_rifle_Mags_Tr = "";
_rifleCrew = [""];
_rifleCrew_Mags = "";
_rifleCrew_Mags_Tr = "";
_rifleAttRailIR = [""];
_rifleAttRailFL = [""];
_rifleAttMuzzle = [""];
_rifleAttBipod = [""];
_rifleAttScope = [""];
_itemsGL = ["","","",""];
_itemsGLNVG = ["","","",""];
_itemsGLAmt	= [8,6,4,4];
_rifleMark = [""];
_rifleMark_Mags = "";
_rifleMarkAttRailIR = [""];
_rifleMarkAttRailFL = [""];
_rifleMarkAttMuzzle = [""];
_rifleMarkAttBipod = [""];
_rifleMarkAttScope = [""];
_rifleAir = [""];
_rifleAir_Mags = "";
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = [""];
_rifleAirAttMuzzle = [""];
_rifleAirAttBipod = [""];
_rifleAirAttScope = [""];
_rifleAR = [""];
_rifleAR_Mags = "";
_rifleARAttRailIR = [""];
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = [""];
_rifleARAttBipod = [""];
_rifleARAttScope = [""];
_handGun = [""];
_handGun_Mags = "";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = [""];
_handGunAttBipod = [""];
_handGunAttScope = [""];
_launcher = [""];
_launcher_Mags = [];
_binocular = [""];

//Old Launcher Mags for backward compat
_launcher_MagAA = "";
_launcher_MagAT = "";

// Check for GL weapon if not give normal rifle and add GL Handgun to backpack
_hgGL = false;
_handGunGL = "";
if (((_rifleGL select 0) == "") OR ((_rifleGL select 0) == (_rifle select 0))) then 
{
	_hgGL = true;
	_rifleGL = _rifle;
};

// Include base variable and select the gear/weapon sets
_loadout = 0;
switch (_lt_loadout) do 
{
	case "BASE":
	{
		_loadout = 0;
		#include "\lt_template_gear\Loadout_BASE\SwitchWeaponBASE.sqf"
	};
	case "GM":
	{
		_loadout = 1;
		_handGunGL = "gm_pallad_d_brn";
		#include "\lt_template_gear\Loadout_GM\SwitchWeaponGM.sqf"
	};
	case "VN":
	{
		_loadout = 2;
		_handGunGL = "vn_m79_p";
		#include "\lt_template_gear\Loadout_VN\SwitchWeaponVN.sqf"
	};
};

if (_launcher_MagAA != "") then 
{
	_launcher_Mags pushBack _launcher_MagAA;
	systemChat "[LT] (Weapon) Old launcherMag detected update customWeapon.sqf";
};
if (_launcher_MagAT != "") then 
{
	_launcher_Mags pushBack _launcher_MagAT;
	systemChat "[LT] (Weapon) Old launcherMag detected update customWeapon.sqf";
};

// build different arrays for the weapons
_rifleAttTMP = [(selectRandom _rifleAttRailIR),(selectRandom _rifleAttRailFL),(selectRandom _rifleAttMuzzle),(selectRandom _rifleAttBipod),(selectRandom _rifleAttScope)];
_rifleAttArr = [_rifleScImp,_rifleAttImp,_rifleAttTMP] call LT_fnc_weaponItems;
_rifleMarkAttTMP = [(selectRandom _rifleMarkAttRailIR),(selectRandom _rifleMarkAttRailFL),(selectRandom _rifleMarkAttMuzzle),(selectRandom _rifleMarkAttBipod),(selectRandom _rifleMarkAttScope)];
_rifleMarkAttArr = [_rifleScImp,_rifleAttImp,_rifleMarkAttTMP] call LT_fnc_weaponItems;
_rifleAirAttTMP = [(selectRandom _rifleAirAttRailIR),(selectRandom _rifleAirAttRailFL),(selectRandom _rifleAirAttMuzzle),(selectRandom _rifleAirAttBipod),(selectRandom _rifleAirAttScope)];
_rifleAirAttArr = [_rifleScImp,_rifleAttImp,_rifleAirAttTMP] call LT_fnc_weaponItems;
_rifleARAttTMP = [(selectRandom _rifleARAttRailIR),(selectRandom _rifleARAttRailFL),(selectRandom _rifleARAttMuzzle),(selectRandom _rifleARAttBipod),(selectRandom _rifleARAttScope)];
_rifleARAttArr = [_rifleScImp,_rifleAttImp,_rifleARAttTMP] call LT_fnc_weaponItems;
_handGunAttTMP = [(selectRandom _handGunAttRailIR),(selectRandom _handGunAttRailFL),(selectRandom _handGunAttMuzzle),(selectRandom _handGunAttBipod),(selectRandom _handGunAttScope)];
_handGunAttArr = [_rifleScImp,_rifleAttImp,_handGunAttTMP] call LT_fnc_weaponItems;

// Define roles Main, Crew, GL and HG
_roleMain = ["Main"] call LT_fnc_rolesArray;
_roleCrew = ["Crews"] call LT_fnc_rolesArray;
_roleGL = ["GL"] call LT_fnc_rolesArray;
_roleAir = ["Air"] call LT_fnc_rolesArray;
_roleHG = ["HG"] call LT_fnc_rolesArray;
_roleWpn = ["Wpn"] call LT_fnc_rolesArray;

Diag_log format["[LT] (Weapon) Rifle attachments are -%1/-%2/-%3/-%4", _rifleAttArr select 0, _rifleAttArr select 1, _rifleAttArr select 2, _rifleAttArr select 3];
Diag_log format["[LT] (Weapon) DMR attachments are -%1/-%2/-%3/-%4", _rifleMarkAttArr select 0, _rifleMarkAttArr select 1, _rifleMarkAttArr select 2, _rifleMarkAttArr select 3];
Diag_log format["[LT] (Weapon) Air attachments are -%1/-%2/-%3/-%4", _rifleAirAttArr select 0, _rifleAirAttArr select 1, _rifleAirAttArr select 2, _rifleAirAttArr select 3];
Diag_log format["[LT] (Weapon) AR attachments are -%1/-%2/-%3/-%4", _rifleARAttArr select 0, _rifleARAttArr select 1, _rifleARAttArr select 2, _rifleARAttArr select 3];
Diag_log format["[LT] (Weapon) HG attachments are -%1/-%2/-%3/-%4", _handGunAttArr select 0, _handGunAttArr select 1, _handGunAttArr select 2, _handGunAttArr select 3];
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat format["[LT] (Weapon) Rifle attachments are -%1/-%2/-%3/-%4", _rifleAttArr select 0, _rifleAttArr select 1, _rifleAttArr select 2, _rifleAttArr select 3];
	systemChat format["[LT] (Weapon) DMR attachments are -%1/-%2/-%3/-%4", _rifleMarkAttArr select 0, _rifleMarkAttArr select 1, _rifleMarkAttArr select 2, _rifleMarkAttArr select 3];
	systemChat format["[LT] (Weapon) Air attachments are -%1/-%2/-%3/-%4", _rifleAirAttArr select 0, _rifleAirAttArr select 1, _rifleAirAttArr select 2, _rifleAirAttArr select 3];
	systemChat format["[LT] (Weapon) AR attachments are -%1/-%2/-%3/-%4", _rifleARAttArr select 0, _rifleARAttArr select 1, _rifleARAttArr select 2, _rifleARAttArr select 3];
	systemChat format["[LT] (Weapon) HG attachments are -%1/-%2/-%3/-%4", _handGunAttArr select 0, _handGunAttArr select 1, _handGunAttArr select 2, _handGunAttArr select 3];
};

if (!isPlayer _unit) exitWith 
{
	// Define variables for vehicle loadout
	_rifleGL = [(selectRandom _rifleGL), _rifleAttArr select 1, _rifleAttArr select 0, _rifleAttArr select 3, [], [], _rifleAttArr select 2];
	_rifleCrew = [(selectRandom _rifleCrew), _rifleAttArr select 1, _rifleAttArr select 0, _rifleAttArr select 3, [], [], _rifleAttArr select 2];
	_rifleMark = [(selectRandom _rifleMark), _rifleMarkAttArr select 1, _rifleMarkAttArr select 0, _rifleMarkAttArr select 3, [], [], _rifleMarkAttArr select 2];
	_rifleAir = [(selectRandom _rifleAir), _rifleAirAttArr select 1, _rifleAirAttArr select 0, _rifleAirAttArr select 3,[], [], _rifleAirAttArr select 2];
	_rifleAR = [(selectRandom _rifleAR), _rifleARAttArr select 1, _rifleARAttArr select 0, _rifleARAttArr select 3, [], [], _rifleARAttArr select 2];
	_handGun = [(selectRandom _handGun), _handGunAttArr select 1, _handGunAttArr select 0, _handGunAttArr select 3, [], [], _handGunAttArr select 2];

	_weapons = 
	[
		[_rifleGL, _rifle_Mags, _rifle_Mags_Tr], 
		[_rifleCrew, _rifleCrew_Mags, _rifleCrew_Mags_Tr],
		[_rifleMark, _rifleMark_Mags],
		[_itemsGL,_itemsGLNVG], 
		[_rifleAir, _rifleAir_Mags], 
		[_rifleAR, _rifleAR_Mags], 
		[_handGun, _handGun_Mags],
		[(selectRandom _launcher), _launcher_Mags],
		(selectRandom _binocular)
	];
	[_unit,_weapons,1] call LT_fnc_GlobalGear;
	//#include "\lt_template_gear\Reference\LT_Weapons.sqf"
};

_weapons = weapons _unit;
{_unit removeWeapon _x}forEach _weapons;

// Add binocular to given roles
if (_role IN _roleGL OR _role IN _roleHG) then 
{
	_unit addWeapon (selectRandom _binocular)
};

if (_roleItems == 1 && _role == "riflat") then 
{
	_unit addWeapon (selectRandom _launcher);
	{
		(backpackContainer _unit) addItemCargoGlobal [_x,2];
	}forEach _launcher_Mags;
	if (((_launcher_Mags select 0) == "")) then 
	{
		(backpackContainer _unit) addItemCargoGlobal [(selectRandom _launcher), 1];
	};
};

// Add weapons and ammo if consumable is 1
if (_consumable == 0) exitWith 
{
	Diag_log format["[LT] (Weapon) Player: %1 has no consumable", name _unit];
	if ("lt_debug" call bis_fnc_getParamValue == 1) then 
	{
		systemChat format["[LT] (Weapon) Player: %1 has no consumable", name _unit];
	};
};

if (_role IN _roleMain) then 
{
	(vestContainer _unit) addItemCargoGlobal [_rifle_Mags, 10];
	(vestContainer _unit) addItemCargoGlobal [_rifle_Mags_Tr, 4];
	_unit addWeapon (selectRandom _rifle);
};
if (_role IN _roleCrew) then 
{
	(vestContainer _unit) addItemCargoGlobal [_rifleCrew_Mags, 8];
	(vestContainer _unit) addItemCargoGlobal [_rifleCrew_Mags_Tr, 4];
	_unit addWeapon (selectRandom _rifleCrew);
};
if (_role IN _roleGL) then 
{
	if (_nvg == "True") then 
	{
		{
			(backpackContainer _unit) addItemCargoGlobal [_x, _itemsGLAmt select _forEachIndex]
		}forEach _itemsGLNVG;
	} else 
	{
		{
			(backpackContainer _unit) addItemCargoGlobal [_x, _itemsGLAmt select _forEachIndex]
		}forEach _itemsGL;
	};
	(vestContainer _unit) addItemCargoGlobal [_rifle_Mags, 8];
	(vestContainer _unit) addItemCargoGlobal [_rifle_Mags_Tr, 4];
	if (_hgGL) then {(backpackContainer _unit) addItemCargoGlobal [_handGunGL, 1]};
	_unit addWeapon (selectRandom _rifleGL);
};
if (_role IN _roleAir) then 
{
	(vestContainer _unit) addItemCargoGlobal [_rifleAir_Mags, 12];
	_unit addWeapon (selectRandom _rifleAir);
};
if (_role == "dmr") then 
{
	(vestContainer _unit) addItemCargoGlobal [_rifleMark_Mags, 12];
	_unit addWeapon (selectRandom _rifleMark);
};
if (_role == "ar" OR _role == "aar") then 
{
	(backpackContainer _unit) addItemCargoGlobal [_rifleAR_Mags, 5];
	if (_role == "ar") then 
	{
		_unit addWeapon (selectRandom _rifleAR);
	};
};
if (_role IN _roleHG) then 
{
	(vestContainer _unit) addItemCargoGlobal [_handGun_Mags, 3];
	if (_role == "jet") then 
	{
		(vestContainer _unit) addItemCargoGlobal [_handGun_Mags, 3];
	};
	_unit addWeapon (selectRandom _handGun);
};

// Add weapon attachements
removeAllPrimaryWeaponItems _unit;
removeAllHandgunItems _unit;

if (_role IN _roleWpn) then 
{
	{
		_unit addPrimaryWeaponItem _x;
	}forEach _rifleAttArr;
};
if (_role IN _roleAir) then 
{
	{
		_unit addPrimaryWeaponItem _x;
	}forEach _rifleAirAttArr;
};
if (_role == "dmr") then 
{
	{
		_unit addPrimaryWeaponItem _x;
	}forEach _rifleMarkAttArr;
};
if (_role == "ar") then 
{
	{
		_unit addPrimaryWeaponItem _x;
	}forEach _rifleARAttArr;
};
if (_role IN _roleHG) then 
{
	{
		_unit addHandgunItem _x;
	}forEach _handGunAttArr;
};

Diag_log "[LT] (Weapon) Weapons are finished";
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat "[LT] (Weapon) Weapons are finished";
};
