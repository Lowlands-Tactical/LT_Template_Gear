/*

File: XEH_PostInit.sqf
Author: Brainless_Ben

Description:
Defines gear/weapon settings to be used in initPosts

*/

_ltMission = getMissionConfigValue "LT_Loadout_ID";
if (isNil "_ltMission") exitWith
{
	Diag_log format ["[LT] (XEH) %1 Eject is not mission template", __FILE__];
};

// Define clothing that will be used
    //#include "\lt_template_gear\Reference\LT_camo_.sqf"
    _unif = [""];
    _vest = [""];
    _helm = [""];

    _unifMedic = [""];
    _vestMedic = [""];
    _helmMedic = [""];

    _nvgs = [""];
    _goggles = [""];

    _unifCrew = [""];
    _vestCrew = [""];
    _helmCrew = [""];

    _unifHeliP = [""];
    _unifHeliC = [""];
    _vestHeli = [""];
    _helmHeli = [""];

    _unifJet = [""];
    _helmJet = [""];

    _backpackSmall = [""];
    _backpackLarge = [""];
    _backpackMedic = [""];
    _backpackRadio = [""];

// Define type of weapons to use
    //#include "\lt_template_gear\Reference\LT_wpn_.sqf"
    _rifle = [""];
    _rifleGL = [""]; 
    _rifle_Mags	= "";
    _rifle_Mags_Tr = "";

    _rifleCrew = [""];
    _rifleCrew_Mags = "";
    _rifleCrew_Mags_Tr = "";

    _rifleAttRailIR = [""];
    _rifleAttRailFL = [""];
    _rifleAttMuzzle = [""];
    _rifleAttBipod = [""];
    _rifleAttScope = [""];

    _itemsGL = ["","","",""];
    _itemsGLNVG = ["","","",""];

    _rifleMark = [""];
    _rifleMark_Mags = "";
    _rifleMarkAttRailIR = [""];
    _rifleMarkAttRailFL = [""];
    _rifleMarkAttMuzzle = [""];
    _rifleMarkAttBipod = [""];
    _rifleMarkAttScope = [""];

    _rifleAir = [""];
    _rifleAir_Mags = "";
    _rifleAirAttRailIR = [""];
    _rifleAirAttRailFL = [""];
    _rifleAirAttMuzzle = [""];
    _rifleAirAttBipod = [""];
    _rifleAirAttScope = [""]; 

    _rifleAR = [""];
    _rifleAR_Mags = "";
    _rifleARAttRailIR = [""]; 
    _rifleARAttRailFL = [""];
    _rifleARAttMuzzle = [""];
    _rifleARAttBipod = [""];
    _rifleARAttScope = [""];

    _handGun = [""];
    _handGun_Mags = "";
    _handGunAttRailIR = [""];
    _handGunAttRailFL = [""];
    _handGunAttMuzzle = [""];
    _handGunAttBipod = [""];
    _handGunAttScope = [""];

    _launcher = [""];
    _launcher_Mags = [""];

_missionPeriod = MissionSettings get "Period";
_missionScope = MissionSettings get "SCOPE";
_missionAtt = MissionSettings get "ATT";

