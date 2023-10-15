/*

File: prepLoadout_Weapon.sqf
Author: Brainless_Ben

Description:
To be included into every weapon template for ease of use

*/

Diag_log "[LT-GM] (Weapon) Weapon is loading";
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat "[LT-GM] (Weapon) Weapon is loading";
};

// Define parameters
params[
	["_unit", objNull, [objNull]],
	["_nvg", "false", ["false"]],
	["_rifleAttImp", "0", ["0"]],
	["_rifleScImp", "True", ["True"]],
	["_lt_wpnTMP", 0, [0]]		//used in switchGear
];
_role = _unit getVariable ["LT_unit_role", "custom"];
_consumable = _unit getVariable ["LT_unit_gear", 1];
_roleItems = _unit getVariable ["LT_unit_item", 1];

// Default variables weapons
#include "\lt_template_gear\Reference\BaseWeapon.sqf"

// Include base variable and select the gear/weapon sets
#include "\lt_template_gear\Loadout_GM\SwitchWeaponGM.sqf"

// Check for GL weapon if not give normal rifle and add GL Handgun to backpack
_hgGL = false;
_handGunGL = "gm_pallad_d_brn";
if (((_rifleGL select 0) == "") OR ((_rifleGL select 0) == (_rifle select 0))) then 
{
	_hgGL = true;
	_rifleGL = _rifle;
};

// build different arrays for the weapons
_rifleScope = "";
_rifleMarkScope = "";
_rifleAirScope = "";
_rifleARScope = "";
_handGunScope = "";

if (_rifleScImp == "True") then 
{
	_rifleScope = (selectRandom _rifleAttScope);
	_rifleMarkScope = (selectRandom _rifleMarkAttScope);
	_rifleAirScope = (selectRandom _rifleAirAttScope);
	_rifleARScope = (selectRandom _rifleARAttScope);
	_handGunScope = (selectRandom _handGunAttScope);
};

