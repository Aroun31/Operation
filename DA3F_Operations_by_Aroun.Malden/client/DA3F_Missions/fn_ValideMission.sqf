	#include "..\..\DA3F_OP_macros.hpp"
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
    *           fn_ValideMission.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

    disableSerialization;
    private _DA3F_ListBox   = My_Ctrl(120518,1500);
    private _DA3F_Index     = lbCurSel _DA3F_ListBox;
    private _DA3F_Data      = _DA3F_ListBox lbData _DA3F_Index;
    private _MissionSelect  = "";
    private _MissionLoad    = "";
        _DA3F_Data = call compile format ["%1", _DA3F_Data];

    private _DA3F_PathFile  = "client\DA3F_Missions\Loader\mission_%1.sqf";

        _DA3F_Data params[
            ["_DA3F_DataIndex",0,[0]],
            ["_DA3F_title","",[""]]
        ];

        switch (true) do {
            case (["vip",_DA3F_title]call bis_fnc_inString): {
                 _MissionSelect = format [_DA3F_PathFile, 1];
                 scriptName _MissionSelect;
                _MissionLoad    = execVM _MissionSelect;
            };

            case (["bomb",_DA3F_title]call bis_fnc_inString): {
                 _MissionSelect = format [_DA3F_PathFile, 2];
                 scriptName _MissionSelect;
                _MissionLoad    = execVM _MissionSelect;
            };
        };

    diag_log str ["Mission Load : ",_MissionLoad];