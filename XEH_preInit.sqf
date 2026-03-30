/*

File: XEH_PreInit.sqf
Author: Brainless_Ben

Description:
Defines global variables and hashmaps used in the template.

*/

lt_vehicleGearIsSet = 0;

_items=
[
    "ACE_CableTie",                 // _items #0
    "ItemcTabHCam",                 // _items #1
    "ItemcTabMisc",                 // _items #2
    "ACE_rope6",                    // _items #3
    "ACE_RangeCard",                // _items #4
    "ACE_SpottingScope",            // _items #5
    "ACE_wirecutter",               // _items #6
    "MineDetector",                 // _items #7
    "ACE_M26_Clacker",              // _items #8
    "ACE_DefusalKit",               // _items #9
    "ACE_marker_flags_red",         // _items #10
    "ACE_marker_flags_green",       // _items #11
    "ACE_Flashlight_XL50",          // _items #12
    "ACE_EntrenchingTool",          // _items #13
    "ACE_IR_Strobe_Item",           // _items #14
    "ACE_UAVBattery",               // _items #15
    "FirstAidKit",                  // _items #16
    "ACE_SpraypaintBlack",          // _items #17
    "ACE_SpraypaintBlue",           // _items #18
    "ACE_SpraypaintGreen",          // _items #19
    "ACE_SpraypaintRed",            // _items #20
    "Chemlight_green",              // _items #21
    "ACE_Chemlight_IR",             // _items #22
    "ACE_HandFlare_Green",          // _items #23
    "ACE_HandFlare_Red"             // _items #24
];
_itemsLink=[
    ["ItemMap","ItemCompass","ItemWatch","ItemGPS"],                    // (_itemsLink #0)
    ["ItemMap","gm_ge_army_conat2","gm_watch_kosei_80","ACE_DAGR"],     // (_itemsLink #1)
    ["vn_b_item_map","vn_b_item_compass","vn_b_item_watch","ACE_DAGR"], // (_itemsLink #2)
    ["ItemMap","ItemCompass","ItemWatch","ItemGPS"]                     // (_itemsLink #3)
];
_itemsRadio=[
    ["ACRE_PRC343","ACRE_PRC152","ACRE_PRC117F"],   // (_itemsRadio #0)
    ["ACRE_SEM52SL","ACRE_SEM70","ACRE_PRC117F"],   // (_itemsRadio #1)
    ["","ACRE_PRC77","ACRE_PRC117F"],               // (_itemsRadio #2)
    ["ACRE_PRC343","ACRE_PRC152","ACRE_PRC117F"]    // (_itemsRadio #3)
];
_itemsTrow=[
    ["HandGrenade","SmokeShell","SmokeShellGreen","SmokeShellRed","SmokeShellYellow","SmokeShellPurple"],                                                                   // (_itemsTrow #0)
    ["gm_handgrenade_frag_dm51a1","gm_smokeshell_wht_gc","gm_smokeshell_grn_gc","gm_smokeshell_red_gc","gm_smokeshell_yel_gc","gm_smokeshell_blu_gc"],                      // (_itemsTrow #1)
    ["vn_m67_grenade_mag","vn_m18_white_mag","vn_m18_green_mag","vn_m18_red_mag","vn_m18_yellow_mag","vn_m18_purple_mag"],                                                  // (_itemsTrow #2)
    ["TIOW_ig_frag_grenade_mag","TIOW_ig_krak_grenade_mag","TIOW_ig_smoke_grenade_mag","TIOW_ig_smoke_grenade_mag","TIOW_ig_smoke_grenade_mag","TIOW_ig_smoke_grenade_mag"] // (_itemsTrow #3)
];
_itemsTrowAmt=[
    [6,2,2],                // (_itemsTrowAmt #0)
    [16,16,8,8,8,8],        // (_itemsTrowAmt #1)
    [10,5,5,5,5,5],         // (_itemsTrowAmt #2)
    [20,10,10,10,10,10],    // (_itemsTrowAmt #3)
    [30,20,20,20,20,20],    // (_itemsTrowAmt #4)
    [0,4,4,6,6,6]           // (_itemsTrowAmt #5)
];
_itemsGL=[
    [["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"],["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"]],              // (_itemsGL #0)
    [["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"],["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F"]],              // (_itemsGL #1)
    [["vn_40mm_m381_he_mag","vn_40mm_m680_smoke_w_mag","vn_40mm_m715_smoke_g_mag","vn_40mm_m682_smoke_r_mag"],["vn_40mm_m381_he_mag","vn_40mm_m583_flare_w_mag","vn_40mm_m661_flare_g_mag","vn_40mm_m662_flare_r_mag"]],// (_itemsGL #2)
    [["TIOW_IG_GL_Frag_mag","TIOW_IG_GL_Krak_mag","TIOW_IG_GL_Flame_mag","TIOW_IG_GL_Smoke_mag"],["TIOW_IG_GL_Frag_mag","TIOW_IG_GL_Krak_mag","TIOW_IG_GL_Flame_mag","TIOW_IG_GL_Flare_mag"]]                           // (_itemsGL #3)
];

