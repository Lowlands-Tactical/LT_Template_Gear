/*

File: LT_camo_MACVDark.sqf
Tijdperk: VN
Author: PingWing

Description: MACV loadout, voor nacht-gebruik.
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define clothing that will be used
_unif = ["vn_b_uniform_sog_02_03", "vn_b_uniform_sog_01_03", "vn_b_uniform_sog_02_06", "vn_b_uniform_sog_01_06"];
_vest = ["vn_b_vest_sog_01", "vn_b_vest_sog_06", "vn_b_vest_sog_04"];
_helm = ["vn_b_bandana_03", "vn_b_boonie_02_03", "vn_b_boonie_02_09", "vn_b_boonie_03_03", "vn_b_boonie_03_09",  "vn_b_boonie_04_03", "vn_b_boonie_04_09",  "vn_b_boonie_05_03", "vn_b_boonie_05_09", "vn_b_boonie_01_03", "vn_b_boonie_01_09"];
	//Optioneel medic kleding
_unifMedic = [""];
_vestMedic = [""];
_helmMedic = [""];

_nvgs = [""];
_goggles = [""];

_unifCrew = ["vn_b_uniform_macv_01_01"];
_vestCrew = ["vn_b_vest_usarmy_14"];
_helmCrew = ["vn_b_helmet_t56_01_01", "vn_b_helmet_t56_02_01", "vn_b_helmet_t56_02_02"];

_unifHeliP = ["vn_b_uniform_heli_01_01"];
_unifHeliC = ["vn_b_uniform_heli_01_01"];
_vestHeli = ["vn_b_vest_aircrew_05"];
_helmHeli = ["vn_b_helmet_svh4_02_01", "vn_b_helmet_svh4_01_01", "vn_b_helmet_svh4_02_04", "vn_b_helmet_svh4_01_04", "vn_b_helmet_svh4_01_06", "vn_b_helmet_svh4_02_06"];

_unifJet = ["vn_b_uniform_k2b_01_01", "vn_b_uniform_k2b_01_02"];
_helmJet = ["vn_b_helmet_aph6_02_02", "vn_b_helmet_aph6_02_05", "vn_b_helmet_aph6_02_03", "vn_b_helmet_aph6_02_04", "vn_b_helmet_aph6_02_01"];

_backpackSmall = ["vn_b_pack_01", "vn_b_pack_04"];
_backpackLarge = ["vn_b_pack_01", "vn_b_pack_04"];
_backpackMedic = ["vn_b_pack_01", "vn_b_pack_04"];
_backpackRadio = ["vn_b_pack_01", "vn_b_pack_04"];

//=====================================================================================