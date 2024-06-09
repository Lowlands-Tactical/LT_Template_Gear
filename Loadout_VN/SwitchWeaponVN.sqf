/*

File: SwitchWeaponVN.sqf
Author: Brainless_Ben

Description:
To be included into prepPlayerLoadout function for the end switch case

Empty case for when added
	case 00: {
		#include "\lt_template_gear\Loadout_VN\Weapon\LT_wpn_.sqf"
	};
*/

switch (_lt_wpnTMP) do 
{
	case 0: {
		if (fileExists "Scripts\customWeapon.sqf") then 
		{
			call compileScript ["Scripts\customWeapon.sqf"]
		} else 
		{
			#include "\lt_template_gear\Reference\LT_wpn_CUSTOM.sqf"
		};
	};
	case 1: {
		#include "\lt_template_gear\Loadout_VN\Weapon\LT_wpn_US_M16A1_Black.sqf"
	};
	case 2: {
		#include "\lt_template_gear\Loadout_VN\Weapon\LT_wpn_US_M16A1_Camo.sqf"
	};
	case 3: {
		#include "\lt_template_gear\Loadout_VN\Weapon\LT_wpn_US_Navy_SEALS.sqf"
	};
	case 6: {
		#include "\lt_template_gear\Loadout_VN\Weapon\LT_wpn_XM17.sqf"
	};
	case 7: {
		#include "\lt_template_gear\Loadout_VN\Weapon\LT_wpn_XM17Camo.sqf"
	};
};
