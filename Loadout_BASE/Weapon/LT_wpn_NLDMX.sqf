/*

File: LT_wpn_NLDMX.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["arifle_NAF_MX_SF"];
_rifleGL = ["arifle_NAF_MX_GL_SF"];
_rifle_Mags	= "30Rnd_65x39_caseless_black_mag";
_rifle_Mags_Tr = "30Rnd_65x39_caseless_black_mag_Tracer";

_rifleCrew = ["arifle_NAF_MXC_SF"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["ace_acc_pointer_green"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["muzzle_snds_h_snd_f"];
_rifleAttBipod = ["bipod_02_F_blk"];
_rifleAttScope = ["rhsusf_acc_g33_xps3_tan"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = ["arifle_NAF_MXM_SF"];
_rifleMark_Mags = _rifle_Mags_Tr;
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = _rifleAttMuzzle;
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = ["optic_Hamr"];

_rifleAir = ["arifle_NAF_MXC_SF"];
_rifleAir_Mags = _rifle_Mags_Tr;
_rifleAirAttRailIR = _rifleAttRailIR;
_rifleAirAttRailFL = _rifleAttRailFL;
_rifleAirAttMuzzle = _rifleAttMuzzle;
_rifleAirAttBipod = _rifleAttBipod;
_rifleAirAttScope = _rifleAttScope;

_rifleAR = ["arifle_NAF_MX_AR_SF"];
_rifleAR_Mags = "100Rnd_65x39_caseless_black_mag_tracer";
_rifleARAttRailIR = _rifleAttRailIR;
_rifleARAttRailFL = _rifleAttRailFL;
_rifleARAttMuzzle = _rifleAttMuzzle;
_rifleARAttBipod = _rifleAttBipod;
_rifleARAttScope = _rifleAttScope;

_handGun = ["hgun_G17_black_F"];
_handGun_Mags = "17Rnd_9x21_Mag";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = ["muzzle_snds_L"];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["launch_NLAW_F"];
_launcher_MagAA = "";
_launcher_MagAT = "";

_binocular = ["Rangefinder"];

//=====================================================================================
