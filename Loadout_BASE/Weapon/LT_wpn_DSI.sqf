/*

File: LT_wpn_DSI.sqf
Tijdperl: Heden
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["rhs_weap_hk416d145"];
_rifleGL = ["rhs_weap_hk416d145_m320"];
_rifle_Mags	= "30Rnd_556x45_Stanag";
_rifle_Mags_Tr = "30Rnd_556x45_Stanag_green";

_rifleCrew = ["rhs_weap_hk416d10"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["Aegis_acc_pointer_DM"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["JCA_muzzle_snds_556_advanced_black"];
_rifleAttBipod = ["hlc_grip_PMVFG_Black"];
_rifleAttScope = ["hlc_optic_HensoldtZO_lo_Docter_2D"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = ["hlc_rifle_416D20"];
_rifleMark_Mags = _rifle_Mags_Tr;
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = _rifleAttMuzzle;
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = ["JCA_optic_AICO_black"];

_rifleAir = ["hlc_smg_mp5sd6"];
_rifleAir_Mags = "hlc_30Rnd_9x19_B_MP5";
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = [""];
_rifleAirAttMuzzle = [""];
_rifleAirAttBipod = [""];
_rifleAirAttScope = ["rhsusf_acc_eotech_xps3"];

_rifleAR = ["hlc_lmg_mk48mod1"];
_rifleAR_Mags = "hlc_200Rnd_762x51_M_M60E4";
_rifleARAttRailIR = ["rhsusf_acc_anpeq15side_bk"];
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = ["hlc_muzzle_A1_FlashHider"];
_rifleARAttBipod = [""];
_rifleARAttScope = ["rhsusf_acc_eotech_xps3"];

_handGun = ["hlc_pistol_P226R_40Elite"];
_handGun_Mags = "hlc_12Rnd_40sw_JHP_P226";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = [""];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["Atlas_Launch_Pzf3_F"];
_launcher_Mags = ["Atlas_DM32_HEAT_MP_F","Atlas_DM22_HEAT_F"];

_binocular = ["Rangefinder"];

//=====================================================================================
