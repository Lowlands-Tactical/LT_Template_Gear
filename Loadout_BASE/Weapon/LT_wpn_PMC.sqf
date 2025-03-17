/*

File: LT_wpn_PMC.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["hlc_rifle_hk33a2RIS"];
_rifleGL = ["hlc_rifle_hk33a2RIS_GL"];
_rifle_Mags	= "hlc_30rnd_556x45_M_HK33";
_rifle_Mags_Tr = "hlc_30rnd_556x45_M_HK33";

_rifleCrew = ["hlc_rifle_hk33a2"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["Aegis_acc_pointer_compact_green"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["hlc_muzzle_A1_FlashHider"];
_rifleAttBipod = ["hlc_grip_AFG2"];
_rifleAttScope = ["optic_Yorris"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = ["hlc_rifle_psg1"];
_rifleMark_Mags = "hlc_20rnd_762x51_T_G3";
_rifleMarkAttRailIR = [""];
_rifleMarkAttRailFL = [""];
_rifleMarkAttMuzzle = [""];
_rifleMarkAttBipod = ["rhsusf_acc_harris_bipod"];
_rifleMarkAttScope = [""];

_rifleAir = ["hlc_smg_mp5k_PDW"];
_rifleAir_Mags = "hlc_30Rnd_9x19_B_MP5";
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = [""];
_rifleAirAttMuzzle = ["muzzle_snds_L"];
_rifleAirAttBipod = [""];
_rifleAirAttScope = ["JCA_optic_ARO_black"];

_rifleAR = ["hlc_lmg_minimipara_railed"];
_rifleAR_Mags = "hlc_200rnd_556x45_M_SAW";
_rifleARAttRailIR = [""];
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = ["hlc_muzzle_A1_FlashHider"];
_rifleARAttBipod = [""];
_rifleARAttScope = ["optic_Yorris"];

_handGun = ["hgun_Mk26_F"];
_handGun_Mags = "7Rnd_127x33_Mag";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = [""];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["rhs_weap_fgm148"];
_launcher_Mags = ["rhs_fgm148_magazine_AT"];

_binocular = ["ACE_Vector"];

//=====================================================================================
