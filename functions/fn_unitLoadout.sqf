/*

File: fn_unitLoadout.sqf
Author: Brainless_Ben

Description:
Function to set unit loadout.

Parameters:
_this select 0 = unit
_this select 1 = side unit
_this select 2 = unit role

Example:
[this, "WEST"] call LT_fnc_unitLoadout

*/

_unit = param [0, objNull, [objNull]];
_unitSide = param [1, "WEST", ["WEST"]];
_unitRole = param [2, _unit getVariable ["LT_unit_role","custom"],[_unit getVariable ["LT_unit_role","custom"]]];
_return = false;
if !(local _unit) exitWith {_return};

// Eject incorrect
if ((_unitRole == "custom") OR (_unitSide == "CIV")) exitWith 
{
	Diag_log format["[LT] (initPostUnit) role:%1 of side:%2 is incorrect no gear is set for unit:%3",_unitRole,_unitSide, name _unit];
	if ("lt_debug" call bis_fnc_getParamValue == 1) then 
	{
		systemChat format["[LT] (initPostUnit) role:%1 of side:%2 is incorrect no gear is set for unit:%3",_unitRole,_unitSide, name _unit];
	};

    _return
};
_return = true;

// Map/GPS/Bino
_unitLink = _unit getVariable ["LT_unit_link", true];
//PersMedic Nades
_unitItems = _unit getVariable ["LT_unit_item", true];
//Wapens Munitie
_unitWeapon = _unit getVariable ["LT_unit_weapon", true];
//Role items
_unitSpecial = _unit getVariable ["LT_unit_gear", true];
// Checks resets variables
_missionPeriod = MissionSettings get "Period";
_missionRadioLong = switch (typeName (MissionSettings get "RadioLong")) do
{
	case "BOOL":{MissionSettings get "RadioLong"};
	case "STRING":{false};
};

// Define gear/weapon/items
_gearUnits = switch (_unitSide) do {
	case "WEST":{westGear};
	case "EAST":{eastGear};
	case "GUER":{guerGear};
};
_weaponUnits = switch (_unitSide) do {
	case "WEST":{westWeapons};
	case "EAST":{eastWeapons};
	case "GUER":{guerWeapons};
};
// Backpack assignment
_packSmallRole = RoleSettings get "backSmall";
_packSmallArr = (_gearUnits get "BPS") #0;
_packLargeRole = RoleSettings get "backLarge";
_packLargeArr = (_gearUnits get "BPS") #1;
_packRadioRole = RoleSettings get "backRadio";
_packRadioArr = (_gearUnits get "BPS") #3;

// Remove everything start from fresh
removeUniform _unit;
removeVest _unit;
removeHeadgear _unit;
removeBackpackGlobal _unit;
removeAllAssignedItems _unit;
_unitWeapons = weapons _unit;
{_unit removeWeapon _x}forEach _unitWeapons;

// (Re)set unit traits
_unit setUnitTrait ["UAVHacker", false];
_unit setUnitTrait ["medic", false];
_unit setUnitTrait ["engineer", false];
_unit setUnitTrait ["explosiveSpecialist", false];
_unit ForceFlagTexture "";

