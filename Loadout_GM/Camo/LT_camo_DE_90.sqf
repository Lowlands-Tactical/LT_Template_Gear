/*

File: LT_camo_DE_90.sqf
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Default gear
_unif = ["gm_ge_uniform_soldier_90_flk","gm_ge_uniform_soldier_rolled_90_flk"];
_vest = ["gm_ge_vest_90_rifleman_flk","gm_ge_vest_90_demolition_flk"];
_helm = ["gm_ge_headgear_m92_flk","gm_ge_headgear_m92_glasses_flk"];
	// Optioneel medic gear
_unifMedic = [""];
_vestMedic = ["gm_ge_vest_90_medic_flk"];
_helmMedic = [""];
	// NVG and goggles(faceware)
_nvgs = ["gm_ferod51_oli"];
_goggles = ["gm_xx_facewear_scarf_01_flk","gm_ge_facewear_dustglasses"];
	// Vehicle crew gear
_unifCrew = ["gm_ge_uniform_soldier_rolled_90_flk"];
_vestCrew = ["gm_ge_vest_90_crew_flk"];
_helmCrew = ["gm_xx_headgear_headwrap_crew_01_flk"];
	// Heli gear
_unifHeliP = ["gm_ge_army_uniform_pilot_oli","gm_ge_army_uniform_pilot_rolled_oli"];
_unifHeliC = _unifHeliP;
_vestHeli = ["gm_ge_army_vest_pilot_oli"];
_helmHeli = ["gm_ge_headgear_sph4_oli"];
	// Jet gear
_unifJet = _unifHeliP;
_helmJet = _helmHeli;
	// Backpacks
_backpackSmall = ["gm_ge_army_backpack_80_oli"];
_backpackLarge = ["gm_ge_army_backpack_90_flk"];
_backpackMedic = ["gm_ge_army_backpack_medic_80_oli"];
_backpackRadio = ["gm_ge_backpack_sem35_oli"];

//=====================================================================================