_medic=[
    "ACE_fieldDressing",    // _medic #0
    "ACE_elasticBandage",   // _medic #1
    "ACE_quikclot",         // _medic #2
    "ACE_tourniquet",       // _medic #3
    "ACE_splint",           // _medic #4
    "ACE_painkillers",      // _medic #5
    "ACE_morphine",         // _medic #6
    "ACE_epinephrine",      // _medic #7
    "ACE_bloodIV",          // _medic #8
    "ACE_plasmaIV_500",     // _medic #9
    "ACE_salineIV_500",     // _medic #10
    "ACE_bodyBag",          // _medic #11
    "ACE_surgicalKit",      // _medic #12
    "ACE_personalAidKit"    // _medic #13
];
_medicAmt=[
    [100,100,20,24,30,10,60,40,12,12,4,20,2,20],// (_medicAmt #0)
    [50,50,10,12,15,5,30,20,6,6,2,10,1,10],     // (_medicAmt #1)
    [25,25,5,6,8,3,15,10,3,3,1,5,1,5],          // (_medicAmt #2)
    [13,13,3,3,4,2,8,5,2,2,1,3,1,3],            // (_medicAmt #3)
    [6,6,6,2,2,1,0,2,1]                         // (_medicAmt #4)
];

_itemsExpl=[
    [20,10],                                                        // (_itemsExpl #0)
    ["DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag"],           // (_itemsExpl #1)
    ["gm_explosive_petn_charge","gm_explosive_plnp_charge"],        // (_itemsExpl #2)
    ["vn_mine_satchel_remote_02_mag","vn_mine_cartridge_mag"],      // (_itemsExpl #3)
    ["IC_CAD_CHARGE_placeable_mag","TIOW_melta_bomb_placeable_Mag"] // (_itemsExpl #4)
];
_itemsMines=[
    [20,10,10,10,5],                                                                                                                    // (_itemsMines #0)
    ["APERSMineDispenser_Mag","ATMine_Range_Mag","APERSBoundingMine_Range_Mag","APERSMine_Range_Mag","SLAMDirectionalMine_Wire_Mag"],   // (_itemsMines #1)
    ["","gm_mine_at_tm46","gm_mine_at_dm21","gm_mine_ap_dm31",""],                                                                      // (_itemsMines #2)
    ["","","","",""],                                                                                                                   // (_itemsMines #3)
    ["APERSMineDispenser_Mag","ATMine_Range_Mag","APERSBoundingMine_Range_Mag","APERSMine_Range_Mag","SLAMDirectionalMine_Wire_Mag"]    // (_itemsMines #4)
];

