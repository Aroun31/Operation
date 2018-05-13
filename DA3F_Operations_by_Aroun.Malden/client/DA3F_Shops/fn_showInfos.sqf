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
    *           fn_showInfos.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *              _this call DA3F_fnc_showInfos;
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

			private _DA3F_Data 		= call compile format ["%1", _DA3F_Ctrl lbData _DA3F_index];
			private _DA3F_IDD		= ctrlIDD(ctrlParent _DA3F_Ctrl);
			private _DA3F_TxtInfo	= My_Ctrl(_DA3F_IDD,1100);
			private _DA3F_ShowTxt 	= "";

				_DA3F_Data params[
				    ["_DA3F_ClassName","",[""]],
					["_DA3F_Price",-1,[0]],
					["_DA3F_Price",-1,[0]],
					["_DA3F_Condition",false,[false]]
				];

		if (_DA3F_Condition) then [{
		private _DA3F_RealName 	= getText(ConfigFile >> "CfgWeapons" >> _DA3F_ClassName >> "displayName");
		private _DA3F_Pix 		= getText(ConfigFile >> "CfgWeapons" >> _DA3F_ClassName >> "picture");
        private _DA3F_magazines	= getArray (configFile >> "CfgWeapons" >> _DA3F_ClassName >> "magazines");

		_DA3F_ShowTxt = _DA3F_ShowTxt + "<t size='0.75' color='#407CA4' align='left'>ID obj :<t/><br/>";
		_DA3F_ShowTxt = _DA3F_ShowTxt + format["<img size='0.75' image='%2'/> <t size='0.75' color='#00F0F0' align='right'>%1<t/><br/><br/>",_DA3F_RealName,_DA3F_Pix];

		_DA3F_ShowTxt = _DA3F_ShowTxt + "<t size='0.75' color='#407CA4' align='left'>Mags :<t/><br/>";

		if (str _DA3F_magazines isEqualTo "[]") exitWith {};

			[_DA3F_magazines]call DA3F_fnc_load_Mags;

        	{
				private _DA3F_RealNameMags 	= getText(ConfigFile >> "CfgMagazines" >> _x >> "displayName");
				private _DA3F_Pix 			= getText(ConfigFile >> "CfgMagazines" >> _x >> "picture");
				private _DA3F_Color			= selectRandom(["#F6CE13","#F6B713","#E1A200","#FB9300"]);
					_DA3F_ShowTxt = _DA3F_ShowTxt + format["<img size='0.75' image='%3'/> <t color='%2' size='0.75' align='center'>%1<t/><br/>",_DA3F_RealNameMags,_DA3F_Color,_DA3F_Pix];
        	} forEach _DA3F_magazines;
								},{
					_DA3F_ShowTxt = _DA3F_ShowTxt + "<t size='0.75' color='#FF0000' align='left'>Vous ne remplissez pas les conditions<t/><br/>";
							}];

				_DA3F_TxtInfo ctrlSetStructuredText parseText _DA3F_ShowTxt;

					private _DA3F_AxeH 		= ctrlTextHeight _DA3F_TxtInfo;
					private _DA3F_PosCtrl	= ctrlPosition _DA3F_TxtInfo;
					_DA3F_PosCtrl params["_DA3F_AxeX","_DA3F_AxeY","_DA3F_AxeW"];
					_DA3F_TxtInfo ctrlSetPosition [_DA3F_AxeX,_DA3F_AxeY,_DA3F_AxeW,_DA3F_AxeH];
					_DA3F_TxtInfo ctrlCommit 0;