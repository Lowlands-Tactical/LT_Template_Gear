/*

File: LT_wpn_Guard.sqf
Tijdperl: Warhammer 40K
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["ICP_Rifle_Kantrael_green"];
_rifleGL = ["ICP_Rifle_Kantrael_green"]; 
_rifle_Mags	= "ic_las_powerpack";
_rifle_Mags_Tr = "ic_las_powerpack_ext";

_rifleCrew = ["ICP_Rifle_Voss_green"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = [""];
_rifleAttRailFL = [""];
_rifleAttMuzzle = ["IC_bayonet_01"];
_rifleAttBipod = [""];
_rifleAttScope = ["ic_las_optic_2x"];

_itemsGL = ["TIOW_IG_GL_Frag_mag","TIOW_IG_GL_Krak_mag","TIOW_IG_GL_Flame_mag","TIOW_IG_GL_Smoke_mag"];
_itemsGLNVG = ["TIOW_IG_GL_Frag_mag","TIOW_IG_GL_Krak_mag","TIOW_IG_GL_Flame_mag","TIOW_IG_GL_Flare_mag"];

_rifleMark = ["TIOW_LongLas_776"];
_rifleMark_Mags = "TIOW_LongLas_Mag";;
_rifleMarkAttRailIR = [""];
_rifleMarkAttRailFL = [""];
_rifleMarkAttMuzzle = [""];
_rifleMarkAttBipod = [""];
_rifleMarkAttScope = [""];

_rifleAir = ["ic_PlasmaGun"];
_rifleAir_Mags = "ic_plasma_canister";
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = [""];
_rifleAirAttMuzzle = [""];
_rifleAirAttBipod = [""];
_rifleAirAttScope = [""];

_rifleAR = ["ICP_LMG_01_imp"];
_rifleAR_Mags = "ic_100rnd_825_HP_Tracer_rifleMag";
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

_launcher = ["IC_CAD_Rocketlauncher_base"];
_launcher_Mags = ["IC_Frag_rocket_mag","IC_Krak_rocket_mag"];

_binocular = ["ic_cad_magnoculars"];

//=====================================================================================