LT_fnc_weaponItems={
    params [
        ["_missionScope", MissionSettings get "SCOPE", [MissionSettings get "SCOPE"]],
        ["_caseNum", MissionSettings get "ATT", [MissionSettings get "ATT"]],
        ["_attArr", [], [[]]],
        ["_wpnName", "Error", ["Error"]],
        ["_weapon", "", [""]]
    ];

    if !(isClass (configFile >> "cfgWeapons" >> _weapon)) exitWith 
    {
        Diag_log format["[LT] (Weapon) Wrong weapon classname: -%1", _weapon];
        if ("lt_debug" call bis_fnc_getParamValue == 1) then 
        {
            systemChat format["[LT] (Weapon) Wrong weapon classname: -%1", _weapon];
        };
    };

    if !(_missionScope) then {_attArr set [4,""]};
    _attIR = (_attArr #0);
    _attFL = (_attArr #1);

    _attachments = switch (_caseNum) do
    {
        case 0: {[_attIR,"","",(_attArr #4)]};
        case 1: {[_attFL,"","",(_attArr #4)]};
        case 2: {[_attIR,(_attArr #2),"",(_attArr #4)]};
        case 3: {[_attFL,(_attArr #2),"",(_attArr #4)]};
        case 4: {[_attIR,"",(_attArr #3),(_attArr #4)]};
        case 5: {[_attFL,"",(_attArr #3),(_attArr #4)]};
        case 6: {["",(_attArr #2),(_attArr #3),(_attArr #4)]};
        case 7: {[_attIR,(_attArr #2),(_attArr #3),(_attArr #4)]};
        case 8: {[_attFL,(_attArr #2),(_attArr #3),(_attArr #4)]};
        case 9: {["","","",(_attArr #4)]}; // None unless scope is true
    };
    _result = [[_weapon,_attachments #1,_attachments #0,_attachments #3,[],[],_attachments #2],_attachments];

    Diag_log format["[LT] (Weapon) WeaponWithAttachments: %1", _result #0];
    if ("lt_debug" call bis_fnc_getParamValue == 1) then 
    {
        systemChat format["[LT] (Weapon) WeaponWithAttachments: %1", _result #0];
    };
    _result;
};

_sides = TabletSettings get "SIDES";
_loadRole = TabletSettings get "ROLES";
{
    // Define switchConditions for gear/weapon switch
    _sideGear = (MissionSettings get "GEAR") get _x;
    _sideWpn = (MissionSettings get "WEAPON") get _x;

    switch (_missionPeriod) do 
    {
        case "BASE":
        {
            #include "\lt_template_gear\Loadout_BASE\SwitchGearBASE.sqf"
            #include "\lt_template_gear\Loadout_BASE\SwitchWeaponBASE.sqf"
        };
        case "GM":
        {
            #include "\lt_template_gear\Loadout_GM\SwitchGearGM.sqf"
            #include "\lt_template_gear\Loadout_GM\SwitchWeaponGM.sqf"
        };
        case "VN":
        {
            #include "\lt_template_gear\Loadout_VN\SwitchGearVN.sqf"
            #include "\lt_template_gear\Loadout_VN\SwitchWeaponVN.sqf"
        };
        case "40K":
        {
            #include "\lt_template_gear\Loadout_40K\SwitchGear40K.sqf"
            #include "\lt_template_gear\Loadout_40K\SwitchWeapon40K.sqf"
        };
    };
    // In case of custom gear check classes and correct if needed.
    if ((_unifMedic select 0) == "") then {_unifMedic = _unif};
    if ((_vestMedic select 0) == "") then {_vestMedic = _vest};
    if ((_helmMedic select 0) == "") then {_helmMedic = _helm};
    if ((_backpackMedic select 0) == "") then {_backpackMedic = _backpackSmall};
    if ((_unifCrew select 0) == "") then {_unifCrew = _unif};
    if ((_vestCrew select 0) == "") then {_vestCrew = _vest};
    if ((_helmCrew select 0) == "") then {_helmCrew = _helm};
    if ((_unifJet select 0) == "") then {_unifJet = _unifHeliP};
    if ((_helmJet select 0) == "") then {_helmJet = _helmHeli};
    if ((_itemsGL select 0) == "") then {_itemsGL = ((ItemsGear get "GL") get _missionPeriod)#0};
    if ((_itemsGLNVG select 0) == "") then {_itemsGLNVG = ((ItemsGear get "GL") get _missionPeriod)#1};

    // Check GL Weapon and define GL Ammo
    _glBool = false;
    _glHand = (UnitWeapons get "GLHG") get _missionPeriod;
    if (((_rifleGL #0) == "") OR (_rifleGL #0 == _rifle #0)) then
    {
        _glBool = true;
        _rifleGL = _rifle;
    };
    _ammoGL = if (MissionSettings get "NVG") then{_itemsGLNVG;}else{_itemsGL;};
    _itemsGLAmt	= [19,6,4,4];

    // Pre select heavy weapon types
    _periodWPN=createHashMapFromArray[
        [_loadRole #7,[_launcher_Mags,_launcher]],
        [_loadRole #8,((UnitWeapons get (_loadRole #8)) get _missionPeriod) get _x],
        [_loadRole #14,((UnitWeapons get (_loadRole #14)) get _missionPeriod) get _x],
        [_loadRole #15,((UnitWeapons get (_loadRole #15)) get _missionPeriod) get _x]
    ];
    _rifleAtt = [_missionScope,_missionAtt,[(selectRandom _rifleAttRailIR),(selectRandom _rifleAttRailFL),(selectRandom _rifleAttMuzzle),(selectRandom _rifleAttBipod),(selectRandom _rifleAttScope)],"Rifle", (selectRandom _rifle)] call LT_fnc_weaponItems;
    _rifleGLAtt = [_missionScope,_missionAtt,[(selectRandom _rifleAttRailIR),(selectRandom _rifleAttRailFL),(selectRandom _rifleAttMuzzle),(selectRandom _rifleAttBipod),(selectRandom _rifleAttScope)],"Rifle(GL)", (selectRandom _rifleGL)] call LT_fnc_weaponItems;
    _rifleCrewAtt = [_missionScope,_missionAtt,[(selectRandom _rifleAttRailIR),(selectRandom _rifleAttRailFL),(selectRandom _rifleAttMuzzle),(selectRandom _rifleAttBipod),(selectRandom _rifleAttScope)],"Rifle(Crew)", (selectRandom _rifleCrew)] call LT_fnc_weaponItems;
    _rifleAirAtt = [_missionScope,_missionAtt,[(selectRandom _rifleAirAttRailIR),(selectRandom _rifleAirAttRailFL),(selectRandom _rifleAirAttMuzzle),(selectRandom _rifleAirAttBipod),(selectRandom _rifleAirAttScope)],"Air", (selectRandom _rifleAir)] call LT_fnc_weaponItems;
    _rifleHGAtt = [_missionScope,_missionAtt,[(selectRandom _handGunAttRailIR),(selectRandom _handGunAttRailFL),(selectRandom _handGunAttMuzzle),(selectRandom _handGunAttBipod),(selectRandom _handGunAttScope)],"HG", (selectRandom _handGun)] call LT_fnc_weaponItems;
    _rifleDMRAtt = [_missionScope,_missionAtt,[(selectRandom _rifleMarkAttRailIR),(selectRandom _rifleMarkAttRailFL),(selectRandom _rifleMarkAttMuzzle),(selectRandom _rifleMarkAttBipod),(selectRandom _rifleMarkAttScope)],_loadRole #9, (selectRandom _rifleMark)] call LT_fnc_weaponItems;
    _rifleARAtt = [_missionScope,_missionAtt,[(selectRandom _rifleARAttRailIR),(selectRandom _rifleARAttRailFL),(selectRandom _rifleARAttMuzzle),(selectRandom _rifleARAttBipod),(selectRandom _rifleARAttScope)],_loadRole #10, (selectRandom _rifleAR)] call LT_fnc_weaponItems;
    switch (_x) do {
        case "WEST":{
            westGear = createHashMapFromArray[
                ["Default", [_unif,_vest,_helm]],
                ["Medic",   [_unifMedic,_vestMedic,_helmMedic]],
                ["Vehicle", [_unifCrew,_vestCrew,_helmCrew]],
                ["Heli",    [_unifHeliP,_unifHeliC,_vestHeli,_helmHeli]],
                ["Jet",     [_unifJet,((ItemsGear get "AIR")get _missionPeriod)#0,_helmJet]],
                ["BPS",     [_backpackSmall,_backpackLarge,_backpackMedic,_backpackRadio]],
                ["Backpack",[selectRandom _backpackSmall,selectRandom _backpackLarge,selectRandom _backpackMedic,selectRandom _backpackRadio,(((ItemsGear get "AIR")get _missionPeriod)#1)]],
                ["UAV",     (ItemsGear get "UAV") get _x],
                ["NVG",     [(MissionSettings get "NVG"),_nvgs,(ItemsGear get "NVG")]],
                ["Goggles", _goggles]
            ];
            westWeapons = createHashMapFromArray[
                ["Rifle", createHashMapFromArray[
                    ["Weapon",  _rifle],
                    ["Ammo",    [_rifle_Mags,_rifle_Mags_Tr]],
                    ["WithAtt", _rifleAtt #0],
                    ["Att",     _rifleAtt #1]
                ]],
                ["RifleGL",createHashMapFromArray[
                    ["Weapon",  _rifleGL],
                    ["Ammo",    [_rifle_Mags,_rifle_Mags_Tr]],
                    ["GLWeapon",[_glBool,_glHand]],
                    ["GLAmmo",  [_ammoGL,_itemsGLAmt]],
                    ["WithAtt", _rifleGLAtt #0],
                    ["Att",     _rifleGLAtt #1]
                ]],
                ["Crew", createHashMapFromArray[
                    ["Weapon",  _rifleCrew],
                    ["Ammo",    [_rifleCrew_Mags,_rifleCrew_Mags_Tr]],
                    ["WithAtt", _rifleCrewAtt #0],
                    ["Att",     _rifleCrewAtt #1]
                ]],
                ["AIR", createHashMapFromArray[
                    ["Weapon",  _rifleAir],
                    ["Ammo",    [_rifleAir_Mags]],
                    ["WithAtt", _rifleAirAtt #0],
                    ["Att",     _rifleAirAtt #1]
                ]],
                ["HG", createHashMapFromArray[
                    ["Weapon",  _handGun],
                    ["Ammo",    [_handGun_Mags]],
                    ["WithAtt", _rifleHGAtt #0],
                    ["Att",     _rifleHGAtt #1]
                ]],
                [_loadRole #7,/*riflat*/ createHashMapFromArray[
                    ["Weapon",  (_periodWPN get (_loadRole #7))#1],
                    ["Ammo",    (_periodWPN get (_loadRole #7))#0],
                    ["WithAtt", [((_periodWPN get (_loadRole #7))#1)#0,"","","",[((_periodWPN get (_loadRole #7))#0)#0,1],[],""]]
                ]],
                [_loadRole #8,/*riflaa*/ createHashMapFromArray[
                    ["Weapon",  [(_periodWPN get (_loadRole #8))#1]],
                    ["Ammo",    [(_periodWPN get (_loadRole #8))#0]],
                    ["WithAtt", [(_periodWPN get (_loadRole #8))#1,"","","",[(_periodWPN get (_loadRole #8))#0,1],[],""]]
                ]],
                [_loadRole #9,/*dmr*/ createHashMapFromArray[
                    ["Weapon",  _rifleMark],
                    ["Ammo",    [_rifleMark_Mags]],
                    ["WithAtt", _rifleDMRAtt #0],
                    ["Att",     _rifleDMRAtt #1]
                ]],
                [_loadRole #10,/*ar*/ createHashMapFromArray[
                    ["Weapon",  _rifleAR],
                    ["Ammo",    [_rifleAR_Mags]],
                    ["WithAtt", _rifleARAtt #0],
                    ["Att",     _rifleARAtt #1]
                ]],
                [_loadRole #14,/*mmg*/ createHashMapFromArray[
                    ["Weapon",  [(_periodWPN get (_loadRole #14))#1]],
                    ["Ammo",    [(_periodWPN get (_loadRole #14))#0]],
                    ["WithAtt", [(_periodWPN get (_loadRole #14))#1,"","","",[(_periodWPN get (_loadRole #14))#0,1],[],""]]
                ]],
                [_loadRole #15,/*mat*/ createHashMapFromArray[
                    ["Weapon",  [(_periodWPN get (_loadRole #15))#1]],
                    ["Ammo",    (_periodWPN get (_loadRole #15))#0],
                    ["WithAtt", [(_periodWPN get (_loadRole #15))#1,"","","",[((_periodWPN get (_loadRole #15))#0)#0,1],[],""]]
                ]]
            ];
            publicVariable "westGear";
            publicVariable "westWeapons";
        };
        case "EAST":{
            eastGear = createHashMapFromArray[
                ["Default", [_unif,_vest,_helm]],
                ["Medic",   [_unifMedic,_vestMedic,_helmMedic]],
                ["Vehicle", [_unifCrew,_vestCrew,_helmCrew]],
                ["Heli",    [_unifHeliP,_unifHeliC,_vestHeli,_helmHeli]],
                ["Jet",     [_unifJet,((ItemsGear get "AIR")get _missionPeriod)#0,_helmJet]],
                ["BPS",     [_backpackSmall,_backpackLarge,_backpackMedic,_backpackRadio]],
                ["Backpack",[selectRandom _backpackSmall,selectRandom _backpackLarge,selectRandom _backpackMedic,selectRandom _backpackRadio,(((ItemsGear get "AIR")get _missionPeriod)#1)]],
                ["UAV",     (ItemsGear get "UAV") get _x],
                ["NVG",     [(MissionSettings get "NVG"),_nvgs,(ItemsGear get "NVG")]],
                ["Goggles", _goggles]
            ];
            eastWeapons = createHashMapFromArray[
                ["Rifle", createHashMapFromArray[
                    ["Weapon",  _rifle],
                    ["Ammo",    [_rifle_Mags,_rifle_Mags_Tr]],
                    ["WithAtt", _rifleAtt #0],
                    ["Att",     _rifleAtt #1]
                ]],
                ["RifleGL",createHashMapFromArray[
                    ["Weapon",  _rifleGL],
                    ["Ammo",    [_rifle_Mags,_rifle_Mags_Tr]],
                    ["GLWeapon",[_glBool,_glHand]],
                    ["GLAmmo",  [_ammoGL,_itemsGLAmt]],
                    ["WithAtt", _rifleGLAtt #0],
                    ["Att",     _rifleGLAtt #1]
                ]],
                ["Crew", createHashMapFromArray[
                    ["Weapon",  _rifleCrew],
                    ["Ammo",    [_rifleCrew_Mags,_rifleCrew_Mags_Tr]],
                    ["WithAtt", _rifleCrewAtt #0],
                    ["Att",     _rifleCrewAtt #1]
                ]],
                ["AIR", createHashMapFromArray[
                    ["Weapon",  _rifleAir],
                    ["Ammo",    [_rifleAir_Mags]],
                    ["WithAtt", _rifleAirAtt #0],
                    ["Att",     _rifleAirAtt #1]
                ]],
                ["HG", createHashMapFromArray[
                    ["Weapon",  _handGun],
                    ["Ammo",    [_handGun_Mags]],
                    ["WithAtt", _rifleHGAtt #0],
                    ["Att",     _rifleHGAtt #1]
                ]],
                [_loadRole #7,/*riflat*/ createHashMapFromArray[
                    ["Weapon",  (_periodWPN get (_loadRole #7))#1],
                    ["Ammo",    (_periodWPN get (_loadRole #7))#0],
                    ["WithAtt", [((_periodWPN get (_loadRole #7))#1)#0,"","","",[((_periodWPN get (_loadRole #7))#0)#0,1],[],""]]
                ]],
                [_loadRole #8,/*riflaa*/ createHashMapFromArray[
                    ["Weapon",  [(_periodWPN get (_loadRole #8))#1]],
                    ["Ammo",    [(_periodWPN get (_loadRole #8))#0]],
                    ["WithAtt", [(_periodWPN get (_loadRole #8))#1,"","","",[(_periodWPN get (_loadRole #8))#0,1],[],""]]
                ]],
                [_loadRole #9,/*dmr*/ createHashMapFromArray[
                    ["Weapon",  _rifleMark],
                    ["Ammo",    [_rifleMark_Mags]],
                    ["WithAtt", _rifleDMRAtt #0],
                    ["Att",     _rifleDMRAtt #1]
                ]],
                [_loadRole #10,/*ar*/ createHashMapFromArray[
                    ["Weapon",  _rifleAR],
                    ["Ammo",    [_rifleAR_Mags]],
                    ["WithAtt", _rifleARAtt #0],
                    ["Att",     _rifleARAtt #1]
                ]],
                [_loadRole #14,/*mmg*/ createHashMapFromArray[
                    ["Weapon",  [(_periodWPN get (_loadRole #14))#1]],
                    ["Ammo",    [(_periodWPN get (_loadRole #14))#0]],
                    ["WithAtt", [(_periodWPN get (_loadRole #14))#1,"","","",[(_periodWPN get (_loadRole #14))#0,1],[],""]]
                ]],
                [_loadRole #15,/*mat*/ createHashMapFromArray[
                    ["Weapon",  [(_periodWPN get (_loadRole #15))#1]],
                    ["Ammo",    (_periodWPN get (_loadRole #15))#0],
                    ["WithAtt", [(_periodWPN get (_loadRole #15))#1,"","","",[((_periodWPN get (_loadRole #15))#0)#0,1],[],""]]
                ]]
            ];
            publicVariable "eastGear";
            publicVariable "eastWeapons";
        };
        case "GUER":{
            guerGear = createHashMapFromArray[
                ["Default", [_unif,_vest,_helm]],
                ["Medic",   [_unifMedic,_vestMedic,_helmMedic]],
                ["Vehicle", [_unifCrew,_vestCrew,_helmCrew]],
                ["Heli",    [_unifHeliP,_unifHeliC,_vestHeli,_helmHeli]],
                ["Jet",     [_unifJet,((ItemsGear get "AIR")get _missionPeriod)#0,_helmJet]],
                ["BPS",     [_backpackSmall,_backpackLarge,_backpackMedic,_backpackRadio]],
                ["Backpack",[selectRandom _backpackSmall,selectRandom _backpackLarge,selectRandom _backpackMedic,selectRandom _backpackRadio,(((ItemsGear get "AIR")get _missionPeriod)#1)]],
                ["UAV",     (ItemsGear get "UAV") get _x],
                ["NVG",     [(MissionSettings get "NVG"),_nvgs,(ItemsGear get "NVG")]],
                ["Goggles", _goggles]
            ];
            guerWeapons = createHashMapFromArray[
                ["Rifle", createHashMapFromArray[
                    ["Weapon",  _rifle],
                    ["Ammo",    [_rifle_Mags,_rifle_Mags_Tr]],
                    ["WithAtt", _rifleAtt #0],
                    ["Att",     _rifleAtt #1]
                ]],
                ["RifleGL",createHashMapFromArray[
                    ["Weapon",  _rifleGL],
                    ["Ammo",    [_rifle_Mags,_rifle_Mags_Tr]],
                    ["GLWeapon",[_glBool,_glHand]],
                    ["GLAmmo",  [_ammoGL,_itemsGLAmt]],
                    ["WithAtt", _rifleGLAtt #0],
                    ["Att",     _rifleGLAtt #1]
                ]],
                ["Crew", createHashMapFromArray[
                    ["Weapon",  _rifleCrew],
                    ["Ammo",    [_rifleCrew_Mags,_rifleCrew_Mags_Tr]],
                    ["WithAtt", _rifleCrewAtt #0],
                    ["Att",     _rifleCrewAtt #1]
                ]],
                ["AIR", createHashMapFromArray[
                    ["Weapon",  _rifleAir],
                    ["Ammo",    [_rifleAir_Mags]],
                    ["WithAtt", _rifleAirAtt #0],
                    ["Att",     _rifleAirAtt #1]
                ]],
                ["HG", createHashMapFromArray[
                    ["Weapon",  _handGun],
                    ["Ammo",    [_handGun_Mags]],
                    ["WithAtt", _rifleHGAtt #0],
                    ["Att",     _rifleHGAtt #1]
                ]],
                [_loadRole #7,/*riflat*/ createHashMapFromArray[
                    ["Weapon",  (_periodWPN get (_loadRole #7))#1],
                    ["Ammo",    (_periodWPN get (_loadRole #7))#0],
                    ["WithAtt", [((_periodWPN get (_loadRole #7))#1)#0,"","","",[((_periodWPN get (_loadRole #7))#0)#0,1],[],""]]
                ]],
                [_loadRole #8,/*riflaa*/ createHashMapFromArray[
                    ["Weapon",  [(_periodWPN get (_loadRole #8))#1]],
                    ["Ammo",    [(_periodWPN get (_loadRole #8))#0]],
                    ["WithAtt", [(_periodWPN get (_loadRole #8))#1,"","","",[(_periodWPN get (_loadRole #8))#0,1],[],""]]
                ]],
                [_loadRole #9,/*dmr*/ createHashMapFromArray[
                    ["Weapon",  _rifleMark],
                    ["Ammo",    [_rifleMark_Mags]],
                    ["WithAtt", _rifleDMRAtt #0],
                    ["Att",     _rifleDMRAtt #1]
                ]],
                [_loadRole #10,/*ar*/ createHashMapFromArray[
                    ["Weapon",  _rifleAR],
                    ["Ammo",    [_rifleAR_Mags]],
                    ["WithAtt", _rifleARAtt #0],
                    ["Att",     _rifleARAtt #1]
                ]],
                [_loadRole #14,/*mmg*/ createHashMapFromArray[
                    ["Weapon",  [(_periodWPN get (_loadRole #14))#1]],
                    ["Ammo",    [(_periodWPN get (_loadRole #14))#0]],
                    ["WithAtt", [(_periodWPN get (_loadRole #14))#1,"","","",[(_periodWPN get (_loadRole #14))#0,1],[],""]]
                ]],
                [_loadRole #15,/*mat*/ createHashMapFromArray[
                    ["Weapon",  [(_periodWPN get (_loadRole #15))#1]],
                    ["Ammo",    (_periodWPN get (_loadRole #15))#0],
                    ["WithAtt", [(_periodWPN get (_loadRole #15))#1,"","","",[((_periodWPN get (_loadRole #15))#0)#0,1],[],""]]
                ]]
            ];
            publicVariable "guerGear";
            publicVariable "guerWeapons";
        };
    };
    Diag_log format["[LT] (XEH) Gear set for side:%1 ",_x];
    Diag_log format["[LT] (XEH) Weapon set for side:%1 ",_x];
    if ("lt_debug" call bis_fnc_getParamValue == 1) then 
    {
        systemChat format["[LT] (XEH) Gear set for side:%1 ",_x];
        systemChat format["[LT] (XEH) Weapon set for side:%1 ",_x];
    };
}forEach _sides;

/*
Explenation GearCrate Hash
    SIDE
        CRATENAME
            Period      = STRING
            AMOUNT      = ARRAY of SCALARS
            BACKPACK    = ARRAY isBackpack + Arrays of backpacks
*/
_loadName = TabletSettings get "LOAD";
gearCrates = createHashMapFromArray[
    [_sides #0,createHashMapFromArray[
        [_loadName #1 /*Crate Squad*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "Backpack")#2,2,"medic"],[(westGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #2 /*Crate Peleton*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "UAV")#1,1,"none"],[(westGear get "Backpack")#2,1,"medic"],[(westGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "UAV")#1,1,"none"],[(westGear get "Backpack")#2,1,"medic"],[(westGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #5 /*Crate Large*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "UAV")#1,2,"none"],[(westGear get "Backpack")#2,2,"medic"],[(westGear get "Backpack")#0,2,"eng"]]]
        ]],
        [_loadName #6 /*Crate Explosives*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #7 /*Crate Mines*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #8 /*Crate Medical*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "Backpack")#2,3,"medic"]]]
        ]],
        [_loadName #10 /*Crate Air*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "Backpack")#0,2,"pilot"]]]
        ]],
        [_loadName #12 /*Crate NVG*/,createHashMapFromArray[
            [_missionPeriod,[selectRandom ((westGear get "NVG")#1)]],
            ["Amount",      [8]],
            ["Backpack",    [false,["",0,""]]]
        ]],
        [_loadName #13 /*Crate UAV*/,createHashMapFromArray[
            [_missionPeriod,[(westGear get "UAV")#0]],
            ["Amount",      [1]],
            ["Backpack",    [true,[(westGear get "UAV")#1,5,"none"]]]
        ]]
    ]],
    [_sides #1,createHashMapFromArray[
        [_loadName #1 /*Crate Squad*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "Backpack")#2,2,"medic"],[(eastGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #2 /*Crate Peleton*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "UAV")#1,1,"none"],[(eastGear get "Backpack")#2,1,"medic"],[(eastGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "UAV")#1,1,"none"],[(eastGear get "Backpack")#2,1,"medic"],[(eastGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #5 /*Crate Large*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "UAV")#1,2,"none"],[(eastGear get "Backpack")#2,2,"medic"],[(eastGear get "Backpack")#0,2,"eng"]]]
        ]],
        [_loadName #6 /*Crate Explosives*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #7 /*Crate Mines*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #8 /*Crate Medical*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "Backpack")#2,1,"medic"]]]
        ]],
        [_loadName #10 /*Crate Air*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "Backpack")#0,2,"pilot"]]]
        ]],
        [_loadName #12 /*Crate NVG*/,createHashMapFromArray[
            [_missionPeriod,[selectRandom ((eastGear get "NVG")#1)]],
            ["Amount",      [8]],
            ["Backpack",    [false,["",0,""]]]
        ]],
        [_loadName #13 /*Crate UAV*/,createHashMapFromArray[
            [_missionPeriod,[(eastGear get "UAV")#0]],
            ["Amount",      [1]],
            ["Backpack",    [true,[(eastGear get "UAV")#1,5,"none"]]]
        ]]
    ]],
    [_sides #2,createHashMapFromArray[
        [_loadName #1 /*Crate Squad*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "Backpack")#2,2,"medic"],[(guerGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #2 /*Crate Peleton*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "UAV")#1,1,"none"],[(guerGear get "Backpack")#2,1,"medic"],[(guerGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "UAV")#1,1,"none"],[(guerGear get "Backpack")#2,1,"medic"],[(guerGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #5 /*Crate Large*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "UAV")#1,2,"none"],[(guerGear get "Backpack")#2,2,"medic"],[(guerGear get "Backpack")#0,2,"eng"]]]
        ]],
        [_loadName #6 /*Crate Explosives*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #7 /*Crate Mines*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "Backpack")#0,1,"eng"]]]
        ]],
        [_loadName #8 /*Crate Medical*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "Backpack")#2,1,"medic"]]]
        ]],
        [_loadName #10 /*Crate Air*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "Backpack")#0,2,"pilot"]]]
        ]],
        [_loadName #12 /*Crate NVG*/,createHashMapFromArray[
            [_missionPeriod,[selectRandom ((guerGear get "NVG")#1)]],
            ["Amount",      [8]],
            ["Backpack",    [false,["",0,""]]]
        ]],
        [_loadName #13 /*Crate UAV*/,createHashMapFromArray[
            [_missionPeriod,[(guerGear get "UAV")#0]],
            ["Amount",      [1]],
            ["Backpack",    [true,[(guerGear get "UAV")#1,5,"none"]]]
        ]]
    ]]
];
publicVariable "gearCrates";

/*
Explanation weaponCrates array
    SIDE
        CRATENAME
            WEAPON      = HASHMAP Weapon
            LAUNCHER    = BOOL isLauncher
            WPN AMOUNT  = SCALAR
            AMMO ONLY   = BOOL
            AMOUNT      = ARRAY of SCALARS
*/
weaponCrates = createHashMapFromArray[
    [_sides #0,createHashMapFromArray[
        [_loadName #1 /*Crate Squad*/,createHashMapFromArray[
            ["Rifle",       [westWeapons get "Rifle",false,0,true,[48,12]]],
            ["RifleGL",     [westWeapons get "RifleGL",false,0,true,[24,12,6,6]]],
            ["Crew",        [westWeapons get "Crew",false,0,true,[24,6]]],
            ["HG",          [westWeapons get "HG",false,0,true,[16]]],
            [_loadRole #7,  [westWeapons get (_loadRole #7),true,4,true,[4]]],
            [_loadRole #8,  [westWeapons get (_loadRole #8),true,4,true,[4]]],
            [_loadRole #9,  [westWeapons get (_loadRole #9),false,0,true,[12]]],
            [_loadRole #10, [westWeapons get (_loadRole #10),false,0,true,[6]]],
            [_loadRole #14, [westWeapons get (_loadRole #14),false,0,true,[6]]],
            [_loadRole #15, [westWeapons get (_loadRole #15),true,0,true,[4]]]
        ]],
        [_loadName #2 /*Crate Peleton*/,createHashMapFromArray[
            [_loadRole #7,  [westWeapons get (_loadRole #7),true,1,false,[6]]],
            [_loadRole #14, [westWeapons get (_loadRole #14),false,1,false,[6]]],
            [_loadRole #15, [westWeapons get (_loadRole #15),true,1,false,[4]]]
        ]],
        [_loadName #3 /*Crate Small*/,createHashMapFromArray[
            ["Rifle",       [westWeapons get "Rifle",false,0,true,[8,8]]],
            ["RifleGL",     [westWeapons get "RifleGL",false,0,true,[10,5,0,0]]],
            ["Crew",        [westWeapons get "Crew",false,0,true,[8,8]]],
            ["HG",          [westWeapons get "HG",false,0,true,[8]]],
            [_loadRole #9,  [westWeapons get (_loadRole #9),false,0,true,[4]]],
            [_loadRole #10, [westWeapons get (_loadRole #10),false,0,true,[3]]],
            [_loadRole #14, [westWeapons get (_loadRole #14),false,0,true,[3]]]
        ]],
        [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
            ["Rifle",       [westWeapons get "Rifle",false,0,true,[16,16]]],
            ["RifleGL",     [westWeapons get "RifleGL",false,0,true,[20,10,4,4]]],
            ["Crew",        [westWeapons get "Crew",false,0,true,[16,16]]],
            ["HG",          [westWeapons get "HG",false,0,true,[16]]],
            [_loadRole #9,  [westWeapons get (_loadRole #9),false,0,true,[10]]],
            [_loadRole #7,  [westWeapons get (_loadRole #7),true,6,true,[6]]],
            [_loadRole #8,  [westWeapons get (_loadRole #8),true,6,true,[6]]],
            [_loadRole #10, [westWeapons get (_loadRole #10),false,0,true,[6]]],
            [_loadRole #14, [westWeapons get (_loadRole #14),false,0,true,[6]]],
            [_loadRole #15, [westWeapons get (_loadRole #15),true,0,true,[4]]]
        ]],
        [_loadName #5 /*Crate Large*/,createHashMapFromArray[
            ["Rifle",       [westWeapons get "Rifle",false,0,true,[24,24]]],
            ["RifleGL",     [westWeapons get "RifleGL",false,0,true,[30,15,8,8]]],
            ["Crew",        [westWeapons get "Crew",false,0,true,[24,24]]],
            ["HG",          [westWeapons get "HG",false,0,true,[24]]],
            [_loadRole #7,  [westWeapons get (_loadRole #7),true,8,true,[8]]],
            [_loadRole #8,  [westWeapons get (_loadRole #8),true,8,true,[8]]],
            [_loadRole #9,  [westWeapons get (_loadRole #9),false,0,true,[20]]],
            [_loadRole #10, [westWeapons get (_loadRole #10),false,0,true,[8]]],
            [_loadRole #14, [westWeapons get (_loadRole #14),false,0,true,[8]]],
            [_loadRole #15, [westWeapons get (_loadRole #15),true,0,true,[8]]]
        ]],
        [_loadName #9 /*Crate Weapons*/,createHashMapFromArray[
            ["Rifle",       [westWeapons get "Rifle",false,4,false,[0]]],
            ["RifleGL",     [westWeapons get "RifleGL",false,4,false,[0]]],
            ["Crew",        [westWeapons get "Crew",false,4,false,[0]]],
            ["AIR",         [westWeapons get "AIR",false,2,false,[0]]],
            ["HG",          [westWeapons get "HG",false,8,false,[0]]],
            [_loadRole #7,  [westWeapons get (_loadRole #7),true,4,false,[0]]],
            [_loadRole #8,  [westWeapons get (_loadRole #8),true,4,false,[0]]],
            [_loadRole #9,  [westWeapons get (_loadRole #9),false,4,false,[0]]],
            [_loadRole #10, [westWeapons get (_loadRole #10),false,2,false,[0]]],
            [_loadRole #14, [westWeapons get (_loadRole #14),false,1,false,[0]]],
            [_loadRole #15, [westWeapons get (_loadRole #15),true,2,false,[0]]]
        ]],
        [_loadName #10 /*Crate Air*/,createHashMapFromArray[
            ["AIR",         [westWeapons get "AIR",false,0,true,[20]]],
            ["HG",          [westWeapons get "HG",false,0,true,[10]]]
        ]]
    ]],
    [_sides #1,createHashMapFromArray[
        [_loadName #1 /*Crate Squad*/,createHashMapFromArray[
            ["Rifle",       [eastWeapons get "Rifle",false,0,true,[48,12]]],
            ["RifleGL",     [eastWeapons get "RifleGL",false,0,true,[24,12,6,6]]],
            ["Crew",        [eastWeapons get "Crew",false,0,true,[24,6]]],
            ["HG",          [eastWeapons get "HG",false,0,true,[16]]],
            [_loadRole #7,  [eastWeapons get (_loadRole #7),true,4,true,[4]]],
            [_loadRole #8,  [eastWeapons get (_loadRole #8),true,4,true,[4]]],
            [_loadRole #9,  [eastWeapons get (_loadRole #9),false,0,true,[12]]],
            [_loadRole #10, [eastWeapons get (_loadRole #10),false,0,true,[6]]],
            [_loadRole #14, [eastWeapons get (_loadRole #14),false,0,true,[6]]],
            [_loadRole #15, [eastWeapons get (_loadRole #15),true,0,true,[4]]]
        ]],
        [_loadName #2 /*Crate Peleton*/,createHashMapFromArray[
            [_loadRole #7,  [eastWeapons get (_loadRole #7),true,1,false,[6]]],
            [_loadRole #14, [eastWeapons get (_loadRole #14),false,1,false,[6]]],
            [_loadRole #15, [eastWeapons get (_loadRole #15),true,1,false,[4]]]
        ]],
        [_loadName #3 /*Crate Small*/,createHashMapFromArray[
            ["Rifle",       [eastWeapons get "Rifle",false,0,true,[8,8]]],
            ["RifleGL",     [eastWeapons get "RifleGL",false,0,true,[10,5,0,0]]],
            ["Crew",        [eastWeapons get "Crew",false,0,true,[8,8]]],
            ["HG",          [eastWeapons get "HG",false,0,true,[8]]],
            [_loadRole #9,  [eastWeapons get (_loadRole #9),false,0,true,[4]]],
            [_loadRole #10, [eastWeapons get (_loadRole #10),false,0,true,[3]]],
            [_loadRole #14, [eastWeapons get (_loadRole #14),false,0,true,[3]]]
        ]],
        [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
            ["Rifle",       [eastWeapons get "Rifle",false,0,true,[16,16]]],
            ["RifleGL",     [eastWeapons get "RifleGL",false,0,true,[20,10,4,4]]],
            ["Crew",        [eastWeapons get "Crew",false,0,true,[16,16]]],
            ["HG",          [eastWeapons get "HG",false,0,true,[16]]],
            [_loadRole #7,  [eastWeapons get (_loadRole #7),true,6,true,[6]]],
            [_loadRole #8,  [eastWeapons get (_loadRole #8),true,6,true,[6]]],
            [_loadRole #9,  [eastWeapons get (_loadRole #9),false,0,true,[10]]],
            [_loadRole #10, [eastWeapons get (_loadRole #10),false,0,true,[6]]],
            [_loadRole #14, [eastWeapons get (_loadRole #14),false,0,true,[6]]],
            [_loadRole #15, [eastWeapons get (_loadRole #15),true,0,true,[4]]]
        ]],
        [_loadName #5 /*Crate Large*/,createHashMapFromArray[
            ["Rifle",       [eastWeapons get "Rifle",false,0,true,[24,24]]],
            ["RifleGL",     [eastWeapons get "RifleGL",false,0,true,[30,15,8,8]]],
            ["Crew",        [eastWeapons get "Crew",false,0,true,[24,24]]],
            ["HG",          [eastWeapons get "HG",false,0,true,[24]]],
            [_loadRole #7,  [eastWeapons get (_loadRole #7),true,8,true,[8]]],
            [_loadRole #8,  [eastWeapons get (_loadRole #8),true,8,true,[8]]],
            [_loadRole #9,  [eastWeapons get (_loadRole #9),false,0,true,[20]]],
            [_loadRole #10, [eastWeapons get (_loadRole #10),false,0,true,[8]]],
            [_loadRole #14, [eastWeapons get (_loadRole #14),false,0,true,[8]]],
            [_loadRole #15, [eastWeapons get (_loadRole #15),true,0,true,[8]]]
        ]],
        [_loadName #9 /*Crate Weapons*/,createHashMapFromArray[
            ["Rifle",       [eastWeapons get "Rifle",false,4,false,[0]]],
            ["RifleGL",     [eastWeapons get "RifleGL",false,4,false,[0]]],
            ["Crew",        [eastWeapons get "Crew",false,4,false,[0]]],
            ["AIR",         [eastWeapons get "AIR",false,2,false,[0]]],
            ["HG",          [eastWeapons get "HG",false,8,false,[0]]],
            [_loadRole #7,  [eastWeapons get (_loadRole #7),true,4,false,[0]]],
            [_loadRole #8,  [eastWeapons get (_loadRole #8),true,4,false,[0]]],
            [_loadRole #9,  [eastWeapons get (_loadRole #9),false,4,false,[0]]],
            [_loadRole #10, [eastWeapons get (_loadRole #10),false,2,false,[0]]],
            [_loadRole #14, [eastWeapons get (_loadRole #14),false,1,false,[0]]],
            [_loadRole #15, [eastWeapons get (_loadRole #15),true,2,false,[0]]]
        ]],
        [_loadName #10 /*Crate Air*/,createHashMapFromArray[
            ["AIR",         [eastWeapons get "AIR",false,0,true,[20]]],
            ["HG",          [eastWeapons get "HG",false,0,true,[10]]]
        ]]
    ]],
    [_sides #2,createHashMapFromArray[
        [_loadName #1 /*Crate Squad*/,createHashMapFromArray[
            ["Rifle",       [guerWeapons get "Rifle",false,0,true,[48,12]]],
            ["RifleGL",     [guerWeapons get "RifleGL",false,0,true,[24,12,6,6]]],
            ["Crew",        [guerWeapons get "Crew",false,0,true,[24,6]]],
            ["HG",          [guerWeapons get "HG",false,0,true,[16]]],
            [_loadRole #7,  [guerWeapons get (_loadRole #7),true,4,true,[4]]],
            [_loadRole #8,  [guerWeapons get (_loadRole #8),true,4,true,[4]]],
            [_loadRole #9,  [guerWeapons get (_loadRole #9),false,0,true,[12]]],
            [_loadRole #10, [guerWeapons get (_loadRole #10),false,0,true,[6]]],
            [_loadRole #14, [guerWeapons get (_loadRole #14),false,0,true,[6]]],
            [_loadRole #15, [guerWeapons get (_loadRole #15),true,0,true,[4]]]
        ]],
        [_loadName #2 /*Crate Peleton*/,createHashMapFromArray[
            [_loadRole #7,  [guerWeapons get (_loadRole #7),true,1,false,[6]]],
            [_loadRole #14, [guerWeapons get (_loadRole #14),false,1,false,[6]]],
            [_loadRole #15, [guerWeapons get (_loadRole #15),true,1,false,[4]]]
        ]],
        [_loadName #3 /*Crate Small*/,createHashMapFromArray[
            ["Rifle",       [guerWeapons get "Rifle",false,0,true,[8,8]]],
            ["RifleGL",     [guerWeapons get "RifleGL",false,0,true,[10,5,0,0]]],
            ["Crew",        [guerWeapons get "Crew",false,0,true,[8,8]]],
            ["HG",          [guerWeapons get "HG",false,0,true,[8]]],
            [_loadRole #9,  [guerWeapons get (_loadRole #9),false,0,true,[4]]],
            [_loadRole #10, [guerWeapons get (_loadRole #10),false,0,true,[3]]],
            [_loadRole #14, [guerWeapons get (_loadRole #14),false,0,true,[3]]]
        ]],
        [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
            ["Rifle",       [guerWeapons get "Rifle",false,0,true,[16,16]]],
            ["RifleGL",     [guerWeapons get "RifleGL",false,0,true,[20,10,4,4]]],
            ["Crew",        [guerWeapons get "Crew",false,0,true,[16,16]]],
            ["HG",          [guerWeapons get "HG",false,0,true,[16]]],
            [_loadRole #7,  [guerWeapons get (_loadRole #7),true,6,true,[6]]],
            [_loadRole #8,  [guerWeapons get (_loadRole #8),true,6,true,[6]]],
            [_loadRole #9,  [guerWeapons get (_loadRole #9),false,0,true,[10]]],
            [_loadRole #10, [guerWeapons get (_loadRole #10),false,0,true,[6]]],
            [_loadRole #14, [guerWeapons get (_loadRole #14),false,0,true,[6]]],
            [_loadRole #15, [guerWeapons get (_loadRole #15),true,0,true,[4]]]
        ]],
        [_loadName #5 /*Crate Large*/,createHashMapFromArray[
            ["Rifle",       [guerWeapons get "Rifle",false,0,true,[24,24]]],
            ["RifleGL",     [guerWeapons get "RifleGL",false,0,true,[30,15,8,8]]],
            ["Crew",        [guerWeapons get "Crew",false,0,true,[24,24]]],
            ["HG",          [guerWeapons get "HG",false,0,true,[24]]],
            [_loadRole #7,  [guerWeapons get (_loadRole #7),true,8,true,[8]]],
            [_loadRole #8,  [guerWeapons get (_loadRole #8),true,8,true,[8]]],
            [_loadRole #9,  [guerWeapons get (_loadRole #9),false,0,true,[20]]],
            [_loadRole #10, [guerWeapons get (_loadRole #10),false,0,true,[8]]],
            [_loadRole #14, [guerWeapons get (_loadRole #14),false,0,true,[8]]],
            [_loadRole #15, [guerWeapons get (_loadRole #15),true,0,true,[8]]]
        ]],
        [_loadName #9 /*Crate Weapons*/,createHashMapFromArray[
            ["Rifle",       [guerWeapons get "Rifle",false,4,false,[0]]],
            ["RifleGL",     [guerWeapons get "RifleGL",false,4,false,[0]]],
            ["Crew",        [guerWeapons get "Crew",false,4,false,[0]]],
            ["AIR",         [guerWeapons get "AIR",false,2,false,[0]]],
            ["HG",          [guerWeapons get "HG",false,8,false,[0]]],
            [_loadRole #7,  [guerWeapons get (_loadRole #7),true,4,false,[0]]],
            [_loadRole #8,  [guerWeapons get (_loadRole #8),true,4,false,[0]]],
            [_loadRole #9,  [guerWeapons get (_loadRole #9),false,4,false,[0]]],
            [_loadRole #10, [guerWeapons get (_loadRole #10),false,2,false,[0]]],
            [_loadRole #14, [guerWeapons get (_loadRole #14),false,1,false,[0]]],
            [_loadRole #15, [guerWeapons get (_loadRole #15),true,2,false,[0]]]
        ]],
        [_loadName #10 /*Crate Air*/,createHashMapFromArray[
            ["AIR",         [guerWeapons get "AIR",false,0,true,[20]]],
            ["HG",          [guerWeapons get "HG",false,0,true,[10]]]
        ]]
    ]]
];
publicVariable "weaponCrates";

Diag_log "[LT] (XEH) Template Gear PostInit finished";
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat "[LT] (XEH) Template Gear PostInit finished";
};