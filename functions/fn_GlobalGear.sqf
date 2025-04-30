/*
	Author: Brainless_Ben

	Description:
		Define global variable where gear/items and weapons are define for the community Lowlands Tactical

	Parameter(s):
		0: OBJECT - AI unit
		1: ARRAY - Array of items or weapons
        2: NUMBER - Defines if its items or weapons

	Returns:
		BOOLEAN

	Examples:
		[west,[],0] remoteExec ["LT_fnc_GlobalGear"]
*/

params [
    ["_unit", objNull, [objNull]],
    ["_array", [], [[]]],
    ["_itemWeapon", 0, [0]]
];

private _check = 0;
_message = "gear not defined";

switch (side _unit) do 
{
	case west:
	{
        if (_itemWeapon == 0) then 
        {
            if !(isNil "LT_Items_Blue") then
            {
                _message = "Bluefor gear already defined";
                _check = 1;
            }else
            {
                _message = "Bluefor gear defined";
                missionNameSpace setVariable ["LT_Items_Blue",_array,false];
            };
        }else
        {
            if !(isNil "LT_Weapons_Blue") then 
            {
                _message = "Bluefor weapons already defined";
                _check = 1;
            }else
            {
                _message = "Bluefor weapons defined";
                missionNameSpace setVariable ["LT_Weapons_Blue",_array,false];
            };
        };
	};
	case east:
	{
        if (_itemWeapon == 0) then 
        {
            if !(isNil "LT_Items_Red") then
            {
                _message = "Opfor gear already defined";
                _check = 1;
            }else
            {
                _message = "Opfor gear defined";
                missionNameSpace setVariable ["LT_Items_Red",_array,false];
            };
        }else
        {
            if !(isNil "LT_Weapons_Red") then 
            {
                _message = "Opfor weapons already defined";
                _check = 1;
            }else
            {
                _message = "Opfor weapons defined";
                missionNameSpace setVariable ["LT_Weapons_Red",_array,false];
            };
        };
	};
	case resistance:
	{
        if (_itemWeapon == 0) then 
        {
            if !(isNil "LT_Items_Green") then
            {
                _message = "Greenfor gear already defined";
                _check = 1;
            }else
            {
                _message = "Greenfor gear defined";
                missionNameSpace setVariable ["LT_Items_Green",_array,false];
            };
        }else
        {
            if !(isNil "LT_Weapons_Green") then 
            {
                _message = "Greenfor weapons already defined";
                _check = 1;
            }else
            {
                _message = "Greenfor weapons defined";
                missionNameSpace setVariable ["LT_Weapons_Green",_array,false];
            };
        };
	};
};

Diag_Log format["[LT] (Loadout) %1",_message];
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
    systemChat format["[LT] (Loadout) %1",_message];
};

_result = false;
if (_check == 1) then {_result} else {_result = true;};
_result
