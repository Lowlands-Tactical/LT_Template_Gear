/*

File: LT_Weapons.sqf
Author: Brainless_Ben

Description:
Switch case for the AI that sets the public variable for all the LT_Weapons variants

*/

switch (side _unit) do 
{
	case west:
	{
		if (isNil "LT_Weapons_Blue") then 
		{
			LT_Weapons_Blue = _weapons;
			publicVariable "LT_Weapons_Blue";
			
			Diag_Log "[LT] (Loadout) Bluefor weapons defined";
			if ("lt_debug" call bis_fnc_getParamValue == 1) then 
			{
				systemChat "[LT] (Loadout) Bluefor weapons defined";
			};
		}else
		{
			Diag_Log "[LT] (Loadout) Bluefor weapons already defined";
			if ("lt_debug" call bis_fnc_getParamValue == 1) then 
			{
				systemChat "[LT] (Loadout) Bluefor weapons already defined";
			};
		};
	};
	case east:
	{
		if (isNil "LT_Weapons_Red") then 
		{
			LT_Weapons_Red = _weapons;
			publicVariable "LT_Weapons_Red";
			
			Diag_Log "[LT] (Loadout) Opfor weapons defined";
			if ("lt_debug" call bis_fnc_getParamValue == 1) then 
			{
				systemChat "[LT] (Loadout) Opfor weapons defined";
			};
		}else
		{
			Diag_Log "[LT] (Loadout) Opfor weapons already defined";
			if ("lt_debug" call bis_fnc_getParamValue == 1) then 
			{
				systemChat "[LT] (Loadout) Opfor weapons already defined";
			};
		};
	};
	case resistance:
	{
		if (isNil "LT_Weapons_Green") then 
		{
			LT_Weapons_Green = _weapons;
			publicVariable "LT_Weapons_Green";
			
			Diag_Log "[LT] (Loadout) Greenfor weapons defined";
			if ("lt_debug" call bis_fnc_getParamValue == 1) then 
			{
				systemChat "[LT] (Loadout) Greenfor weapons defined";
			};
		}else
		{
			Diag_Log "[LT] (Loadout) Greenfor weapons already defined";
			if ("lt_debug" call bis_fnc_getParamValue == 1) then 
			{
				systemChat "[LT] (Loadout) Greenfor weapons already defined";
			};
		};
	};
};
