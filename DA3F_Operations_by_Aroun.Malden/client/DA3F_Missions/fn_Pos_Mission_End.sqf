//#include "..\..\DA3F_macros.hpp"
    /*
    *
    *       Project :
    *               Projet Alice
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_Pos_Mission_End.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               _DA3F_Pos_End_Or_Desti = []call DA3F_fnc_Pos_Mission_End;
    *               _DA3F_Pos_End_Or_Desti = [[54534,54654]]call DA3F_fnc_Pos_Mission_End;
    *
    */

    params[["_DA3F_Pos",[],[[]]]];

        if (isNil "DA3F_All_Pos_Map") exitWith {};
        if (isNil "DA3F_Bob" && str _DA3F_Pos isEqualTo "[]") exitWith {};
        if (str DA3F_All_Pos_Map isEqualTo "[]") exitWith {};
            private _DA3F_Exit_Pos = selectRandom(DA3F_All_Pos_Map);
            if (isNil "DA3F_Bob") then [{
                    waitUntil {
                       private _DA3F_Desti_Pos  = selectRandom(DA3F_All_Pos_Map);
                       if (_DA3F_Desti_Pos distance _DA3F_Pos > 2500) then {
                          _DA3F_Exit_Pos = _DA3F_Desti_Pos;
                          true
                       };
                };
            },{
                waitUntil {
                   private _DA3F_PosStart   = position DA3F_Bob;
                   private _DA3F_Desti_Pos  = selectRandom(DA3F_All_Pos_Map);
                   if (_DA3F_Desti_Pos distance _DA3F_PosStart > 2500) then {
                      _DA3F_Exit_Pos = _DA3F_Desti_Pos;
                      true
                   };
            };
        }];
// Array pos Destination Or End mission
_DA3F_Exit_Pos