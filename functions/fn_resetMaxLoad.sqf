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

["ResetMaxLoad",format ["Container: %1 has been reset to MaxLoad: %2", _objectContainer, _loadAmount],2] call LT_fnc_log;