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
    *           fn_SpawnConfirme.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               _this call DA3F_fnc_SpawnConfirme;
    *
	*/
#include "fn_SpawnConfirme.hpp"
    DA3F_fnc_DeleteCams={

        if !(isNil "DA3F_CAM_MRK") then {
            DA3F_CAM_MRK cameraEffect ["terminate","back"];
            camDestroy DA3F_CAM_MRK;
        };
        if !(isNil "DA3F_CAM_UNIT") then {
            DA3F_CAM_UNIT cameraEffect ["terminate","back"];
            camDestroy DA3F_CAM_UNIT;
        };
    };

	params[["_DA3F_Ctrl",controlNull,[controlNull]]];

    private _DA3F_Display  = (ctrlParent _DA3F_Ctrl);
	private _DA3F_Idd      = ctrlIDD (_DA3F_Display);
	private _DA3F_Idc      = ctrlIDC _DA3F_Ctrl;

	switch (str _DA3F_Idc) do {
	    case "2400": {
    private _DA3F_ListMrk   = (_DA3F_Display displayCtrl 1500);
    private _DA3F_index     = lbCurSel _DA3F_ListMrk;
        _DA3F_Display closeDisplay 1;
        if (_DA3F_index isEqualTo -1) exitWith {};
    private _DA3F_data      = call compile format ["%1", _DA3F_ListMrk lbData _DA3F_index];
	    	player setPos getMarkerPos (_DA3F_data select 0);
            private _DA3F_InfoPosGPS = mapGridPosition (getMarkerPos (_DA3F_data select 0));
            "" cutText ["Parcours jusqu'à la position","WHITE IN",5];
            sleep 4;
            "" cutText [format ["Spawn en position :\n\n%1", _DA3F_InfoPosGPS],"PLAIN DOWN",5];
	    };

	    case "2402": {
    private _DA3F_ListUnit  = (_DA3F_Display displayCtrl 1501);
    private _DA3F_index     = lbCurSel _DA3F_ListUnit;
        _DA3F_Display closeDisplay 1;
        if (_DA3F_index isEqualTo -1) exitWith {};
    private _DA3F_data      = call compile format ["%1", _DA3F_ListUnit lbData _DA3F_index];
            player setPos getPos _DA3F_data;
            private _DA3F_InfoPosGPS = mapGridPosition (getPos _DA3F_data);
            "" cutText ["Parcours jusqu'à la position","WHITE IN",5];
            sleep 4;
            "" cutText [format ["Spawn en position :\n\n%1", _DA3F_InfoPosGPS],"PLAIN DOWN",5];

	    };
	};