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
    *           DA3F_FnCustom.hpp
    *
    *       DESCRIPTION :
    *               Spécial macros / fnc pre process 
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               #include "DA3F_FnCustom.hpp"
    *
	*/


/*
    CfgGroup -> return config group random 

        private _DA3F_TypeGrp = selectRandom([
            "Armored",
            "Infantry",
            "Mechanized",
            "Motorized_MTP",
            "SpecOps",
            "Support",
            "UInfantry"
        ]);
        call DA3F_Test;
        private _DA3F_GrpSpawn  = call SelectGrp("East",_DA3F_TypeGrp);
        DA3F_GrpCreate = [_DA3F_Pos, east, _DA3F_GrpSpawn] call BIS_fnc_spawnGroup;

*/
        #define GetSideCfg(SideCfg) {private _DA3F_GetSideCfg = switch (SideCfg) do {\
            case "West": {"BLU_F"};\
            case "East": {"OPF_F"};\
            case "Indep": {"IND_F"};\
        };\
        _DA3F_GetSideCfg\
        }

        #define GetGroups(SideCfg,Grp)  {private _DA3F_GetSideCfg = call GetSideCfg(SideCfg);\
            private _DA3F_AllClass = [];\
            {\
                _DA3F_AllClass pushBack (configName _x)\
            } forEach ("true" configClasses (configfile >> "CfgGroups" >> SideCfg >> _DA3F_GetSideCfg >> Grp));\
            _DA3F_AllClass\
        }

        #define SelectGrp(SideCfg,Grp)  {private _DA3F_GetSideCfg = call GetSideCfg(SideCfg);\
        private _DA3F_Grp = selectRandom(call GetGroups(SideCfg,Grp));\
        private _DA3F_PathGrp = (configfile >> "CfgGroups" >> SideCfg >> _DA3F_GetSideCfg >> Grp >> _DA3F_Grp);\
        _DA3F_PathGrp\
        }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
    Check number pos in building
    return array of number position building
*/
        #define GetPosNumBuilding(BUILDING) {private _DA3F_buildingPos = [];private _DA3F_AllPosBuilding = [];\
            if (isNull BUILDING) exitWith {[]};\
                  for "_a" from 0 to 50 do {\
                    _DA3F_buildingPos = BUILDING buildingpos _a;\
                    if !(str _DA3F_buildingPos isEqualTo "[0,0,0]") then {\
                        _DA3F_AllPosBuilding pushBack _a\
                    };\
                };\
                _DA3F_AllPosBuilding\
        }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
