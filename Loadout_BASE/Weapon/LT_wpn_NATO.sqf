/*

File: LT_wpn_NATO.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["arifle_MX_F"];
_rifleGL = ["arifle_MX_GL_F"]; 
_rifle_Mags	= "30Rnd_65x39_caseless_mag";
_rifle_Mags_Tr = "30Rnd_65x39_caseless_mag_Tracer";

_rifleCrew = ["arifle_MXC_F"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["acc_pointer_ir"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["muzzle_snds_h"];
_rifleAttBipod = ["bipod_01_f_snd"];
_rifleAttScope = ["optic_aco"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];

_rifleMark = ["arifle_MXM_F"];
_rifleMark_Mags = _rifle_Mags;
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = _rifleAttMuzzle;
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = ["optic_hamr"];

_rifleAir = _rifleCrew;
_rifleAir_Mags = _rifle_Mags;
_rifleAirAttRailIR = _rifleAttRailIR;
_rifleAirAttRailFL = _rifleAttRailFL;
_rifleAirAttMuzzle = _rifleAttMuzzle;
_rifleAirAttBipod = _rifleAttBipod;
_rifleAirAttScope = _rifleAttScope; 

_rifleAR = ["arifle_MX_SW_F"];
_rifleAR_Mags = "100Rnd_65x39_caseless_mag_Tracer";
_rifleARAttRailIR = _rifleAttRailIR; 
_rifleARAttRailFL = _rifleAttRailFL;
_rifleARAttMuzzle = ["muzzle_snds_h_mg"];
_rifleARAttBipod = _rifleAttBipod;
_rifleARAttScope = ["optic_hamr"];

_handGun = ["hgun_P07_F"];
_handGun_Mags = "16Rnd_9x21_Mag";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = ["muzzle_snds_l"];
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
