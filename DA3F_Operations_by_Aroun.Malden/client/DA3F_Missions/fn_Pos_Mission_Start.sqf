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
    *           fn_Pos_Mission_Start.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               _DA3F_PosStart = call DA3F_fnc_Pos_Mission_Start;
    *
    */


        if (isNil "DA3F_All_Pos_Map") exitWith {};
        if (str DA3F_All_Pos_Map isEqualTo "[]") exitWith {};
            private _DA3F_Exit_Pos = selectRandom(DA3F_All_Pos_Map);
// Array pos start
_DA3F_Exit_Pos