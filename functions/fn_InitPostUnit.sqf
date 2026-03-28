/*

File: fn_InitPostUnit.sqf
Author: Brainless_Ben

Description:
apply loadout for every player with the parameters from the description.ext or keeps the mission template.

Parameters:
[Player Object] 
	Example:
	[player] remoteExec ["LT_fnc_initPostUnit", player]
*/

_ltMission = getMissionConfigValue "LT_Loadout_ID";
if (isNil "_ltMission") exitWith
{
	Diag_log format ["[LT] (XEH) %1 Eject is not mission template", __FILE__];
};

// Define parameters
_return = false;
_unit = param [0, objNull, [objNull]];
if (isNull _unit OR (!local _unit) OR (!isPlayer _unit)) exitWith {_return};

_unitSide = str(side _unit);
_unitRole = _unit getVariable ["LT_unit_role","custom"];
_unitLink = _unit getVariable ["LT_unit_link", true]; // map/gps/bino
_unitItems = _unit getVariable ["LT_unit_item", true]; //PersMedic Nades
_unitWeapon = _unit getVariable ["LT_unit_weapon", true]; //Wapens Munitie
_unitGear = _unit getVariable ["LT_unit_gear", true]; //role items


// Eject incorrect
if ((_unitRole == "custom") OR (_unitSide == "CIV")) exitWith 
{
	Diag_log format["[LT] (initPostUnit) role:%1 of side:%2 is incorrect no gear is set",_unitRole,_unitSide];
	if ("lt_debug" call bis_fnc_getParamValue == 1) then 
	{
		systemChat format["[LT] (initPostUnit) role:%1 of side:%2 is incorrect no gear is set",_unitRole,_unitSide];
	};

	_return
};
_return = true;

_unit setVariable ["LT_unit_role",_unitRole];
_unit setVariable ["LT_unit_link",_unitLink];
_unit setVariable ["LT_unit_item",_unitItems];
_unit setVariable ["LT_unit_weapon",_unitWeapon];
_unit setVariable ["LT_unit_gear",_unitGear];

[_unit, _unitSide, _unitRole] spawn
{
	params ["_unit","_unitSide","_unitRole"];
	waitUntil {sleep 0.2;((((westWeapons get "Rifle") get "Weapon")#0) != "")};
	[_unit, _unitSide, _unitRole] remoteExec ["LT_fnc_unitLoadout"];
};

_return