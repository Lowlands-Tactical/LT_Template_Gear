/*

File: LT_camo_PMC.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define clothing that will be used
_unif = ["CUP_I_B_PMC_Unit_37","CUP_I_B_PMC_Unit_38","CUP_I_B_PMC_Unit_9","CUP_I_B_PMC_Unit_8","CUP_I_B_PMC_Unit_7"];
_vest = ["CUP_V_PMC_CIRAS_OD_Patrol","NLD_SF_PlateCarrier","CUP_V_CZ_NPP2006_nk_black","CUP_V_PMC_IOTV_Black_AR","CUP_V_MBSS_PACA2_Black"];
_helm = ["NLD_SF_ECH","NLD_DSI_Helmet","CUP_H_RUS_Altyn_Shield_Down_black","CUP_H_PMC_Beanie_Headphones_Black","CUP_H_PMC_Cap_EP_Grey"];
	//Optioneel medic kleding
_unifMedic = _unif;
_vestMedic = _vest;
_helmMedic = _helm;

_nvgs = ["ACE_NVG_Wide_Black","CUP_NVG_HMNVS","CUP_NVG_PVS14","CUP_NVG_PVS15_black"];
_goggles = ["G_Tactical_clear","G_Spectacles_Tinted","CUP_G_Scarf_Face_Red","CUP_PMC_Facewrap_Skull"];

_unifCrew = ["NLD_Helicrew_Base"];
_vestCrew = ["V_Rangemaster_belt"];
_helmCrew = ["H_Tank_eaf_F"];

_unifHeliP = ["NLD_Helipilot_Base"];
_unifHeliC = ["NLD_Helicrew_Base"];
_vestHeli = ["V_TacVest_oli"];
_helmHeli = ["H_PilotHelmetHeli_O"];

_unifJet = ["U_B_PilotCoveralls"];
_helmJet = ["H_PilotHelmetFighter_B"];

_backpackSmall = ["CUP_B_Kombat_Olive","CUP_B_AssaultPack_Black","B_TacticalPack_blk"];
_backpackLarge = ["NLD_SF_Carryall_Empty","NLD_Minion3","B_Carryall_blk"];
_backpackMedic = ["B_MAV_B_BACKPACK","NLD_Minion4","NLD_SF_Carryall_Empty"];
_backpackRadio = ["CUP_B_Kombat_Radio_Olive","NLD_Radiobag_Black"];

//=====================================================================================
