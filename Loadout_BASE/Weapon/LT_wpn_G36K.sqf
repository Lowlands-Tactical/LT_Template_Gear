/*

File: LT_wpn_G36K.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

_rifle = ["arifle_G36_F"];
_rifleGL = ["arifle_G36_GL_F"];
_rifle_Mags	= "30Rnd_65x39_caseless_msbs_mag";
_rifle_Mags_Tr = "30Rnd_65x39_caseless_msbs_mag_Tracer";

_rifleCrew = ["arifle_G36C_F"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["JCA_acc_LaserModule_black_Pointer"];
_rifleAttRailFL = ["saber_light_lxWS"];
_rifleAttMuzzle = ["hlc_muzzle_FSC30"];
_rifleAttBipod = ["JCA_bipod_04_black"];
_rifleAttScope = ["JCA_optic_AHO_black"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];

_rifleMark = _rifle;
_rifleMark_Mags = _rifle_Mags_Tr;
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = _rifleAttMuzzle;
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = _rifleAttScope;

_rifleAir = _rifleCrew;
_rifleAir_Mags = _rifle_Mags_Tr;
_rifleAirAttRailIR = _rifleAttRailIR;
_rifleAirAttRailFL = _rifleAttRailFL;
_rifleAirAttMuzzle = _rifleAttMuzzle;
_rifleAirAttBipod = _rifleAttBipod;
_rifleAirAttScope = _rifleAttScope;

_rifleAR = ["hlc_rifle_G36V"];
_rifleAR_Mags = "hlc_100rnd_556x45_M_G36";
_rifleARAttRailIR = ["JCA_acc_LaserModule_black_Pointer"];
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = ["hlc_muzzle_E1_FlashHider"];
_rifleARAttBipod = [""];
_rifleARAttScope = ["JCA_optic_MROS_black"];

_handGun = ["hgun_G17_black_F"];
_handGun_Mags = "17Rnd_9x21_Mag";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = ["muzzle_snds_L"];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["gm_pzf3_blk"];
_launcher_Mags = ["gm_1Rnd_60mm_heat_dm22_pzf3","gm_1Rnd_60mm_heat_dm32_pzf3"];

//=====================================================================================
