/*

File: LT_wpn_AAF.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["arifle_Mk20_F"];
_rifleGL = ["arifle_Mk20_GL_F"]; 
_rifle_Mags	= "30Rnd_556x45_Stanag";
_rifle_Mags_Tr = "30Rnd_556x45_Stanag_Tracer_Yellow";

_rifleCrew = ["arifle_Mk20C_F"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["acc_pointer_ir"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["muzzle_snds_m"];
_rifleAttBipod = [""];
_rifleAttScope = ["optic_aco_grn"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];

_rifleMark = ["srifle_EBR_F"];
_rifleMark_Mags = "20Rnd_762x51_Mag";
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = ["muzzle_snds_b"];
_rifleMarkAttBipod = ["bipod_03_f_blk"];
_rifleMarkAttScope = ["optic_mrco"];

_rifleAir = ["hgun_PDW2000_F"];
_rifleAir_Mags = "30Rnd_9x21_Yellow_Mag";
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = [""];
_rifleAirAttMuzzle = ["muzzle_snds_L"];
_rifleAirAttBipod = [""];
_rifleAirAttScope = ["optic_holosight_smg"]; 

_rifleAR = ["LMG_Mk200_F"];
_rifleAR_Mags = "200Rnd_65x39_cased_Box_Tracer";
_rifleARAttRailIR = _rifleAttRailIR; 
_rifleARAttRailFL = _rifleAttRailFL;
_rifleARAttMuzzle = ["muzzle_snds_h"];
_rifleARAttBipod = ["bipod_01_f_snd"];
_rifleARAttScope = ["optic_hamr"];

_handGun = ["hgun_ACPC2_F"];
_handGun_Mags = "9Rnd_45ACP_Mag";
_handGunAttRailIR = [""];
_handGunAttRailFL = ["acc_flashlight_pistol"];
_handGunAttMuzzle = ["muzzle_snds_acp"];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["launcher_NLAW_F"];
_launcher_Mags = ["NLAW_F"];

_launcherAA = ["rhs_weap_fim92"];
_launcherAA_Mags = ["rhs_fim92_mag","Titan_AA"];

_heavyAR = ["Aegis_MMG_FNMAG_F"];
_heavyAR_Mags = "Aegis_200Rnd_762x51_MAG_Green_Tracer_F";

_binocular = ["Rangefinder"];

//=====================================================================================
