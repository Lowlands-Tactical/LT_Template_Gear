/*

File: LT_wpn_.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["arifle_MSBS65_F","arifle_MSBS65_black_F","arifle_MSBS65_camo_F"];
_rifleGL = ["arifle_MSBS65_GL_F","arifle_MSBS65_GL_black_F","arifle_MSBS65_GL_camo_F"];
_rifle_Mags	= "30Rnd_65x39_caseless_msbs_mag";
_rifle_Mags_Tr = "30Rnd_65x39_caseless_msbs_mag_Tracer";

_rifleCrew = _rifle;
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["acc_pointer_IR"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["muzzle_snds_65_ti_blk_f"];
_rifleAttBipod = ["bipod_01_F_blk","bipod_02_F_blk","bipod_03_F_blk"];
_rifleAttScope = ["optic_hamr"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];

_rifleMark = ["arifle_MSBS65_Mark_F","arifle_MSBS65_Mark_black_F","arifle_MSBS65_Mark_camo_F"];
_rifleMark_Mags = _rifle_Mags;
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = _rifleAttMuzzle;
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = ["optic_sos"];

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

_launcher = ["launch_NLAW_F"];
_launcher_Mags = ["NLAW_F"];

_launcherAA = ["rhs_weap_fim92"];
_launcherAA_Mags = ["rhs_fim92_mag","Titan_AA"];

_heavyAR = ["Aegis_MMG_FNMAG_F"];
_heavyAR_Mags = "Aegis_200Rnd_762x51_MAG_Green_Tracer_F";

_binocular = ["Rangefinder"];

//=====================================================================================
