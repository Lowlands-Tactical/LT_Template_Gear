/*

File: LT_wpn_CSAT.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["arifle_Katiba_F"];
_rifleGL = ["arifle_Katiba_GL_F"]; 
_rifle_Mags	= "30Rnd_65x39_caseless_green";
_rifle_Mags_Tr = "30Rnd_65x39_caseless_green_mag_Tracer";

_rifleCrew = ["arifle_Katiba_C_F"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["acc_pointer_ir"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["muzzle_snds_h"];
_rifleAttBipod = [""];
_rifleAttScope = ["optic_aco_grn"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];

_rifleMark = ["srifle_DMR_01_F"];
_rifleMark_Mags = "10Rnd_762x54_Mag";
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = ["muzzle_snds_b"];
_rifleMarkAttBipod = ["bipod_02_f_blk"];
_rifleMarkAttScope = ["optic_dms"];

_rifleAir = ["SMG_02_F"];
_rifleAir_Mags = "30Rnd_9x21_Mag_SMG_02_Tracer_Green";
_rifleAirAttRailIR = _rifleAttRailIR;
_rifleAirAttRailFL = _rifleAttRailFL;
_rifleAirAttMuzzle = ["muzzle_snds_L"];
_rifleAirAttBipod = [""];
_rifleAirAttScope = ["optic_aco_grn_smg"]; 

_rifleAR = ["LMG_Zafir_F"];
_rifleAR_Mags = "150Rnd_762x54_Box";
_rifleARAttRailIR = [""]; 
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = [""];
_rifleARAttBipod = [""];
_rifleARAttScope = ["optic_arco_ak_blk_f"];

_handGun = ["hgun_Rook40_F"];
_handGun_Mags = "16Rnd_9x21_Mag";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = ["muzzle_snds_L"];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["launcher_RPG32_F"];
_launcher_Mags = ["RPG32_F","RPG32_HE_F"];

_launcherAA = ["rhs_weap_fim92"];
_launcherAA_Mags = ["rhs_fim92_mag","Titan_AA"];

_heavyAR = ["Aegis_MMG_FNMAG_F"];
_heavyAR_Mags = "Aegis_200Rnd_762x51_MAG_Green_Tracer_F";

_binocular = ["Rangefinder"];

//=====================================================================================
