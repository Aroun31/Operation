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
    *           fn_convert_val.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               [0.36]call DA3F_fnc_convert_val; // return : 36
    *
	*/

	private _DA3F_val = param[0,[[-1],[0]]];
	private _DA3F_Convert = 0;
    if (_DA3F_val isEqualTo -1) exitWith {0};
       //_DA3F_Convert = ((1 - (_DA3F_val))* 100);
       _DA3F_Convert = ((_DA3F_val)* 100);
_DA3F_Convert