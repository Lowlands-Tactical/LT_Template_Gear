/*

File: LT_wpn_HK416.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["CUP_arifle_HK416_Black"];
_rifleGL = ["CUP_arifle_HK416_AGL_Black"];
_rifle_Mags	= "CUP_30Rnd_556x45_Emag";
_rifle_Mags_Tr = "CUP_30Rnd_556x45_Emag_Tracer_Green";

_rifleCrew = ["CUP_arifle_HK416_CQB_Black"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["ace_acc_pointer_green"];
_rifleAttRailFL = ["cup_acc_flashlight"];
_rifleAttMuzzle = ["muzzle_snds_570"];
_rifleAttBipod = ["bipod_01_F_blk","bipod_02_F_blk","bipod_03_F_blk"];
_rifleAttScope = ["cup_optic_aimm_compm4_blk"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = ["CUP_arifle_HK417_20"];
_rifleMark_Mags = "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417";
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = ["muzzle_snds_b"];
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = ["optic_mrco"];

_rifleAir = ["CUP_smg_MP5A5_Rail"];
_rifleAir_Mags = "30Rnd_9x21_Mag_SMG_02_Tracer_Green";
_rifleAirAttRailIR = ["cup_acc_llm_black"];
_rifleAirAttRailFL = ["cup_acc_flashlight"];
_rifleAirAttMuzzle = ["muzzle_snds_acp_mp5"];
_rifleAirAttBipod = [""];
_rifleAirAttScope = ["cup_optic_microt1_low"];

_rifleAR = ["CUP_lmg_L110A1"];
_rifleAR_Mags = "CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1";
_rifleARAttRailIR = ["ace_acc_pointer_green"];
_rifleARAttRailFL = ["cup_acc_flashlight"];
_rifleARAttMuzzle = ["ace_muzzle_mzls_b"];
_rifleARAttBipod = [""];
_rifleARAttScope = ["CUP_optic_aimm_microt1_blk"];

_handGun = ["NLD_Glock17"];
_handGun_Mags = "CUP_17Rnd_9x19_glock17";
_handGunAttRailIR = ["cup_acc_mlpls_laser"];
_handGunAttRailFL = ["acc_flashlight_pistol"];
_handGunAttMuzzle = ["muzzle_snds_L"];
_handGunAttBipod = [""];
_handGunAttScope = ["optic_MRD_black"];

_launcher = ["gm_pzf3_blk"];
_launcher_MagAA = "gm_1Rnd_60mm_heat_dm32_pzf3";
_launcher_MagAT = "gm_1Rnd_60mm_heat_dm22_pzf3";

_binocular = ["Rangefinder"];

//=====================================================================================
