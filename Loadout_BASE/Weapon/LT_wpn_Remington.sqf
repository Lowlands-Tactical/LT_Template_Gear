/*

File: LT_wpn_Remington.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

_rifle = ["hlc_rifle_ACR_MID_black"];
_rifleGL = ["hlc_rifle_ACR_GL_mid_black"];
_rifle_Mags	= "hlc_30rnd_Paracord_556x45_EPR";
_rifle_Mags_Tr = "hlc_30rnd_Paracord_556x45_M";

_rifleCrew = ["hlc_rifle_ACR_Carb_black"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["JCA_acc_LaserModule_black_Pointer"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["hlc_muzzle_SF3P_556"];
_rifleAttBipod = ["hlc_grip_PMVFG_Black"];
_rifleAttScope = ["JCA_optic_MROS_black_magnifier"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];

_rifleMark = ["hlc_rifle_ACR_full_black"];
_rifleMark_Mags = _rifle_Mags_Tr;
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = _rifleAttMuzzle;
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = ["JCA_optic_AICO_black"];

_rifleAir = ["hlc_rifle_ACR_SBR_black"];
_rifleAir_Mags = _rifle_Mags_Tr;
_rifleAirAttRailIR = _rifleAttRailIR;
_rifleAirAttRailFL = _rifleAttRailFL;
_rifleAirAttMuzzle = _rifleAttMuzzle;
_rifleAirAttBipod = _rifleAttBipod;
_rifleAirAttScope = _rifleAttScope;

_rifleAR = ["hlc_lmg_M60E4"];
_rifleAR_Mags = "hlc_200Rnd_762x51_M_M60E4";
_rifleARAttRailIR = ["hlc_acc_AIM1D_Generic"];
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = [""];
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
