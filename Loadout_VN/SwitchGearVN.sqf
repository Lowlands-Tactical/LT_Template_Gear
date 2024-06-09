/*

File: SwitchGearVN.sqf
Author: Brainless_Ben

Description:
To be included into prepPlayerLoadout function for the end switch case

Empty case for when added
	case 00: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_.sqf"
	};
*/

switch (_lt_camoTMP) do 
{
	case 0: {
		if (fileExists "Scripts\customGear.sqf") then 
		{
			call compileScript ["Scripts\customGear.sqf"]
		} else 
		{
			#include "\lt_template_gear\Reference\LT_camo_CUSTOM.sqf"
		};
	};
	case 1: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_US_Army_Olive.sqf"
	};
	case 2: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_US_Army_Brown.sqf"
	};
	case 3: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_US_Navy_Olive.sqf"
	};
	case 4: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_US_SF_66_Leopard.sqf"
	};
	case 5: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_US_SF_Tiger.sqf"
	};
	case 6: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_AUS_Army_Olive.sqf"
	};
	case 7: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_AUS_SAS_ERDL.sqf"
	};
	case 8: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_ROK_Army_Frog.sqf"
	};
	case 9: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_MACV.sqf"
	};
	case 10: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_MACVDark.sqf"
	};
	case 11: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_VC_Main_Force_Black.sqf"
	};
	case 12: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_VC_Local_Cadre_Mixed.sqf"
	};
	case 13: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_KR_Army_Black.sqf"
	};
	case 14: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_PL_Army_Brown.sqf"
	};
	case 15: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_PAVN_Army_Olive.sqf"
	};
	case 16: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_PAVN_Marines_BlueWhite.sqf"
	};
	case 17: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_PAVN_Commandos_Mixed.sqf"
	};
	case 18: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_FANK_Army_Olive.sqf"
	};
	case 19: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_ARVN_Army_Olive.sqf"
	};
	case 20: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_ARVN_Ranger_BDQ.sqf"
	};
	case 21: {
		#include "\lt_template_gear\Loadout_VN\Camo\LT_camo_RLA_Army_Olive.sqf"
	};
};
