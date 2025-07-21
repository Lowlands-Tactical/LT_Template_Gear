/*

File: LT_wpn_AK15.sqf
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define type of weapons to use
_rifle = ["arifle_AK12_F"];
_rifleGL = ["arifle_AK12_GL_F"]; 
_rifle_Mags	= "30Rnd_762x39_AK12_Mag_F";
_rifle_Mags_Tr = "30Rnd_762x39_AK12_Mag_Tracer_F";

_rifleCrew = ["arifle_AK12U_F"];
_rifleCrew_Mags = _rifle_Mags;
_rifleCrew_Mags_Tr = _rifle_Mags_Tr;

_rifleAttRailIR = ["ace_acc_pointer_green"];
_rifleAttRailFL = ["acc_flashlight"];
_rifleAttMuzzle = ["ace_muzzle_mzls_b"];
_rifleAttBipod = ["bipod_01_f_blk"];
_rifleAttScope = ["optic_erco_blk_f"];

_itemsGL = ["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_itemsGLNVG = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"];

_rifleMark = ["srifle_DMR_05_blk_F"];
_rifleMark_Mags = "10Rnd_93x64_DMR_05_Mag";
_rifleMarkAttRailIR = _rifleAttRailIR;
_rifleMarkAttRailFL = _rifleAttRailFL;
_rifleMarkAttMuzzle = ["muzzle_snds_93mmg"];
_rifleMarkAttBipod = _rifleAttBipod;
_rifleMarkAttScope = ["ace_optic_sos_pip"];

_rifleAir = ["SMG_05_F"];
_rifleAir_Mags = "30Rnd_9x21_Mag_SMG_02";
_rifleAirAttRailIR = _rifleAttRailIR;
_rifleAirAttRailFL = _rifleAttRailFL;
_rifleAirAttMuzzle = ["muzzle_snds_l"];
_rifleAirAttBipod = [""];
_rifleAirAttScope = ["optic_aco_grn_smg"]; 

_rifleAR = ["arifle_RPK12_F"];
_rifleAR_Mags = "75rnd_762x39_AK12_Mag_F";
_rifleARAttRailIR = _rifleAttRailIR; 
_rifleARAttRailFL = _rifleAttRailFL;
_rifleARAttMuzzle = ["ace_muzzle_mzls_b"];
_rifleARAttBipod = [""];
_rifleARAttScope = ["optic_arco_blk_f"];

_handGun = ["hgun_Rook40_F"];
_handGun_Mags = "16Rnd_9x21_Mag";
_handGunAttRailIR = [""];
_handGunAttRailFL = [""];
_handGunAttMuzzle = ["muzzle_snds_l"];
_handGunAttBipod = [""];
_handGunAttScope = [""];

_launcher = ["launch_RPG32_green_F"];
_launcher_Mags = ["RPG32_HE_F","RPG32_F"];

_binocular = ["Laserdesignator_01_khk_F"];

//=====================================================================================
