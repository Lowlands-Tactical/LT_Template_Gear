/*

File: SwitchGearBase.sqf
Author: Brainless_Ben

Description:
To be included into prepPlayerLoadout function for the end switch case

Empty case for when added
case 00: {
	#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_.sqf"
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
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_NATO.sqf"
	};
	case 2:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_CSAT.sqf"
	};
	case 3:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_AAF.sqf"
	};
	case 4:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_Woodland.sqf"
	};
	case 5:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_Winter.sqf"
	};
	case 6:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_Desert.sqf"
	};
	case 7:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_Jungle.sqf"
	};
	case 8:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_Mariniers.sqf"
	};
	case 9:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_NFP_GREEN.sqf"
	};
	case 10:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_NFP_TAN.sqf"
	};
	case 11:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_NFP_WINTER.sqf"
	};
	case 12:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_SF_Black.sqf"
	};
	case 13:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_PMC.sqf"
	};
	case 14:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_KMAR.sqf"
	};
	case 15:
	{
		#include "\lt_template_gear\Loadout_BASE\Camo\LT_camo_DSI.sqf"
	};
};
