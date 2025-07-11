/*

File: fn_weaponItems.sqf
Author: Brainless_Ben

Description:
Checks if given helmet had build in night vision defined by our list of known helmets

Parameters:
	0: STRING - String true or false
	1: STRING - String number
	2: ARRAY - Defines if its items or weapons
	3: STRING - String name weapon for debug
	4: STRING - String className weapon

Example:
	["True","8",[(IR),(FLASH),(MUZZLE),(BIPOD),(SCOPE)]] remoteExec ["LT_fnc_weaponItems"]
	Result:
	array of weapon with attachments and attachments [[],[Rail,Muzzle,Bipod,Scope]]

*/

params [
	["_scope", "True", ["True"]],
	["_caseNum", "9", ["9"]],
	["_attArr", [], [[]]],
	["_wpnName", "Error", ["Error"]],
	["_weapon", "", [""]]
];
/*
_scope = param [0, "True", ["True"]];
_caseNum = param [1, "9", ["9"]];
_attArr = param [2, [], [[]]]; 

_wpnName = param [3, "Error", ["Error"]];
_weapon = param [4, "", [""]];
*/

if !(isClass (configFile >> "cfgWeapons" >> _weapon)) exitWith 
{
	systemChat format["[LT] (Weapon) Wrong weapon classname: -%1", _weapon];
};

_result = [];
if (_scope == "False") then {_attArr set [4,""]};
_attIR = (_attArr #0);
_attFL = (_attArr #1);

_attachments = switch (_caseNum) do
{
	case "0": {[_attIR,"","",(_attArr #4)]};
	case "1": {[_attFL,"","",(_attArr #4)]};
	case "2": {[_attIR,(_attArr #2),"",(_attArr #4)]};
	case "3": {[_attFL,(_attArr #2),"",(_attArr #4)]};
	case "4": {[_attIR,"",(_attArr #3),(_attArr #4)]};
	case "5": {[_attFL,"",(_attArr #3),(_attArr #4)]};
	case "6": {["",(_attArr #2),(_attArr #3),(_attArr #4)]};
	case "7": {[_attIR,(_attArr #2),(_attArr #3),(_attArr #4)]};
	case "8": {[_attFL,(_attArr #2),(_attArr #3),(_attArr #4)]};
	case "9": {["","","",(_attArr #4)]}; // None unless scope is true
};

Diag_log format["[LT] (Weapon) %1 attachments are %2", _wpnName, _attachments];
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat format["[LT] (Weapon) %1 attachments are %2", _wpnName, _attachments];
};

_result = [[_weapon,_attachments #1,_attachments #0,_attachments #3,[],[],_attachments #2],_attachments];

Diag_log format["[LT] (Weapon) WeaponWithAttachments: %1", (_result #0)];
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat format["[LT] (Weapon) WeaponWithAttachments: %1", (_result #0)];
};

_result;
