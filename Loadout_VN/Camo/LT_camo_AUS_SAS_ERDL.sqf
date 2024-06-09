/*
	
	File: LT_camo_AUSandNZ_SAS_ERDL_SOG.sqf
	Tijdperk: VN
	Author: R.Hoods
	
	Description: Australie en New Zeeland SAS gear, kleur ERDL.
	Reset player weapons set from mission parameters
	
*/

// =====================================================================================

// Define clothing that will be used
_unif = ["vn_b_uniform_sas_01_06","vn_b_uniform_sas_02_06","vn_b_uniform_sas_03_06"];
_vest = ["vn_b_vest_sas_03","vn_b_vest_sas_04"];
_helm = ["vn_b_bandana_08","vn_b_boonie_04_08","vn_b_boonie_05_08","vn_b_boonie_01_08","vn_b_headband_08"];
// Optioneel medic kleding
_unifMedic = [""];
_vestMedic = ["vn_b_vest_sas_01"];
_helmMedic = ["vn_b_boonie_02_08"];

_nvgs = [""];
_goggles = [""];

_unifCrew = ["vn_b_uniform_aus_01_01"];
_vestCrew = ["vn_b_vest_anzac_09"];
_helmCrew = ["vn_b_helmet_t56_01_01","vn_b_helmet_t56_02_01"];

_unifHeliP = ["vn_b_uniform_heli_01_01"];
_unifHeliC = ["vn_b_uniform_k2b_03_01"];
_vestHeli = ["vn_b_vest_aircrew_05"];
_helmHeli = ["vn_b_helmet_svh4_02_04"];

_unifJet = ["vn_b_uniform_k2b_01_02"];
_helmJet = ["vn_b_helmet_aph6_01_01"];

_backpackSmall = ["vn_b_pack_trp_03_eng_m16_xm148_pl"];
_backpackLarge = ["vn_b_pack_p44_01_l2a1_pl"];
_backpackMedic = ["vn_b_pack_p44_01_medic_l1a1_pl"];
_backpackRadio = ["vn_b_pack_trp_04_m16_pl"];

// =====================================================================================
