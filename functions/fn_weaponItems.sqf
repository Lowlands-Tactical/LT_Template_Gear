/*

File: fn_weaponItems.sqf
Author: Brainless_Ben

Description:
Checks if given helmet had build in night vision defined by our list of known helmets

Parameters:
	0: BOOLEAN - true or false
	1: INTERGER - Number
	2: ARRAY - Defines if its items or weapons
	3: STRING - String name weapon for debug
	4: STRING - String className weapon

Example:
	[true,8,[(IR),(FLASH),(MUZZLE),(BIPOD),(SCOPE)]] remoteExec ["LT_fnc_weaponItems"]
	Result:
	[array of weapon with attachments]

*/

params [
	["_scope", MissionSettings get "SCOPE", [MissionSettings get "SCOPE"]],
	["_caseNum", MissionSettings get "ATT", [MissionSettings get "ATT"]],
	["_attArr", [], [[]]],
	["_wpnName", "Error", ["Error"]],
	["_weapon", "", [""]]
];

if !(isClass (configFile >> "cfgWeapons" >> _weapon)) exitWith 
{
	Diag_log format["[LT] (Weapon) Wrong weapon classname: -%1", _weapon];
	systemChat format["[LT] (Weapon) Wrong weapon classname: -%1", _weapon];
};

_result = [];
if !(_scope) then {_attArr set [4,""]};
_attIR = (_attArr #0);
_attFL = (_attArr #1);

_attachments = switch (_caseNum) do
{
	case 0: {[_attIR,"","",(_attArr #4)]};
	case 1: {[_attFL,"","",(_attArr #4)]};
	case 2: {[_attIR,(_attArr #2),"",(_attArr #4)]};
	case 3: {[_attFL,(_attArr #2),"",(_attArr #4)]};
	case 4: {[_attIR,"",(_attArr #3),(_attArr #4)]};
	case 5: {[_attFL,"",(_attArr #3),(_attArr #4)]};
	case 6: {["",(_attArr #2),(_attArr #3),(_attArr #4)]};
	case 7: {[_attIR,(_attArr #2),(_attArr #3),(_attArr #4)]};
	case 8: {[_attFL,(_attArr #2),(_attArr #3),(_attArr #4)]};
	case 9: {["","","",(_attArr #4)]}; // None unless scope is true
};

Diag_log format["[LT] (Weapon) %1 attachments are %2", _wpnName, _attachments];
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat format["[LT] (Weapon) %1 attachments are %2", _wpnName, _attachments];
};

_result = [_weapon,_attachments #1,_attachments #0,_attachments #3,[],[],_attachments #2];

Diag_log format["[LT] (Weapon) WeaponWithAttachments: %1", (_result #0)];
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat format["[LT] (Weapon) WeaponWithAttachments: %1", (_result #0)];
};

_result;
