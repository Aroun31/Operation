#include "..\..\DA3F_OP_macros.hpp"
#define	CtrlListMyVeh	My_Ctrl(290418,1500)

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
    *           fn_init_Garage.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	params[
		"",
		"",
		"",
		["_DA3F_TypeShop","",[""]]
	];
        missionNamespace setVariable ["DA3F_TypeShop",_DA3F_TypeShop];

	disableSerialization;

	if (str(DA3F_My_Garage)isEqualTo "[[],[]]") exitWith
		{
			hint localize "DA3F_NoVeh"
	};

		if !(createDialog "DA3F_GUI_Garage") exitWith {};

		private _DA3F_ClassName = "";
		private _DA3F_Damage 	= 0;
		private _DA3F_Fuel 		= 0;
		private _DA3F_ArrayInfo = [];

			DA3F_My_Garage params[
			    ["_DA3F_ListVeh",[],[[]]],
				["_DA3F_ListInfo",[],[[]]]
			];

				{
					_DA3F_ClassName = _x;
					_DA3F_ArrayInfo = _DA3F_ListInfo select _foreachindex;
						_DA3F_ArrayInfo params[
						                ["_DA3F_dmg",[],[[]]],
						                ["_DA3F_fuel",0,[0]],
						                ["_DA3F_PrixVente",0,[0]],
						                ["_DA3F_Plak","",[""]],
						                ["_DA3F_Actif",0,[0]]
						            ];

						if (_DA3F_Actif isEqualTo 0) then {
						    private _DA3F_MaxCapa   = Cfg_OP_VehInfo(getNumber,_DA3F_ClassName,"Item_MaxCoffre");
					        private _DA3F_RealName  = Cfg_Veh_A3(getText,_DA3F_ClassName,"displayName");
					        private _DA3F_Picture   = Cfg_Veh_A3(getText,_DA3F_ClassName,"picture");
								CtrlListMyVeh lbAdd format ["%1 -- %2", _DA3F_RealName, _DA3F_Plak];
								CtrlListMyVeh lbSetData [_foreachindex,str([_DA3F_ClassName,_DA3F_ArrayInfo,_foreachindex])];
								CtrlListMyVeh lbSetColor [_foreachindex,[0.1,0.75,0.8,1]];
				            };
				} forEach _DA3F_ListVeh;

	hint format [localize "DA3F_WelcomeMyShop", profileName];
