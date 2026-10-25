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

//Backward compatible for older missions
_unitVars = [_unitLink,_unitItems,_unitWeapon,_unitGear];
_unitNewVars = [];
{ 
	_newValue = switch (typeName _x) do
	{
		case "BOOL":{_x};
		case "SCALAR":{if (_x == 0) then {false} else {true};};
	};
	_unitNewVars pushBack _newValue;
}forEach _unitVars;
_unitLink = (_unitNewVars #0);
_unitItems = (_unitNewVars #1);
_unitWeapon = (_unitNewVars #2);
_unitGear = (_unitNewVars #3);

// Eject incorrect
if ((_unitRole == "custom") OR (_unitSide == "CIV")) exitWith 
{
	["initPostUnit",format ["role:%1 of side:%2 is incorrect no gear is set",_unitRole,_unitSide],3] call LT_fnc_log;
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
	private ["_until"];
	params ["_unit", "_unitSide", "_unitRole"];
	_until = diag_tickTime + 60;
	waitUntil {sleep 0.2; ((missionNamespace getVariable ["LT_gear_ready", false]) || (diag_tickTime > _until))};
	if (missionNamespace getVariable ["LT_gear_ready", false]) then
	{
		[_unit, _unitSide, _unitRole] remoteExec ["LT_fnc_unitLoadout"];
	} else
	{
		["initPostUnit", format ["gear tables not ready, no loadout for %1", name _unit], 3] call LT_fnc_log;
		_return = false;
	};
};

_return