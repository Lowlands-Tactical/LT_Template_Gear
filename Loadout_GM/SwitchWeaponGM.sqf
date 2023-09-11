/*

File: SwitchWeaponGM.sqf
Author: Brainless_Ben

Description:
To be included into prepPlayerLoadout function for the end switch case

Empty case for when added
	case 00: {
		#include "\lt_template_gear\Loadout_GM\Weapon\LT_wpn_.sqf"
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
		#include "\lt_template_gear\Loadout_GM\Weapon\LT_wpn_NLD_80.sqf"
	};
	case 2: {
		#include "\lt_template_gear\Loadout_GM\Weapon\LT_wpn_NLD_90.sqf"
	};
	case 3: {
		#include "\lt_template_gear\Loadout_GM\Weapon\LT_wpn_G3A3.sqf"
	};
	case 4: {
		#include "\lt_template_gear\Loadout_GM\Weapon\LT_wpn_G11K2.sqf"
	};
	case 5: {
		#include "\lt_template_gear\Loadout_GM\Weapon\LT_wpn_G36A1.sqf"
	};
	case 6: {
		#include "\lt_template_gear\Loadout_GM\Weapon\LT_wpn_SG542.sqf"
	};
	case 7: {
		#include "\lt_template_gear\Loadout_GM\Weapon\LT_wpn_SG550.sqf"
	};
};
