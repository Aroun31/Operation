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
    *           init.sqf
    *
    *       DESCRIPTION :
    *               Ceci est le script d'initialisation de base, d'ou son nom : init
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
    */

    0 execVM "client\init_Vars.sqf";
    []spawn {
        systemChat localize "DA3F_Mrk_MedicCenter";
        cutText [localize "DA3F_WelcomeTitle","BLACK FADED",0];
        sleep 3;
        []call DA3F_fnc_load_info; // Vérification des données du joueur
    };
player addItem "ItemMap";
player assignItem "ItemMap";