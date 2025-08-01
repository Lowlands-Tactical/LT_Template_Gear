/*

File: LT_wpn_colt.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["arifle_NAF_C7NLD"];
_rifleGL = ["arifle_NAF_C7NLD_GL"];
_rifle_Mags	= "30Rnd_556x45_Stanag";
_rifle_Mags_Tr = "30Rnd_556x45_Stanag_green";

_rifleCrew = ["arifle_NAF_C8NLD"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["acc_NAF_Colt_pointer"];
_rifleAttRailFL = ["acc_NAF_Colt_flashlight"];
_rifleAttMuzzle = ["muzzle_NAF_Colt_snds"];
_rifleAttBipod = ["bipod_NAF_Colt"];
_rifleAttScope = ["optic_NAF_Colt"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];

_rifleMark = ["hlc_rifle_samr2"];
_rifleMark_Mags = _rifle_Mags;
_rifleMarkAttRailIR = ["JCA_acc_LaserModule_sand_Pointer"];
_rifleMarkAttRailFL = ["JCA_acc_flashlight_tactical_sand"];
_rifleMarkAttMuzzle = ["hlc_muzzle_556NATO_OpsInc12th"];
_rifleMarkAttBipod = ["JCA_bipod_04_sand"];
_rifleMarkAttScope = ["optic_DMS"];

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
_launcher_Mags = ["gm_1Rnd_60mm_heat_dm32_pzf3","gm_1Rnd_60mm_heat_dm22_pzf3"];

_binocular = ["Rangefinder"];

//=====================================================================================
