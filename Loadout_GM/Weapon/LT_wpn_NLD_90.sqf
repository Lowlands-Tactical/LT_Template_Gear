/*

File: LT_wpn_NLD90.sqf
Author: Shiftysean		

Description:
Nederlandse landmacht halverwege de jaren 90, gebruik van Diemaco's.
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["gm_c7a1_blk"];
_rifleGL = [""]; 
_rifle_Mags	= "gm_30Rnd_556x45mm_B_M855_stanag_gry";
_rifle_Mags_Tr = "gm_30Rnd_556x45mm_B_T_M856_stanag_gry";

_rifleCrew = ["gm_mp2a1_blk"];
_rifleCrew_Mags = "gm_32Rnd_9x19mm_B_DM51_mp2_blk";
_rifleCrew_Mags_Tr = _rifleCrew_Mags;

_rifleAttRailIR = [""];
_rifleAttRailFL = [""];
_rifleAttMuzzle = [""];
_rifleAttBipod = [""];
_rifleAttScope = ["gm_c79a1_blk"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = ["gm_c7a1_blk"];
_rifleMark_Mags = "gm_30Rnd_556x45mm_B_T_M856_stanag_gry";
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

_launcher = ["gm_pzf84_oli"];
_launcher_MagAA = "";
_launcher_MagAT = "gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf";

_binocular = ["gm_ferod16_oli"];

//=====================================================================================