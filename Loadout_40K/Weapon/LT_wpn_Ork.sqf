/*

File: LT_wpn_Ork.sqf
Tijdperl: Warhammer 40K
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["Ork_Shoota_1","Ork_Shoota_2","Ork_Shoota_3","Shoota2"];
_rifleGL = ["Shoota1_A"]; 
_rifle_Mags	= "ShootaMag";
_rifle_Mags_Tr = "TIOW_ShootaMag";

_rifleCrew = _rifle;
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = [""];
_rifleAttRailFL = ["TIOW_M36_flashlight"];
_rifleAttMuzzle = [""];
_rifleAttBipod = [""];
_rifleAttScope = ["TIOW_2x4xScope_1"];

_itemsGL = ["KannonHEMag","KannonAPMag","",""];
_itemsGLNVG = ["KannonHEMag","KannonAPMag","",""];

_rifleMark = ["Ork_Speshul_01_BA"];
_rifleMark_Mags = "2rnd_AP_speshul_mag";;
_rifleMarkAttRailIR = [""];
_rifleMarkAttRailFL = [""];
_rifleMarkAttMuzzle = [""];
_rifleMarkAttBipod = [""];
_rifleMarkAttScope = [""];

_rifleAir = ["Ork_Burna_01_BA"];
_rifleAir_Mags = "300rnd_burna_mag";
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = [""];
_rifleAirAttMuzzle = [""];
_rifleAirAttBipod = [""];
_rifleAirAttScope = [""];

_rifleAR = ["Ork_SnazzGun_01_F"];
_rifleAR_Mags = "Ork_SnazzGun_01_F";
_rifleARAttRailIR = [""];
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = [""];
_rifleARAttBipod = [""];
_rifleARAttScope = [""];

_handGun = ["WBK_ork_axe_1","WBK_ork_axe_2","WBK_ork_BigChoppa","WBK_ork_Choppa"];
_handGun_Mags = "";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = [""];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["DKOK_Mole_Launcher_1"];
_launcher_Mags = ["Mol_AT_Mag","Mol_HE_Mag"];

_launcherAA = ["IC_Launcher_AA_grey"];
_launcherAA_Mags = ["IC_Flak_Missile_mag"];

_heavyAR = ["ICP_LMG_01_imp"];
_heavyAR_Mags = "ic_100rnd_825_HP_Tracer_rifleMag";

_binocular = [""];

//=====================================================================================
