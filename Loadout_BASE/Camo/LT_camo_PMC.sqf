/*

File: LT_camo_PMC.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define clothing that will be used
_unif = ["U_lxWS_ION_Casual2","U_lxWS_ION_Casual3","U_lxWS_ION_Casual4","U_lxWS_ION_Casual6"];
_vest = ["Atlas_V_OCarrierRig_blk_F","Atlas_V_OCarrierRig_Lite_blk_F","Atlas_V_OCarrierRig_Lite_alt_blk_F","V_BandollierB_blk"];
_helm = ["H_HelmetB_black","H_HelmetSpecB_blk","H_HelmetB_light_black","H_PASGT_neckprot_black_F"];
	//Optioneel medic kleding
_unifMedic = _unif;
_vestMedic = _vest;
_helmMedic = _helm;

_nvgs = ["NVGogglesB_blk_F"];
_goggles = ["G_Cigarette","G_Headset_lxWS","G_WirelessEarpiece_F","rhsusf_shemagh_od"];

_unifCrew = ["NAF_U_GVTT_blk"];
_vestCrew = ["NAF_V_PlateCarrier1_blk"];
_helmCrew = ["NAF_H_MilCap_blk"];

_unifHeliP = ["NAF_U_HeliCoveralls_Support"];
_unifHeliC = ["NAF_U_HeliCoveralls_Support"];
_vestHeli = ["V_TacVest_blk"];
_helmHeli = ["H_PilotHelmetHeli_O"];

_unifJet = ["NAF_U_PilotCoveralls_Support"];
_helmJet = ["H_PilotHelmetFighter_B"];

_backpackSmall = ["NAF_AssaultPack_blk","NAF_FieldPack_blk","NAF_ViperHarness_blk"];
_backpackLarge = ["NAF_Carryall_blk","NAF_Bergen_blk"];
_backpackMedic = ["NAF_TacticalPack_blk","NAF_Kitbag_blk","NAF_OperatorBag_blk"];
_backpackRadio = ["NAF_Radiobag_blk"];

//=====================================================================================
