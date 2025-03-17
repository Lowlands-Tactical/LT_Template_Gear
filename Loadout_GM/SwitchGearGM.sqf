/*

File: SwitchGearGM.sqf
Author: Brainless_Ben

Description:
To be included into prepPlayerLoadout function for the end switch case

Empty case for when added
	case 00: {
		#include "\lt_template_gear\Loadout_GM\Camo\LT_camo_.sqf"
	};
*/

switch (_lt_camoTMP) do 
{
	case 0:
	{
		if (fileExists "Scripts\customGear.sqf") then 
		{
			call compileScript ["Scripts\customGear.sqf"]
		} else 
		{
			#include "\lt_template_gear\Reference\LT_camo_CUSTOM.sqf"
		};
	};
	case 1:
	{
		#include "\lt_template_gear\Loadout_GM\Camo\LT_camo_NLD_80_WDL.sqf"
	};
	case 2:
	{
		#include "\lt_template_gear\Loadout_GM\Camo\LT_camo_NLD_90_WDL.sqf"
	};
	case 3:
	{
		#include "\lt_template_gear\Loadout_GM\Camo\LT_camo_DE_80_Summer.sqf"
	};
	case 4:
	{
		#include "\lt_template_gear\Loadout_GM\Camo\LT_camo_DE_90.sqf"
	};
	case 5:
	{
		#include "\lt_template_gear\Loadout_GM\Camo\LT_camo_DE_90_FLAK.sqf"
	};
};
