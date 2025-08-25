/*

File: fn_rolesArray.sqf
Author: Brainless_Ben

Description:
Returns role array based on params (Roles)

Parameters:
	Example:
	["Test"] remoteExec ["LT_fnc_rolesArray"]
	Result:
	["Test\Roles"]

*/

private _roleSelect = param [0, "Test", ["Test"]];

private _roles = ["com","sql","jtac","ftl","gren","comms","rifl","riflat","riflaa","dmr","ar","aar","medic","eng","hmg","hmga","vhco","vhgu","vhdr","pilot","crew","jet","lvdw"];
//				 [ 00  , 01  ,  02  , 03  ,  04  ,  05   ,  06  ,   07   ,   08   , 09  , 10 , 11  ,  12   , 13  , 14  ,  15  ,  16  ,  17  ,  18  ,  19   ,  20  ,  21 ,  22  ]
private _result = switch (_roleSelect) do
{
	case "Test":	{"Test\Roles"};
	case "Small":	{[_roles #0, _roles #1, _roles #2, _roles #3, _roles #4, _roles#5, _roles #6, _roles #9, _roles #10, _roles #14, _roles #16, _roles #17, _roles #18]};
	case "Large":	{[_roles #7, _roles #8, _roles #11, _roles #13, _roles #15]};
	case "Crew":	{[_roles #16, _roles #17, _roles #18, _roles #19, _roles #20, _roles #21]};
	case "Special":	{[_roles #13, _roles #16, _roles #17, _roles #18, _roles #19]};
	case "Colour":	{[_roles #0, _roles #1, _roles #3, _roles #5]};
	case "Main":	{[_roles #5, _roles #6, _roles #7, _roles #8, _roles #11, _roles #13, _roles #15, _roles #22]};
	case "Crews":	{[_roles #12, _roles #16, _roles #17, _roles #18]};
	case "GL":		{[_roles #0, _roles #1, _roles #2, _roles #3, _roles #4]};
	case "Air":		{[_roles #19, _roles #20, _roles #21]};
	case "HG":		{[_roles #0, _roles #1, _roles #9, _roles #10, _roles #13, _roles #14, _roles #15, _roles #16, _roles #17, _roles #18, _roles #19]};
	case "Wpn":		{[_roles #0, _roles #1, _roles #2, _roles #3, _roles #4, _roles #5, _roles #6, _roles #7, _roles #8, _roles #11, _roles #12,_roles #13, _roles #15, _roles #16, _roles #17, _roles #18, _roles #22]};
	case "Laser":	{[_roles #0, _roles #1, _roles #2, _roles #3, _roles #9, _roles #16, _roles #17, _roles #18, _roles #19, _roles #20]};
};

_result;
