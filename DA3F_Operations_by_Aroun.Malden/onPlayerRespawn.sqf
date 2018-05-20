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
    *           onPlayerRespawn.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
    */

player addItem "ItemMap";
player assignItem "ItemMap";
[]spawn DA3F_fnc_init_SpawnMenu;
//player addAction ["DA3F Medic Menu",DA3F_fnc_init_GUI_Medical,"",9999,false,false,"",""];