/*

File: LT_wpn_M4A1.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["JCA_arifle_M4A1_black_F"];
_rifleGL = ["JCA_arifle_M4A1_GL_black_F"];
_rifle_Mags	= "30Rnd_556x45_Stanag";
_rifle_Mags_Tr = "30Rnd_556x45_Stanag_green";

_rifleCrew = ["JCA_arifle_M4A1_short_black_F"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["ACE_acc_pointer_green"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["JCA_muzzle_snds_556_advanced_black"];
_rifleAttBipod = ["JCA_bipod_04_black"];
_rifleAttScope = ["JCA_optic_ACOG_black"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = _rifle;
_rifleMark_Mags = _rifle_Mags_Tr;
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = _rifleAttMuzzle;
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = ["JCA_optic_AICO_black"];

_rifleAir = ["SMG_01_F"];
_rifleAir_Mags = "30Rnd_45ACP_Mag_SMG_01_Tracer_Red";
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = ["acc_flashlight_smg_01"];
_rifleAirAttMuzzle = ["muzzle_snds_acp"];
_rifleAirAttBipod = [""];
_rifleAirAttScope = ["JCA_optic_ARO_black"];

_rifleAR = ["hlc_lmg_minimipara_railed"];
_rifleAR_Mags = "hlc_200rnd_556x45_M_SAW";
_rifleARAttRailIR = [""];
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = ["hlc_muzzle_A1_FlashHider"];
_rifleARAttBipod = [""];
_rifleARAttScope = ["optic_Yorris"];

_handGun = ["hgun_G17_black_F"];
_handGun_Mags = "17Rnd_9x21_Mag";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = ["muzzle_snds_L"];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["gm_pzf3_blk"];
_launcher_MagAA = "gm_1Rnd_60mm_heat_dm32_pzf3";
_launcher_MagAT = "gm_1Rnd_60mm_heat_dm22_pzf3";

_binocular = ["Rangefinder"];

//=====================================================================================
