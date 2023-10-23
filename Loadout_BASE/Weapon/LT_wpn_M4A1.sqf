/*

File: LT_wpn_M4A1.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["CUP_arifle_M4A1_black"];
_rifleGL = ["CUP_arifle_M4A1_BUIS_GL"];
_rifle_Mags	= "CUP_30Rnd_556x45_Emag";
_rifle_Mags_Tr = "CUP_30Rnd_556x45_Emag_Tracer_Green";

_rifleCrew = ["CUP_arifle_M4A1_standard_short_black"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["CUP_acc_ANPEQ_15_Black"];
_rifleAttRailFL = ["CUP_acc_Flashlight"];
_rifleAttMuzzle = ["CUP_muzzle_mfsup_Flashhider_556x45_Black"];
_rifleAttBipod = ["bipod_01_F_blk","bipod_02_F_blk","bipod_03_F_blk"];
_rifleAttScope = ["CUP_optic_AIMM_MICROT1_BLK"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = ["CUP_arifle_M4A1_standard_black"];
_rifleMark_Mags = _rifle_Mags_Tr;
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = _rifleAttMuzzle;
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = ["optic_sos"];

_rifleAir = ["CUP_smg_MP5A5_Rail"];
_rifleAir_Mags = "30Rnd_9x21_Mag_SMG_02_Tracer_Green";
_rifleAirAttRailIR = ["cup_acc_llm_black"];
_rifleAirAttRailFL = ["cup_acc_flashlight"];
_rifleAirAttMuzzle = ["muzzle_snds_acp_mp5"];
_rifleAirAttBipod = [""];
_rifleAirAttScope = ["cup_optic_microt1_low"];

_rifleAR = ["CUP_lmg_M60E4_norail"];
_rifleAR_Mags = "150Rnd_762x51_Box_Tracer";
_rifleARAttRailIR = [""];
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = [""];
_rifleARAttBipod = [""];
_rifleARAttScope = [""];

_handGun = ["CUP_hgun_Deagle"];
_handGun_Mags = "CUP_7Rnd_50AE_Deagle";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = [""];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["gm_pzf3_blk"];
_launcher_MagAA = "gm_1Rnd_60mm_heat_dm32_pzf3";
_launcher_MagAT = "gm_1Rnd_60mm_heat_dm22_pzf3";

_binocular = ["Rangefinder"];

//=====================================================================================
