/*

File: LT_wpn_Cad700th.sqf
Tijdperl: Warhammer 40K
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["M36KantRifle700"];
_rifleGL = ["M36KantRifle700"]; 
_rifle_Mags	= "M36KantRifle_mag";
_rifle_Mags_Tr = "M36KantRifle_mag";

_rifleCrew = ["ICP_Rifle_Voss_green"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = [""];
_rifleAttRailFL = ["TIOW_M36_flashlight"];
_rifleAttMuzzle = [""];
_rifleAttBipod = [""];
_rifleAttScope = ["TIOW_2x4xScope_1"];

_itemsGL = ["TIOW_IG_GL_Frag_mag","TIOW_IG_GL_Krak_mag","TIOW_IG_GL_Flame_mag","TIOW_IG_GL_Smoke_mag"];
_itemsGLNVG = ["TIOW_IG_GL_Frag_mag","TIOW_IG_GL_Krak_mag","TIOW_IG_GL_Flame_mag","TIOW_IG_GL_Flare_mag"];

_rifleMark = ["TIOW_LongLas_700"];
_rifleMark_Mags = "TIOW_LongLas_Mag";;
_rifleMarkAttRailIR = [""];
_rifleMarkAttRailFL = [""];
_rifleMarkAttMuzzle = [""];
_rifleMarkAttBipod = [""];
_rifleMarkAttScope = [""];

_rifleAir = ["TIOW_IG_Flamer"];
_rifleAir_Mags = "TIOW_CadianHellgun_Mag";
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = [""];
_rifleAirAttMuzzle = [""];
_rifleAirAttBipod = [""];
_rifleAirAttScope = [""];

_rifleAR = ["TIOW_CadianHellgun"];
_rifleAR_Mags = "TIOW_CadianHellgun_Mag";
_rifleARAttRailIR = [""];
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = [""];
_rifleARAttBipod = [""];
_rifleARAttScope = [""];

_handGun = ["WBK_PowerSword_1","WBK_HumanChainsword_1","Shovel_Russian_Rotated"];
_handGun_Mags = "";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = [""];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["IC_Launcher_AT_grey"];
_launcher_Mags = ["IC_frag_Missile_mag","IC_krakk_Missile_mag"];

_launcherAA = ["IC_Launcher_AA_grey"];
_launcherAA_Mags = ["IC_Flak_Missile_mag"];

_heavyAR = ["ICP_LMG_01_imp"];
_heavyAR_Mags = "ic_100rnd_825_HP_Tracer_rifleMag";

_binocular = ["ic_cad_magnoculars"];

//=====================================================================================
