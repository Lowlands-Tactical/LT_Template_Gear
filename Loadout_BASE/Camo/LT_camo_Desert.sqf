/*

File: LT_camo_.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define clothing that will be used
_unif = ["NAF_U_GVT_dst","NAF_U_GVTV_dst"];
_vest = ["NAF_V_PlateCarrier2_dst","NAF_V_PlateCarrierGL_dst","NAF_V_PlateCarrierSpec_dst"];
_helm = ["NAF_H_HelmetIA_dst"];

_unifMedic = _unif;
_vestMedic = _vest;
_helmMedic = _helm;

_nvgs = ["ACE_NVG_Wide"];
_goggles = [""];

_unifCrew = ["NAF_U_GVTT_dst"];
_vestCrew = ["NAF_V_PlateCarrier1_dst"];
_helmCrew = ["NAF_H_MilCap_dst"];

_unifHeliP = ["NAF_U_HeliCoveralls_Support"];
_unifHeliC = ["NAF_U_HeliCoveralls_Support"];
_vestHeli = ["V_TacVest_blk"];
_helmHeli = ["H_PilotHelmetHeli_O"];

_unifJet = ["NAF_U_PilotCoveralls_Support"];
_helmJet = ["H_PilotHelmetFighter_B"];

_backpackSmall = ["NAF_AssaultPack_dst","NAF_FieldPack_dst","NAF_ViperHarness_dst"];
_backpackLarge = ["NAF_Carryall_dst","NAF_Bergen_dst"];
_backpackMedic = ["NAF_TacticalPack_dst","NAF_Kitbag_dst","NAF_OperatorBag_dst"];
_backpackRadio = ["NAF_Radiobag_dst"];

//=====================================================================================
