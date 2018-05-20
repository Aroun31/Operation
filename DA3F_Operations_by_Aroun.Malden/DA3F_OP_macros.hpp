	/*
    *
    *       Project :  
    *               °Opération°
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           DA3F_OP_macros.hpp
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               #include "DA3F_OP_macros.hpp"
    *
	*/
    
    #define DA3F_Compil(Args)   ([Args]call{call compile format ["%1",param[0,[[""],[""]]]]})
    #define DA3F_CfgMission(TYPE,STATS)   TYPE(missionConfigFile >> "DA3F_initCfg_Mission" >> STATS)
    #define DA3F_CfgSpawn(TYPE,STATS)   TYPE(missionConfigFile >> "DA3F_initCfg_Spawn" >> STATS)
    #define Cfg_Veh_A3(TYPE,Class,SETTING) TYPE(ConfigFile >> "CfgVehicles" >> Class >> SETTING)
    #define Cfg_OP_ItemInfo(TYPE,Class,SETTING) TYPE(missionConfigFile >> "DA3F_Cfg_Items" >> Class >> SETTING)
    #define Cfg_Weapon_A3(TYPE,Class,SETTING) TYPE(ConfigFile >> "CfgWeapons" >> Class >> SETTING)
    #define Cfg_ShopWeapons(TYPE,SECTION,Class,SETTING) TYPE(missionConfigFile >> "Cfg_Shops_Weapons" >> SECTION >> Class >> SETTING)
    #define Cfg_OP_VehInfo(TYPE,Class,SETTING) TYPE(missionConfigFile >> "Vehicles_Info" >> Class >> SETTING)
    #define My_Ctrl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl) 

    /*    
    #define PlayerInGrp(CLASS)  {private _condition = false;\
    private _Grp = getArray(missionConfigfile >> "Cfg_Grps" >> CLASS);\
    if (str(player) in _Grp) then {\
        _condition = false;\
    };\
    _condition;\
    }
*/