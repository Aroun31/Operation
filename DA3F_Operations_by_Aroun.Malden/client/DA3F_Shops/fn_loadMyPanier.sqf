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
    *           fn_loadMyPanier.sqf
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

		DA3F_My_Panier params[
		    ["_DA3F_ListItems",[],[[]]],
			["_DA3F_ListQuantit",[],[[]]]
		];
			private _DA3F_ListPanier= My_Ctrl(10805184,1502);
			private _DA3F_RealName 	= "";
			lbClear _DA3F_ListPanier;

			{
				private _DA3F_item 		= _x;
				private _DA3F_Value 	= _DA3F_ListQuantit select _foreachindex;

					_DA3F_RealName 	= (getText(ConfigFile >> "CfgWeapons" >> _DA3F_item >> "displayName"));
						if (_DA3F_RealName isEqualTo "") then {
							_DA3F_RealName 	= (getText(ConfigFile >> "CfgMagazines" >> _DA3F_item >> "displayName"));
						};

					_DA3F_ListPanier lbAdd format ["[x%1] %2",_DA3F_Value, _DA3F_RealName];
					_DA3F_ListPanier lbSetData [(lbSize _DA3F_ListPanier)-1,str([_DA3F_item,_DA3F_Value])];
			} forEach _DA3F_ListItems;