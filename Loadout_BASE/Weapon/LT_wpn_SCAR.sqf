/*

File: LT_wpn_Mk17_Mk16.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["arifle_SCAR_L_F"];
_rifleGL = ["arifle_SCAR_L_GL_F"];
_rifle_Mags	= "30Rnd_556x45_Stanag_Sand";
_rifle_Mags_Tr = "30Rnd_556x45_Stanag_Sand_Tracer_Green";

_rifleCrew = ["arifle_SCAR_L_short_F"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["hlc_acc_DBALPL_Side"];
_rifleAttRailFL = ["hlc_acc_SF660"];
_rifleAttMuzzle = ["hlc_muzzle_Miter18T"];
_rifleAttBipod = ["hlc_grip_PMVFG_Black","hlc_grip_AFG2"];
_rifleAttScope = ["hlc_optic_HensoldtZO_lo_Docter"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];

_rifleMark = ["hlc_WP_SSR"];
_rifleMark_Mags = "hlc_20Rnd_762x51_B_SCARH_Tan";
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = _rifleAttMuzzle;
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = ["hlc_optic_ATACR"];

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

_binocular = ["ace_Vector"];

//=====================================================================================