/*
    roleSettings
    ["com","sql","jtac","ftl","gren","comms","rifl","riflat","riflaa","dmr","ar","aar","medic","eng","mmg","mat","vhco","vhgu","vhdr","pilot","crew","jet","lvdw"];
    [ 00  , 01  ,  02  , 03  ,  04  ,  05   ,  06  ,   07   ,   08   , 09  , 10 , 11  ,  12   , 13  , 14  ,  15 ,  16  ,  17  ,  18  ,  19   ,  20  ,  21 ,  22  ];

	SmallBP = gren, rifl, dmr, ar, aar, eng, vhgu, vhdr
	LargeBP = riflat, riflaa, mmg, mat
    RadioBP = com, sql, jtac, ftl, comms, vhco
    NoArrBackpack = medic, lvdw

	MainWpn = rifl, riflat, riflaa, aar, mat, lvdw
	GLWpn = com, sql, jtac, ftl, gren, comms
	CrewWpn = medic, eng, vhco, vhgu, vhdr
    AirWpn = pilot, crew, jet
	SpecialWpn =  riflat, riflaa, dmr, ar, mmg, mat
	Bino = rifl, riflat, riflaa, ar, medic, eng, mmg, mat, vhgu, vhdr, lvdw
*/
_roles = TabletSettings get "ROLES";
RoleSettings = createHashMapFromArray [
	["backSmall",	[_roles #4,_roles #6,_roles #9,_roles #10,_roles #11,_roles #13,_roles #17,_roles #18]],
	["backLarge",	[_roles #7,_roles #8,_roles #14,_roles #15]],
    ["backRadio",   [_roles #0,_roles #1,_roles #2,_roles #3,_roles #5,_roles #16]],
	["wpnMain",		[_roles #6,_roles #7,_roles #8,_roles #11,_roles #15,_roles #22]],
	["wpnGL",		[_roles #0,_roles #1,_roles #2,_roles #3,_roles #4,_roles #5]],
	["wpnCrew",		[_roles #12,_roles #13,_roles #16,_roles #17,_roles #18]],
    ["wpnAir",      [_roles #19,_roles #20,_roles #21]],
	["wpnSpecial",	[_roles #7,_roles #8,_roles #9,_roles #10,_roles #14,_roles #15]],
	["wpnBino",		[_roles #6,_roles #7,_roles #8,_roles #10,_roles #12,_roles #13,_roles #14,_roles #15,_roles #17,_roles #18,_roles #22]]
];
publicVariable "RoleSettings";

_sides = TabletSettings get "SIDES";
// Unit weapons and magazines - Build arrays like this: Type >> Period >> Side >>["magazine","weapon"]
UnitWeapons = createHashMapFromArray[
    [_roles #8,createHashMapFromArray[
        ["BASE",createHashMapFromArray[
            [_sides #0,["rhs_fim92_mag","rhs_weap_fim92"]],
            [_sides #1,["rhs_mag_9k38_rocket","rhs_weap_igla"]],
            [_sides #2,["Titan_AA","launch_I_Titan_eaf_F"]]
        ]],
        ["GM",createHashMapFromArray[
            [_sides #0,["gm_1Rnd_70mm_he_m585_fim43","gm_fim43_oli"]],
            [_sides #1,["gm_1Rnd_72mm_he_9m32m","gm_9k32m_oli"]],
            [_sides #2,["gm_1Rnd_70mm_he_m585_fim43","gm_fim43_oli"]]
        ]],
        ["VN",createHashMapFromArray[
            [_sides #0,["vn_sa7b","vn_sa7b"]],
            [_sides #1,["vn_sa7b","vn_sa7b"]],
            [_sides #2,["vn_sa7b","vn_sa7b"]]
        ]],
        ["40K",createHashMapFromArray[
            [_sides #0,["IC_Flak_Missile_mag","IC_Launcher_AA_grey"]],
            [_sides #1,["IC_Flak_Missile_mag","IC_Launcher_AA_grey"]],
            [_sides #2,["IC_Flak_Missile_mag","IC_Launcher_AA_grey"]]
        ]]
    ]],
    [_roles #14,createHashMapFromArray[
        ["BASE",createHashMapFromArray[
            [_sides #0,["Aegis_200Rnd_762x51_MAG_Green_Tracer_F","Aegis_MMG_FNMAG_F"]],
            [_sides #1,["100Rnd_762x51_S77_Red_lxWS","LMG_S77_lxWS"]],
            [_sides #2,["hlc_200Rnd_762x51_M_M60E4","hlc_lmg_m60"]]
        ]],
        ["GM",createHashMapFromArray[
            [_sides #0,["gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn","gm_lmgm62_blk"]],
            [_sides #1,["gm_100Rnd_762x54mmR_B_T_7t2_pk_grn","gm_hmgpkm_prp"]],
            [_sides #2,["hlc_200Rnd_762x51_M_M60E4","hlc_lmg_m60"]]
        ]],
        ["VN",createHashMapFromArray[
            [_sides #0,["vn_m60_100_mag","vn_m60"]],
            [_sides #1,["vn_m60_100_mag","vn_m60"]],
            [_sides #2,["vn_m60_100_mag","vn_m60"]]
        ]],
        ["40K",createHashMapFromArray[
            [_sides #0,["ic_100rnd_825_HP_Tracer_rifleMag","ICP_LMG_01_imp"]],
            [_sides #1,["ic_100rnd_825_HP_Tracer_rifleMag","ICP_LMG_01_imp"]],
            [_sides #2,["ic_100rnd_825_HP_Tracer_rifleMag","ICP_LMG_01_imp"]]
        ]]
    ]],
    [_roles #15,createHashMapFromArray[
        ["BASE",createHashMapFromArray[
            [_sides #0,[["ace_spike_lr"],"ace_spike_launcher_olive"]],
            [_sides #1,[["ace_spike_lr"],"ace_spike_launcher"]],
            [_sides #2,[["Titan_AT"],"launch_B_Titan_short_tna_F"]]
        ]],
        ["GM",createHashMapFromArray[
            [_sides #0,[["gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM12a1_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf"],"gm_pzf84_oli"]],
            [_sides #1,[["gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM12a1_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf"],"gm_pzf84_oli"]],
            [_sides #2,[["gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM12a1_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf"],"gm_pzf84_oli"]]
        ]],
        ["VN",createHashMapFromArray[
            [_sides #0,[["gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM12a1_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf"],"gm_pzf84_oli"]],
            [_sides #1,[["gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM12a1_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf"],"gm_pzf84_oli"]],
            [_sides #2,[["gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM12a1_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf"],"gm_pzf84_oli"]]
        ]],
        ["40K",createHashMapFromArray[
            [_sides #0,[["ace_spike_lr"],"ace_spike_launcher_olive"]],
            [_sides #1,[["ace_spike_lr"],"ace_spike_launcher_olive"]],
            [_sides #2,[["ace_spike_lr"],"ace_spike_launcher_olive"]]
        ]]
    ]],
    ["GLHG",createHashMapFromArray[
        ["BASE",""],
        ["GM","gm_pallad_d_brn"],
        ["VN","vn_m79_p"],
        ["40K","TIOW_IG_GL"]
    ]],
    ["BINO",createHashMapFromArray[
        ["BASE","Rangefinder"],
        ["GM","gm_ferod16_oli"],
        ["VN","vn_m19_binocs_grey"],
        ["40K","ic_cad_magnoculars"]
    ]],
    ["LASER",createHashMapFromArray[
        ["BASE",["Laserdesignator_01_khk_F","Laserbatteries"]],
        ["GM",["gm_lp7_oli",""]],
        ["VN",["gm_lpr1_oli",""]],
        ["40K",["Laserdesignator_01_khk_F","Laserbatteries"]]
    ]]
];
publicVariable "UnitWeapons";

_loadRole = TabletSettings get "ROLES";
ItemsGear= createHashMapFromArray [
    ["UAV",createHashMapFromArray[
        [_sides #0,["B_UavTerminal","B_UAV_01_backpack_F"]],
        [_sides #1,["O_UavTerminal","O_UAV_01_backpack_F"]],
        [_sides #2,["I_UavTerminal","I_UAV_01_backpack_F"]]
    ]],
    ["AIR",createHashMapFromArray[
        ["BASE",["V_Rangemaster_belt","B_Parachute"]],
        ["GM",["V_Rangemaster_belt","gm_backpack_rs9_parachute"]],
        ["VN",["V_Rangemaster_belt","vn_b_pack_t10_01"]],
        ["40K",["V_Rangemaster_belt","B_Parachute"]]
    ]],
    ["LVDW",[["NAF_Digbag_extra","NAF_BigDigBag_extra"],"\lt_template_base\Logos\lvdwcamo.paa"]],
    ["Link",createHashMapFromArray[
        ["BASE",    (_itemsLink #0)],
        ["GM",      (_itemsLink #1)],
        ["VN",      (_itemsLink #2)],
        ["40K",     (_itemsLink #3)],
        ["Amount",  [1,1,1,0]]
    ]],
    ["Radio",createHashMapFromArray[
        ["BASE",    (_itemsRadio #0)],
        ["GM",      (_itemsRadio #1)],
        ["VN",      (_itemsRadio #2)],
        ["40K",     (_itemsRadio #3)],
        ["Amount",  [1,1,1]]
    ]],
    ["Uniform",createHashMapFromArray[
        ["BASE",    [_medic #0,_medic #1,_medic #2,_medic #3,_medic #4,_medic #5,_medic #13,_items #0,_items #1]],
        ["GM",      [_medic #0,_medic #1,_medic #2,_medic #3,_medic #4,_medic #5,_medic #13,_items #0,_items #1]],
        ["VN",      [_medic #0,_medic #1,_medic #2,_medic #3,_medic #4,_medic #5,_medic #13,_items #0,_items #1]],
        ["40K",     [_items #16,_items #16,"","","","","",_items #0,_items #1]],
        ["Amount",  (_medicAmt #4)]
    ]],
    ["Vest",createHashMapFromArray[
        ["BASE",    [(_itemsTrow #0) #0,(_itemsTrow #0) #1,(_itemsTrow #0) #2]],
        ["GM",      [(_itemsTrow #1) #0,(_itemsTrow #1) #1,(_itemsTrow #1) #2]],
        ["VN",      [(_itemsTrow #2) #0,(_itemsTrow #2) #1,(_itemsTrow #2) #2]],
        ["40K",     [(_itemsTrow #3) #0,(_itemsTrow #3) #1,(_itemsTrow #3) #2]],
        ["Amount",  (_itemsTrowAmt #0)]
    ]],
    ["VestExtra",createHashMapFromArray[
        ["BASE",    (_itemsTrow #0)],
        ["GM",      (_itemsTrow #1)],
        ["VN",      (_itemsTrow #2)],
        ["40K",     (_itemsTrow #3)],
        ["Amount",  (_itemsTrowAmt #5)]
    ]],
    ["GL",createHashMapFromArray[
        ["BASE",    (_itemsGL #0)],
        ["GM",      (_itemsGL #1)],
        ["VN",      (_itemsGL #2)],
        ["40K",     (_itemsGL #3)],
        ["Amount",  []]
    ]],
    ["NVG",createHashMapFromArray[
        ["BASE",    [_items #12,_items #14,_items #21,_items #22]],
        ["GM",      [_items #12,"",_items #21,_items #22]],
        ["VN",      [_items #12,"",_items #21,_items #22]],
        ["40K",     [_items #12,_items #14,_items #21,_items #22]],
        ["Amount",  [1,4,2,2]]
    ]],
    [_loadRole #0 /*com*/,createHashMapFromArray[
        ["BASE",    [_items #2,_items #17,_items #18,_items #19,_items #20,_items #23,_items #24]],
        ["GM",      ["",_items #17,_items #18,_items #19,_items #20,_items #23,_items #24]],
        ["VN",      ["",_items #17,_items #18,_items #19,_items #20,_items #23,_items #24]],
        ["40K",     [_items #2,_items #17,_items #18,_items #19,_items #20,_items #23,_items #24]],
        ["Amount",  [1,2,2,2,2,4,4]]
    ]],
    [_loadRole #2 /*jtac*/,createHashMapFromArray[
        ["BASE",    [_items #13]],
        ["GM",      [_items #13]],
        ["VN",      [_items #13]],
        ["40K",     [_items #13]],
        ["Amount",  [1]]
    ]],
    [_loadRole #4 /*gren*/,createHashMapFromArray[
        ["BASE",    [_items #6]],
        ["GM",      [_items #6]],
        ["VN",      [_items #6]],
        ["40K",     [_items #6]],
        ["Amount",  [1]]
    ]],
    [_loadRole #7 /*riflat*/,createHashMapFromArray[
        ["BASE",    [_items #6]],
        ["GM",      [_items #6]],
        ["VN",      [_items #6]],
        ["40K",     [_items #6]],
        ["Amount",  [1]]
    ]],
    [_loadRole #9 /*dmr*/,createHashMapFromArray[
        ["BASE",    [_items #4,_items #5,_items #13]],
        ["GM",      [_items #4,_items #5,_items #13]],
        ["VN",      [_items #4,_items #5,_items #13]],
        ["40K",     [_items #4,_items #5,_items #13]],
        ["Amount",  [1,1,1]]
    ]],
    [_loadRole #12 /*medic*/,createHashMapFromArray[
        ["BASE",    _medic],
        ["GM",      _medic],
        ["VN",      _medic],
        ["40K",     [_items #16,"","","","","","","","","","","","",""]],
        ["Amount",  (_medicAmt #1)]
    ]],
    [_loadRole #13 /*eng*/,createHashMapFromArray[
        ["BASE",    [_items #6,_items #7,_items #8,_items #9,_items #10,_items #11,_items #17,_items #18,_items #19,_items #20]],
        ["GM",      [_items #6,_items #7,_items #8,_items #9,_items #10,_items #11,_items #17,_items #18,_items #19,_items #20]],
        ["VN",      [_items #6,_items #7,_items #8,_items #9,_items #10,_items #11,_items #17,_items #18,_items #19,_items #20]],
        ["40K",     [_items #6,_items #7,_items #8,_items #9,_items #10,_items #11,_items #17,_items #18,_items #19,_items #20]],
        ["Amount",  [1,1,1,1,6,6,2,2,2,2]]
    ]]
];
publicVariable "ItemsGear";

// Crate loadouts
_loadName = TabletSettings get "LOAD";
itemsCrates=createHashMapFromArray[
    [_loadName #1 /*Crate Squad*/,createHashMapFromArray[
        ["BASE",    [_items #13,_items #14,(_itemsExpl #1 #0)] +(_itemsTrow #0) +_medic],
        ["GM",      [_items #13,"",(_itemsExpl #2 #0)] +(_itemsTrow #1) +_medic],
        ["VN",      [_items #13,"",(_itemsExpl #3 #0)] +(_itemsTrow #2) +_medic],
        ["40K",     [_items #13,_items #14,(_itemsExpl #4 #0)] +(_itemsTrow #3) +_medic],
        ["Amount",  [2,8,8] +(_itemsTrowAmt #1) +(_medicAmt #3)]
    ]],
    [_loadName #2 /*Crate Peleton*/,createHashMapFromArray[
        ["BASE",    [_items #13,_items #14,_items #15,(_itemsRadio #0 #1)]],
        ["GM",      [_items #13,"","",(_itemsRadio #1 #1)]],
        ["VN",      [_items #13,"","",(_itemsRadio #2 #1)]],
        ["40K",     [_items #13,_items #14,_items #15,(_itemsRadio #3 #1)]],
        ["Amount",  [6,16,4,3]]
    ]],
    [_loadName #3 /*Crate Small*/,createHashMapFromArray[
        ["BASE",    [_items #3,_items #15] +(_itemsTrow #0) +_medic],
        ["GM",      [_items #3,""] +(_itemsTrow #1) +_medic],
        ["VN",      [_items #3,""] +(_itemsTrow #2) +_medic],
        ["40K",     [_items #3,_items #15] +(_itemsTrow #3) +_medic],
        ["Amount",  [3,1] +(_itemsTrowAmt #2) +(_medicAmt #3)]
    ]],
    [_loadName #4 /*Crate Medium*/,createHashMapFromArray[
        ["BASE",    [_items #3,_items #15] +(_itemsTrow #0) +_medic],
        ["GM",      [_items #3,""] +(_itemsTrow #1) +_medic],
        ["VN",      [_items #3,""] +(_itemsTrow #2) +_medic],
        ["40K",     [_items #3,_items #15] +(_itemsTrow #3) +_medic],
        ["Amount",  [6,2] +(_itemsTrowAmt #3) +(_medicAmt #2)]
    ]],
    [_loadName #5 /*Crate Large*/,createHashMapFromArray[
        ["BASE",    [_items #3,_items #15] +(_itemsTrow #0) +_medic],
        ["GM",      [_items #3,""] +(_itemsTrow #1) +_medic],
        ["VN",      [_items #3,""] +(_itemsTrow #2) +_medic],
        ["40K",     [_items #3,_items #15] +(_itemsTrow #3) +_medic],
        ["Amount",  [12,4] +(_itemsTrowAmt #4) +(_medicAmt #1)]
    ]],
    [_loadName #6 /*Crate Explosives*/,createHashMapFromArray[
        ["BASE",    [_items #7,_items #8,_items #9,_items #10,_items #11] +(_itemsExpl #1)],
        ["GM",      [_items #7,_items #8,_items #9,_items #10,_items #11] +(_itemsExpl #2)],
        ["VN",      [_items #7,_items #8,_items #9,_items #10,_items #11] +(_itemsExpl #3)],
        ["40K",     [_items #7,_items #8,_items #9,_items #10,_items #11] +(_itemsExpl #4)],
        ["Amount",  [2,2,2,10,10] +(_itemsExpl #0)]
    ]],
    [_loadName #7 /*Crate Mines*/,createHashMapFromArray[
        ["BASE",    [_items #7,_items #8,_items #9,_items #10,_items #11] +(_itemsMines #1)],
        ["GM",      [_items #7,_items #8,_items #9,_items #10,_items #11] +(_itemsMines #2)],
        ["VN",      [_items #7,_items #8,_items #9,_items #10,_items #11] +(_itemsMines #3)],
        ["40K",     [_items #7,_items #8,_items #9,_items #10,_items #11] +(_itemsMines #4)],
        ["Amount",  [2,2,2,10,10] +(_itemsMines #0)]
    ]],
    [_loadName #8 /*Crate Medical*/,createHashMapFromArray[
        ["BASE",    _medic],
        ["GM",      _medic],
        ["VN",      _medic],
        ["40K",     [_items #16,"","","","","","","","","","","","",""]],
        ["Amount",  (_medicAmt #0)]
    ]],
    [_loadName #10 /*Crate Air*/,createHashMapFromArray[
        ["BASE",    [(_itemsLink #0 #3),_items #13] +(_itemsTrow #0) +_medic +[(UnitWeapons get "BINO") get "BASE"]],
        ["GM",      [(_itemsLink #1 #3),_items #13] +(_itemsTrow #1) +_medic +[(UnitWeapons get "BINO") get "GM"]],
        ["VN",      [(_itemsLink #2 #3),_items #13] +(_itemsTrow #2) +_medic +[(UnitWeapons get "BINO") get "VN"]],
        ["40K",     [(_itemsLink #3 #3),_items #13] +(_itemsTrow #3) +_medic +[(UnitWeapons get "BINO") get "40K"]],
        ["Amount",  [4,4] +(_itemsTrowAmt #2) +(_medicAmt #3) +[4]]
    ]],
    [_loadName #11 /*Crate Comms*/,createHashMapFromArray[
        ["BASE",    [(_itemsLink #0 #3),_items #12] +(_itemsRadio #0) +((UnitWeapons get "LASER") get "BASE")],
        ["GM",      [(_itemsLink #1 #3),_items #12] +(_itemsRadio #1) +((UnitWeapons get "LASER") get "GM")],
        ["VN",      [(_itemsLink #2 #3),_items #12] +(_itemsRadio #2) +((UnitWeapons get "LASER") get "VN")],
        ["40K",     [(_itemsLink #3 #3),_items #12] +(_itemsRadio #3) +((UnitWeapons get "LASER") get "40K")],
        ["Amount",  [10,5] +[10,10,10] +[10,10]]
    ]],
    [_loadName #12 /*Crate NVG*/,createHashMapFromArray[
        ["BASE",    [_items #12,_items #14,_items #21,_items #22]],
        ["GM",      [_items #12,_items #14,_items #21,_items #22]],
        ["VN",      [_items #12,_items #14,_items #21,_items #22]],
        ["40K",     [_items #12,_items #14,_items #21,_items #22]],
        ["Amount",  [20,40,20,20]]
    ]],
    [_loadName #13 /*Crate UAV*/,createHashMapFromArray[
        ["BASE",    [_items #12,_items #14,_items #15] +((UnitWeapons get "LASER") get "BASE")],
        ["GM",      [_items #12,_items #14,_items #15] +((UnitWeapons get "LASER") get "GM")],
        ["VN",      [_items #12,_items #14,_items #15] +((UnitWeapons get "LASER") get "VN")],
        ["40K",     [_items #12,_items #14,_items #15] +((UnitWeapons get "LASER") get "40K")],
        ["Amount",  [4,8,4] +[8,8]]
    ]]
];
publicVariable "itemsCrates";

Diag_log "[LT] (XEH) Template Gear PreInit finished";
if ("lt_debug" call bis_fnc_getParamValue == 1) then 
{
	systemChat "[LT] (XEH) Template Gear PreInit finished";
};