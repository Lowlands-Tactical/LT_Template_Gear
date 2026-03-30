/*

File: fn_vehicleLoadout.sqf
Author: Brainless_Ben

Description:
Function to set vehicle loadout.

Parameters:
_this select 0 = vehicle
_this select 1 = side vehicle or variable LT_veh_side
_this select 2 = loadout type

Example:
[this, west, "Crate Medium"] call LT_fnc_vehicleLoadout

*/

_return = false;
if (!isServer) exitWith {_return};

// Set Variables
_vehicle = param [0, objNull, [objNull]];
_vehSide = param [1, _vehicle getVariable ["LT_veh_side","CIV"],[_vehicle getVariable ["LT_veh_side","CIV"]]];
_loadout = param [2, _vehicle getVariable["LT_veh_role","Custom"],[_vehicle getVariable["LT_veh_role","Custom"]]];
_setRespawn = _vehicle getVariable ["LT_veh_setRepawn", 0];

// Eject vaulty variables
if (_vehSide == "CIV") exitWith
{
	Diag_Log format["[LT] (Loadout) Side is civilian for Vehicle: %1", typeOf _vehicle];
	if ("lt_debug" call bis_fnc_getParamValue == 1) then 
	{
		systemChat format["[LT] (Loadout) Side is civilian for Vehicle: %1", typeOf _vehicle];
	};
	_return
};
if !(_loadout isEqualType "") exitWith 
{
	Diag_Log format["[LT] (Loadout) Loadout is not STRING: %1 for Vehicle: %2", _loadout,typeOf _vehicle];
	if ("lt_debug" call bis_fnc_getParamValue == 1) then 
	{
		systemChat format["[LT] (Loadout) Loadout is not STRING: %1 for Vehicle: %2", _loadout,typeOf _vehicle];
	};
	_return
};
Diag_Log format["[LT] (Loadout) Vehicle %1 has side %2 and Loadout: %3",typeOf _vehicle, _vehSide, _loadout];
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat format["[LT] (Loadout) Vehicle %1 has side %2 and Loadout: %3",typeOf _vehicle,  _vehSide, _loadout];
};

_check = true;
switch (_loadout) do {
	case "None";
	case "Empty":{
		clearWeaponCargoGlobal _vehicle;
		clearMagazineCargoGlobal _vehicle;
		clearItemCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;
		_check = false;
	};
	case "Custom":{
		_check = false;
	};
	default{
		clearWeaponCargoGlobal _vehicle;
		clearMagazineCargoGlobal _vehicle;
		clearItemCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;
	};
};

