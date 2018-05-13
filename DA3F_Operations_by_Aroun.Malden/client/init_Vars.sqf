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
    *           init_Vars.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
    */

        DA3F_Active_debug = true;


        DA3F_Action     = false;
        DA3F_IsAction   = false;
        DA3F_Stop_Action= false;
        DA3F_Cash       = 0;
        DA3F_Bank       = 25000;
        DA3F_BankGrp    = 10000;
        DA3F_Faim       = 100;
        DA3F_Soif       = 100;
        DA3F_NextLvl    = 110;
        DA3F_Death      = false;
        DA3F_poids      = 0;
        DA3F_poidMaxInv = 100;
        DA3F_TotalMyPanier = 0;
        player setVariable ["DA3F_isComa",false,false];

            missionNamespace setVariable ["DA3F_My_Panier",[[],[]]];
            missionNamespace setVariable ["DA3F_My_StockUsine",[[],[]]];
            missionNamespace setVariable ["DA3F_MyKeysVeh",[]];
            missionNamespace setVariable ["DA3F_lvl_Combat",0];
            missionNamespace setVariable ["DA3F_lvl_prog",0];
            missionNamespace setVariable ["DA3F_lvl_next",DA3F_NextLvl];
