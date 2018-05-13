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
    *           fn_ClearObj.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *              [_Obj]call DA3F_fnc_ClearObj;
    *
	*/

		params[["_DA3F_Veh",objNull,[objNull]]];

			if (isNull _DA3F_Veh) exitWith {};
			    clearBackpackCargoGlobal _DA3F_Veh;
		        clearMagazineCargoGlobal _DA3F_Veh;
		        clearItemCargoGlobal _DA3F_Veh;
		        clearWeaponCargoGlobal _DA3F_Veh;