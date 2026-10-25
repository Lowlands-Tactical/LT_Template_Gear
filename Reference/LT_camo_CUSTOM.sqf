/*

File: LT_camo_CUSTOM.sqf
Tijdperl: 
Author: Brainless_Ben

Description:
ERROR when customFile is not found in mission fallback to this

*/

["customGear","Mission has no Scripts\customGear.sqf fallback applied",3] call LT_fnc_log;

//=====================================================================================

// Define clothing that will be used
_unif = ["U_C_Journalist"];
_vest = ["V_Press_F"];
_helm = ["H_Cap_press"];
	//Optioneel medic kleding
_unifMedic = _unif;
_vestMedic = _vest;
_helmMedic = _helm;

_nvgs = ["NVGoggles_OPFOR"];
_goggles = ["G_Goggles_VR"];

_unifCrew = _unif;
_vestCrew = _vest;
_helmCrew = _helm;

_unifHeliP = _unif;
_unifHeliC = _unif;
_vestHeli = _vest;
_helmHeli = _helm;

_unifJet = _unif;
_helmJet = _helm;

_backpackSmall = ["B_AssaultPack_mcamo"];
_backpackLarge = ["B_Carryall_oucamo"];
_backpackMedic = _backpackSmall;
_backpackRadio = ["B_RadioBag_01_sage_F"];

//=====================================================================================
