/*

File: SwitchWeaponBase.sqf
Author: Brainless_Ben

Description:
To be included into prepPlayerLoadout function for the end switch case

Empty case for when added
case 00: {
	#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_.sqf"
};
*/

switch (_lt_wpnTMP) do 
{
	case 0:
	{
		if (fileExists "Scripts\customWeapon.sqf") then 
		{
			call compileScript ["Scripts\customWeapon.sqf"]
		} else 
		{
			#include "\lt_template_gear\Reference\LT_wpn_CUSTOM.sqf"
		};
	};
	case 1:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_NATO.sqf"
	};
	case 2:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_CSAT.sqf"
	};
	case 3:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_AAF.sqf"
	};
	case 4:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_Colt.sqf"
	};
	case 5:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_SCAR.sqf"
	};
	case 6:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_HK416.sqf"
	};
	case 7:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_M4A1.sqf"
	};
	case 8:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_PMC.sqf"
	};
	case 9:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_NLDMX.sqf"
	};
	case 10:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_KMAR.sqf"
	};
	case 11:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_MSBS.sqf"
	};
	case 12:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_AK15.sqf"
	};
	case 13:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_UNA_WS.sqf"
	};
	case 14:
	{
		#include "\lt_template_gear\Loadout_BASE\Weapon\LT_wpn_DSI.sqf"
	};
};
