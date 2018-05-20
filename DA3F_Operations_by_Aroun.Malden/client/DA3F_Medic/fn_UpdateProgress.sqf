	#include "DefineCtrl_Medix.hpp"
	/*
    *
    *       Project :
    *               Projet Alice
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_UpdateProgress.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	disableSerialization;
	private _DA3F_PosProgres = progressPosition DA3F_ProgressSoins;
	if (_DA3F_PosProgres >= 1) then {
		_DA3F_PosProgres = 0;
	};
	_DA3F_PosProgres = _DA3F_PosProgres + 0.05;

	DA3F_ProgressSoins progressSetPosition _DA3F_PosProgres;