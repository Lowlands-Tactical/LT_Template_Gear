#ifndef BLUE_GEAR
    #define BLUE_GEAR 1
#endif
#ifndef BLUE_WEAPON
    #define BLUE_WEAPON 3
#endif
#ifndef RED_GEAR
    #define RED_GEAR 11
#endif
#ifndef RED_WEAPON
    #define RED_WEAPON 6
#endif
#ifndef GREEN_GEAR
    #define GREEN_GEAR 18
#endif
#ifndef GREEN_WEAPON
    #define GREEN_WEAPON 7
#endif
#ifndef SHORT_RADIO
    #define SHORT_RADIO 0
#endif
#ifndef LONG_RADIO
    #define LONG_RADIO 1
#endif
#ifndef GEAR_NVG
    #define GEAR_NVG 0
#endif
#ifndef WEAPON_ATT
    #define WEAPON_ATT 9
#endif
#ifndef WEAPON_SCOPE
    #define WEAPON_SCOPE 1
#endif

#define LT_GEAR_VN_V 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21

#define LT_GEAR_VN_1_T "Use customGear","US Army Olive","US Army ERDL Brown","US Navy Olive","US Special Forces 66 Leopard","US Special Forces Tiger","AUS Army Olive","AUS SAS ERDL","ROK Army Frog","MACV Olive","MACV Black"
#define LT_GEAR_VN_2_T "VC Main Army Black","VC Local Cadre Mix","Korea Army Black","Polish Army Brown","PAVN Army","PAVN Marines","PAVN Commandos"
#define LT_GEAR_VN_3_T "FANK Olive","ARVN Olive","ARVN Ranger BDQ","RLA Army Frog"

#define LT_GEAR_VN_T LT_GEAR_VN_1_T,LT_GEAR_VN_2_T,LT_GEAR_VN_3_T

#define LT_WEAPON_VN_V 0,1,2,3,6,7
#define LT_WEAPON_VN_T "Use customWeapon","US M16A1 Black","US M16A1 Camo","US Navy SEALS","XM17","XM17 Camo"

class lt_Empty_02 
{
    title = "========== Template setting ==========";
    values[] = {0};
    texts[] = {"========== [ S.O.G. Prairie fire ] =========="};
    default = 0;
};
class lt_gear_camo_blue
{
    title = "[BLUEFOR] - Camoflage";
    values[] = {LT_GEAR_VN_V};
    texts[] = {LT_GEAR_VN_T};
    default = BLUE_GEAR;
};
class lt_gear_weapon_blue
{
    title = "[BLUEFOR] - Weapons";
    values[] = {LT_WEAPON_VN_V};
    texts[] = {LT_WEAPON_VN_T};
    default = BLUE_WEAPON;
};
class lt_gear_camo_red
{
    title = "[OPFOR] - Camoflage";
    values[] = {LT_GEAR_VN_V};
    texts[] = {LT_GEAR_VN_T};
    default = RED_GEAR;
};
class lt_gear_weapon_red
{
    title = "[OPFOR] - Weapons";
    values[] = {LT_WEAPON_VN_V};
    texts[] = {LT_WEAPON_VN_T};
    default = RED_WEAPON;
};
class lt_gear_camo_green
{
    title = "[GUER] - Camoflage";
    values[] = {LT_GEAR_VN_V};
    texts[] = {LT_GEAR_VN_T};
    default = GREEN_GEAR;
};
class lt_gear_weapon_green
{
    title = "[GUER] - Weapons";
    values[] = {LT_WEAPON_VN_V};
    texts[] = {LT_WEAPON_VN_T};
    default = GREEN_WEAPON;
};
class lt_gear_SR
{
    title = "Short range radio settings";
    values[] = {0};
    texts[] = {"Nobody"};
    default = SHORT_RADIO;
};
class lt_gear_radiopack
{
    title = "Long range radio settings";
    values[] = {0,1};
    texts[] = {"Nobody","Radioman(GM/VN)"};
    default = LONG_RADIO;
};
class lt_gear_nvg
{
    title = "Nightvision settings (Also affects grenadier colours Smoke/Light)";
    values[] = {0,1};
    texts[] = {"False","True"};
    default = GEAR_NVG;
};
class lt_gear_weapon_att
{
    title = "Weapon Attachments";
    values[] = {0,1,2,3,4,5,6,7,8,9};
    texts[] = {"Infrarood laser","Flashlight","Infrarood laser/Silencer","Flash/Silencer","Infrarood laser/Bipod","Flash/Bipod","Silencer/Bipod","Infrarood laser/Silencer/Bipod","Flash/Silencer/Bipod","No Attachments"};
    default = WEAPON_ATT;
};
class lt_gear_weapon_scope
{
    title = "Weapon Scope";
    values[] = {0,1};
    texts[] = {"False","True"};
    default = WEAPON_SCOPE;
};
