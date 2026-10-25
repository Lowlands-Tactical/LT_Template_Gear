/*

File: LT_wpn_CUSTOM.sqf
Tijdperl: 
Author: Brainless_Ben

Description:
ERROR when customFile is not found in mission fallback to this

*/

["customWeapon","Mission has no Scripts\customWeapon.sqf fallback applied",3] call LT_fnc_log;

//=====================================================================================

// Define type of weapons to use
_rifle = ["arifle_SDAR_F"];
_rifleGL = _rifle; 
_rifle_Mags	= "30Rnd_556x45_Stanag";
_rifle_Mags_Tr = "30Rnd_556x45_Stanag_red";

_rifleCrew = ["SMG_02_F"];
_rifleCrew_Mags = "30Rnd_9x21_Mag_SMG_02";
_rifleCrew_Mags_Tr = "30Rnd_9x21_Mag_SMG_02_Tracer_Red";

_rifleAttRailIR = [""];
_rifleAttRailFL = [""];
_rifleAttMuzzle = [""];
_rifleAttBipod = [""];
_rifleAttScope = [""];

_itemsGL = ["","","",""];
_itemsGLNVG = ["","","",""];

_rifleMark = ["srifle_GM6_F"];
_rifleMark_Mags = "5Rnd_127x108_Mag";
_rifleMarkAttRailIR = [""];
_rifleMarkAttRailFL = [""];
_rifleMarkAttMuzzle = [""];
_rifleMarkAttBipod = [""];
_rifleMarkAttScope = [""];

_rifleAir = ["SMG_01_F"];
_rifleAir_Mags = "30Rnd_45ACP_Mag_SMG_01";
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = [""];
_rifleAirAttMuzzle = [""];
_rifleAirAttBipod = [""];
_rifleAirAttScope = [""]; 

_rifleAR = ["LMG_Mk200_F"];
_rifleAR_Mags = "200Rnd_65x39_cased_Box";
_rifleARAttRailIR = [""]; 
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = [""];
_rifleARAttBipod = [""];
_rifleARAttScope = [""];

_handGun = ["hgun_ACPC2_F"];
_handGun_Mags = "9Rnd_45ACP_Mag";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = [""];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["launch_NLAW_F"];
_launcher_Mags = [""];

_launcherAA = "";
_launcherAA_Mags = "";

_mmg = "";
_mmg_Mag = "";
_mmg_Scope = "";

_mat = "";
_mat_Mags = [""];

_binocular = ["Camera_lxWS"];

//=====================================================================================