_rifleAttArr = switch (_rifleAttImp) do 
{
	case "0": {[(selectRandom _rifleAttRailIR),"","",_rifleScope]};
	case "1": {[(selectRandom _rifleAttRailFL),"","",_rifleScope]};
	case "2": {[(selectRandom _rifleAttRailIR),(selectRandom _rifleAttMuzzle),"",_rifleScope]};
	case "3": {[(selectRandom _rifleAttRailFL),(selectRandom _rifleAttMuzzle),"",_rifleScope]};
	case "4": {[(selectRandom _rifleAttRailIR),"",(selectRandom _rifleAttBipod),_rifleScope]};
	case "5": {[(selectRandom _rifleAttRailFL),"",(selectRandom _rifleAttBipod),_rifleScope]};
	case "6": {["",(selectRandom _rifleAttMuzzle),(selectRandom _rifleAttBipod),_rifleScope]};
	case "7": {[(selectRandom _rifleAttRailIR),(selectRandom _rifleAttMuzzle),(selectRandom _rifleAttBipod),_rifleScope]};
	case "8": {[(selectRandom _rifleAttRailFL),(selectRandom _rifleAttMuzzle),(selectRandom _rifleAttBipod),_rifleScope]};
	case "9": {["","",""]}; // None
};
_rifleMarkAttArr = switch (_rifleAttImp) do 
{
	case "0": {[(selectRandom _rifleMarkAttRailIR),"","",_rifleMarkScope]};
	case "1": {[(selectRandom _rifleMarkAttRailFL),"","",_rifleMarkScope]};
	case "2": {[(selectRandom _rifleMarkAttRailIR),(selectRandom _rifleMarkAttMuzzle),"",_rifleMarkScope]};
	case "3": {[(selectRandom _rifleMarkAttRailFL),(selectRandom _rifleMarkAttMuzzle),"",_rifleMarkScope]};
	case "4": {[(selectRandom _rifleMarkAttRailIR),"",(selectRandom _rifleMarkAttBipod),_rifleMarkScope]};
	case "5": {[(selectRandom _rifleMarkAttRailFL),"",(selectRandom _rifleMarkAttBipod),_rifleMarkScope]};
	case "6": {["",(selectRandom _rifleMarkAttMuzzle),(selectRandom _rifleMarkAttBipod),_rifleMarkScope]};
	case "7": {[(selectRandom _rifleMarkAttRailIR),(selectRandom _rifleMarkAttMuzzle),(selectRandom _rifleMarkAttBipod),_rifleMarkScope]};
	case "8": {[(selectRandom _rifleMarkAttRailFL),(selectRandom _rifleMarkAttMuzzle),(selectRandom _rifleMarkAttBipod),_rifleMarkScope]};
	case "9": {["","",""]}; // None
};
_rifleAirAttArr = switch (_rifleAttImp) do 
{
	case "0": {[(selectRandom _rifleAirAttRailIR),"","",_rifleAirScope]};
	case "1": {[(selectRandom _rifleAirAttRailFL),"","",_rifleAirScope]};
	case "2": {[(selectRandom _rifleAirAttRailIR),(selectRandom _rifleAirAttMuzzle),"",_rifleAirScope]};
	case "3": {[(selectRandom _rifleAirAttRailFL),(selectRandom _rifleAirAttMuzzle),"",_rifleAirScope]};
	case "4": {[(selectRandom _rifleAirAttRailIR),"",(selectRandom _rifleAirAttBipod),_rifleAirScope]};
	case "5": {[(selectRandom _rifleAirAttRailFL),"",(selectRandom _rifleAirAttBipod),_rifleAirScope]};
	case "6": {["",(selectRandom _rifleAirAttMuzzle),(selectRandom _rifleAirAttBipod),_rifleAirScope]};
	case "7": {[(selectRandom _rifleAirAttRailIR),(selectRandom _rifleAirAttMuzzle),(selectRandom _rifleAirAttBipod),_rifleAirScope]};
	case "8": {[(selectRandom _rifleAirAttRailFL),(selectRandom _rifleAirAttMuzzle),(selectRandom _rifleAirAttBipod),_rifleAirScope]};
	case "9": {["","",""]}; // None
};
_rifleARAttArr = switch (_rifleAttImp) do 
{
	case "0": {[(selectRandom _rifleARAttRailIR),"","",_rifleARScope]};
	case "1": {[(selectRandom _rifleARAttRailFL),"","",_rifleARScope]};
	case "2": {[(selectRandom _rifleARAttRailIR),(selectRandom _rifleARAttMuzzle),"",_rifleARScope]};
	case "3": {[(selectRandom _rifleARAttRailFL),(selectRandom _rifleARAttMuzzle),"",_rifleARScope]};
	case "4": {[(selectRandom _rifleARAttRailIR),"",(selectRandom _rifleARAttBipod),_rifleARScope]};
	case "5": {[(selectRandom _rifleARAttRailFL),"",(selectRandom _rifleARAttBipod),_rifleARScope]};
	case "6": {["",(selectRandom _rifleARAttMuzzle),(selectRandom _rifleARAttBipod),_rifleARScope]};
	case "7": {[(selectRandom _rifleARAttRailIR),(selectRandom _rifleARAttMuzzle),(selectRandom _rifleARAttBipod),_rifleARScope]};
	case "8": {[(selectRandom _rifleARAttRailFL),(selectRandom _rifleARAttMuzzle),(selectRandom _rifleARAttBipod),_rifleARScope]};
	case "9": {["","",""]}; // None
};
_handGunAttArr = switch (_rifleAttImp) do 
{
	case "0": {[(selectRandom _handGunAttRailIR),"","",_handGunScope]};
	case "1": {[(selectRandom _handGunAttRailFL),"","",_handGunScope]};
	case "2": {[(selectRandom _handGunAttRailIR),(selectRandom _handGunAttMuzzle),"",_handGunScope]};
	case "3": {[(selectRandom _handGunAttRailFL),(selectRandom _handGunAttMuzzle),"",_handGunScope]};
	case "4": {[(selectRandom _handGunAttRailIR),"",(selectRandom _handGunAttBipod),_handGunScope]};
	case "5": {[(selectRandom _handGunAttRailFL),"",(selectRandom _handGunAttBipod),_handGunScope]};
	case "6": {["",(selectRandom _handGunAttMuzzle),(selectRandom _handGunAttBipod),_handGunScope]};
	case "7": {[(selectRandom _handGunAttRailIR),(selectRandom _handGunAttMuzzle),(selectRandom _handGunAttBipod),_handGunScope]};
	case "8": {[(selectRandom _handGunAttRailFL),(selectRandom _handGunAttMuzzle),(selectRandom _handGunAttBipod),_handGunScope]};
	case "9": {["","",""]}; // None
};

