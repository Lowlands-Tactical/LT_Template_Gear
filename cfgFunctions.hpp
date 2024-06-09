// Functions for lt_template_gear
class cfgFunctions
{
    class LT
    {
        class template_gear
        {
            file = "\lt_template_gear\functions";
            class gearItems {};
            class weaponItems {};
            class rolesArray {};
        };
    };
};

// Defines the functions that can we remote executed and for whom.
class cfgRemoteExec
{
    class LT
    {
        // 0= all machines 1= only clients 2= only server
        mode = 2;
        jip = 1;
        class LT_fnc_gearItems      {allowedTargets = 2};
        class LT_fnc_weaponItems    {allowedTargets = 2};
        class LT_fnc_rolesArray     {allowedTargets = 2};
    };
};
