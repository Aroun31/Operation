//#include "..\..\DA3F_macros.hpp"
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
    *           DA3F_mission_0_comp.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    * ["Land_MultistoryBuilding_01_F","Land_MultistoryBuilding_03_F","Land_MultistoryBuilding_04_F"]
    */
        private _DA3F_Bati = objNull;
[1,format["Récupérez ce qu'il vous faut sur la vielle mine de charbon, il doit rester de ",nil]]call DA3F_fnc_hint;
            _DA3F_Pos_Desti = [position player]call DA3F_fnc_Pos_Mission_End;
            _DA3F_Pos_End = [_DA3F_Pos_Desti]call DA3F_fnc_Pos_Mission_End;
            _DA3F_Bati = selectRandom(nearestObjects [_DA3F_Pos_Desti,["Land_i_Shed_Ind_F","Land_dp_mainFactory_F","Land_Factory_Main_F","Land_Offices_01_V1_F","Land_WIP_F","Land_MultistoryBuilding_01_F","Land_MultistoryBuilding_03_F","Land_MultistoryBuilding_04_F"],500]);
            private _DA3F_PosDesBat = [];
            if (isNil "_DA3F_Bati") then [{
                _DA3F_PosDesBat = _DA3F_Pos_Desti;
                private _DA3F_ClassName = selectRandom(["Land_i_Shed_Ind_F","Land_dp_mainFactory_F","Land_Factory_Main_F","Land_Offices_01_V1_F","Land_WIP_F","Land_MultistoryBuilding_01_F","Land_MultistoryBuilding_03_F","Land_MultistoryBuilding_04_F"]);
                _DA3F_Bati =  _DA3F_ClassName createVehicle _DA3F_Pos_Desti;
                DA3F_Stock_Obj_Mission set [count DA3F_Stock_Obj_Mission,_DA3F_Bati];
            },{
            _DA3F_PosDesBat = getPos _DA3F_Bati;
        }];
            [_DA3F_PosDesBat,"Bâtiment officiel","DA3F_Mrk_Cible","ColorRed",independent] remoteExecCall ["DA3F_fnc_Create_Marker",0];
            [_DA3F_Pos_End,"Vielle mine de charbon","DA3F_Mrk_Check","ColorGreen",independent] remoteExecCall ["DA3F_fnc_Create_Marker",0];
    private _DA3F_Radius = 100;
    DA3F_Bati = _DA3F_Bati;
    _trg = createTrigger["EmptyDetector", _DA3F_PosDesBat];
    _trg setTriggerArea[_DA3F_Radius, _DA3F_Radius, 0, false];
    _trg setTriggerActivation["NONE","PRESENT", false];
    _trg setTriggerStatements["(damage DA3F_Bati)> 0.97", "
        DA3F_Mission_Valide = true;
        publicVariable ""DA3F_Mission_Valide"";
    ", ""];
[_trg]spawn{
        waitUntil {
        DA3F_Mission_Valide
        Or
        DA3F_Mission_Avorte
    };
    sleep 60;
    DA3F_Bati = nil;
    deleteVehicle _trg;
};