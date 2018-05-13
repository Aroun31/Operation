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
    *           fn_autoSave.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               []spawn DA3F_fnc_autoSave;
    *
    */
    //  (5*60)
    private _DA3F_Unit = objNull;
    while {true} do {
        _DA3F_Unit = player;

            private _DA3F_Dmg   = damage _DA3F_Unit;
            profileNamespace setVariable ["DA3F_Stats_Life",[_DA3F_Dmg,DA3F_Faim,DA3F_Soif,DA3F_Cash,DA3F_Bank]];

            profileNamespace setVariable ["DA3F_Stats_Lvl",[["DA3F_lvl_Combat","DA3F_lvl_prog"],[DA3F_lvl_Combat,DA3F_lvl_prog]]];

           // DA3F_Stats_Lvl = profileNamespace getVariable "DA3F_Stats_Lvl";

/*            private _DA3F_MyGarage =  missionNamespace getVariable ["DA3F_My_Garage",[[],[]]];
            profileNamespace setVariable ["DA3F_MyGarage",_DA3F_MyGarage];
*/
            //DA3F_MyGarage = profileNamespace getVariable "DA3F_MyGarage";


//        private _DA3F_Inv = (([_DA3F_Unit]call bis_fnc_invString) + (items _DA3F_Unit) + (assignedItems _DA3F_Unit) + (weapons _DA3F_Unit) + (magazines _DA3F_Unit));
        private _DA3F_Inv = getUnitLoadout player;
        /*
            private _DA3F_inventory = [[],[]];

                {
                    _list_Name  = (_DA3F_inventory select 0);
                    _list_Num   = (_DA3F_inventory select 1);
                            if !(_x in _list_Name) then [{
                                _list_Name set [count _list_Name,_x];
                                _list_Num set [count _list_Num,1];
                        },{
                            _DA3F_index = _list_Name find _x;
                            _cnt = _list_Num select _DA3F_index;
                            _cnt = _cnt + 1;
                            _list_Num set [_DA3F_index,_cnt];
                    }];
                    _DA3F_inventory set [0,_list_Name];
                    _DA3F_inventory set [1,_list_Num];
                } forEach _DA3F_Inv;*/

            profileNamespace setVariable ["DA3F_Inventory_Unit",_DA3F_Inv];
            //DA3F_Inventory = profileNamespace getVariable "DA3F_Inventory_Unit";

            profileNamespace setVariable ["DA3F_InvVirt",player getVariable ["DA3F_InvVirtUnit",[]]];
            //DA3F_InvVirt = profileNamespace getVariable "DA3F_InvVirt";

            systemChat localize "DA3F_SaveSucces";
        saveProfileNamespace;
        sleep (60 + random 15);
    };