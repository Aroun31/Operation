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
    *           fn_load_info.sqf
    *
    *       DESCRIPTION :
    *               Vérification des données du joueur.
    *               Si les données sont inexistante le script s'arrête.
    *               Alors le script de création des données est appelé.
    *               Sinon on attribut les données dans les variables
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
    */
/*
        private _DA3F_Save  = false;
        DA3F_Stats_Life     = profileNamespace getVariable "DA3F_Stats_Life";
        DA3F_Stats_Lvl      = profileNamespace getVariable "DA3F_Stats_Lvl";
        DA3F_Inventory      = profileNamespace getVariable "DA3F_Inventory";
        DA3F_MyGarage       = profileNamespace getVariable "DA3F_MyGarage";
        DA3F_InvVirt        = profileNamespace getVariable "DA3F_InvVirt";
*/
        {
            missionNamespace setVariable [format ["DA3F_Item_%1",(configName _x)],0];
        } forEach ("true" configClasses (missionConfigFile >> "DA3F_Cfg_Items"));

            if (isNil{profileNamespace getVariable "DA3F_Stats_Life"}) then [{
                profileNamespace setVariable ["DA3F_Stats_Life",[(damage player),100,100,DA3F_Cash,DA3F_Bank]];
            },{
            DA3F_Stats_Life = profileNamespace getVariable "DA3F_Stats_Life";
            private _DA3F_DmgPlayer = 0;
            _DA3F_DmgPlayer = ((DA3F_Stats_Life) select 0);
                if (_DA3F_DmgPlayer >= 0.95) then {
                    _DA3F_DmgPlayer = 0.75;
                };
            player setDamage(_DA3F_DmgPlayer);

            DA3F_Faim = DA3F_Stats_Life select 1;
            DA3F_Soif = DA3F_Stats_Life select 2;
            DA3F_Cash = DA3F_Stats_Life select 3;
            DA3F_Bank = DA3F_Stats_Life select 4;
        }];

            if (isNil{profileNamespace getVariable "DA3F_Stats_Lvl"}) then [{
                profileNamespace setVariable ["DA3F_Stats_Lvl",[["DA3F_lvl_Combat","DA3F_lvl_prog"],[0,0]]];
                    missionNamespace setVariable ["DA3F_lvl_Combat",0];
                    missionNamespace setVariable ["DA3F_lvl_prog",0];
            },{
                DA3F_Stats_Lvl = profileNamespace getVariable "DA3F_Stats_Lvl";
                private _DA3F_values = DA3F_Stats_Lvl select 1;
                        _DA3F_lvl_Combat = _DA3F_values select 0;
                        _DA3F_lvl_Prog = _DA3F_values select 1;
                    missionNamespace setVariable ["DA3F_lvl_Combat",_DA3F_lvl_Combat];
                    missionNamespace setVariable ["DA3F_lvl_prog",_DA3F_lvl_Prog];
        }];

            if (isNil{profileNamespace getVariable "DA3F_Inventory"}) then [{
                    profileNamespace setVariable ["DA3F_Inventory_Unit",[]];
            },{
                private _DA3F_Loadout = profileNamespace getVariable ["DA3F_Inventory_Unit",[]];
                if !(str _DA3F_Loadout isEqualTo "[]") then {
                    player setUnitLoadout _DA3F_Loadout;
                };
        }];

        [player, [profileNamespace, "DA3F_MyInventory"]] call BIS_fnc_loadInventory;
            if (isNil{profileNamespace getVariable "DA3F_MyGarage"}) then [{
                    profileNamespace setVariable ["DA3F_MyGarage",[[],[]]];
                    missionNamespace setVariable ["DA3F_My_Garage",[[],[]]];
            },{
                    DA3F_MyGarage = profileNamespace getVariable "DA3F_MyGarage";
                    missionNamespace setVariable ["DA3F_My_Garage",DA3F_MyGarage];
        }];

            if (isNil{profileNamespace getVariable "DA3F_InvVirt"}) then [{
                    profileNamespace setVariable ["DA3F_InvVirt",[[],[]]];
                    player setVariable ["DA3F_InvVirtUnit",[[],[]],false];
            },{
                DA3F_InvVirt = profileNamespace getVariable "DA3F_InvVirt";

                DA3F_InvVirt params[
                    ["_DA3F_ListItems",[],[[]]],
                    ["_DA3F_ListNrbItems",[],[[]]]
                ];

                    player setVariable ["DA3F_InvVirtUnit",[_DA3F_ListItems,_DA3F_ListNrbItems],false];

                if !(str _DA3F_ListItems isEqualTo "[]") then {
                    {
                        private _DA3F_Item  = _x;
                        private _DA3F_value = _DA3F_ListNrbItems select _foreachindex;
                        missionNamespace setVariable [format["DA3F_item_%1",_DA3F_Item],_DA3F_value];
                    } forEach _DA3F_ListItems;
                };
        }];


            [] spawn compile preprocessFileLineNumbers "client\init_Player.sqf";