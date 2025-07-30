#include "script_version.hpp"

class cfgPatches
{
	class lt_template_gear
	{
		name="lt_template_gear";
		author="Lowlands Tactical";
		url="http://lowtac.nl/";
		requiredVersion=2.14;
		requiredAddons[]={"lt_template_base"};
		units[]={};
		weapons[]={};

		//CBA versioning
		version=VERSION;
		versionStr=STR(VERSION_STR);
		versionAR[]={VERSION_AR};
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
				main_addon="LT_Template_Gear";
				class Dependancies 
				{
					LT_Base[]={"LT_Template_Base", {3,52,22}, "true"};
					LT_Gear[]={"LT_Template_Gear", {VERSION_AR}, "true"};
				};
			};
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
            class gearItems {};
            class weaponItems {};
            class rolesArray {};
			class GlobalGear {};
        };
		class Loadout_gear
		{
			file="\lt_template_gear\functions\Loadout";
			class resetMaxLoad {};
			class buildInNVG {};
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
        class LT_fnc_gearItems		{allowedTargets=0;};
        class LT_fnc_weaponItems	{allowedTargets=0;};
        class LT_fnc_rolesArray		{allowedTargets=0;};
		class LT_fnc_resetMaxLoad	{allowedTargets=2;};
		class LT_fnc_buildinNVG		{allowedTargets=0;};
		class LT_fnc_GlobalGear
		{
			allowedTargets=0;
			jip=0;
		};
    };
};

#include "\lt_template_base\macros.inc"

class ctrlEdit;
class ctrlCombo;
class LT_Loadout;
class Cfg3DEN
{
	class Mission
	{
		class Scenario
		{
			class AttributeCategories
			{
				class LT_Category_Other
				{
					class Attributes
					{
						class LT_Loadout: LT_Loadout
						{
							displayName="Tijdperk settings";
							tooltip="Tijdperk voor je scenario defineerd gear/weapons";
							property="LT_Loadout_ID";
							control="LT_loadout";
							defaultValue="0";
							typeName="STRING";
						};
					};
				};
			};
		};
	};
	class Attributes 
	{
		class Default;
		class Title: Default
		{
			class Controls
			{
				class Title;
			};
		};
		class LT_Loadout: Title
		{
			attributeLoad="_ctrl=_this controlsGroupCtrl 100;_attCtrl=getText( _config >> 'control' );_staticItemsCfg=configFile >> 'Cfg3DEN' >> 'Attributes' >> _attCtrl >> 'Controls' >> 'Value' >> 'items';_fnc_setValues={private [ '_index' ];params[ '_path', [ '_apply', true ] ];{_cfg=_x; if ( _apply ) then {	_index=_ctrl lbAdd getText( _cfg >> 'text' ); _ctrl lbSetData [ _index, getText( _cfg >> 'data' ) ];} else {_index=_foreachindex;}; if ( !( _value isEqualType '' ) ) then {if ( _index isEqualTo _value ) then {_ctrl lbSetCurSel _index;} ;} else {if ( _value == getText( _cfg >> 'data' ) ) then {_ctrl lbSetCurSel _index;};}; } forEach configProperties [_path,'isclass _x'];}; if ( isClass _staticItemsCfg ) then {[ _staticItemsCfg, false ] call _fnc_setValues;};";
			attributeSave =	"_ctrl=_this controlsGroupCtrl 100;_ctrl lbData lbCurSel _ctrl;";
			class Controls: Controls
			{
				class Title: Title{};
				class Value: ctrlCombo
				{
					idc=100;
					x=ATTRIBUTE_TITLE_W * GRID_W;
					w=ATTRIBUTE_CONTENT_W * GRID_W;
					h=SIZE_M * GRID_H;

					class Items
					{
						class LT_Loadout_Base 	{data="BASE";	text="[LT-Base] Huidig"; default=1;};
						class LT_Loadout_GM 	{data="GM";		text="[LT-GM] Koude Oorlog";};
						class LT_Loadout_VN		{data="VN";		text="[LT-VN] Vietnam";};
						class LT_Loadout_40K	{data="40K";	text="[LT-40K] Warhammer";};
					};
				};
			};
		};
	};
};
