/*

File: LT_wpn_CUSTOM.sqf
Tijdperl: 
Author: Brainless_Ben

Description:
ERROR when customFile is not found in mission fallback to this

*/

_errorMismatch = "[LT] (customWeapon) Mission has no Scripts\customWeapon.sqf fallback applied";
Diag_log _errorMismatch;
systemChat _errorMismatch;
[_errorMismatch] remoteExec ["globalChat", 2];

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

_binocular = ["Camera_lxWS"];

//=====================================================================================
