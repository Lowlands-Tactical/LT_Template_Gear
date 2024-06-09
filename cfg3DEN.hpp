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
							displayName = "Tijdperk settings";
							tooltip = "Tijdperk voor je scenario defineerd gear/weapons";
							property = "LT_Loadout_ID";
							control = "LT_loadout";
							defaultValue = "0";
							typeName = "STRING";
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
			attributeLoad = "_ctrl = _this controlsGroupCtrl 100;_attCtrl = getText( _config >> 'control' );_staticItemsCfg = configFile >> 'Cfg3DEN' >> 'Attributes' >> _attCtrl >> 'Controls' >> 'Value' >> 'items';_fnc_setValues = {private [ '_index' ];params[ '_path', [ '_apply', true ] ];{_cfg = _x; if ( _apply ) then {	_index = _ctrl lbAdd getText( _cfg >> 'text' ); _ctrl lbSetData [ _index, getText( _cfg >> 'data' ) ];} else {_index = _foreachindex;}; if ( !( _value isEqualType '' ) ) then {if ( _index isEqualTo _value ) then {_ctrl lbSetCurSel _index;} ;} else {if ( _value == getText( _cfg >> 'data' ) ) then {_ctrl lbSetCurSel _index;};}; } forEach configProperties [_path,'isclass _x'];}; if ( isClass _staticItemsCfg ) then {[ _staticItemsCfg, false ] call _fnc_setValues;};";
			attributeSave =	"_ctrl = _this controlsGroupCtrl 100;_ctrl lbData lbCurSel _ctrl;";
			class Controls: Controls
			{
				class Title: Title{};
				class Value: ctrlCombo
				{
					idc = 100;
					x = ATTRIBUTE_TITLE_W * GRID_W;
					w = ATTRIBUTE_CONTENT_W * GRID_W;
					h = SIZE_M * GRID_H;

					class Items
					{
						class LT_Loadout_Base 	{data = "BASE";	text = "[LT-Base] Huidig"; default = 1;};
						class LT_Loadout_GM 	{data = "GM";	text = "[LT-GM] Koude Oorlog";};
						class LT_Loadout_VN		{data = "VN";	text = "[LT-VN] Vietnam";};
					};
				};
			};
		};
	};
};
