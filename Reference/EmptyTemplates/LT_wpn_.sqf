/*

File: LT_wpn_.sqf
Tijdperk: GM
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = [""];
_rifleGL = [""]; 
_rifle_Mags	= "";
_rifle_Mags_Tr = "";

_rifleCrew = [""];
_rifleCrew_Mags = "";
_rifleCrew_Mags_Tr = "";

_rifleAttRailIR = [""];
_rifleAttRailFL = [""];
_rifleAttMuzzle = [""];
_rifleAttBipod = [""];
_rifleAttScope = [""];

_itemsGL = ["","","",""];
_itemsGLNVG = ["","","",""];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = [""];
_rifleMark_Mags = "";
_rifleMarkAttRailIR = [""];
_rifleMarkAttRailFL = [""];
_rifleMarkAttMuzzle = [""];
_rifleMarkAttBipod = [""];
_rifleMarkAttScope = [""];

_rifleAir = [""];
_rifleAir_Mags = "";
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = [""];
_rifleAirAttMuzzle = [""];
_rifleAirAttBipod = [""];
_rifleAirAttScope = [""]; 

_rifleAR = [""];
_rifleAR_Mags = "";
_rifleARAttRailIR = [""]; 
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = [""];
_rifleARAttBipod = [""];
_rifleARAttScope = [""];

_handGun = [""];
_handGun_Mags = "";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = [""];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = [""];
_launcher_MagAA = "";
_launcher_MagAT = "";

_binocular = [""];

//=====================================================================================
