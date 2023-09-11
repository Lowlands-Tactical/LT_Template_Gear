/*

File: LT_wpn_Mk17_Mk16.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["CUP_arifle_Mk17_STD_black"];
_rifleGL = ["CUP_arifle_Mk17_STD_EGLM"];
_rifle_Mags	= "CUP_20Rnd_762x51_B_SCAR";
_rifle_Mags_Tr = "CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR";

_rifleCrew = ["CUP_arifle_Mk16_STD_black"];
_rifleCrew_Mags = "CUP_30Rnd_556x45_Stanag";
_rifleCrew_Mags_Tr = "30Rnd_556x45_Stanag_Tracer_Red";

_rifleAttRailIR = ["acc_pointer_IR"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["muzzle_snds_M"];
_rifleAttBipod = ["bipod_01_F_blk","bipod_02_F_blk","bipod_03_F_blk"];
_rifleAttScope = ["CUP_optic_CompM2_Black"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = ["CUP_srifle_Mk18_blk"];
_rifleMark_Mags = "ace_20Rnd_762x51_Mag_tracer_green";
_rifleMarkAttRailIR = ["ace_acc_pointer_green"];
_rifleMarkAttRailFL = ["cup_acc_flashlight"];
_rifleMarkAttMuzzle = ["muzzle_snds_b"];
_rifleMarkAttBipod = ["cup_bipod_vltor_modpod_black"];
_rifleMarkAttScope = ["optic_sos"];

_rifleAir = ["CUP_smg_EVO"];
_rifleAir_Mags = "CUP_30Rnd_9x19_EVO";
_rifleAirAttRailIR = _rifleAttRailIR;
_rifleAirAttRailFL = _rifleAttRailFL;
_rifleAirAttMuzzle = ["muzzle_snds_l"];
_rifleAirAttBipod = [""];
_rifleAirAttScope = ["cup_optic_ac11704_black"];

_rifleAR = ["CUP_lmg_m249_pip4"];
_rifleAR_Mags = "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";
_rifleARAttRailIR = ["CUP_acc_ANPEQ_15_Black"];
_rifleARAttRailFL = ["cup_acc_flashlight"];
_rifleARAttMuzzle = [""];
_rifleARAttBipod = [""];
_rifleARAttScope = ["CUP_optic_aimm_microt1_blk"];

_handGun = ["CUP_hgun_M9"];
_handGun_Mags = "CUP_15Rnd_9x19_M9";
_handGunAttRailIR = ["cup_acc_mlpls_laser"];
_handGunAttRailFL = ["acc_flashlight_pistol"];
_handGunAttMuzzle = ["muzzle_snds_L"];
_handGunAttBipod = [""];
_handGunAttScope = ["optic_MRD_black"];

_launcher = ["CUP_launch_Mk153Mod0"];
_launcher_MagAA = "CUP_SMAW_HEAA_M";
_launcher_MagAT = "CUP_SMAW_HEDP_M";

_binocular = ["ace_Vector"];

//=====================================================================================