//Set uniform
switch (_unitRole) do
{
	case "vhco";
	case "vhgu";
	case "vhdr":
	{
		_gearVeh = _gearUnits get "Vehicle";
		_unif = selectRandom(_gearVeh #0);
		if (_unit isUniformAllowed _unif) then
		{
			_unit addUniform _unif;
		}else
		{
			_unit forceAddUniform _unif;
		};
		_unit addVest (selectRandom(_gearVeh #1));
		_unit addHeadGear (selectRandom(_gearVeh #2));
		if (_unitRole IN _packSmallRole) then {_unit addBackpackGlobal (selectRandom _packSmallArr);};
	};
	case "pilot";
	case "crew":
	{
		_gearHeli = _gearUnits get "Heli";
		_unif = if (_unitRole == "pilot") then {selectRandom (_gearHeli #0);} else {selectRandom (_gearHeli #1)};
		if (_unit isUniformAllowed _unif) then
		{
			_unit addUniform _unif;
		}else
		{
			_unit forceAddUniform _unif;
		};
		_unit addVest (selectRandom (_gearHeli #2));
		_unit addHeadGear (selectRandom (_gearHeli #3));
		_unit addBackpackGlobal ((_gearUnits get "Backpack") #4);
	};
	case "jet":
	{
		_gearJet = _gearUnits get "Jet";
		_unif = selectRandom (_gearJet #0);
		if (_unit isUniformAllowed _unif) then
		{
			_unit addUniform _unif;
		}else
		{
			_unit forceAddUniform _unif;
		};
		_unit addVest (_gearJet #1);
		_unit addHeadGear (selectRandom (_gearJet #2));
		_unit addBackpackGlobal ((_gearUnits get "Backpack") #4);
	};
	case "medic":
	{
		_gearMed = _gearUnits get "Medic";
		_unif = selectRandom(_gearMed #0);
		if (_unit isUniformAllowed _unif) then
		{
			_unit addUniform _unif;
		}else
		{
			_unit forceAddUniform _unif;
		};
		_unit addVest (selectRandom(_gearMed #1));
		_unit addHeadGear (selectRandom(_gearMed #2));
		_packMedicArr = (_gearUnits get "BPS") #2;
		_unit addBackpackGlobal (selectRandom _packMedicArr);
	};
	default
	{
		_gearDefault = _gearUnits get "Default";
		_unif = selectRandom(_gearDefault #0);
		if (_unit isUniformAllowed _unif) then
		{
			_unit addUniform _unif;
		}else
		{
			_unit forceAddUniform _unif;
		};
		_unit addVest (selectRandom(_gearDefault #1));
		_unit addHeadGear (selectRandom(_gearDefault #2));
		if (_unitRole IN _packSmallRole) then {_unit addBackpackGlobal (selectRandom _packSmallArr);};
		if (_unitRole IN _packLargeRole) then {_unit addBackpackGlobal (selectRandom _packLargeArr);};
		if (_unitRole == "lvdw") then
		{
			_packLVDWArr = (ItemsGear get "LVDW")#0;
			_unit addBackpackGlobal (selectRandom _packLVDWArr);
			_lvdwFlag = (ItemsGear get "LVDW")#1;
			_unit ForceFlagTexture _lvdwFlag;
		};
	};
};
// Longrange radio backpacks
if (_unitRole IN _packRadioRole) then
{
	if (_missionRadioLong OR (_unitRole == "comms")) then
	{
		_unit addBackpackGlobal (selectRandom _packRadioArr);
	}else
	{
		_unit addBackpackGlobal (selectRandom _packSmallArr);
	};
};
clearAllItemsFromBackpack _unit;

// Role arrays
_roleWpnMain = RoleSettings get "wpnMain";
_roleWpnGL = RoleSettings get "wpnGL";
_roleWpnCrew = RoleSettings get "wpnCrew";
_roleWpnAir = RoleSettings get "wpnAir";
_roleWpnSpecial = RoleSettings get "wpnSpecial";

// Unit link items
_itemsLink = ItemsGear get "Link";
_linkItems = _itemsLink get _missionPeriod;
_nvgBool = (_gearUnits get "NVG")#0;

_linkAmt = [0,1,1,0];
if (_unitLink) then
{
	if (_unitRole IN _packRadioRole) then
	{
		if (_unitRole == "jtac") then
		{
			_uavTerminal = (_gearUnits get "UAV")#0;
			_linkItems set [3,_uavTerminal];
		};
		_linkAmt = [1,1,1,1];
	}else
	{
		_linkAmt = _itemsLink get "Amount";
	};
	if (_nvgBool) then
	{
		_nvgs = (_gearUnits get "NVG")#1;
		_buildInNVG = [(headGear _unit)] call LT_fnc_buildinNVG;
		if (!_buildInNVG) then
		{
			_unit linkItem (selectRandom _nvgs);
		};
	};
	_binoRole = RoleSettings get "wpnBino";
	_binoItem = (UnitWeapons get "BINO") get _missionPeriod;
	_laserItem = (UnitWeapons get "LASER") get _missionPeriod;
	if (_unitRole IN _binoRole) then
	{
		_unit addWeapon _binoItem;
	}else
	{
		(uniformContainer _unit) addItemCargoGlobal [_laserItem #1, 2];
		_unit addWeapon _laserItem #0;
	};
};
_goggles = (_gearUnits get "Goggles");
if ((goggles _unit) == "") then {_unit addGoggles (selectRandom _goggles)};
{
	if ((_linkAmt select _forEachIndex) == 1) then
	{
		_unit linkItem _x;
	};
}forEach _linkItems;

// Unit gear items
if (_unitItems) then
{
	_itemsUniform = ItemsGear get "Uniform";
	_uniformItems = _itemsUniform get _missionPeriod;
	_uniformAmt = _itemsUniform get "Amount";
	{
		(uniformContainer _unit) addItemCargoGlobal [_x, _uniformAmt select _forEachIndex];
	}forEach _uniformItems;
	_itemsVest = ItemsGear get "Vest";
	_vestItems = _itemsVest get _missionPeriod;
	_vestAmt = _itemsVest get "Amount";
	{
		(vestContainer _unit) addItemCargoGlobal [_x, _vestAmt select _forEachIndex];
	}forEach _vestItems;

	if ((_unitRole IN _roleWpnGL) OR (_unitRole == "dmr")) then
	{
		_itemsVest = ItemsGear get "VestExtra";
		_vestItems = _itemsVest get _missionPeriod;
		_vestAmt = _itemsVest get "Amount";
		{
			(vestContainer _unit) addItemCargoGlobal [_x, _vestAmt select _forEachIndex];
		}forEach _vestItems;
	};

	if (_nvgBool) then
	{
		_nvgHash = (_gearUnits get "NVG")#2;
		_nvgItems = (_nvgHash get _missionPeriod);
		_nvgAmt = (_nvgHash get "Amount");
		{
			(uniformContainer _unit) addItemCargoGlobal [_x, _nvgAmt select _forEachIndex];
		}forEach _nvgItems;
	};
	
	_itemsRadios = (ItemsGear get "Radio") get _missionPeriod;
	if (MissionSettings get "RadioShort") then
	{
		(uniformContainer _unit) addItemCargoGlobal [_itemsRadios #0,1];
	};
	if (_unitRole IN _packRadioRole) then
	{
		if (_missionRadioLong OR (_unitRole == "comms")) then
		{
			(uniformContainer _unit) addItemCargoGlobal [_itemsRadios #1,1];
		};
	};
};

// Unit role items/weapons
if (_unitSpecial) then
{
	_roleItems = (ItemsGear get _unitRole) get _missionPeriod;
	if !(isNil "_roleItems") then
	{
		_roleAmt = (ItemsGear get _unitRole) get "Amount";
		_roleCont = switch (_unitRole) do
		{
			case "com";
			case "jtac":{vestContainer _unit};
			case "gren";
			case "riflat":{uniformContainer _unit};
			case "dmr";
			case "medic";
			case "eng":{backpackContainer _unit};
		};
		{
			_roleCont addItemCargoGlobal [_x, _roleAmt select _forEachIndex];
		}forEach _roleItems;
	};

	if (_unitRole == "jtac") then
	{
		_uavBackpack = (_gearUnits get "UAV")#1;
		_uavBackpack createVehicle (position _unit);
	};

	if (_unitRole IN _roleWpnSpecial) then
	{
		_weaponHash = _weaponUnits get _unitRole;
		_weaponSP = _weaponHash get "Weapon";
		_ammoSP = _weaponHash get "Ammo";
		_weaponAttSP = _weaponHash get "WithAtt";
		switch (_unitRole) do
		{
			case "riflat";
			case "riflaa";
			case "mat":
			{
				_weaponSP = selectRandom _weaponSP;
				_disposable = !(getNumber (configFile >> "CfgWeapons" >> _weaponSP >> "magazineReloadTime") > 1);
				if (_disposable) then
				{
					(backpackContainer _unit) addWeaponWithAttachmentsCargoGlobal [_weaponAttSP,3];
				}else
				{
					{
						(backpackContainer _unit) addItemCargoGlobal [_x, 5];
					}forEach _ammoSP;
					_unit addWeapon _weaponSP;
				};
			};
			case "dmr":
			{
				{
					(vestContainer _unit) addItemCargoGlobal [_x, 11];
				}forEach _ammoSP;
				_unit addWeapon (selectRandom _weaponSP);
				{
					_unit addPrimaryWeaponItem _x;
				}forEach (_weaponHash get "Att");
			};
			case "ar";
			case "mmg":
			{
				{
					(backpackContainer _unit) addItemCargoGlobal [_x, 6];
				}forEach _ammoSP;
				_unit addWeapon (selectRandom _weaponSP);
				if (_unitRole == "ar") then
				{
					{
						_unit addPrimaryWeaponItem _x;
					}forEach (_weaponHash get "Att");
				};
			};
		};
	};
	if (_unitRole == "aar") then
	{
		_ammoSP = ((_weaponUnits get "ar")get "Ammo")#0;
		(backpackContainer _unit) addItemCargoGlobal [_ammoSP,6];
	};
};

// Unit default weapons
if (_unitWeapon) then
{
	_weaponHash = switch (true) do
	{
		case (_unitRole IN _roleWpnMain):	{_weaponUnits get "Rifle";};
		case (_unitRole IN _roleWpnGL):		{_weaponUnits get "RifleGL";};
		case (_unitRole IN _roleWpnCrew):	{_weaponUnits get "Crew";};
		case (_unitRole IN _roleWpnAir):	{_weaponUnits get "AIR";};
		default{false};
	};
	if (_unitRole IN _roleWpnGL) then
	{
		_glHG = _weaponHash get "GLWeapon";
		_glAmmo = (_weaponHash get "GLAmmo")#0;
		_glAmt = (_weaponHash get "GLAmmo")#1;
		{
			(backpackContainer _unit) addItemCargoGlobal [_x, _glAmt select _forEachIndex];
		}forEach _glAmmo;
		if (_glHG #0) then
		{
			(backpackContainer _unit) addWeaponCargoGlobal (_glHG #1);
		};
	};
	if (typeName _weaponHash != typeName true) then
	{
		_weapon = _weaponHash get "Weapon";
		_ammo = _weaponHash get "Ammo";
		_weaponAtt = _weaponHash get "Att";
		_amt = if (count _ammo < 2) then{13}else{9};
		{
			(vestContainer _unit) addItemCargoGlobal [_x, _amt];
		}forEach _ammo;
		_unit addWeapon (selectRandom _weapon);
		removeAllPrimaryWeaponItems _unit;
		{
			_unit addPrimaryWeaponItem _x;
		}forEach _weaponAtt;
	};
	_weaponHash = _weaponUnits get "HG";
	_weapon = _weaponHash get "Weapon";
	_ammo = _weaponHash get "Ammo";
	_weaponAtt = _weaponHash get "Att";
	(vestContainer _unit) addItemCargoGlobal [_ammo #0,3];
	_unit addWeapon _weapon;
	removeAllHandgunItems _unit;
	{
		_unit addHandgunItem _x;
	}forEach _weaponAtt;
};

//setUnitTrait per role
_unit setUnitTrait ["audibleCoef", 0.4];
_unit setUnitTrait ["camouflageCoef", 0.4];
_unit setUnitTrait ["loadCoef", 0.2];
switch (_unitRole) do
{
	case "com";
	case "comms";
	case "vhco";
	case "jtac":
	{
		_unit setUnitTrait ["UAVHacker", true];
	};
	case "vhdr";
	case "crew";
	case "jet";
	case "medic":
	{
		_unit setUnitTrait ["medic", true];
	};
	case "gren";
	case "riflat":
	{
		_unit setUnitTrait ["engineer", true];
	};
	case "vhgu";
	case "pilot";
	case "eng":
	{
		_unit setUnitTrait ["engineer", true];
		_unit setUnitTrait ["explosiveSpecialist", true];
	};
};

// Reset unit gear load with extra space
[(uniformContainer _unit), (ceil(loadabs (uniformContainer _unit))) +50] remoteExec ["LT_fnc_resetMaxLoad"];
[(vestContainer _unit), (ceil(loadabs (vestContainer _unit))) +200] remoteExec ["LT_fnc_resetMaxLoad"];
[(backpackContainer _unit), (ceil(loadabs (backpackContainer _unit))) +500] remoteExec ["LT_fnc_resetMaxLoad"];

_return