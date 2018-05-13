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
    *           fn_initShopWeapon.sqf
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
        ["_DA3F_PNJ",objNull,[objNull]],
        "",
        "",
        ["_DA3F_TypeShop","DA3F_PNJ_Default",[""]]
    ];


    if !(createDialog "DA3F_ShopWeapon") exitWith {};
        private _DA3F_ListCatego        = My_Ctrl(10805184,2100);
        private _DA3F_BtnAddInPanierWp  = My_Ctrl(10805184,2400);
        private _DA3F_BtnAddInPanierMag = My_Ctrl(10805184,2401);
        private _DA3F_BtnClear          = My_Ctrl(10805184,2403);
        private _DA3F_BtnRemove         = My_Ctrl(10805184,2404);
        private _DA3F_BtnValide         = My_Ctrl(10805184,2405);
        private _DA3F_QuantitWps        = My_Ctrl(10805184,2101);
        private _DA3F_QuantitMag        = My_Ctrl(10805184,2102);
        private _DA3F_InfoPlayer        = My_Ctrl(10805184,1102);
    	private _DA3F_TxtShop           = My_Ctrl(10805184,1101);
        private _DA3F_Exit              = false;
        private _DA3F_PathImage         = "images\GUI\boutons\PanierIconeWhite.paa";
        private _DA3F_PathImgValideA3   = "\A3\ui_f\data\map\MapControl\waypointcompleted_CA.paa";
        private _DA3F_PathImgDelete     = "images\GUI\boutons\Poubelle_by_Aurel.paa";
        private _DA3F_PathImgRemove     = "images\GUI\boutons\Icone_Croix.paa";
       // private _DA3F_ArrayWeapon       = "true" configClasses (missionConfigFile >> "Cfg_Shops_Weapons" >> "DA3F_PNJ_Almyra" >> _DA3F_TypeShop);
        private _DA3F_Shop_NamePNJ      = Cfg_ShopWeapons(getText,"CfgShops_PNJ",_DA3F_TypeShop,"NameShop");
        private _DA3F_Shop_Condition    = Cfg_ShopWeapons(getText,"CfgShops_PNJ",_DA3F_TypeShop,"Condition");
        private _DA3F_Shop_MrkSp        = Cfg_ShopWeapons(getArray,"CfgShops_PNJ",_DA3F_TypeShop,"markerSp");
        private _DA3F_Shop_ListSet      = Cfg_ShopWeapons(getArray,"CfgShops_PNJ",_DA3F_TypeShop,"Set_List");
        if !(_DA3F_Shop_Condition isEqualTo "") then {
            _DA3F_Shop_Condition = call compile format ["%1", _DA3F_Shop_Condition];
            if !(_DA3F_Shop_Condition) then {
                _DA3F_Exit = true;
            };
        };

        if (_DA3F_Exit) exitWith {
            closeDialog 0;
            hint format [localize"DA3F_NotUseShop", nil];
        };
        missionNamespace setVariable ["DA3F_ShopPnj",_DA3F_PNJ];
        missionNamespace setVariable ["DA3F_TypeShop",_DA3F_TypeShop];
    	//private _DA3F_ArrayWeapon = "(getText(_x >> ""simulation""))isEqualTo 'Weapon'" configClasses getarr(configFile >> "CfgWeapons");
        //private _DA3F_ArrayWeapon       = "true" configClasses(configFile >> "CfgWeapons" >> "Rifle");

        for "_a" from 1 to 10 do {
            _DA3F_QuantitWps lbAdd str(_a);
            _DA3F_QuantitWps lbSetData [(lbSize _DA3F_QuantitWps)-1,str(_a)];
            _DA3F_QuantitMag lbAdd str(_a);
            _DA3F_QuantitMag lbSetData [(lbSize _DA3F_QuantitMag)-1,str(_a)];
        };


        	{
            private _DA3F_Title     = Cfg_ShopWeapons(getText,"CfgShops_Sets",_x,"title");
            private _DA3F_Condition = Cfg_ShopWeapons(getText,"CfgShops_Sets",_x,"Condition");
            private _DA3F_Items     = Cfg_ShopWeapons(getArray,"CfgShops_Sets",_x,"items");
        		_index = _DA3F_ListCatego lbAdd format ["%1",_DA3F_Title];
        		_DA3F_ListCatego lbSetData [_index,_x];
        		sleep 0.001;
        	} forEach _DA3F_Shop_ListSet;

            _DA3F_TxtShop ctrlSetStructuredText parseText format ["<t color='#F31400' >%1<t/>",_DA3F_Shop_NamePNJ];
            _DA3F_BtnClear ctrlSetStructuredText parseText format ["<img size='1.3' image='%1' />",_DA3F_PathImgDelete];
            _DA3F_BtnRemove ctrlSetStructuredText parseText format ["<img size='1.3' image='%1' />",_DA3F_PathImgRemove];
            _DA3F_BtnValide ctrlSetStructuredText parseText format ["<img size='1.3' image='%1' />",_DA3F_PathImgValideA3];
            _DA3F_BtnAddInPanierWp ctrlSetStructuredText parseText format ["<img size='1.3' image='%1' />",_DA3F_PathImage];
            _DA3F_BtnAddInPanierMag ctrlSetStructuredText parseText format ["<img size='1.3' image='%1' />",_DA3F_PathImage];
            _DA3F_InfoPlayer ctrlSetStructuredText parseText format ["<t color='#F31400' >Cash : %1µ Bank : %2µ Exp : %3<t/>",DA3F_Cash,DA3F_Bank,DA3F_lvl_Combat];