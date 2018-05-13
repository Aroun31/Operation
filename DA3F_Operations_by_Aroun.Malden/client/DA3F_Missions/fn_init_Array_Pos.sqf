//#include "..\..\DA3F_macros.hpp"
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
    *           fn_init_Array_Pos.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               []spawn DA3F_fnc_init_Array_Pos;
    *
    */

//////////////////////////
    private _DA3F_PosNear_Altis = [[7113.64,11581.1],[7420.49,18716.6],[16671.4,20076.9],[19768.8,10607.6],[25963.7,21315.8]];
    private _DA3F_PosNear_Malden = [[4552.87,9493.88],[6025.89,4147.85]];
    private _DA3F_PosNear_Tanoa = [[4647.8,9930.04],[5165.9,3423.38],[11916.4,6135.76],[10392.6,11408.1]];
/*
    Posez plusieurs mrk radius de 5000m pour recouvrir grossièrement
    l'ensemble des villes de votre carte  puis
    récupérez la position des markers pour les mettre dans le tableau comme les map vanillia.
    Une fois réalisé vous pouvez retirer les markers.
    C'est une manière de récupérer l'ensemble des positions des villes villages etc
    au lancement du serveur pour n'avoir que la variable à interroger et non l'ensemble de la map à chaque nouvelle position
*/
    private _DA3F_PosNear_Other = [];
//////////////////////////

    private _DA3F_Pos = switch (worldName) do {
        case "Altis": {_DA3F_PosNear_Altis};
        case "Malden": {_DA3F_PosNear_Malden};
        case "Tanoa": {_DA3F_PosNear_Tanoa};
        default {_DA3F_PosNear_Other};
    };
//////////////////////////

        if (str _DA3F_Pos isEqualTo "[]") exitWith {};

      allLocationTypes = ["Mount","Name","CityCenter","Airport","NameMarine","NameCityCapital","NameCity","NameVillage","NameLocal","Hill","ViewPoint","RockArea"];

      DA3F_All_Pos_Map = [];

          {
          private _DA3F_posi = _x;
              {
                  private _DA3F_Location  = _x;
                  private _DA3F_posLoc    = getPos _DA3F_Location;
                  if !(_DA3F_posLoc in DA3F_All_Pos_Map) then {
                      DA3F_All_Pos_Map set [count DA3F_All_Pos_Map,_DA3F_posLoc];
                  };
              } forEach nearestLocations [_DA3F_posi, allLocationTypes, 5000];
          } forEach _DA3F_Pos;

  publicVariable "DA3F_All_Pos_Map";