// Add loadout to crate in order, Items/Gear/Weapons
if (_check) then
{
	_missionPeriod = MissionSettings get "Period";
	
	_loadItemCrate = itemsCrates get _loadout;
	if !(isNil "_loadItemCrate") then
	{
		_loadItem = _loadItemCrate get _missionPeriod;
		_loadItemAmt = _loadItemCrate get "Amount";
		{
			_vehicle addItemCargoGlobal [_x, _loadItemAmt select _forEachIndex];
		}forEach _loadItem;
	};

	_loadGearSide = gearCrates get _vehSide;
	_loadGearCrate = _loadGearSide get _loadout;
	if !(isNil "_loadGearCrate") then
	{
		_loadGear = _loadGearCrate get _missionPeriod;
		_loadGearAmt = _loadGearCrate get "Amount";
		_loadGearPack = _loadGearCrate get "Backpack";
		if !(_loadGear isEqualTypeArray []) then
		{
			{
				_vehicle addItemCargoGlobal [_x, _loadGearAmt select _forEachIndex];
			}forEach _loadGear;
		};
		if (_loadGearPack #0) then
		{
			{
				if ((typeName _x) == (typeName [])) then
				{
					_backpack = _x #0;
					_amtBP = _x #1;
					_typeBP = _x #2;
					_vehicle addBackpackCargoGlobal [_backpack,_amtBP];
					{
						_type = _x getVariable "LoadType";
						if ((typeOf _x == _backpack) && (isNil "_type")) then
						{
							_x setVariable ["LoadType", _typeBP];
							if (_typeBP != "none") then
							{
								_pack = _x;
								_items = (ItemsGear get _typeBP) get _missionPeriod;
								_itemsAmt = (ItemsGear get _typeBP) get "Amount";
								{
									_pack addItemCargoGlobal [_x, _itemsAmt select _forEachIndex];
								}forEach _items;
								[_pack, ((ceil(loadabs _pack)) + 100)] remoteExec ["LT_fnc_resetMaxLoad"];
							};
						};
					}forEach (everyBackpack _vehicle);
				};
			}forEach _loadGearPack;
		};
	};
	_loadWeaponSide = weaponCrates get _vehSide;
	_loadWeaponCrate = _loadWeaponSide get _loadout;
	if !(isNil "_loadWeaponCrate") then
	{
		{
			_loadWeaponHash = (_loadWeaponCrate get _x) #0;		//HASH
			_loadWeapon = (_loadWeaponHash get "Weapon");		//STRING
			_loadAmmo = (_loadWeaponHash get "Ammo");			//ARRAY
			_loadWeaponAtt = (_loadWeaponHash get "WithAtt");	//ARRAY
			_loadWeaponLaunch = (_loadWeaponCrate get _x) #1;	//BOOL
			_loadWeaponAmt = (_loadWeaponCrate get _x) #2;		//SCALAR
			_loadAmmoOnly = (_loadWeaponCrate get _x) #3;		//BOOL
			_loadAmmoAmt = (_loadWeaponCrate get _x) #4;		//ARRAY
			_loadAmmoAmt resize [(count _loadAmmo),(_loadAmmoAmt #0)];
			if (_loadAmmoOnly) then
			{
				{
					_vehicle addItemCargoGlobal [_x, _loadAmmoAmt select _forEachIndex];
				}forEach _loadAmmo;
			}else
			{
				if (_loadWeaponLaunch) then
				{
					_loadWeapon = selectRandom _loadWeapon;
					_disposable = !(getNumber (configFile >> "CfgWeapons" >> _loadWeapon >> "magazineReloadTime") > 1);
					if (_disposable) then
					{
						_vehicle addWeaponWithAttachmentsCargoGlobal [_loadWeaponAtt,_loadWeaponAmt];
					}else
					{
						_vehicle addWeaponWithAttachmentsCargoGlobal [_loadWeaponAtt,_loadWeaponAmt];
						{
							_vehicle addItemCargoGlobal [_x, _loadAmmoAmt select _forEachIndex];
						}forEach _loadAmmo;
					};
				}else
				{
					_vehicle addWeaponWithAttachmentsCargoGlobal [_loadWeaponAtt,_loadWeaponAmt];
					{
						_vehicle addItemCargoGlobal [_x, _loadAmmoAmt select _forEachIndex];
					}forEach _loadAmmo;
				};
			};
		}forEach _loadWeaponCrate;
	};
	sleep 0.2;

	[_vehicle, ((ceil(loadabs _vehicle)) + 2000)] remoteExec ["LT_fnc_resetMaxLoad"];

	_return = true;
}else{_return = false};

sleep 0.2;

if (_setRespawn == 0) then 
{
	if (_vehicle isKindOf "LandVehicle" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship") then 
	{
		_vehRespawn = _vehicle getVariable ["LT_veh_respawn", 0];
		Diag_Log format["[LT] (prepLoadout) Vehicle: %1 has Respawn: %2", _vehicle, _vehRespawn];
		if (_vehRespawn != 0) then 
		{
			_vehicle setVariable ["LT_veh_setRepawn", 1];
			_delay = _vehicle getVariable ["LT_veh_respawn_delay",15];
			if (_delay < 15) then {_delay = 15;};
			[_vehicle, _delay] call FRED_fnc_vehicleRespawn;
		};
	};
};

_return