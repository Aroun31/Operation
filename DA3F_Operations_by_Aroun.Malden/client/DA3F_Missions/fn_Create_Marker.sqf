//#include "..\..\DA3F_macros.hpp"
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
    *           fn_Create_Marker.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *           [_DA3F_pos,"Bâtiment officiel","hd_dot","ColorRed",side player,"true"] remoteExec ["DA3F_fnc_Create_Marker",-2];
    */

        params[
            ["_DA3F_pos",[],[[]]],
            ["_DA3F_Txt","Objectif",[""]],
            ["_DA3F_Mrk_Type","DA3F_Mrk_00",[""]],
            ["_DA3F_Mrk_Color","Default",[""]],
            ["_DA3F_Side",sideUnknown,[sideUnknown]],
            ["_DA3F_Condi","true",["true"]]
        ];

        if (_DA3F_Side isEqualTo "") exitWith {};
             if !((side player) isEqualTo _DA3F_Side) exitWith {};
            if !(_DA3F_Condi isEqualTo "") then {
                _DA3F_Condi = call compile format ["%1", _DA3F_Condi];
            };

             if !(_DA3F_Condi) exitWith {};

        _DA3F_mrk_Objectif = createMarker [format["DA3F_Mrk_Mission_%1",_DA3F_pos],_DA3F_pos];
        _DA3F_mrk_Objectif setMarkerShape "ICON";
        _DA3F_mrk_Objectif setMarkerType _DA3F_Mrk_Type;
        _DA3F_mrk_Objectif setMarkerColor _DA3F_Mrk_Color;
        _DA3F_mrk_Objectif setMarkerText format ["%1", _DA3F_Txt];
        DA3F_Stock_Mrk_Mission pushBack _DA3F_mrk_Objectif;



