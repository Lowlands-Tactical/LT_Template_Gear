/*

File: LT_wpn_MACV_XM17Camo_SOG_.sqf
Tijdperk: VN
Author: PingWing

Description: XM-style wapens en M60, standaard voor MACV / special forces, met camouflage
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["vn_xm177_stock_camo"];
_rifleGL = ["vn_xm177_m203_camo"]; 
_rifle_Mags	= "vn_m16_30_mag";
_rifle_Mags_Tr = "vn_m16_30_t_mag";

_rifleCrew = ["vn_m45_camo"];
_rifleCrew_Mags = "vn_m45_mag";
_rifleCrew_Mags_Tr = "vn_m45_t_mag";

_rifleAttRailIR = [""];
_rifleAttRailFL = [""];
_rifleAttMuzzle = [""];
_rifleAttBipod = ["vn_bipod_m16"];
_rifleAttScope = [""];

_itemsGL = ["vn_40mm_m381_he_mag","vn_40mm_m680_smoke_w_mag","vn_40mm_m716_smoke_g_mag","vn_40mm_m715_smoke_r_mag"];
_itemsGLNVG = ["vn_40mm_m381_he_mag","vn_40mm_m583_flare_w_mag","vn_40mm_m583_flare_g_mag","vn_40mm_m583_flare_r_mag"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = ["vn_m16_camo"];
_rifleMark_Mags = "vn_m16_20_t_mag";
_rifleMarkAttRailIR = [""];
_rifleMarkAttRailFL = [""];
_rifleMarkAttMuzzle = [""];
_rifleMarkAttBipod = ["vn_bipod_m16"];
_rifleMarkAttScope = ["vn_o_9x_m16"];

_rifleAir = _rifleCrew;
_rifleAir_Mags = _rifleCrew_Mags;
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = [""];
_rifleAirAttMuzzle = [""];
_rifleAirAttBipod = _rifleAttBipod;
_rifleAirAttScope = [""]; 

_rifleAR = ["vn_m60_shorty_camo"];
_rifleAR_Mags = "vn_m60_100_mag";
_rifleARAttRailIR = [""]; 
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = [""];
_rifleARAttBipod = [""];
_rifleARAttScope = [""];

_handGun = ["vn_m1911"];
_handGun_Mags = "vn_m1911_mag";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = [""];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["vn_m72"];
_launcher_MagAA = "";
_launcher_MagAT = "";

_binocular = ["vn_m19_binocs_grey", "vn_m19_binocs_grn"];


//=====================================================================================
