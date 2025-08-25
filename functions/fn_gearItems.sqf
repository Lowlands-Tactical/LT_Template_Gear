/*

File: fn_gearItems.sqf
Author: Brainless_Ben

Description:
Returns items based on params (Timeperiod,Items)

Parameters:
	Example:
	[0,"Test"] remoteExec ["LT_fnc_gearItems"]
	Result:
	["Test\BASE"]

*/

private _period = param [0, 0, [0]];
private _gear = param [1, "Test", ["Test"]];

private _uniAmt = [6,6,6,2,2,2,1];
private _trowAmt = [6,2,2,0,0,0];
private _specAmt = [0,1,1,1,1,6,6];
private _meds = ["ACE_fieldDressing","ACE_elasticBandage","ACE_quikclot","ACE_tourniquet","ACE_splint","ACE_painkillers","ACE_morphine","ACE_epinephrine","ACE_bloodIV","ACE_plasmaIV_500","ACE_salineIV_500","ACE_bodyBag","ACE_surgicalKit"];
private _medAmt = [50,50,10,12,15,5,30,20,6,6,2,10,1];
private _mineAmt = [20,10,10,10,5];
private _explAmt = [20,10];

private _result = [];

//Period = 0/BASE 1/GM 3-"Roles"/Roles
switch (_period) do 
{
	case 0:
	{
		private _radios = ["ACRE_PRC343","ACRE_PRC152","ACRE_PRC117F"];
		private _roleArr = ["ItemGPS","ACE_Flashlight_XL50","ACE_EntrenchingTool","ACE_IR_Strobe_Item","ACE_UAVBattery"];

		_result = switch (_gear) do
		{
			case "Test":		{"Test\BASE"};
			case "Link":		{["ItemMap","ItemCompass","ItemWatch"]};
			case "Radio":		{_radios};
			case "Uniform":		{[_meds #0,_meds #1,_meds #2,_meds #3,_meds #4,_meds #5,"ACE_CableTie"]};
			case "UniformAmt":	{_uniAmt};
			case "Trow":		{["HandGrenade","SmokeShell","SmokeShellGreen","SmokeShellRed","SmokeShellYellow","SmokeShellPurple"]};
			case "TrowAmt":		{_trowAmt};
			case "Role":		{_roleArr};
			case "DMR":			{["ACE_RangeCard","ACE_SpottingScope", _radios #1, _roleArr #0, _roleArr #2]};
			case "Special":		{["ToolKit","ACE_M26_Clacker","ACE_wirecutter","MineDetector","ACE_DefusalKit","ACE_marker_flags_red","ACE_marker_flags_green"]};
			case "SpecialAmt":	{_specAmt};
			case "Expl":		{["DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag"]};
			case "ExplAmt":		{_explAmt};
			case "Mine":		{["APERSMineDispenser_Mag","ATMine_Range_Mag","APERSBoundingMine_Range_Mag","APERSMine_Range_Mag","SLAMDirectionalMine_Wire_Mag"]};
			case "MineAmt":		{_mineAmt};
			case "Medic":		{_meds};
			case "MedicAmt":	{_medAmt};
			case "Parachute":	{"B_Parachute"};
		};
	};
	case 1:
	{
		private _radios = ["ACRE_SEM52SL","ACRE_SEM70"];
		private _roleArr = ["ACE_DAGR","ACE_Flashlight_XL50","ACE_EntrenchingTool","ACE_IR_Strobe_Item",""];

		_result = switch (_gear) do
		{
			case "Test":		{"Test\GM"};
			case "Link":		{["ItemMap","gm_ge_army_conat2","gm_watch_kosei_80"]};
			case "Radio":		{_radios};
			case "Uniform":		{[_meds #0,_meds #1,_meds #2,_meds #3,_meds #4,_meds #5,"ACE_CableTie"]};
			case "UniformAmt":	{_uniAmt};
			case "Trow":		{["gm_handgrenade_frag_dm51a1","gm_smokeshell_wht_gc","gm_smokeshell_grn_gc","gm_smokeshell_red_gc","gm_smokeshell_yel_gc","gm_smokeshell_blu_gc"]};
			case "TrowAmt":		{_trowAmt};
			case "Role":		{_roleArr};
			case "DMR":			{["ACE_RangeCard","ACE_SpottingScope", _radios #1, _roleArr #0, _roleArr #2]};
			case "Special":		{["gm_repairkit_01","ACE_M26_Clacker","ACE_wirecutter","MineDetector","ACE_DefusalKit","ACE_marker_flags_red","ACE_marker_flags_green"]};
			case "SpecialAmt":	{_specAmt};
			case "Expl":		{["gm_explosive_petn_charge","gm_explosive_plnp_charge"]};
			case "ExplAmt":		{_explAmt};
			case "Mine":		{["","gm_mine_at_tm46","gm_mine_at_dm21","gm_mine_ap_dm31",""]};
			case "MineAmt":		{_mineAmt};
			case "Medic":		{_meds};
			case "MedicAmt":	{_medAmt};
			case "Parachute":	{"gm_backpack_rs9_parachute"};
		};
	};
	case 2:
	{
		private _radios = ["","ACRE_PRC77"];
		private _roleArr = ["ACE_DAGR","ACE_Flashlight_XL50","ACE_EntrenchingTool","ACE_IR_Strobe_Item",""];

		_result = switch (_gear) do
		{
			case "Test":		{"Test\VN"};
			case "Link":		{["vn_b_item_map","vn_b_item_compass","vn_b_item_watch"]};
			case "Radio":		{_radios};
			case "Uniform":		{[_meds #0,_meds #1,_meds #2,_meds #3,_meds #4,_meds #5,"ACE_CableTie"]};
			case "UniformAmt":	{_uniAmt};
			case "Trow":		{["vn_m67_grenade_mag","vn_m18_white_mag","vn_m18_green_mag","vn_m18_red_mag","vn_m18_yellow_mag","vn_m18_purple_mag"]};
			case "TrowAmt":		{_trowAmt};
			case "Role":		{_roleArr};
			case "DMR":			{["ACE_RangeCard","", _radios #1, _roleArr #0, _roleArr #2]};
			case "Special":		{["vn_b_item_toolkit","ACE_Clacker","ACE_wirecutter","","ACE_DefusalKit","ACE_marker_flags_red","ACE_marker_flags_green"]};
			case "SpecialAmt":	{_specAmt};
			case "Expl":		{["vn_mine_satchel_remote_02_mag","vn_mine_cartridge_mag"]};
			case "ExplAmt":		{_explAmt};
			case "Mine":		{["","","","",""]};
			case "MineAmt":		{_mineAmt};
			case "Medic":		{_meds};
			case "MedicAmt":	{_medAmt};
			case "Parachute":	{"vn_b_pack_t10_01"};
		};
	};
	case 3:
	{
		private _radios = ["ACRE_PRC343","ACRE_PRC152","ACRE_PRC117F"];
		private _roleArr = ["ItemGPS","ACE_Flashlight_XL50","ACE_EntrenchingTool","ACE_IR_Strobe_Item","ACE_UAVBattery"];

		_result = switch (_gear) do
		{
			case "Test":		{"Test\40K"};
			case "Link":		{["ItemMap","ItemCompass","ItemWatch"]};
			case "Radio":		{_radios};
			case "Uniform":		{["FirstAidKit","ACE_CableTie"]};
			case "UniformAmt":	{[5,2]};
			case "Trow":		{["TIOW_ig_frag_grenade_mag","TIOW_ig_krak_grenade_mag","TIOW_ig_smoke_grenade_mag","TIOW_ig_smoke_grenade_mag","TIOW_ig_smoke_grenade_mag","TIOW_ig_smoke_grenade_mag"]};
			case "TrowAmt":		{_trowAmt};
			case "Role":		{_roleArr};
			case "DMR":			{["ACE_RangeCard","ACE_SpottingScope", _radios #1, _roleArr #0, _roleArr #2]};
			case "Special":		{["ToolKit","ACE_M26_Clacker","ACE_wirecutter","MineDetector","ACE_DefusalKit","ACE_marker_flags_red","ACE_marker_flags_green"]};
			case "SpecialAmt":	{_specAmt};
			case "Expl":		{["IC_CAD_CHARGE_placeable_mag","TIOW_melta_bomb_placeable_Mag"]};
			case "ExplAmt":		{_explAmt};
			case "Mine":		{["APERSMineDispenser_Mag","ATMine_Range_Mag","APERSBoundingMine_Range_Mag","APERSMine_Range_Mag","SLAMDirectionalMine_Wire_Mag"]};
			case "MineAmt":		{_mineAmt};
			case "Medic":		{["FirstAidKit"]};
			case "MedicAmt":	{[10]};
			case "Parachute":	{"B_Parachute"};
		};
	};
};

_result;
