#include "DefineCtrl_Medix.hpp"
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
    *           fn_Pulse_Target.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	private _DA3F_Target = cursorObject;

	if (isNull _DA3F_Target) exitWith {};
	if !(_DA3F_Target isKindOf "Man") exitWith {};
	if (_DA3F_Target distance player > 5) exitWith {};

		disableSerialization;

			private _DA3F_Stat_Target = lifeState _DA3F_Target;
			DA3F_Txt_Pulse ctrlSetStructuredText parseText format ["<t color='#00F0F0' size='1.2' align='center' >%1<t/>", _DA3F_Stat_Target];

        private _DA3F_Info  = "";
        private _DA3F_Val   = 0;

        (getAllHitPointsDamage _DA3F_Target)params[
            ["_DA3F_HitPart", [], [[]]],
            ["_DA3F_memory", [], [[]]],
            ["_DA3F_Values", [], [[]]]
        ];

        {
            _DA3F_Val = _DA3F_Values select _foreachindex;
            if (_x isEqualTo "incapacitated") then [{
                            _DA3F_Val = ((_DA3F_Val)* 100);
                        }, {
                            _DA3F_Val = [_DA3F_Val]call DA3F_fnc_convert_val;
                    }];
           _DA3F_Info = _DA3F_Info + format ["<t align='left'>%1<t/><t align='right'>%2%3<t/><br/>", [_x]call DA3F_fnc_convert_STR, _DA3F_Val,'%'];
        } forEach _DA3F_HitPart;

        DA3F_Txt_CtrlGrp ctrlSetStructuredText parseText _DA3F_Info;
        private _DA3F_posCtrl   = ctrlPosition DA3F_Txt_CtrlGrp;
        private _DA3F_AxeH      = ctrlTextHeight DA3F_Txt_CtrlGrp;

            _DA3F_posCtrl params["_DA3F_AxeX", "_DA3F_AxeY", "_DA3F_AxeW"];

            DA3F_Txt_CtrlGrp ctrlSetPosition [_DA3F_AxeX,_DA3F_AxeY,_DA3F_AxeW,_DA3F_AxeH];
            DA3F_Txt_CtrlGrp ctrlCommit 0;