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
    *           fn_PNJ_LoadMissions.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

    _this addAction ["Mission",DA3F_fnc_init_Loader,"",0,true,false,"","_this distance _target < 5 && !(isNull _target)"];
    //_this addAction ["GUI BCC",DA3F_fnc_init_loadGui];

