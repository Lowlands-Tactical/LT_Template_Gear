/*

File: XEH_PostInit.sqf
Author: Brainless_Ben

Description:
Defines gear/weapon settings to be used in initPosts

*/

_ltMission = getMissionConfigValue "LT_Loadout_ID";
if (isNil "_ltMission") exitWith
{
	Diag_log format ["[LT] (XEH_Gear) %1 Eject is not mission template", __FILE__];
};

_missionPeriod = MissionSettings get "Period";
_missionScope = MissionSettings get "SCOPE";
_missionAtt = MissionSettings get "ATT";

_fnc_weaponItems={
    params [
        ["_missionScope", MissionSettings get "SCOPE", [MissionSettings get "SCOPE"]],
        ["_caseNum", MissionSettings get "ATT", [MissionSettings get "ATT"]],
        ["_attArr", [], [[]]],
        ["_wpnName", "Error", ["Error"]],
        ["_weapon", "", [""]]
    ];

    private _result = [["","","","",[],[],""],["","","",""]];
    if !(isClass (configFile >> "cfgWeapons" >> _weapon)) exitWith 
    {
        ["XEH_Gear",format ["%1: Wrong weapon classname '%2', slot stays empty", _wpnName, _weapon],2] call LT_fnc_log;
        _result
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

    ["XEH_Gear",format ["WeaponWithAttachments: %1", _result #0],2] call LT_fnc_log;

    _result
};

// Keeps the valid classnames of a list (array or single string). Only when none is valid the fallback is used and logged
// (also when a mod is not loaded). A class is valid when it exists, is usable (scope >= 1) and fits the slot:
// _type 1 = primary weapon, 2 = handgun, 4 = launcher, 801 = uniform, 701 = vest, 605 = helmet, 616 = NVG, -1 = no type check
// (in cfgVehicles the class has to be a backpack)
_fnc_keep = {
	params [
		["_list", [], [[], ""]],
		["_fallback", [], [[]]],
		["_section", "cfgWeapons", [""]],
		["_name", "?", [""]],
		["_type", -1, [0]]
	];
	private _all = flatten [_list];
	// && is lazy on purpose: >> would raise an error on a non-string
	private _valid = _all select {
		(_x isEqualType "") && {
			private _cfg = configFile >> _section >> _x;
			(isClass _cfg) && {(getNumber (_cfg >> "scope")) >= 1} && {
				switch (true) do
				{
					case (_type in [1,2,4]): {(getNumber (_cfg >> "type")) == _type};
					case (_type > 0): {(getNumber (_cfg >> "ItemInfo" >> "type")) == _type};
					case (_section == "cfgVehicles"): {(getNumber (_cfg >> "isBackpack")) == 1};
					default {true};
				}
			}
		}
	};
	private _dropped = (_all - _valid) - [""];
	if ((_dropped isNotEqualTo []) && (_valid isNotEqualTo [])) then
	{
		["XEH_Gear", format ["%1: invalid or wrong slot type, removed: %2", _name, _dropped], 1] call LT_fnc_log;
	};
	if (_valid isEqualTo []) exitWith
	{
		["XEH_Gear", format ["%1: no valid class in %2 (invalid or wrong slot type), fallback %3 used", _name, _list, _fallback], 1] call LT_fnc_log;
		_fallback
	};
	_valid
};

// A magazine that fits the weapon: the given one, else the given fallback magazine, else the first compatible magazine
_fnc_mag = {
	params [
		["_mag", "", [""]],
		["_weapon", "", [""]],
		["_fallbackMag", "", [""]],
		["_name", "?", [""]]
	];
	if (isClass (configFile >> "cfgMagazines" >> _mag)) exitWith {_mag};
	private _result = if (isClass (configFile >> "cfgMagazines" >> _fallbackMag)) then
    {
        _fallbackMag
    } else
    {
        (compatibleMagazines _weapon) param [0, ""]
    };
	["XEH_Gear", format ["%1: magazine '%2' not valid, '%3' used", _name, _mag, _result], 1] call LT_fnc_log;
	_result
};

_sides = TabletSettings get "SIDES";
_loadRole = TabletSettings get "ROLES";
{
    // Define switchConditions for gear/weapon switch
    _sideGear = (MissionSettings get "GEAR") get _x;
    _sideWpn = (MissionSettings get "WEAPON") get _x;

    // Every side starts from "nothing chosen": placeholders that are never valid.
    // The variables have to exist here: a variable first set inside an include (a case scope) is lost after that scope.
    // Only what the includes do not set (or set wrong) is replaced by a fallback further down.
    // Clothing
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
    // Weapons
    _rifle = [""];
    _rifleGL = [""];
    _rifle_Mags = "";
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
    _itemsGLAmt = [];
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
    _launcherAA = "";
    _launcherAA_Mags = "";
    _mmg = "";
    _mmg_Mag = "";
    _mmg_Scope = "";
    _mat = "";
    _mat_Mags = [""];

    // Priority 1: the mission parameters. The includes fill the variables above.
    // isNil: an error inside an include (for example a custom file) only stops that include, the rest of the script keeps running.
    isNil {
        switch (_missionPeriod) do
        {
            case "BASE": { 
                #include "\lt_template_gear\Loadout_BASE\SwitchGearBASE.sqf"
            };
            case "GM": { 
                #include "\lt_template_gear\Loadout_GM\SwitchGearGM.sqf"
            };
            case "VN": { 
                #include "\lt_template_gear\Loadout_VN\SwitchGearVN.sqf"
            };
            case "40K": { 
                #include "\lt_template_gear\Loadout_40K\SwitchGear40K.sqf"
            };
        };
    };
    isNil {
        switch (_missionPeriod) do
        {
            case "BASE": { 
                #include "\lt_template_gear\Loadout_BASE\SwitchWeaponBASE.sqf"
            };
            case "GM": { 
                #include "\lt_template_gear\Loadout_GM\SwitchWeaponGM.sqf"
            };
            case "VN": { 
                #include "\lt_template_gear\Loadout_VN\SwitchWeaponVN.sqf"
            };
            case "40K": { 
                #include "\lt_template_gear\Loadout_40K\SwitchWeapon40K.sqf"
            };
        };
    };

    // Priority 2: fallback, only for what is empty or invalid after the includes (every use is logged).
    // Clothing: a valid default exists for every slot
    _unif = [_unif,["U_B_CombatUniform_mcam"],"cfgWeapons","_unif",801] call _fnc_keep;
    _vest = [_vest,["V_PlateCarrier1_rgr"],"cfgWeapons","_vest",701] call _fnc_keep;
    _helm = [_helm,["H_HelmetB"],"cfgWeapons","_helm",605] call _fnc_keep;

    _unifMedic = [_unifMedic,_unif,"cfgWeapons","_unifMedic",801] call _fnc_keep;
    _vestMedic = [_vestMedic,_vest,"cfgWeapons","_vestMedic",701] call _fnc_keep;
    _helmMedic = [_helmMedic,_helm,"cfgWeapons","_helmMedic",605] call _fnc_keep;

    _unifCrew = [_unifCrew,_unif,"cfgWeapons","_unifCrew",801] call _fnc_keep;
    _vestCrew = [_vestCrew,_vest,"cfgWeapons","_vestCrew",701] call _fnc_keep;
    _helmCrew = [_helmCrew,_helm,"cfgWeapons","_helmCrew",605] call _fnc_keep;

    _unifHeliP = [_unifHeliP,["NAF_U_HeliCoveralls_Support"],"cfgWeapons","_unifHeliP",801] call _fnc_keep;
    _unifHeliC = [_unifHeliC,_unifHeliP,"cfgWeapons","_unifHeliC",801] call _fnc_keep;
    _vestHeli = [_vestHeli,["V_TacVest_blk"],"cfgWeapons","_vestHeli",701] call _fnc_keep;
    _helmHeli = [_helmHeli,["H_PilotHelmetHeli_O"],"cfgWeapons","_helmHeli",605] call _fnc_keep;

    _unifJet = [_unifJet,_unifHeliP,"cfgWeapons","_unifJet",801] call _fnc_keep;
    _helmJet = [_helmJet,_helmHeli,"cfgWeapons","_helmJet",605] call _fnc_keep;

    _nvgs = [_nvgs,["NVGoggles"],"cfgWeapons","_nvgs",616] call _fnc_keep;
    // No goggles is allowed: the fallback is an empty slot
    _goggles = [_goggles,[""],"cfgGlasses","_goggles"] call _fnc_keep;

    _backpackSmall = [_backpackSmall,["B_AssaultPack_mcamo"],"cfgVehicles","_backpackSmall"] call _fnc_keep;
    _backpackLarge = [_backpackLarge,["B_Carryall_oucamo"],"cfgVehicles","_backpackLarge"] call _fnc_keep;
    _backpackMedic = [_backpackMedic,_backpackSmall,"cfgVehicles","_backpackMedic"] call _fnc_keep;
    _backpackRadio = [_backpackRadio,["B_RadioBag_01_sage_F"],"cfgVehicles","_backpackRadio"] call _fnc_keep;

    // Weapons: every slot falls back to a slot that always exists
    _rifle = [_rifle,["arifle_MX_F"],"cfgWeapons","_rifle",1] call _fnc_keep;
    _rifleGL = [_rifleGL,_rifle,"cfgWeapons","_rifleGL",1] call _fnc_keep;
    _rifleCrew = [_rifleCrew,_rifle,"cfgWeapons","_rifleCrew",1] call _fnc_keep;
    _rifleAir = [_rifleAir,_rifleCrew,"cfgWeapons","_rifleAir",1] call _fnc_keep;
    _rifleAR = [_rifleAR,_rifle,"cfgWeapons","_rifleAR",1] call _fnc_keep;
    _rifleMark = [_rifleMark,_rifle,"cfgWeapons","_rifleMark",1] call _fnc_keep;
    _handGun = [_handGun,["hgun_P07_F"],"cfgWeapons","_handGun",2] call _fnc_keep;

    // Launcher: only magazines that fit the (valid) launcher
    _launcher = [_launcher,["launch_NLAW_F"],"cfgWeapons","_launcher",4] call _fnc_keep;
    _launcher_Mags = (flatten [_launcher_Mags]) select {_x in compatibleMagazines (_launcher #0)};
    if (_launcher_Mags isEqualTo []) then
    {
        _launcher_Mags = (compatibleMagazines (_launcher #0)) select [0, 2];
        ["XEH_Gear", format ["_launcher_Mags: no fitting magazine, %1 used", _launcher_Mags], 1] call LT_fnc_log;
    };

    // Magazines: the given one, else one that fits
    _rifle_Mags = [_rifle_Mags,_rifle #0,"","_rifle_Mags"] call _fnc_mag;
    _rifle_Mags_Tr = [_rifle_Mags_Tr,_rifle #0,_rifle_Mags,"_rifle_Mags_Tr"] call _fnc_mag;
    _rifleCrew_Mags = [_rifleCrew_Mags,_rifleCrew #0,"","_rifleCrew_Mags"] call _fnc_mag;
    _rifleCrew_Mags_Tr = [_rifleCrew_Mags_Tr,_rifleCrew #0,_rifleCrew_Mags,"_rifleCrew_Mags_Tr"] call _fnc_mag;
    _rifleAir_Mags = [_rifleAir_Mags,_rifleAir #0,"","_rifleAir_Mags"] call _fnc_mag;
    _rifleAR_Mags = [_rifleAR_Mags,_rifleAR #0,"","_rifleAR_Mags"] call _fnc_mag;
    _handGun_Mags = [_handGun_Mags,_handGun #0,"","_handGun_Mags"] call _fnc_mag;

    if (_mmg_Scope == "" AND _missionScope) then {_mmg_Scope = (((UnitWeapons get (_loadRole #14)) get _missionPeriod) get "SCOPE")};

    // Check GL Weapon and define GL Ammo
    _glBool = false;
    _glHand = (UnitWeapons get "GLHG") get _missionPeriod;
    if (((_rifleGL #0) == "") OR (_rifleGL #0 == _rifle #0)) then
    {
        _glBool = true;
        _rifleGL = _rifle;
    };
    if ((_itemsGL select 0) == "") then {_itemsGL = ((ItemsGear get "GL") get _missionPeriod)#0};
    if ((_itemsGLNVG select 0) == "") then {_itemsGLNVG = ((ItemsGear get "GL") get _missionPeriod)#1};
    _ammoGL = if ((MissionSettings get "NVG")) then{_itemsGLNVG;}else{_itemsGL;};
    _itemsGLAmt = if (_itemsGLAmt isEqualTo []) then {((ItemsGear get "GL") get "Amount")} else {_itemsGLAmt};


    // Pre select heavy weapon types
    if (_launcherAA isNotEqualTo "") then
    {
        ((UnitWeapons get (_loadRole #8)) get _missionPeriod) set [_x, [_launcherAA_Mags,_launcherAA]];
    };
    if (_mmg isNotEqualTo "") then
    {
        ((UnitWeapons get (_loadRole #14)) get _missionPeriod) set [_x, [_mmg_Mag,_mmg]];
    };
    if (_mat isNotEqualTo "") then
    {
        ((UnitWeapons get (_loadRole #15)) get _missionPeriod) set [_x, [_mat_Mags,_mat]];
    };
    _weaponAT = [_launcher_Mags,_launcher];
    _weaponAA = ((UnitWeapons get (_loadRole #8)) get _missionPeriod) get _x;
    _weaponMMG = ((UnitWeapons get (_loadRole #14)) get _missionPeriod) get _x;
    _weaponMAT = ((UnitWeapons get (_loadRole #15)) get _missionPeriod) get _x;
    
    _rifleAtt=[
        _missionScope,_missionAtt,
        [
            (selectRandom _rifleAttRailIR),
            (selectRandom _rifleAttRailFL),
            (selectRandom _rifleAttMuzzle),
            (selectRandom _rifleAttBipod),
            (selectRandom _rifleAttScope)
        ],
        "Rifle",(selectRandom _rifle)
    ] call _fnc_weaponItems;
    
    _rifleGLAtt=[
        _missionScope,_missionAtt,
        [
            (selectRandom _rifleAttRailIR),
            (selectRandom _rifleAttRailFL),
            (selectRandom _rifleAttMuzzle),
            (selectRandom _rifleAttBipod),
            (selectRandom _rifleAttScope)
        ],
        "Rifle(GL)",(selectRandom _rifleGL)
    ] call _fnc_weaponItems;

    _rifleCrewAtt=[
        _missionScope,_missionAtt,
        [
            (selectRandom _rifleAttRailIR),
            (selectRandom _rifleAttRailFL),
            (selectRandom _rifleAttMuzzle),
            (selectRandom _rifleAttBipod),
            (selectRandom _rifleAttScope)
        ],
        "Rifle(Crew)",(selectRandom _rifleCrew)
    ] call _fnc_weaponItems;

    _rifleAirAtt=[
        _missionScope,_missionAtt,
        [
            (selectRandom _rifleAirAttRailIR),
            (selectRandom _rifleAirAttRailFL),
            (selectRandom _rifleAirAttMuzzle),
            (selectRandom _rifleAirAttBipod),
            (selectRandom _rifleAirAttScope)
        ],
        "Air",(selectRandom _rifleAir)
    ] call _fnc_weaponItems;

    _rifleHGAtt=[
        _missionScope,_missionAtt,
        [
            (selectRandom _handGunAttRailIR),
            (selectRandom _handGunAttRailFL),
            (selectRandom _handGunAttMuzzle),
            (selectRandom _handGunAttBipod),
            (selectRandom _handGunAttScope)
        ],
        "HG",(selectRandom _handGun)
    ] call _fnc_weaponItems;

    _rifleDMRAtt=[
        _missionScope,_missionAtt,
        [
            (selectRandom _rifleMarkAttRailIR),
            (selectRandom _rifleMarkAttRailFL),
            (selectRandom _rifleMarkAttMuzzle),
            (selectRandom _rifleMarkAttBipod),
            (selectRandom _rifleMarkAttScope)
        ],
        _loadRole #9,(selectRandom _rifleMark)
    ] call _fnc_weaponItems;

    _rifleARAtt=[
        _missionScope,_missionAtt,
        [
            (selectRandom _rifleARAttRailIR),
            (selectRandom _rifleARAttRailFL),
            (selectRandom _rifleARAttMuzzle),
            (selectRandom _rifleARAttBipod),
            (selectRandom _rifleARAttScope)
        ],
        _loadRole #10,(selectRandom _rifleAR)
    ] call _fnc_weaponItems;

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
                    ["Weapon",  (_weaponAT #1)],
                    ["Ammo",    (_weaponAT #0)],
                    ["WithAtt", [((_weaponAT #1)#0),"","","",[((_weaponAT #0)#0),1],[],""]]
                ]],
                [_loadRole #8,/*riflaa*/ createHashMapFromArray[
                    ["Weapon",  [(_weaponAA #1)]],
                    ["Ammo",    [(_weaponAA #0)]],
                    ["WithAtt", [(_weaponAA #1),"","","",[(_weaponAA #0),1],[],""]]
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
                    ["Weapon",  [(_weaponMMG #1)]],
                    ["Ammo",    [(_weaponMMG #0)]],
                    ["WithAtt", [(_weaponMMG #1),"","",_mmg_Scope,[(_weaponMMG #0),1],[],""]],
                    ["Att",     [_mmg_Scope]]
                ]],
                [_loadRole #15,/*mat*/ createHashMapFromArray[
                    ["Weapon",  [(_weaponMAT #1)]],
                    ["Ammo",    (_weaponMAT #0)],
                    ["WithAtt", [(_weaponMAT #1),"","","",[((_weaponMAT #0)#0),1],[],""]]
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
                    ["Weapon",  (_weaponAT #1)],
                    ["Ammo",    (_weaponAT #0)],
                    ["WithAtt", [((_weaponAT #1)#0),"","","",[((_weaponAT #0)#0),1],[],""]]
                ]],
                [_loadRole #8,/*riflaa*/ createHashMapFromArray[
                    ["Weapon",  [(_weaponAA #1)]],
                    ["Ammo",    [(_weaponAA #0)]],
                    ["WithAtt", [(_weaponAA #1),"","","",[(_weaponAA #0),1],[],""]]
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
                    ["Weapon",  [(_weaponMMG #1)]],
                    ["Ammo",    [(_weaponMMG #0)]],
                    ["WithAtt", [(_weaponMMG #1),"","",_mmg_Scope,[(_weaponMMG #0),1],[],""]],
                    ["Att",     [_mmg_Scope]]
                ]],
                [_loadRole #15,/*mat*/ createHashMapFromArray[
                    ["Weapon",  [(_weaponMAT #1)]],
                    ["Ammo",    (_weaponMAT #0)],
                    ["WithAtt", [(_weaponMAT #1),"","","",[((_weaponMAT #0)#0),1],[],""]]
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
                    ["Weapon",  (_weaponAT #1)],
                    ["Ammo",    (_weaponAT #0)],
                    ["WithAtt", [((_weaponAT #1)#0),"","","",[((_weaponAT #0)#0),1],[],""]]
                ]],
                [_loadRole #8,/*riflaa*/ createHashMapFromArray[
                    ["Weapon",  [(_weaponAA #1)]],
                    ["Ammo",    [(_weaponAA #0)]],
                    ["WithAtt", [(_weaponAA #1),"","","",[(_weaponAA #0),1],[],""]]
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
                    ["Weapon",  [(_weaponMMG #1)]],
                    ["Ammo",    [(_weaponMMG #0)]],
                    ["WithAtt", [(_weaponMMG #1),"","",_mmg_Scope,[(_weaponMMG #0),1],[],""]],
                    ["Att",     [_mmg_Scope]]
                ]],
                [_loadRole #15,/*mat*/ createHashMapFromArray[
                    ["Weapon",  [(_weaponMAT #1)]],
                    ["Ammo",    (_weaponMAT #0)],
                    ["WithAtt", [(_weaponMAT #1),"","","",[((_weaponMAT #0)#0),1],[],""]]
                ]]
            ];
            publicVariable "guerGear";
            publicVariable "guerWeapons";
        };
    };
    ["XEH_Gear",format ["Gear set for side:%1 ", _x],2] call LT_fnc_log;
    ["XEH_Gear",format ["Weapon set for side:%1 ",_x],2] call LT_fnc_log;
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
            ["Backpack",    [true,[(westGear get "Backpack")#2,2,"medic"],[(westGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #2 /*Crate Peleton*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "UAV")#1,1,"none"],[(westGear get "Backpack")#2,1,"medic"],[(westGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "UAV")#1,1,"none"],[(westGear get "Backpack")#2,1,"medic"],[(westGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #5 /*Crate Large*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "UAV")#1,2,"none"],[(westGear get "Backpack")#2,2,"medic"],[(westGear get "Backpack")#0,2,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #6 /*Crate Explosives*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #7 /*Crate Mines*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #8 /*Crate Medical*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "Backpack")#2,3,"medic"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #10 /*Crate Air*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(westGear get "Backpack")#0,2,"pilot"]]],
            ["addToBP",     [true,[((westWeapons get "AIR") get "Ammo")#0,((westWeapons get "HG") get "Ammo")#0],[10,5]]]
        ]],
        [_loadName #12 /*Crate NVG*/,createHashMapFromArray[
            [_missionPeriod,[selectRandom ((westGear get "NVG")#1)]],
            ["Amount",      [8]],
            ["Backpack",    [false,["",0,""]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #13 /*Crate UAV*/,createHashMapFromArray[
            [_missionPeriod,[(westGear get "UAV")#0]],
            ["Amount",      [1]],
            ["Backpack",    [true,[(westGear get "UAV")#1,5,"none"]]],
            ["addToBP",     [false,[],[]]]
        ]]
    ]],
    [_sides #1,createHashMapFromArray[
        [_loadName #1 /*Crate Squad*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "Backpack")#2,2,"medic"],[(eastGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #2 /*Crate Peleton*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "UAV")#1,1,"none"],[(eastGear get "Backpack")#2,1,"medic"],[(eastGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "UAV")#1,1,"none"],[(eastGear get "Backpack")#2,1,"medic"],[(eastGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #5 /*Crate Large*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "UAV")#1,2,"none"],[(eastGear get "Backpack")#2,2,"medic"],[(eastGear get "Backpack")#0,2,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #6 /*Crate Explosives*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #7 /*Crate Mines*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #8 /*Crate Medical*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "Backpack")#2,1,"medic"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #10 /*Crate Air*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(eastGear get "Backpack")#0,2,"pilot"]]],
            ["addToBP",     [true,[((eastWeapons get "AIR") get "Ammo")#0,((eastWeapons get "HG") get "Ammo")#0],[10,5]]]
        ]],
        [_loadName #12 /*Crate NVG*/,createHashMapFromArray[
            [_missionPeriod,[selectRandom ((eastGear get "NVG")#1)]],
            ["Amount",      [8]],
            ["Backpack",    [false,["",0,""]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #13 /*Crate UAV*/,createHashMapFromArray[
            [_missionPeriod,[(eastGear get "UAV")#0]],
            ["Amount",      [1]],
            ["Backpack",    [true,[(eastGear get "UAV")#1,5,"none"]]],
            ["addToBP",     [false,[],[]]]
        ]]
    ]],
    [_sides #2,createHashMapFromArray[
        [_loadName #1 /*Crate Squad*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "Backpack")#2,2,"medic"],[(guerGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #2 /*Crate Peleton*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "UAV")#1,1,"none"],[(guerGear get "Backpack")#2,1,"medic"],[(guerGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "UAV")#1,1,"none"],[(guerGear get "Backpack")#2,1,"medic"],[(guerGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #5 /*Crate Large*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "UAV")#1,2,"none"],[(guerGear get "Backpack")#2,2,"medic"],[(guerGear get "Backpack")#0,2,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #6 /*Crate Explosives*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #7 /*Crate Mines*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "Backpack")#0,1,"eng"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #8 /*Crate Medical*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "Backpack")#2,1,"medic"]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #10 /*Crate Air*/,createHashMapFromArray[
            [_missionPeriod,[]],
            ["Amount",      []],
            ["Backpack",    [true,[(guerGear get "Backpack")#0,2,"pilot"]]],
            ["addToBP",     [true,[((guerWeapons get "AIR") get "Ammo")#0,((guerWeapons get "HG") get "Ammo")#0],[10,5]]]
        ]],
        [_loadName #12 /*Crate NVG*/,createHashMapFromArray[
            [_missionPeriod,[selectRandom ((guerGear get "NVG")#1)]],
            ["Amount",      [8]],
            ["Backpack",    [false,["",0,""]]],
            ["addToBP",     [false,[],[]]]
        ]],
        [_loadName #13 /*Crate UAV*/,createHashMapFromArray[
            [_missionPeriod,[(guerGear get "UAV")#0]],
            ["Amount",      [1]],
            ["Backpack",    [true,[(guerGear get "UAV")#1,5,"none"]]],
            ["addToBP",     [false,[],[]]]
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
            ["AIR",         [westWeapons get "AIR",false,0,true,[16]]],
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
            [_loadRole #8,  [westWeapons get (_loadRole #8),true,1,false,[6]]],
            [_loadRole #14, [westWeapons get (_loadRole #14),false,1,false,[6]]],
            [_loadRole #15, [westWeapons get (_loadRole #15),true,1,false,[4]]]
        ]],
        [_loadName #3 /*Crate Small*/,createHashMapFromArray[
            ["Rifle",       [westWeapons get "Rifle",false,0,true,[8,8]]],
            ["RifleGL",     [westWeapons get "RifleGL",false,0,true,[10,5,0,0]]],
            ["Crew",        [westWeapons get "Crew",false,0,true,[8,8]]],
            ["AIR",         [westWeapons get "AIR",false,0,true,[8]]],
            ["HG",          [westWeapons get "HG",false,0,true,[8]]],
            [_loadRole #8,  [westWeapons get (_loadRole #8),true,0,true,[2]]],
            [_loadRole #9,  [westWeapons get (_loadRole #9),false,0,true,[4]]],
            [_loadRole #10, [westWeapons get (_loadRole #10),false,0,true,[3]]],
            [_loadRole #14, [westWeapons get (_loadRole #14),false,0,true,[3]]]
        ]],
        [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
            ["Rifle",       [westWeapons get "Rifle",false,0,true,[16,16]]],
            ["RifleGL",     [westWeapons get "RifleGL",false,0,true,[20,10,4,4]]],
            ["Crew",        [westWeapons get "Crew",false,0,true,[16,16]]],
            ["AIR",         [westWeapons get "AIR",false,0,true,[16]]],
            ["HG",          [westWeapons get "HG",false,0,true,[16]]],
            [_loadRole #7,  [westWeapons get (_loadRole #7),true,6,true,[6]]],
            [_loadRole #8,  [westWeapons get (_loadRole #8),true,6,true,[6]]],
            [_loadRole #9,  [westWeapons get (_loadRole #9),false,0,true,[10]]],
            [_loadRole #10, [westWeapons get (_loadRole #10),false,0,true,[6]]],
            [_loadRole #14, [westWeapons get (_loadRole #14),false,0,true,[6]]],
            [_loadRole #15, [westWeapons get (_loadRole #15),true,0,true,[4]]]
        ]],
        [_loadName #5 /*Crate Large*/,createHashMapFromArray[
            ["Rifle",       [westWeapons get "Rifle",false,0,true,[24,24]]],
            ["RifleGL",     [westWeapons get "RifleGL",false,0,true,[30,15,8,8]]],
            ["Crew",        [westWeapons get "Crew",false,0,true,[24,24]]],
            ["AIR",         [westWeapons get "AIR",false,0,true,[24]]],
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
        ]]
    ]],
    [_sides #1,createHashMapFromArray[
        [_loadName #1 /*Crate Squad*/,createHashMapFromArray[
            ["Rifle",       [eastWeapons get "Rifle",false,0,true,[48,12]]],
            ["RifleGL",     [eastWeapons get "RifleGL",false,0,true,[24,12,6,6]]],
            ["Crew",        [eastWeapons get "Crew",false,0,true,[24,6]]],
            ["AIR",         [eastWeapons get "AIR",false,0,true,[16]]],
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
            [_loadRole #8,  [eastWeapons get (_loadRole #8),true,1,false,[6]]],
            [_loadRole #14, [eastWeapons get (_loadRole #14),false,1,false,[6]]],
            [_loadRole #15, [eastWeapons get (_loadRole #15),true,1,false,[4]]]
        ]],
        [_loadName #3 /*Crate Small*/,createHashMapFromArray[
            ["Rifle",       [eastWeapons get "Rifle",false,0,true,[8,8]]],
            ["RifleGL",     [eastWeapons get "RifleGL",false,0,true,[10,5,0,0]]],
            ["Crew",        [eastWeapons get "Crew",false,0,true,[8,8]]],
            ["AIR",         [eastWeapons get "AIR",false,0,true,[8]]],
            ["HG",          [eastWeapons get "HG",false,0,true,[8]]],
            [_loadRole #8,  [eastWeapons get (_loadRole #8),true,0,true,[2]]],
            [_loadRole #9,  [eastWeapons get (_loadRole #9),false,0,true,[4]]],
            [_loadRole #10, [eastWeapons get (_loadRole #10),false,0,true,[3]]],
            [_loadRole #14, [eastWeapons get (_loadRole #14),false,0,true,[3]]]
        ]],
        [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
            ["Rifle",       [eastWeapons get "Rifle",false,0,true,[16,16]]],
            ["RifleGL",     [eastWeapons get "RifleGL",false,0,true,[20,10,4,4]]],
            ["Crew",        [eastWeapons get "Crew",false,0,true,[16,16]]],
            ["AIR",         [eastWeapons get "AIR",false,0,true,[16]]],
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
            ["AIR",         [eastWeapons get "AIR",false,0,true,[24]]],
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
        ]]
    ]],
    [_sides #2,createHashMapFromArray[
        [_loadName #1 /*Crate Squad*/,createHashMapFromArray[
            ["Rifle",       [guerWeapons get "Rifle",false,0,true,[48,12]]],
            ["RifleGL",     [guerWeapons get "RifleGL",false,0,true,[24,12,6,6]]],
            ["Crew",        [guerWeapons get "Crew",false,0,true,[24,6]]],
            ["AIR",         [guerWeapons get "AIR",false,0,true,[16]]],
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
            [_loadRole #8,  [guerWeapons get (_loadRole #8),true,1,false,[6]]],
            [_loadRole #14, [guerWeapons get (_loadRole #14),false,1,false,[6]]],
            [_loadRole #15, [guerWeapons get (_loadRole #15),true,1,false,[4]]]
        ]],
        [_loadName #3 /*Crate Small*/,createHashMapFromArray[
            ["Rifle",       [guerWeapons get "Rifle",false,0,true,[8,8]]],
            ["RifleGL",     [guerWeapons get "RifleGL",false,0,true,[10,5,0,0]]],
            ["Crew",        [guerWeapons get "Crew",false,0,true,[8,8]]],
            ["AIR",         [guerWeapons get "AIR",false,0,true,[8]]],
            ["HG",          [guerWeapons get "HG",false,0,true,[8]]],
            [_loadRole #8,  [guerWeapons get (_loadRole #8),true,0,true,[2]]],
            [_loadRole #9,  [guerWeapons get (_loadRole #9),false,0,true,[4]]],
            [_loadRole #10, [guerWeapons get (_loadRole #10),false,0,true,[3]]],
            [_loadRole #14, [guerWeapons get (_loadRole #14),false,0,true,[3]]]
        ]],
        [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
            ["Rifle",       [guerWeapons get "Rifle",false,0,true,[16,16]]],
            ["RifleGL",     [guerWeapons get "RifleGL",false,0,true,[20,10,4,4]]],
            ["Crew",        [guerWeapons get "Crew",false,0,true,[16,16]]],
            ["AIR",         [guerWeapons get "AIR",false,0,true,[16]]],
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
            ["AIR",         [guerWeapons get "AIR",false,0,true,[24]]],
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
        ]]
    ]]
];
publicVariable "weaponCrates";

["XEH_Gear","Template Gear PostInit finished",2] call LT_fnc_log;

LT_gear_ready = true;