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
    *           fn_loadList.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               _this call DA3F_fnc_loadList;
    *
	*/
	disableSerialization;
	_this params[
	    ["_DA3F_Ctrl",controlNull,[controlNull]],
		["_DA3F_index",-1,[0]]
	];

	if (_DA3F_index isEqualTo -1) exitWith {
		hint parseText format ["<t color='#FF0000' >Sélectionnez une catégorie<t/>", nil]
	};

		private _DA3F_Class 	= (_DA3F_Ctrl lbData _DA3F_index);
		private _DA3F_Condition	= Cfg_ShopWeapons(getText,"CfgShops_Sets",_DA3F_Class,"Condition");
		private _DA3F_listItems	= Cfg_ShopWeapons(getArray,"CfgShops_Sets",_DA3F_Class,"items");
		private _DA3F_IDD		= ctrlIDD(ctrlParent _DA3F_Ctrl);
		private _DA3F_ListBox	= My_Ctrl(_DA3F_IDD,1500);
		private _DA3F_Exit		= false;
		private _DA3F_Colors	= false;

		systemChat str [_DA3F_Class,_DA3F_Condition,_DA3F_listItems];

		if !(_DA3F_Condition isEqualTo "") then {
			_DA3F_Condition = call compile format ["%1",_DA3F_Condition];
		if !(_DA3F_Condition) then {
				_DA3F_Exit  = true;
				hint localize "STR_DA3F_NotLevel";
			};
		};

		if (_DA3F_Exit) exitWith {};

			lbClear _DA3F_ListBox;

			{
				_x params[
					    ["_DA3F_ClassName","",[""]],
						["_DA3F_PriceBuy",-1,[0]],
						["_DA3F_PriceSell",-1,[0]],
						["_DA3F_Condition","",[""]]
					];

					if (_DA3F_Condition isEqualTo "") then [{
						_DA3F_Condition = true;
					},{
						_DA3F_Condition = call compile format ["%1", _DA3F_Condition];

						if !(_DA3F_Condition) then {
							_DA3F_Colors = true
						};
					}];

					private _DA3F_RealName 	= (getText(ConfigFile >> "CfgWeapons" >> _DA3F_ClassName >> "displayName"));
					private _DA3F_Pix 		= (getText(ConfigFile >> "CfgWeapons" >> _DA3F_ClassName >> "Picture"));

					if (_DA3F_RealName isEqualTo "") then {
						_DA3F_RealName 	= (getText(ConfigFile >> "CfgVehicles" >> _DA3F_ClassName >> "displayName"));
						_DA3F_Pix 		= (getText(ConfigFile >> "CfgVehicles" >> _DA3F_ClassName >> "Picture"));
					};

					private _DA3F_index 	= _DA3F_ListBox lbAdd format ["%1", _DA3F_RealName];
					_DA3F_ListBox lbSetData [_DA3F_index,str([_DA3F_ClassName,_DA3F_PriceBuy,_DA3F_PriceSell,_DA3F_Condition])];
					_DA3F_ListBox lbSetPicture [_DA3F_index,_DA3F_Pix];

					if (_DA3F_Colors) then {
						_DA3F_ListBox lbSetColor [_DA3F_index,[1,0.4,0.1,1]];
					};
			} forEach _DA3F_listItems;

					lbSort _DA3F_ListBox;