/*

File: LT_wpn_NLD80.sqf
Author: Shiftysean

Description:
Nederlandse landmacht in de jaren 80, gebruik van FAL en uzi's.
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["arifle_SLR_V_lxW"];
_rifleGL = ["arifle_SLR_V_GL_lxWS"]; 
_rifle_Mags	= "20Rnd_762x51_slr_lxWS";
_rifle_Mags_Tr = "20Rnd_762x51_slr_reload_tracer_green_lxWS";

_rifleCrew = ["gm_mp2a1_blk"];
_rifleCrew_Mags = "gm_32Rnd_9x19mm_B_DM51_mp2_blk";
_rifleCrew_Mags_Tr = _rifleCrew_Mags;

_rifleAttRailIR = [""];
_rifleAttRailFL = [""];
_rifleAttMuzzle = [""];
_rifleAttBipod = [""];
_rifleAttScope = [""];

_itemsGL = ["1Rnd_40mm_HE_lxWS","1Rnd_58mm_AT_lxWS","1Rnd_50mm_Smoke_lxWS"];
_itemsGLNVG = ["1Rnd_40mm_HE_lxWS","1Rnd_58mm_AT_lxWS","1Rnd_50mm_Smoke_lxWS"];
_itemsGLAmt	= [8,8,6];

_rifleMark = ["arifle_SLR_V_lxW"];
_rifleMark_Mags = "20Rnd_762x51_slr_lxWS";
_rifleMarkAttRailIR = [""];
_rifleMarkAttRailFL = [""];
_rifleMarkAttMuzzle = [""];
_rifleMarkAttBipod = [""];
_rifleMarkAttScope = ["gm_feroz24_ris_blk"];

_rifleAir = ["gm_mp2a1_blk"];
_rifleAir_Mags = "gm_32Rnd_9x19mm_B_DM51_mp2_blk";
_rifleAirAttRailIR = [""];
_rifleAirAttRailFL = [""];
_rifleAirAttMuzzle = [""];
_rifleAirAttBipod = [""];
_rifleAirAttScope = [""]; 

_rifleAR = ["CUP_lmg_FNMAG"];
_rifleAR_Mags = "150Rnd_762x51_Box";
_rifleARAttRailIR = [""]; 
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = [""];
_rifleARAttBipod = [""];
_rifleARAttScope = [""];

_handGun = ["CUP_hgun_Colt1911"];
_handGun_Mags = "CUP_7Rnd_45ACP_1911";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = [""];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["gm_m72a3_oli"];
_launcher_MagAA = "";
_launcher_MagAT = "";

_binocular = ["gm_ferod16_oli"];

//=====================================================================================