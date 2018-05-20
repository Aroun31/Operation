#include "..\..\DA3F_OP_macros.hpp"
#define    CtrlListMyVeh    My_Ctrl(290418,1500)

	/*
    *
    *       Project :
    *               Farming Party
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_SpawnMyVeh.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	private _DA3F_index = lbCurSel CtrlListMyVeh;
	if (_DA3F_index isEqualTo -1) exitWith {
		hint localize "DA3F_VehNoSelect";
	};

	private _DA3F_Data	= CtrlListMyVeh lbData _DA3F_index;
	_DA3F_Data	= call compile format ["%1", _DA3F_Data];

    DA3F_My_Garage params[
        ["_DA3F_ListClassName",[],[[]]],
    	["_DA3F_ListInfo",[],[[]]]
    ];

	_DA3F_Data params[
	    ["_DA3F_ClassName","",[""]],
		["_DA3F_ArrayInfo",[],[[]]],
		["_DA3F_IndexCtrl",-1,[0]]
	];

		_DA3F_ArrayInfo params[
	                ["_DA3F_dmg",[],[[]]],
	                ["_DA3F_fuel",0,[0]],
	                ["_DA3F_PrixVente",0,[0]],
	                ["_DA3F_Plak","",[""]],
	                ["_DA3F_Actif",0,[0]]
	            ];

	private _DA3F_MrkSpawn = Cfg_ShopWeapons(getText,"CfgShops_PNJ",DA3F_TypeShop,"markerSp");
	private _DA3F_Veh      = _DA3F_ClassName createVehicle [0,0,500];
		_DA3F_Veh setpos getMarkerPos _DA3F_MrkSpawn;
		_DA3F_Veh setdir markerDir _DA3F_MrkSpawn;
		_DA3F_Veh setFuel _DA3F_fuel;
       	_DA3F_Veh setVariable ["DA3F_VehInfos",[profileName,_DA3F_PrixVente,_DA3F_Plak],true];

		    {
		        [_DA3F_Veh,_x,(_DA3F_dmg select _foreachindex)] call BIS_fnc_setHitPointDamage;
		    } forEach ((getAllHitPointsDamage _DA3F_veh)select 0);

                _DA3F_ArrayInfo set [4,1];
                _DA3F_ListInfo set [_DA3F_IndexCtrl,_DA3F_ArrayInfo];

                DA3F_My_Garage set [1,_DA3F_ListInfo];

                hint localize "DA3F_SpawnMyVeh";


        private _DA3F_MyGarage =  missionNamespace getVariable ["DA3F_My_Garage",[[],[]]];
            profileNamespace setVariable ["DA3F_MyGarage",_DA3F_MyGarage];
			saveProfileNamespace;
			closeDialog 0;