/*

File: LT_wpn_colt.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["Weapon_C7NLD_nogrip"];
_rifleGL = ["Weapon_C7NLD_BaseGL"];
_rifle_Mags	= "30Rnd_556x45_Stanag";
_rifle_Mags_Tr = "30Rnd_556x45_Stanag_green";

_rifleCrew = ["Weapon_C8NLD_nogrip"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["Colt_Laser_Pointer_Tan"];
_rifleAttRailFL = ["Colt_Flashlight_Tan"];
_rifleAttMuzzle = ["Colt_Suppressor_Black"];
_rifleAttBipod = ["Colt_Grip"];
_rifleAttScope = ["Colt_Scope_Down"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = ["CUP_srifle_Mk12SPR"];
_rifleMark_Mags = _rifle_Mags_Tr;
_rifleMarkAttRailIR = ["ace_acc_pointer_green"];
_rifleMarkAttRailFL = ["cup_acc_flashlight"];
_rifleMarkAttMuzzle = ["cup_muzzle_snds_mk12"];
_rifleMarkAttBipod = ["cup_bipod_vltor_modpod_black"];
_rifleMarkAttScope = ["optic_sos"];

_rifleAir = ["CUP_smg_MP5SD6"];
_rifleAir_Mags = "CUP_30Rnd_Green_Tracer_9x19_MP5";
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = ["acc_flashlight_smg_01"];
_rifleAirAttMuzzle = ["muzzle_snds_acp"];
_rifleAirAttBipod = [""];
_rifleAirAttScope = ["cup_optic_ac11704_black"];

_rifleAR = ["CUP_lmg_L110A1"];
_rifleAR_Mags = "CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1";
_rifleARAttRailIR = ["ace_acc_pointer_green"];
_rifleARAttRailFL = ["cup_acc_flashlight"];
_rifleARAttMuzzle = ["ace_muzzle_mzls_b"];
_rifleARAttBipod = [""];
_rifleARAttScope = ["CUP_optic_aimm_microt1_blk"];

_handGun = ["NLD_Glock17"];
_handGun_Mags = "CUP_17Rnd_9x19_glock17";
_handGunAttRailIR = ["cup_acc_mlpls_laser"];
_handGunAttRailFL = ["acc_flashlight_pistol"];
_handGunAttMuzzle = ["muzzle_snds_L"];
_handGunAttBipod = [""];
_handGunAttScope = ["optic_MRD_black"];

_launcher = ["launch_NLAW_F"];
_launcher_MagAA = "";
_launcher_MagAT = "";

_binocular = ["Rangefinder"];

//=====================================================================================
