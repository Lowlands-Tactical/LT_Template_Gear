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
		versionStr=QUOTE(VERSION_STR);
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
		init="call compile preprocessFileLineNumbers '\lt_template_gear\XEH_PreInit.sqf'";
	};
};
class Extended_PostInit_EventHandlers
{
	class LT_Template_Gear_Post
	{
		init="call compile preprocessFileLineNumbers '\lt_template_gear\XEH_PostInit.sqf'";
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
            class initPostUnit {};
            class resetMaxLoad {};
			class unitLoadout {};
            class vehicleLoadout {};
        };
    };
};

// Remote executable functions of the Gear mod, 0 = every machine, 1 = clients only, 2 = server only.
// mode and jip are set once in lt_template_base (config.cpp), this class only adds entries.
class cfgRemoteExec
{
    class Functions
    {
        class LT_fnc_InitPostUnit	{allowedTargets=0;};
		class LT_fnc_resetMaxLoad	{allowedTargets=2;};
		class LT_fnc_unitLoadout	{allowedTargets=0;};
        class LT_fnc_VehicleLoadout	{allowedTargets=2;};
    };
};