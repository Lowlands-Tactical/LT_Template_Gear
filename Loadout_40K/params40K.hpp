#ifndef BLUE_GEAR
    #define BLUE_GEAR 1
#endif
#ifndef BLUE_WEAPON
    #define BLUE_WEAPON 1
#endif
#ifndef RED_GEAR
    #define RED_GEAR 2
#endif
#ifndef RED_WEAPON
    #define RED_WEAPON 2
#endif
#ifndef GREEN_GEAR
    #define GREEN_GEAR 3
#endif
#ifndef GREEN_WEAPON
    #define GREEN_WEAPON 3
#endif
#ifndef SHORT_RADIO
    #define SHORT_RADIO 1
#endif
#ifndef LONG_RADIO
    #define LONG_RADIO 1
#endif
#ifndef GEAR_NVG
    #define GEAR_NVG 0
#endif
#ifndef WEAPON_ATT
    #define WEAPON_ATT 5
#endif
#ifndef WEAPON_SCOPE
    #define WEAPON_SCOPE 1
#endif

#define LT_GEAR_V 0,1,2,3,4
#define LT_GEAR_T "Use customGear","Guard","Cultist","Ork","Cadia 700th"

#define LT_WEAPON_V 0,1,2,3,4
#define LT_WEAPON_T "Use customWeapon","Guard","Cultist","Ork","Cadia 700th"

class lt_Empty_02 
{
    title = "========== Template setting ==========";
    values[] = {0};
    texts[] = {"========== [BASE / Western Sahara] =========="};
    default = 0;
};
class lt_gear_camo_blue
{
    title = "[BLUEFOR] - Camoflage";
    values[] = {LT_GEAR_V};
    texts[] = {LT_GEAR_T};
    default = BLUE_GEAR;
};
class lt_gear_weapon_blue
{
    title = "[BLUEFOR] - Weapons";
    values[] = {LT_WEAPON_V};
    texts[] = {LT_WEAPON_T};
    default = BLUE_WEAPON;
};
class lt_gear_camo_red
{
    title = "[OPFOR] - Camoflage";
    values[] = {LT_GEAR_V};
    texts[] = {LT_GEAR_T};
    default = RED_GEAR;
};
class lt_gear_weapon_red
{
    title = "[OPFOR] - Weapons";
    values[] = {LT_WEAPON_V};
    texts[] = {LT_WEAPON_T};
    default = RED_WEAPON;
};
class lt_gear_camo_green
{
    title = "[GUER] - Camoflage";
    values[] = {LT_GEAR_V};
    texts[] = {LT_GEAR_T};
    default = GREEN_GEAR;
};
class lt_gear_weapon_green
{
    title = "[GUER] - Weapons";
    values[] = {LT_WEAPON_V};
    texts[] = {LT_WEAPON_T};
    default = GREEN_WEAPON;
};
class lt_gear_SR
{
    title = "Short range radio settings";
    values[] = {0,1,2,3,4,5,6};
    texts[] = {"Nobody","Everyone","Commandant/Squad Leader","Commandant/Squad Leader/Fire Team Leader","Commandant/Squad Leader/Fire Team Leader/Combat Life Safer","Commandant/Squad Leader/Fire Team Leader/Genadier","Commandant/Squad Leader/Fire Team Leader/Dedicated markmen"};
    default = SHORT_RADIO;
};
class lt_gear_radiopack
{
    title = "Long range radio settings";
    values[] = {0,1,2,3,4,5,6,7};
    texts[] = {"Nobody","Radioman(GM/VN/40K)","Commandant/Squad Leader","Commandant/Squad Leader/Fire Team Leader","Commandant/Squad Leader/Fire Team Leader/Combat Life Safer","Commandant/Squad Leader/Fire Team Leader/Genadier","Commandant/Squad Leader/Fire Team Leader/Dedicated markmen","Commandant/Squad Leader/Fire Team Leader/Engineer"};
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
