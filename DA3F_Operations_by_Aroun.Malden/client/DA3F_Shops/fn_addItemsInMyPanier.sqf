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
    *           fn_addItemsInMyPanier.sqf
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

	_this params[["_DA3F_Ctrl",controlNull,[controlNull]]];

		private _DA3F_IDC				= ctrlIDC _DA3F_Ctrl;
		private _DA3F_Display			= ctrlParent _DA3F_Ctrl;
        private _DA3F_ListBoxWeapon     = _DA3F_Display displayCtrl 1500;
        private _DA3F_ListBoxMags      	= _DA3F_Display displayCtrl 1501;
        private _DA3F_ListBoxPanier   	= _DA3F_Display displayCtrl 1502;
        private _DA3F_ListCatego        = _DA3F_Display displayCtrl 2100;
        private _DA3F_BtnAddInPanierWp  = _DA3F_Display displayCtrl 2400;
        private _DA3F_BtnAddInPanierMag = _DA3F_Display displayCtrl 2401;
        private _DA3F_QuantitWps        = _DA3F_Display displayCtrl 2101;
    	private _DA3F_QuantitMag        = _DA3F_Display displayCtrl 2102;

    	switch (str _DA3F_IDC) do {
    	    case "2400": {
					if ((lbCurSel _DA3F_ListBoxWeapon) isEqualTo -1) exitWith {hint localize "DA3F_ItemNoSelect"};
    	    	private _DA3F_data 		= call compile format ["%1",_DA3F_ListBoxWeapon lbData (lbCurSel _DA3F_ListBoxWeapon)];
    	    		if ((lbCurSel _DA3F_QuantitWps) isEqualTo -1) exitWith {hint localize "DA3F_QuantitNoSelect"};
    	    	private _DA3F_Quantit 	= call compile format ["%1",_DA3F_QuantitWps lbData (lbCurSel _DA3F_QuantitWps)];

    	    		_DA3F_data params[
    	    		    ["_DA3F_ClassName","",[""]],
    	    			["_DA3F_PriceBuy",-1,[0]],
    	    			["_DA3F_PriceSell",-1,[0]],
    	    			["_DA3F_Conditon",false,[false]]
    	    		];

                        if !(_DA3F_Conditon) exitWith {
                            hint parseText format ["<t color='#F31400' align='center' size='1.5'>%1<t/>", localize "DA3F_VeryStupid"];
                            systemChat localize "DA3F_VeryStupid"
                        };

					private _DA3F_RealName 	= (getText(ConfigFile >> "CfgWeapons" >> _DA3F_ClassName >> "displayName"));

					DA3F_My_Panier params[
					    ["_DA3F_ListItems",[],[[]]],
						["_DA3F_ListQuantit",[],[[]]]
					];

                    DA3F_TotalMyPanier = DA3F_TotalMyPanier + (_DA3F_PriceBuy * _DA3F_Quantit);

						if (_DA3F_ClassName in _DA3F_ListItems) then [{
							private _DA3F_index = _DA3F_ListItems find _DA3F_ClassName;
							private _DA3F_Value = _DA3F_ListQuantit select _DA3F_index;
							_DA3F_Value = _DA3F_Value + _DA3F_Quantit;
								_DA3F_ListQuantit set [_DA3F_index,_DA3F_Value];
						},{
							_DA3F_ListItems pushBack _DA3F_ClassName;
							_DA3F_ListQuantit pushBack _DA3F_Quantit;
					}];

					missionNamespace setVariable ["DA3F_My_Panier",[_DA3F_ListItems,_DA3F_ListQuantit]];

    	    	};

    	    case "2401": {
    	    		if ((lbCurSel _DA3F_ListBoxMags) isEqualTo -1) exitWith {hint localize "DA3F_ItemNoSelect"};
    	    	private _DA3F_data 		= _DA3F_ListBoxMags lbData (lbCurSel _DA3F_ListBoxMags);
    	    		if ((lbCurSel _DA3F_QuantitMag) isEqualTo -1) exitWith {hint localize "DA3F_QuantitNoSelect"};
    	    	private _DA3F_Quantit 	= call compile format ["%1",_DA3F_QuantitMag lbData (lbCurSel _DA3F_QuantitMag)];

    	    		_DA3F_data params[["_DA3F_ClassName","",[""]]];

					private _DA3F_RealName 	= (getText(ConfigFile >> "CfgWeapons" >> _DA3F_ClassName >> "displayName"));

					DA3F_My_Panier params[
					    ["_DA3F_ListItems",[],[[]]],
						["_DA3F_ListQuantit",[],[[]]]
					];

						if (_DA3F_ClassName in _DA3F_ListItems) then [{
							private _DA3F_index = _DA3F_ListItems find _DA3F_ClassName;
							private _DA3F_Value = _DA3F_ListQuantit select _DA3F_index;
							_DA3F_Value = _DA3F_Value + _DA3F_Quantit;
								_DA3F_ListQuantit set [_DA3F_index,_DA3F_Value];
						},{
							_DA3F_ListItems pushBack _DA3F_ClassName;
							_DA3F_ListQuantit pushBack _DA3F_Quantit;
					}];

					missionNamespace setVariable ["DA3F_My_Panier",[_DA3F_ListItems,_DA3F_ListQuantit]];

    	    };
    	};

	[]call DA3F_fnc_loadMyPanier;