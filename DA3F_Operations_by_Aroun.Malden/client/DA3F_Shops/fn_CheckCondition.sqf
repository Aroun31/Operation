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
    *           fn_CheckCondition.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *              ["Class"] call DA3F_fnc_CheckCondition
    *
	*/

	params[["_DA3F_Class","",[""]]];
    private _condition = false;
    if !(_DA3F_Class isEqualTo "") then {
        private _Grp = getArray(missionConfigfile >> "Cfg_Spec" >> _DA3F_Class >> "units");
        if (str(player) in _Grp) then
        {
            _condition = true;
        };
    };
    _condition;