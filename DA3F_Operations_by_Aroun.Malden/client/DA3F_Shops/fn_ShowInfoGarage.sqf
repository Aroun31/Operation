#include "..\..\DA3F_OP_macros.hpp"
#define	CtrltxtGrpGarage	My_Ctrl(290418,1101)
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
    *           fn_ShowInfoGarage.sqf
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

	params[
	    ["_DA3F_Ctrl",controlNull,[controlNull]],
		["_DA3F_index",-1,[0]]
	];
	private _DA3F_Display = (ctrlParent _DA3F_Ctrl);
			if (_DA3F_index isEqualTo -1) exitWith {};
		private _DA3F_Data 		= _DA3F_Ctrl lbData _DA3F_index;

		_DA3F_Data = call compile format ["%1", _DA3F_Data];

		switch (str(ctrlIDD _DA3F_Display)) do {

		    case "290418": {
				_DA3F_Data params[
				    ["_DA3F_ClassName","",[""]],
					["_DA3F_ArrayInfo",[],[[]]]
				];

				_DA3F_ArrayInfo params[
				    ["_DA3F_Dmg",[],[[]]],
					["_DA3F_Fuel",0,[0]],
					["_DA3F_Price",0,[0]]
				];

			private _DA3F_RealName 	= Cfg_Veh_A3(getText,_DA3F_ClassName,"displayName");
			private _DA3F_Picture 	= Cfg_Veh_A3(getText,_DA3F_ClassName,"picture");
			private _DA3F_MaxCapa 	= Cfg_OP_VehInfo(getNumber,_DA3F_ClassName,"Item_MaxCoffre");

			CtrltxtGrpGarage ctrlSetStructuredText parseText format ["<img size='2' image='%1'/><br/><br/><t align='left'>Type de véhicule :<t/><t align='right'>%2<t/><br/><t align='left'>Carburant<t/><t align='right'>%3<t/><br/><t align='left'>Capacité Max. :<t/><t align='right'>%4<t/><br/><t align='left'>Prix de vente :<t/><t align='right'>%5<t/>",_DA3F_Picture,_DA3F_RealName,round((1 - (_DA3F_Fuel)) * 100),_DA3F_MaxCapa,_DA3F_Price];

		(ctrlPosition CtrltxtGrpGarage) params["_axX","_axY","_axW"];
		private _axH = ctrlTextHeight CtrltxtGrpGarage;

			CtrltxtGrpGarage ctrlSetPosition [_axX,_axY,_axW,_axH];
			CtrltxtGrpGarage ctrlCommit 0.4;
		    };
		};


