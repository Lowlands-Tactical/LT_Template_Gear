/*

File: LT_Items.sqf
Author: Brainless_Ben

Description:
Switch case for the AI that sets the public variable for all the LT_Items variants

*/

switch (side _unit) do 
{
	case west:
	{
		if (isNil "LT_Items_Blue") then 
		{
			LT_Items_Blue = _items;
			publicVariable "LT_Items_Blue";

			Diag_Log "[LT] (Loadout) Bluefor gear defined";
			if ("lt_debug" call bis_fnc_getParamValue == 1) then 
			{
				systemChat "[LT] (Loadout) Bluefor gear defined";
			};
		}else
		{
			Diag_Log "[LT] (Loadout) Bluefor gear already defined";
			if ("lt_debug" call bis_fnc_getParamValue == 1) then 
			{
				systemChat "[LT] (Loadout) Bluefor gear already defined";
			};
		};
	};
	case east:
	{
		if (isNil "LT_Items_Red") then 
		{
			LT_Items_Red = _items;
			publicVariable "LT_Items_Red";

			Diag_Log "[LT] (Loadout) Opfor gear defined";
			if ("lt_debug" call bis_fnc_getParamValue == 1) then 
			{
				systemChat "[LT] (Loadout) Opfor gear defined";
			};
		}else
		{
			Diag_Log "[LT] (Loadout) Opfor gear already defined";
			if ("lt_debug" call bis_fnc_getParamValue == 1) then 
			{
				systemChat "[LT] (Loadout) Opfor gear already defined";
			};
		};
	};
	case resistance:
	{
		if (isNil "LT_Items_Green") then 
		{
			LT_Items_Green = _items;
			publicVariable "LT_Items_Green";

			Diag_Log "[LT] (Loadout) Greenfor gear defined";
			if ("lt_debug" call bis_fnc_getParamValue == 1) then 
			{
				systemChat "[LT] (Loadout) Greenfor gear defined";
			};
		}else
		{
			Diag_Log "[LT] (Loadout) Greenfor gear already defined";
			if ("lt_debug" call bis_fnc_getParamValue == 1) then 
			{
				systemChat "[LT] (Loadout) Greenfor gear already defined";
			};
		};
	};
};