Diag_log format["[LT-GM] (Weapon) Rifle attachments are -%1/-%2/-%3/-%4", _rifleAttArr select 0, _rifleAttArr select 1, _rifleAttArr select 2, _rifleAttArr select 3];
Diag_log format["[LT-GM] (Weapon) DMR attachments are -%1/-%2/-%3/-%4", _rifleMarkAttArr select 0, _rifleMarkAttArr select 1, _rifleMarkAttArr select 2, _rifleMarkAttArr select 3];
Diag_log format["[LT-GM] (Weapon) Air attachments are -%1/-%2/-%3/-%4", _rifleAirAttArr select 0, _rifleAirAttArr select 1, _rifleAirAttArr select 2, _rifleAirAttArr select 3];
Diag_log format["[LT-GM] (Weapon) AR attachments are -%1/-%2/-%3/-%4", _rifleARAttArr select 0, _rifleARAttArr select 1, _rifleARAttArr select 2, _rifleARAttArr select 3];
Diag_log format["[LT-GM] (Weapon) HG attachments are -%1/-%2/-%3/-%4", _handGunAttArr select 0, _handGunAttArr select 1, _handGunAttArr select 2, _handGunAttArr select 3];
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat format["[LT-GM] (Weapon) Rifle attachments are -%1/-%2/-%3/-%4", _rifleAttArr select 0, _rifleAttArr select 1, _rifleAttArr select 2, _rifleAttArr select 3];
	systemChat format["[LT-GM] (Weapon) DMR attachments are -%1/-%2/-%3/-%4", _rifleMarkAttArr select 0, _rifleMarkAttArr select 1, _rifleMarkAttArr select 2, _rifleMarkAttArr select 3];
	systemChat format["[LT-GM] (Weapon) Air attachments are -%1/-%2/-%3/-%4", _rifleAirAttArr select 0, _rifleAirAttArr select 1, _rifleAirAttArr select 2, _rifleAirAttArr select 3];
	systemChat format["[LT-GM] (Weapon) AR attachments are -%1/-%2/-%3/-%4", _rifleARAttArr select 0, _rifleARAttArr select 1, _rifleARAttArr select 2, _rifleARAttArr select 3];
	systemChat format["[LT-GM] (Weapon) HG attachments are -%1/-%2/-%3/-%4", _handGunAttArr select 0, _handGunAttArr select 1, _handGunAttArr select 2, _handGunAttArr select 3];
};

if (!isPlayer _unit) exitWith 
{
	// Define variables for vehicle loadout
	_rifleGL = [(selectRandom _rifleGL), _rifleAttArr select 1, _rifleAttArr select 0, _rifleAttArr select 3, [], [], _rifleAttArr select 2];
	_rifleCrew = [(selectRandom _rifleCrew), _rifleAttArr select 1, _rifleAttArr select 0, _rifleAttArr select 3, [], [], _rifleAttArr select 2];
	_rifleMark = [(selectRandom _rifleMark), _rifleMarkAttArr select 1, _rifleMarkAttArr select 0, _rifleMarkAttArr select 3, [], [], _rifleMarkAttArr select 2];
	_rifleAir = [(selectRandom _rifleAir), _rifleAirAttArr select 1, _rifleAirAttArr select 0, _rifleAirAttArr select 3,[], [], _rifleAirAttArr select 2];
	_rifleAR = [(selectRandom _rifleAR), _rifleARAttArr select 1, _rifleARAttArr select 0, _rifleARAttArr select 3, [], [], _rifleARAttArr select 2];
	_handGun = [_handGunGL,"","","", [], [],""];

	_weapons = 
	[
		[_rifleGL, _rifle_Mags, _rifle_Mags_Tr], 
		[_rifleCrew, _rifleCrew_Mags, _rifleCrew_Mags_Tr],
		[_rifleMark, _rifleMark_Mags],
		[_itemsGL,_itemsGLNVG], 
		[_rifleAir, _rifleAir_Mags], 
		[_rifleAR, _rifleAR_Mags], 
		[_handGun, _handGun_Mags],
		[(selectRandom _launcher), _launcher_MagAA, _launcher_MagAT],
		(selectRandom _binocular)
	];

	#include "\lt_template_gear\Reference\LT_Weapons.sqf"
};

// Define roles Main, Crew, GL and HG
_roleMain = ["rifl","riflat","aar","eng","comms","lvdw"];
_roleCrew = ["medic","vhco","vhgu","vhdr"];
_roleGL = ["com","sql","ftl","jtac","gren"];
_roleAir = ["pilot","crew","jet"];
_roleHG = ["com","sql","ar","dmr","eng","vhco","vhgu","vhdr","pilot","crew","jet"];
_roleWpn = ["com","sql","jtac","ftl","gren","comms","rifl","riflat","aar","medic","eng","vhco","vhgu","vhdr","lvdw"];

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
	if (_launcher_MagAA != "") then 
	{
		(backpackContainer _unit) addItemCargoGlobal [_launcher_MagAA, 2];
	};
	if (_launcher_MagAT != "") then 
	{
		(backpackContainer _unit) addItemCargoGlobal [_launcher_MagAT, 2];
	};
	if ((_launcher_MagAA == "") && (_launcher_MagAT == "")) then 
	{
		(backpackContainer _unit) addItemCargoGlobal [(selectRandom _launcher), 1];
	};
};

// Add weapons and ammo if consumable is 1
if (_consumable == 0) exitWith 
{
	Diag_log format["[LT-GM] (Weapon) Player: %1 has no consumable", name _unit];
	if ("lt_debug" call bis_fnc_getParamValue == 1) then 
	{
		systemChat format["[LT-GM] (Weapon) Player: %1 has no consumable", name _unit];
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

Diag_log "[LT-GM] (Weapon) Weapons are finished";
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat "[LT-GM] (Weapon) Weapons are finished";
};
