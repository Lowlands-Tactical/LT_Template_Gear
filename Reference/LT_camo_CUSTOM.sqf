/*

File: LT_camo_CUSTOM.sqf
Tijdperl: 
Author: Brainless_Ben

Description:
ERROR when customFile is not found in mission fallback to this

*/

_errorMismatch = "[LT] (customGear) Mission has no Scripts\customGear.sqf fallback applied";
Diag_log _errorMismatch;
systemChat _errorMismatch;
[_errorMismatch] remoteExec ["globalChat", 2];

//=====================================================================================

// Define clothing that will be used
_unif = ["U_C_Journalist"];
_vest = ["V_Press_F"];
_helm = ["H_Cap_press"];
	//Optioneel medic kleding
_unifMedic = [""];
_vestMedic = [""];
_helmMedic = [""];

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

_backpackSmall = [""];
_backpackLarge = [""];
_backpackMedic = [""];
_backpackRadio = [""];

//=====================================================================================
