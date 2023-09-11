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
_itemsGLAmt	= [8,6,4,4];

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
_rifleAirAttScope = ["cup_optic_ac11704_black"];

_rifleAR = ["CUP_lmg_Mk48","CUP_lmg_Mk48_od","CUP_lmg_Mk48_wdl"];
_rifleAR_Mags = "150Rnd_762x51_Box_Tracer";
_rifleARAttRailIR = _rifleAttRailIR;
_rifleARAttRailFL = ["CUP_acc_flashlight"];
_rifleARAttMuzzle = ["ace_muzzle_mzls_b"];
_rifleARAttBipod = [""];
_rifleARAttScope = ["CUP_optic_aimm_microt1_blk"];

_handGun = ["NLD_Glock17"];
_handGun_Mags = "CUP_17Rnd_9x19_glock17";
_handGunAttRailIR = [""];
_handGunAttRailFL = ["acc_flashlight_pistol"];
_handGunAttMuzzle = ["muzzle_snds_L"];
_handGunAttBipod = [""];
_handGunAttScope = ["optic_MRD_black"];

_launcher = ["launch_NLAW_F"];
_launcher_MagAA = "";
_launcher_MagAT = "";

_binocular = ["Rangefinder"];

//=====================================================================================
