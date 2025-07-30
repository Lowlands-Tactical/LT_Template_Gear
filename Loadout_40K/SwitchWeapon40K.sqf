/*

File: SwitchWeaponBase.sqf
Author: Brainless_Ben

Description:
To be included into prepPlayerLoadout function for the end switch case

Empty case for when added
case 00: {
	#include "\lt_template_gear\Loadout_40K\Weapon\LT_wpn_.sqf"
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
		#include "\lt_template_gear\Loadout_40K\Weapon\LT_wpn_Guard.sqf"
	};
    case 2:
    {
        #include "\lt_template_gear\Loadout_40K\Weapon\LT_wpn_Cultist.sqf"
    };
    case 3:
    {
        #include "\lt_template_gear\Loadout_40K\Weapon\LT_wpn_Ork.sqf"
    };
    case 4:
    {
        #include "\lt_template_gear\Loadout_40K\Weapon\LT_wpn_Cad700th.sqf"
    };
};
