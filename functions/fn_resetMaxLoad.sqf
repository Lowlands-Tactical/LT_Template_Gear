/*

File: fn_resetMaxLoad.sqf
Author: Brainless_Ben

Description:
Reset loadout with desired load

*/

if !(isServer) exitWith {};

_objectContainer = param [0, objNull, [objNull]];
_loadAmount = param [1, 300, [300]];

if (isNull _objectContainer) exitWith
{
    ["ResetMaxLoad","ContainerObject does not exitst",3] call LT_fnc_log;
};

_objectContainer setMaxLoad _loadAmount;
