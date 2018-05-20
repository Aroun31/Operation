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
    *           fn_vehicleGoInGarage.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

    private _DA3F_Search   = false;
	private _DA3F_ListVeh  = [];
	private _DA3F_InfoVeh  = [];

	_DA3F_Veh = nearestObjects [player,["Car","Air","Support"],40]select 0;
	_DA3F_InfoVeh = _DA3F_Veh getVariable ["DA3F_VehInfos",[]];

		_DA3F_InfoVeh params[
		    ["_DA3F_NameProprio","",[""]],
			["_DA3F_PlakNear","",[""]],
            ["_DA3F_PrixVente",0,[0]]
		];

	 if !(_DA3F_PlakNear in DA3F_MyKeysVeh) exitWith {
	 	hint localize "DA3F_NotYourVeh";
	 };

    DA3F_My_Garage params[
        ["_DA3F_ListClassName",[],[[]]],
    	["_DA3F_ListInfo",[],[[]]]
    ];

    for "_a" from 0 to (count _DA3F_ListInfo -1) do {
        _DA3F_ArrInfo = _DA3F_ListInfo select _a;
            _DA3F_ArrInfo params[
                ["_DA3F_dmg",[],[[]]],
                ["_DA3F_fuel",0,[0]],
                ["_DA3F_PrixVente",0,[0]],
                ["_DA3F_Plak","",[""]],
                ["_DA3F_Actif",0,[0]]
            ];

            if (_DA3F_PlakNear isEqualTo _DA3F_Plak) exitWith {
                _DA3F_Search = true;
                _DA3F_ArrInfo set [0,(getAllHitPointsDamage _DA3F_Veh)select 2];
                _DA3F_ArrInfo set [1,fuel _DA3F_Veh];
                _DA3F_ArrInfo set [4,0];
                _DA3F_ListInfo set [_a,_DA3F_ArrInfo];
                DA3F_My_Garage set [1,_DA3F_ListInfo];
            };
    };

        if !(_DA3F_Search) exitWith {hint localize "DA3F_VehInGarageFail";};
            deleteVehicle _DA3F_Veh;
            hint localize "DA3F_VehInGarageSucces";

        private _DA3F_MyGarage =  missionNamespace getVariable ["DA3F_My_Garage",[[],[]]];
            profileNamespace setVariable ["DA3F_MyGarage",_DA3F_MyGarage];
            saveProfileNamespace;