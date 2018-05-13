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
    *           fn_Create_Unit.sqf
    *
    *       DESCRIPTION :
    *               unité généré par le script : DA3F_Bob
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               _DA3F_Unit_Bot = [[53554,657654],group player,0.7,"MAJOR"]spawn DA3F_fnc_Create_Unit;    // is OK
    *               _DA3F_Unit_Bot = [[53554,657654],nil,nil,nil]spawn DA3F_fnc_Create_Unit;                 // is OK
    *               _DA3F_Unit_Bot = [[53554,657654],nil,0.5,nil]spawn DA3F_fnc_Create_Unit;                 // is OK
    *               _DA3F_Unit_Bot = [[53554,657654],Group GrandMere,nil,nil]spawn DA3F_fnc_Create_Unit;     // is OK
    *               _DA3F_Unit_Bot = [[53554,657654],nil,nil,"MAJOR"]spawn DA3F_fnc_Create_Unit;             // is OK
    *
    *               _DA3F_Unit_Bot = [nil,nil,nil,nil]spawn DA3F_fnc_Create_Unit;                            // NOT OK
    *               _DA3F_Unit_Bot = []spawn DA3F_fnc_Create_Unit;                                           // NOT OK
    *
    */
    if (isNil "DA3F_Stock_Obj_Mission") then {
        DA3F_Stock_Obj_Mission = [];
    };
        params[
            ["_DA3F_pos",[],[[]]],
            ["_DA3F_Grp",grpNull,[grpNull,sideUnknown]],
            ["_DA3F_Skill",0.5,[0]],
            ["_DA3F_Rank","CORPORAL",["CORPORAL"]]
        ];
         private _DA3F_GrpUnit = grpNull;
        if (str _DA3F_pos isEqualTo "[]") exitWith {};
            switch (typeName _DA3F_Grp) do {
                case "GROUP": {
                    _DA3F_GrpUnit = createGroup civilian;
                    if (_DA3F_Grp isEqualTo grpNull) then {
                        _DA3F_Grp = _DA3F_GrpUnit;
                    };
                };
                case "SIDE": {
                    _DA3F_GrpUnit = createGroup _DA3F_Grp;
                    _DA3F_Grp = _DA3F_GrpUnit;
                };
            };
        private _DA3F_Unit_Bot = "I_C_Soldier_Bandit_7_F" createUnit [_DA3F_pos, _DA3F_Grp, "DA3F_Bob = this;
            DA3F_Bob disableAI ""Move"";
        removeAllWeapons DA3F_Bob;
        removeAllItems DA3F_Bob;
        removeAllAssignedItems DA3F_Bob;
        removeUniform DA3F_Bob;
        removeVest DA3F_Bob;
        removeBackpack this;
        removeHeadgear this;
        removeGoggles this;
        this forceAddUniform ""U_I_C_Soldier_Para_3_F"";
        this addItemToUniform ""FirstAidKit"";
        for ""_i"" from 1 to 2 do {this addItemToUniform ""30Rnd_762x39_Mag_F"";};
        this addVest ""V_BandollierB_rgr"";
        this addItemToVest ""MiniGrenade"";
        this addItemToVest ""30Rnd_762x39_Mag_F"";
        this addBackpack ""B_Messenger_Gray_F"";
        this addHeadgear ""H_PASGT_basic_black_F"";
        this addWeapon ""arifle_AK12_GL_F"";
        DA3F_Bob addPrimaryWeaponItem ""optic_ERCO_blk_F"";
        this linkItem ""ItemMap"";
        this linkItem ""ItemCompass"";
        this linkItem ""ItemWatch"";
        this linkItem ""ItemRadio"";
        DA3F_Stock_Obj_Mission set [count DA3F_Stock_Obj_Mission,this];
",_DA3F_Skill, _DA3F_Rank];
(position DA3F_Bob) params["_axx","_axy","_axz"];
DA3F_Bob allowDamage false;
if ((count (nearestObjects [getPos DA3F_Bob,["building"],20])) isEqualTo 0) then {
    DA3F_Bob setPosASLW [_axx,_axy,(_axz + 2)];
};

waitUntil {isTouchingGround DA3F_Bob};
DA3F_Bob allowDamage true;
player setpos getPos DA3F_Bob;
_DA3F_Valide = true;