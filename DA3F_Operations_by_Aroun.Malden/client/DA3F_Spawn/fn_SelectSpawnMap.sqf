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
    *           fn_SelectSpawnMap.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               _this call DA3F_fnc_SelectSpawnMap;
    *
	*/

		disableSerialization;
		_this params[
		    ["_DA3F_Ctrl",controlNull,[controlNull]],
			["_DA3F_index",-1,[0]]
		];
		private _DA3F_Idc		= ctrlIDC(_DA3F_Ctrl);
		private _DA3F_Idd		= ctrlIDD(ctrlParent _DA3F_Ctrl);
		private _DA3F_Display 	= (findDisplay _DA3F_Idd);
		private _speed 			= 1.5;
		private _zoom 			= 0.03;
		private _position 		= [];
		if (_DA3F_index isEqualTo -1) exitWith {
			hint parseText format ["<t color='#FF0000' size='1.3' >Sélectionne une unité<t/>", nil];
		};
getUnitLoadout
		    _DA3F_data = call compile format ["%1", _DA3F_Ctrl lbData _DA3F_index];

		switch (str _DA3F_Idc) do {

		    case "1500": {
				_DA3F_data params[
				    ["_DA3F_Marker_Name","",[""]],
					["_DA3F_markerText","",[""]],
					["_DA3F_Desc","",[""]]
				];
				_position = getMarkerPos _DA3F_Marker_Name;
				private _control 	= ((_DA3F_Display)displayCtrl 2900);
				_control ctrlMapAnimAdd[_speed,_zoom,_position];
				ctrlMapAnimCommit _control;
				if (isNil "DA3F_CAM_MRK") then {
					DA3F_CAM_MRK = camCreate _position;
				};
					DA3F_CAM_MRK camSetTarget _position;
					DA3F_CAM_MRK camSetRelPos [0,10,8];
					DA3F_CAM_MRK camCommit 0;
		    };

		    case "1501": {
				_position = getPos _DA3F_data;
				private _control 	= ((_DA3F_Display)displayCtrl 2901);
				_control ctrlMapAnimAdd[_speed,_zoom,_position];
				ctrlMapAnimCommit _control;
				if (isNil "DA3F_CAM_UNIT") then {
					DA3F_CAM_UNIT = camCreate _position;
				};
					DA3F_CAM_UNIT camSetTarget _position;
					DA3F_CAM_UNIT camSetRelPos [0,10,8];
					DA3F_CAM_UNIT camCommit 0;
		    };
		};
