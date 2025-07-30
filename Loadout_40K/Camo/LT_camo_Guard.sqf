/*

File: LT_camo_Guard.sqf
Tijdperl: Warhammer 40K
Author: Brainless_Ben

Description:
Reset player weapons set from mission parameters

*/

//=====================================================================================

// Define clothing that will be used
_unif = ["TIOW_CadKasrUni_776"];
_vest = ["Cad_KasrGear776th"];
_helm = ["Cad_InfPhoto_Helm776th"];
	//Optioneel medic kleding
_unifMedic = _unif;
_vestMedic = ["Cad_MedGear776th"];
_helmMedic = _helm;

_nvgs = ["IC_Invisible_NVG"];
_goggles = ["ic_Cadian_MedicPouches","ic_Cadian_Extra2","ic_Cadian_Extra4V2","ic_Cadian_Extra4V3","ic_Cadian_Extra4V4","ic_Cadian_Extra4V5",""];

_unifCrew = ["CadTnkUni776th"];
_vestCrew = ["Cad_TnkGear776th"];
_helmCrew = ["Cad_Kasr_Helm776th"];

_unifHeliP = ["CadUni776th"];
_unifHeliC = _unifHeliP;
_vestHeli = ["TIOW_CadKasrUni_776"];
_helmHeli = _helmCrew;

_unifJet = _unifHeliP;
_helmJet = _helmCrew;

_backpackSmall = ["TIOW_CadKasrkinBackpack_776th"];
_backpackLarge = ["TIOW_CadKasrkinBackpack_776th"];
_backpackMedic = ["TIOW_CadMedicaeBackpack"];
_backpackRadio = ["TIOW_Vox_Caster_Green"];

//=====================================================================================
