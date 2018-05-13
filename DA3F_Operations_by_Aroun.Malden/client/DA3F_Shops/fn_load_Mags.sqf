#include "..\..\DA3F_OP_macros.hpp"
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
    *           fn_load_Mags.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	params[["_DA3F_arrayMags",[],[[]]]];

	if (str _DA3F_arrayMags isEqualTo "[]") exitWith {};
		private _DA3F_CtrlListBoxMags = My_Ctrl(10805184,1501);
		lbClear _DA3F_CtrlListBoxMags;
    	{
			private _DA3F_RealNameMags 	= getText(ConfigFile >> "CfgMagazines" >> _x >> "displayName");
            private _DA3F_Pix           = getText(ConfigFile >> "CfgMagazines" >> _x >> "Picture");

			private _DA3F_index = _DA3F_CtrlListBoxMags lbAdd _DA3F_RealNameMags;
			_DA3F_CtrlListBoxMags lbSetData [_DA3F_index,_x];
            _DA3F_CtrlListBoxMags lbSetPicture [_DA3F_index,_DA3F_Pix];
    	} forEach _DA3F_arrayMags;