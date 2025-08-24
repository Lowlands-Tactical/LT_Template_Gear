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
_rifleAttMuzzle = ["gm_suppressor_atec150_556mm_blk"];
_rifleAttBipod = [""];
_rifleAttScope = ["gm_c79a1_blk"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];
_itemsGLAmt	= [8,6,4,4];

_rifleMark = _rifle;
_rifleMark_Mags = _rifle_Mags;
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

_rifleAR = ["LMG_S77_lxWS"];
_rifleAR_Mags = "100Rnd_762x51_S77_Green_lxWS";
_rifleARAttRailIR = [""]; 
_rifleARAttRailFL = [""];
_rifleARAttMuzzle = [""];
_rifleARAttBipod = [""];
_rifleARAttScope = [""];

_handGun = ["hgun_ACPC2_black_F"];
_handGun_Mags = "9Rnd_45ACP_Mag";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = [""];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["gm_pzf84_win_feroz2x17"];
_launcher_Mags = ["gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf"];

_launcherAA = ["gm_fim43_oli"];
_launcherAA_Mags = ["gm_1Rnd_70mm_he_m585_fim43","Titan_AA"];

_heavyAR = ["gm_lmgm62_blk"];
_heavyAR_Mags = "gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn";

_binocular = ["gm_ferod16_oli"];

//=====================================================================================