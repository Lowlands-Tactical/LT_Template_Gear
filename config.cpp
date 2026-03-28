#include "\lt_template_base\script_mod.hpp"

class cfgPatches
{
	class lt_template_gear
	{
		name="lt_template_gear";
		author="Lowlands Tactical";
		url="http://lowtac.nl/";
		requiredVersion=2.14;
		requiredAddons[]=
        {
            "lt_template_base"
        };
		units[]={};
		weapons[]={};

		//CBA versioning
		version=VERSION;
		versionStr=STR(VERSION_STR);
		versionAR[]={VERSION_AR};
	};
};

#include "cfg3DEN.hpp"

// Extended Eventhandlers
/*Game start
│
├─ PreStart
│
Mission loading
│
├─ PreInit
│
├─ Object Init
│   (Extended_Init_EventHandlers)
│
├─ init.sqf
│
├─ PostInit
│
└─ InitPost	*/

class Extended_PreInit_EventHandlers
{
	class LT_Template_Gear_Pre
	{
		serverinit="call compile preprocessFileLineNumbers '\lt_template_gear\XEH_PreInit.sqf'";
	};
};
class Extended_PostInit_EventHandlers
{
	class LT_Template_Gear_Post
	{
		serverinit="call compile preprocessFileLineNumbers '\lt_template_gear\XEH_PostInit.sqf'";
	};
};
class Extended_InitPost_EventHandlers
{
	class CAManBase
	{
		class LT_Template_Gear_InitMan
		{
			clientinit="_this call LT_fnc_InitPostUnit";
		};
	};
};

// Functions for lt_template_gear
class cfgFunctions
{
    class LT
    {
        class template_gear
        {
            file="\lt_template_gear\functions";
			class buildInNVG {};
            class initPostUnit {};
            class initPostVeh {};
            class resetMaxLoad {};
			class unitLoadout {};
            class vehicleLoadout {};
        };
    };
};

// Defines the functions that can we remote executed and for whom.
class cfgRemoteExec
{
    class Functions
    {
        // 0= all machines 1= only clients 2= only server
        mode=2;
        jip=1;
		class LT_fnc_buildinNVG		{allowedTargets=0;};
        class LT_fnc_InitPostUnit	{allowedTargets=0;};
        class LT_fnc_InitPostVeh	{allowedTargets=2;};
		class LT_fnc_resetMaxLoad	{allowedTargets=2;};
		class LT_fnc_unitLoadout	{allowedTargets=2;};
        class LT_fnc_VehicleLoadout	{allowedTargets=2;};
		class FRED_fnc_vehicleRespawn{allowedTargets=2;};
    };
};