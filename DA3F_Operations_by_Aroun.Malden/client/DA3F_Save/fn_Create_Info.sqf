//#include "..\..\DA3F_macros.hpp"
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
    *           fn_Create_info.sqf
    *
    *       DESCRIPTION :
    *               Création des données du joueur.
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *   // Remise à zéro de la mission (Console de debug)
        profileNamespace setVariable ["DA3F_Stats_Life",nil];
        profileNamespace setVariable ["DA3F_Stats_Lvl",nil];
        profileNamespace setVariable ["DA3F_Inventory_Unit",nil];
        profileNamespace setVariable ["DA3F_InvVirt",nil];
        profileNamespace setVariable ["DA3F_MyGarage",nil];
        saveProfileNamespace;
    *
    */

        if (isNil "DA3F_Stats_Life") then [{
        private _DA3F_Dmg   = damage player;
            profileNamespace setVariable ["DA3F_Stats_Life",[_DA3F_Dmg,100,100,DA3F_Cash,DA3F_Bank]];
            DA3F_Stats_Life = profileNamespace getVariable "DA3F_Stats_Life";
            _DA3F_Save      = true;
        },{

            private _DA3F_Dmg = DA3F_Stats_Life select 0;
            DA3F_Faim = DA3F_Stats_Life select 1;
            DA3F_Soif = DA3F_Stats_Life select 2;
            DA3F_Cash = DA3F_Stats_Life select 3;
            DA3F_Bank = DA3F_Stats_Life select 4;

    }];

        if (isNil "DA3F_Stats_Lvl") then [{
            profileNamespace setVariable ["DA3F_Stats_Lvl",[["DA3F_lvl_Combat","DA3F_lvl_prog"],[0,0]]];
            DA3F_Stats_Lvl = profileNamespace getVariable "DA3F_Stats_Lvl";
            _DA3F_Save      = true;
        },{
            DA3F_Stats_Lvl = profileNamespace getVariable "DA3F_Stats_Lvl";
            _DA3F_lvl_Combat = (DA3F_Stats_Lvl select 1)select 0;
            _DA3F_lvl_Prog = (DA3F_Stats_Lvl select 1)select 1;
            missionNamespace setVariable ["DA3F_lvl_Combat",_DA3F_lvl_Combat];
            missionNamespace setVariable ["DA3F_lvl_prog",_DA3F_lvl_Prog];
            systemChat str [_DA3F_lvl_Combat,_DA3F_lvl_Prog];
    }];

        if (isNil "DA3F_Inventory") then [{
                    profileNamespace setVariable ["DA3F_Inventory_Unit",[[],[]]];
                    DA3F_Inventory = profileNamespace getVariable "DA3F_Inventory_Unit";
                    _DA3F_Save      = true;
                },{
                // à venir...
            }];

        if (isNil "DA3F_InvVirt") then [{
                    profileNamespace setVariable ["DA3F_InvVirt",[[],[]]];
                    DA3F_InvVirt = profileNamespace getVariable "DA3F_InvVirt";
                    player setVariable ["DA3F_InvVirtUnit",DA3F_InvVirt,false];
                    _DA3F_Save      = true;
                },{

                player setVariable ["DA3F_InvVirtUnit",DA3F_InvVirt,false];
                private _DA3F_ListItems     = DA3F_InvVirt select 0;
                private _DA3F_ListNrbItems  = DA3F_InvVirt select 1;

                {
                    private _DA3F_Item  = _x;
                    private _DA3F_value = _DA3F_ListNrbItems select _foreachindex;
                    missionNamespace setVariable [format["DA3F_item_%1",_DA3F_Item],_DA3F_value];
                } forEach _DA3F_ListItems;

            }];

        if (isNil "DA3F_MyGarage") then [{
                    profileNamespace setVariable ["DA3F_MyGarage",[[],[],[]]];
                    DA3F_MyGarage = profileNamespace getVariable "DA3F_MyGarage";
                    missionNamespace setVariable ["DA3F_My_Garage",DA3F_MyGarage];
                    _DA3F_Save      = true;
                },{
                missionNamespace setVariable ["DA3F_My_Garage",DA3F_MyGarage];
            }];

        if (_DA3F_Save) then {
            saveProfileNamespace;
        };

    [] spawn compile preprocessFileLineNumbers "scripts\init_Player.sqf";

