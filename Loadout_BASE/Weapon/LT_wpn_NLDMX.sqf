/*

File: LT_wpn_NLDMX.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["NLD_MX"];
_rifleGL = ["NLD_MX_GL"];
_rifle_Mags	= "30Rnd_65x39_caseless_black_mag";
_rifle_Mags_Tr = "30Rnd_65x39_caseless_black_mag_Tracer";

_rifleCrew = ["NLD_MX_C"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["ace_acc_pointer_green"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["muzzle_snds_h_snd_f"];
_rifleAttBipod = ["cup_bipod_vltor_modpod","cup_bipod_harris_1a2_l"];
_rifleAttScope = ["ace_optic_arco_2d"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = ["NLD_MX_DMR"];
_rifleMark_Mags = _rifle_Mags_Tr;
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = _rifleAttMuzzle;
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = ["cup_optic_leupoldmk4"];

_rifleAir = _rifleCrew;
_rifleAir_Mags = _rifleGL;
_rifleAirAttRailIR = _rifleAttRailIR;
_rifleAirAttRailFL = _rifleAttRailFL;
_rifleAirAttMuzzle = _rifleAttMuzzle;
_rifleAirAttBipod = _rifleAttBipod;
_rifleAirAttScope = ["cup_optic_ac11704_tan"];

_rifleAR = ["NLD_MX_SW"];
_rifleAR_Mags = "100Rnd_65x39_caseless_black_mag_tracer";
_rifleARAttRailIR = _rifleAttRailIR;
_rifleARAttRailFL = _rifleAttRailFL;
_rifleARAttMuzzle = _rifleAttMuzzle;
_rifleARAttBipod = _rifleAttBipod;
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
