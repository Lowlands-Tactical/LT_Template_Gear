#include "script_version.hpp"

class cfgPatches
{
	class lt_template_gear
	{
		name = "lt_template_gear";
		author = "Lowlands Tactical";
		url = "http://lowtac.nl/";
		requiredVersion = 2.14;
		requiredAddons[] = {"lt_template_base"};
		units[] = {};
		weapons[] = {};

		//CBA versioning
		version = VERSION;
		versionStr = STR(VERSION_STR);
		versionAR[] = {VERSION_AR};
	};
};

class CfgSettings 
{
	class CBA 
	{
		class Versioning 
		{
			class LT_Gear
			{
				main_addon = "LT_Template_Gear";
				class Dependancies 
				{
					LT_Base[] = {"LT_Template_Base", {3,23,156}, "true"};
					LT_Gear[] = {"LT_Template_Gear", {VERSION_AR}, "true"};
				};
			};
		};
	};
};

#include "cfg3DEN.hpp"
