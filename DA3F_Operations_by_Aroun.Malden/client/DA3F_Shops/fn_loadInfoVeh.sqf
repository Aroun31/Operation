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
    *           fn_loadInfoVeh.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

		_this params[
		    ["_DA3F_veh",objNull,[objNull]],
			["_DA3F_PrixVente",0,[0]]
		];

       DA3F_My_Garage params[
           ["_DA3F_ListVeh",[],[[]]],
           ["_DA3F_InfoVeh",[],[[]]]
       ];

        private _DA3F_ClassName = typeOf _DA3F_veh;
        private _DA3F_plak = []call DA3F_fnc_Create_New_Plaque;
       _DA3F_ListVeh pushBack _DA3F_ClassName;
       DA3F_MyKeysVeh pushBack _DA3F_Plak;

       _DA3F_Veh setVariable ["DA3F_VehInfos",[profileName,_DA3F_Plak,_DA3F_PrixVente]];
       _DA3F_InfoVeh pushBack [(getAllHitPointsDamage _DA3F_Veh)select 2,1,_DA3F_PrixVente,_DA3F_Plak,1];// [Damage,fuel,PrixVente,plak,actif];

            _DA3F_Veh setVariable ["dbinfo",["Moi",_DA3F_Plak],true];

            missionNamespace setVariable ["DA3F_My_Garage",[_DA3F_ListVeh,_DA3F_InfoVeh]];