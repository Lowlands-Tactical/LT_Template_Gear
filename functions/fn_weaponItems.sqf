/*

File: fn_weaponItems.sqf
Author: Brainless_Ben

Description:
Checks if given helmet had build in night vision defined by our list of known helmets

Parameters:
	Example:
	["True","8",[(IR),(FLASH),(MUZZLE),(BIPOD),(SCOPE)]] remoteExec ["LT_fnc_weaponItems"]
	Result:
	array of weapon attachments [Rail,Muzzle,Bipod,Scope]

*/

private _scope = param [0, "True", ["True"]];
private _caseNum = param [1, "9", ["9"]];
private _attArr = param [2, [], [[]]]; 

private _result = [];
if (_scope == "False") then {_attArr set [4,""]};
private _attIR = (_attArr #0);
private _attFL = (_attArr #1);

_result = switch (_caseNum) do
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

_result;
