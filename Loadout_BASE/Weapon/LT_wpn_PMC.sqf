/*

File: LT_wpn_PMC.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["CUP_arifle_CZ805_A1","CUP_arifle_CZ805_A1_blk","CUP_arifle_CZ805_A1_coyote"];
_rifleGL = ["CUP_arifle_CZ805_GL","CUP_arifle_CZ805_GL_blk","CUP_arifle_CZ805_GL_coyote"];
_rifle_Mags	= "CUP_30Rnd_556x45_CZ805";
_rifle_Mags_Tr = "CUP_30Rnd_TE1_Green_Tracer_556x45_CZ805";

_rifleCrew = ["CUP_arifle_CZ805_A2","CUP_arifle_CZ805_A2_blk","CUP_arifle_CZ805_A2_coyote"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["acc_pointer_IR"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["muzzle_snds_M"];
_rifleAttBipod = ["bipod_01_F_blk","bipod_02_F_blk","bipod_03_F_blk"];
_rifleAttScope = ["cup_optic_aimm_m68_blk"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = _rifle;
_rifleMark_Mags = _rifle_Mags_Tr;
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = _rifleAttMuzzle;
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = ["optic_sos"];

_rifleAir = ["CUP_smg_EVO"];
_rifleAir_Mags = "CUP_30Rnd_9x19_EVO";
_rifleAirAttRailIR = _rifleAttRailIR;
_rifleAirAttRailFL = _rifleAttRailFL;
_rifleAirAttMuzzle = ["muzzle_snds_l"];
_rifleAirAttBipod = [""];
_rifleAirAttScope = ["cup_optic_ac11704_black"];

_rifleAR = ["CUP_lmg_L7A2"];
_rifleAR_Mags = "150Rnd_762x51_Box_Tracer";
_rifleARAttRailIR = [""];
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = [""];
_rifleARAttBipod = [""];
_rifleARAttScope = ["optic_arco_ak_blk_f"];

_handGun = ["CUP_hgun_Deagle"];
_handGun_Mags = "CUP_7Rnd_50AE_Deagle";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = [""];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["CUP_launch_RPG7V"];
_launcher_MagAA = "CUP_PG7V_M";
_launcher_MagAT = "CUP_PG7VR_M";

_binocular = ["Rangefinder"];

//=====================================================================================
