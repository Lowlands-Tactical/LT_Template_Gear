/*

File: SwitchGearBase.sqf
Author: Brainless_Ben

Description:
To be included into prepPlayerLoadout function for the end switch case

Empty case for when added
case 00: {
	#include "\lt_template_gear\Loadout_40K\Camo\LT_camo_.sqf"
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
		#include "\lt_template_gear\Loadout_40K\Camo\LT_camo_Guard.sqf"
	};
    case 2:
    {
        #include "\lt_template_gear\Loadout_40K\Camo\LT_camo_Cultist.sqf"
    };
    case 3:
    {
        #include "\lt_template_gear\Loadout_40K\Camo\LT_camo_Ork.sqf"
    };
    case 4:
    {
        #include "\lt_template_gear\Loadout_40K\Camo\LT_camo_Cad700th.sqf"
    };
};
