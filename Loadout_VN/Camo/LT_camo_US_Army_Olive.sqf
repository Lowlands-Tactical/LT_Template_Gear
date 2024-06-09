/*
	
	File: LT_camo_US_Army_Olive.sqf
	Tijdperk: VN
	Author: R.Hoods
	
	Description: Standaard USA Gear, kleur olive/field.
	Reset player weapons set from mission parameters
	
*/

// =====================================================================================

// Define clothing that will be used
_unif = ["vn_b_uniform_macv_01_01","vn_b_uniform_macv_02_01","vn_b_uniform_macv_03_01","vn_b_uniform_macv_04_01","vn_b_uniform_macv_05_01","vn_b_uniform_macv_06_01"];
_vest = ["vn_b_vest_usarmy_02","vn_b_vest_usarmy_03","vn_b_vest_usarmy_04","vn_b_vest_usarmy_05","vn_b_vest_usarmy_08","vn_b_vest_usarmy_09"];
_helm = ["vn_b_helmet_m1_05_01","vn_b_helmet_m1_06_01","vn_b_helmet_m1_19_01","vn_b_helmet_m1_16_01", "vn_b_helmet_m1_15_01","vn_b_bandana_01"];
// Optioneel medic kleding
_unifMedic = [""];
_vestMedic = ["vn_b_vest_usarmy_07"];
_helmMedic = ["vn_b_helmet_m1_07_01", "vn_b_helmet_m1_18_01"];

_nvgs = [""];
_goggles = ["vn_none","vn_b_aviator","vn_b_acc_rag_02","vn_b_acc_towel_01","vn_b_scarf_01_03","vn_b_scarf_01_01"];

_unifCrew = ["vn_b_uniform_macv_01_01"];
_vestCrew = ["vn_b_vest_usarmy_14"];
_helmCrew = ["vn_b_helmet_t56_01_01","vn_b_helmet_t56_01_02","vn_b_helmet_t56_01_03","vn_b_helmet_t56_02_01","vn_b_helmet_t56_02_02","vn_b_helmet_t56_02_03"];

_unifHeliP = ["vn_b_uniform_k2b_02_01","vn_b_uniform_k2b_02_02"];
_unifHeliC = ["vn_b_uniform_k2b_02_01","vn_b_uniform_k2b_02_02"];
_vestHeli = ["vn_b_vest_aircrew_05"];
_helmHeli = ["vn_b_helmet_svh4_01_01","vn_b_helmet_svh4_01_04","vn_b_helmet_svh4_01_06","vn_b_helmet_svh4_01_03"];

_unifJet = ["vn_b_uniform_k2b_01_02"];
_helmJet = ["vn_b_helmet_aph6_01_01","vn_b_helmet_aph6_01_02","vn_b_helmet_aph6_01_03","vn_b_helmet_aph6_01_04","vn_b_helmet_aph6_01_05"];

_backpackSmall = ["vn_b_pack_lw_01_m16_pl"];
_backpackLarge = ["vn_b_pack_lw_04"];
_backpackMedic = ["vn_b_pack_lw_07"];
_backpackRadio = ["vn_b_pack_prc77_01"];

// =====================================================================================