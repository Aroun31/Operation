    /*
    *
    *       Project :
    *               Farming Party
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           init_Player.sqf
    *
    *       DESCRIPTION :
    *               Ceci est le script d'initialisation des variables de la mission
    *               Ajoutez à la suite des variables 'DA3F_' vos variables que vous souhaiteriez ajouter
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
    */



    //player addEventHandler ["killed",{_this spawn{DA3F_Death = true}}];

            []spawn DA3F_fnc_autoSave;
          //  []spawn DA3F_fnc_init_SpawnMenu;
            []spawn DA3F_fnc_playerEH;
