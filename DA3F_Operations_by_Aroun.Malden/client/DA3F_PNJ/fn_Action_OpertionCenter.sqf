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
    *           fn_Action_OpertionCenter.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               this call DA3F_fnc_Action_OpertionCenter;
    *
	*/

	_this addAction ["Armurerie",DA3F_fnc_initShop,"DA3F_PNJ_Default",0,true,false,"","_this distance _target < 5 && !(isNull _target)"];