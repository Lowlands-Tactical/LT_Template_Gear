/*

File: LT_wpn_Cultist.sqf
Tijdperl: Warhammer 40K
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["AgripinaaAutoChaos","AgripinaaAutoChaos2","AgripinaaAutoChaos3"];
_rifleGL = ["AgripinaaAutoChaosgl","AgripinaaAutoChaos2gl","AgripinaaAutoChaos3gl"]; 
_rifle_Mags	= "30Rnd_Agrip_mag";
_rifle_Mags_Tr = "30Rnd_Agrip_mag_Tracer";

_rifleCrew = _rifle;
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = [""];
_rifleAttRailFL = ["TIOW_M36_flashlight"];
_rifleAttMuzzle = [""];
_rifleAttBipod = [""];
_rifleAttScope = ["TIOW_2x4xScope_1"];

_itemsGL = ["TIOW_1Rnd_HE_Grenade_shell","TIOW_1Rnd_HE_Grenade_shell","",""];
_itemsGLNVG = ["TIOW_1Rnd_HE_Grenade_shell","TIOW_1Rnd_HE_Grenade_shell","",""];

_rifleMark = ["TIOW_Chaos_Shotgun"];
_rifleMark_Mags = "TIOW_Shotgun_pellets_mag";;
_rifleMarkAttRailIR = [""];
_rifleMarkAttRailFL = [""];
_rifleMarkAttMuzzle = [""];
_rifleMarkAttBipod = [""];
_rifleMarkAttScope = [""];

_rifleAir = ["TIOW_Chaos_Flamer"];
_rifleAir_Mags = "TIOW_Chaos_Flamer_mag";
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

_handGun = ["WBK_Chaos_Blade_3","WBK_ChaosBlade","WBK_Khopesh"];
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

_binocular = ["ic_cad_magnoculars"];

//=====================================================================================
