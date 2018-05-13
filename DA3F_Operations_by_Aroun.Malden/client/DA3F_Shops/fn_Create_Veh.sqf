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
    *           fn_Create_Veh.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               0 : OBJECT  :: player
    *               1 : STRING  :: className vehicle
    *               2 : ARRAY   :: position spawn veh
    *               3 : STRING  :: Prix de revente
    *               4 : STRING  :: Devise
    *               5 : BOOLEAN :: is concess
    *               6 : BOOLEAN :: is garage
    *               7 : ARRAY   :: info veh garage [_DA3F_plak,_DA3F_fuel,_DA3F_dmg,_DA3F_invV]
    *       EXEMPLES :
    *               [player,_DA3F_ClassName,_DA3F_Pos,_prixVente,_Devise,false,true,_inv] remoteExec ["DA3F_fnc_Create_Veh",2];
    *               [player,_DA3F_ClassName,_DA3F_Pos,_prixVente,_Devise,true,false,[]] remoteExec ["DA3F_fnc_Create_Veh",2];
    *
	*/
        _this params[
            ["_DA3F_Unit",objNull,[objNull]],
            ["_DA3F_ClassName","",[""]],
            ["_DA3F_Pos",[],[[]]],
            ["_DA3F_Prix_vente",0,[0]],
            ["_DA3F_Devise","µ",[""]],
            ["_DA3F_NewVeh",false,[false]],
            ["_DA3F_infoMyVeh",[],[[]]]
        ];

    /*
    	private _DA3F_Unit 			= _this select 0;
    	private _DA3F_ClassName 			= _this select 1;
    	private _DA3F_Pos 			= _this select 2;
    	private _DA3F_Prix_vente 	= _this select 3;
    	private _DA3F_Devise 		= _this select 4;
        private _DA3F_Bool_Concess  = _this select 5;
        private _DA3F_Bool_Garage   = _this select 6;
    	private _DA3F_infoMyVeh	    = _this select 7;
    */

/*
		if (isNil "_DA3F_Unit") exitWith {};
		if (isNil "_DA3F_ClassName") exitWith {};
			if (isNull _DA3F_Unit) exitWith {};
			if (isNull _DA3F_ClassName) exitWith {};
*/
    private _DA3F_plak  = "";
    private _DA3F_mrk   = player getVariable ["DA3F_Mrk_SpawnVeh",""];
	private _veh = _DA3F_ClassName createVehicle [0,0,500];
			_veh allowDamage false;
			_veh setPosATL _DA3F_Pos;
            _veh lock 0;
            [_veh]call DA3F_fnc_ClearObj;
            _veh setdir (markerDir _DA3F_mrk);

    if (_DA3F_NewVeh) then {
        [_veh,_DA3F_Prix_vente] remoteExecCall ["DA3F_fnc_loadInfoVeh",_DA3F_Unit];
    };
            //_veh setVariable ["DA3F_VehInfo",[profileName,_DA3F_plak,_DA3F_Prix_vente],true];
