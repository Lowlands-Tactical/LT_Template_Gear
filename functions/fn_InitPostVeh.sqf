/*

File: fn_prepVehicleLoadout.sqf
Author: Brainless_Ben

Description:
preps veh loadout with the parameters from the description.ext or keeps the mission template.

Parameters:
[] 
	Example:
	[] remoteExec ["LT_fnc_initPostVeh", 2]

*/

/*_ltMission = getMissionConfigValue "LT_Loadout_ID";
if (isNil "_ltMission") exitWith
{
	Diag_log format ["[LT] (XEH) %1 Eject is not mission template", __FILE__];
};*/


if (!isServer) exitWith {};

if (lt_vehicleGearIsSet == 1) then
{
	Diag_log "[LT] (prepLoadout) vehicle loadouts already set";
	if ("lt_debug" call bis_fnc_getParamValue == 1) then 
	{
		systemChat "[LT] (prepLoadout) vehicle loadouts already set";
	};
}else
{
	{
		if (_x isKindOf "ReammoBox_F" OR _x isKindOf "LandVehicle" OR _x isKindOf "Air" OR _x isKindOf "Ship") then 
		{
			_vehLoadout = _x getVariable ["LT_veh_role", "Custom"];
			_vehside = _x getVariable ["LT_veh_side", "CIV"];
			Diag_Log format["[LT] (initPostVeh) Vehicle: %1 has Loadout: %2", _x, _vehLoadout];
			if (_vehLoadout != "Custom") then 
			{
				[_x, _vehside, _vehLoadout] spawn
				{
					params ["_vehicle","_vehside","_vehLoadout"];
					waitUntil {sleep 0.2;((((westWeapons get "Rifle") get "Weapon")#0) != "")};
					[_vehicle, _vehside, _vehLoadout] remoteExec ["LT_fnc_VehicleLoadout"];
				};
			}else
			{
				_vehRespawn = _x getVariable ["LT_veh_respawn", 0];
				Diag_Log format["[LT] (initPostVeh) Vehicle: %1 has Respawn: %2", _x, _vehRespawn];
				if (_vehRespawn != 0) then 
				{
					_x setVariable ["LT_veh_setRepawn", 1];
					_delay = _x getVariable ["LT_veh_respawn_delay",15];
					if (_delay < 15) then {_delay = 15;};
					[_x, _delay] remoteExec ["FRED_fnc_vehicleRespawn",2];
				};
			};
		};
		if ((getNumber (configFile >> "cfgvehicles" >> typeOf _x >> "isUAV") > 0) && count (crew _x) > 0) then 
		{
			_UAVSide = _x getVariable ["LT_drone_side", "WEST"];
			_vehSide = switch (_UAVSide) do
			{
				case "WEST":{west};
				case "EAST":{east};
				case "GUER":{resistance};
				case "CIV":{civilian};
			};
			_grpSide = (createGroup _vehSide);
			_grpSide copyWaypoints (group _x);
			[_x] joinSilent _grpSide;
			(crew _x) joinSilent _grpSide;
		};
	}forEach vehicles;

	lt_vehicleGearIsSet = 1;
	publicVariable "lt_vehicleGearIsSet";
};