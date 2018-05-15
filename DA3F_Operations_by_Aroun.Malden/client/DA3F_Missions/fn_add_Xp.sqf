#include "..\..\DA3F_OP_macros.hpp"
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
    *           fn_add_Xp.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               [Value]call DA3F_fnc_add_Xp;
    *
	*/

		params[
		    ["_DA3F_Msg","Combat",[""]],
			["_DA3F_value",10,[0]],
			["_DA3F_arrUnits",[],[[]]]
		];

		_DA3F_arrUnits params[
		    ["_DA3F_Unit",objNull,[objNull]],
			["_DA3F_Killer",objNull,[objNull]]
		];

	    private _DA3F_NextLvl 	= (DA3F_lvl_next * DA3F_lvl_Combat);
private _DA3F_oldVal = DA3F_lvl_prog;
	    DA3F_lvl_prog = DA3F_lvl_prog + _DA3F_value;

	            if (DA3F_lvl_prog >= _DA3F_NextLvl) then {

	                DA3F_lvl_Combat = DA3F_lvl_Combat + 1;

	               private _msg = format["<t font='PuristaMedium' size='0.75' color='#D3D3D3'>! Nouveau level !</t><br/><t font='PuristaMedium' size='0.75'  color='#16C500' >+ 1<br/>pour un total de : %1</t>",DA3F_lvl_Combat];
	                          [_msg,0.5,0.35,5,1.5] spawn BIS_fnc_dynamicText;
	                private _DA3F_Diff = DA3F_lvl_prog - _DA3F_NextLvl;
	                DA3F_lvl_prog = _DA3F_Diff;
	            };

	            disableSerialization;
	            5 cutRsc ["DA3F_Hud_Kill", "PLAIN"];
	            private _DA3F_display 	= uinamespace getVariable ["DA3F_HudKill",displayNull];
	            private _DA3F_Progress 	= _DA3F_display displayCtrl 1900;
	            private _DA3F_TextTitle	= _DA3F_display displayCtrl 1100;
	            private _DA3F_TextInfo 	= _DA3F_display displayCtrl 1101;
	            private _DA3F_PixOne 	= _DA3F_display displayCtrl 1200;
	            private _DA3F_PixTwo 	= _DA3F_display displayCtrl 1201;
	            private _DA3F_ProgPression 	= 0;
				_DA3F_PixOne ctrlSetText format ["%1", Cfg_Weapon_A3(getText,(currentWeapon _DA3F_Killer),"picture")];
				_DA3F_PixTwo ctrlSetText format ["%1", Cfg_Weapon_A3(getText,(currentWeapon _DA3F_Unit),"picture")];


	    private _DA3F_lvl = format ["<t font='PuristaMedium' align='left' size='0.6' color='#FFED11'>Arme Tireur</t><t font='PuristaMedium' align='right' size='0.6' color='#FFED11'>Arme Cible</t><br/><t font='PuristaMedium' align='center' size='0.75' color='#FFED11'>%5</t><br/><t font='PuristaMedium' align='center' size='0.75' color='#EB9326'>+ %1pts</t><br/><t font='PuristaMedium' align='center' size='0.75' color='#36EB26'>%2/%3</t><br/><t font='PuristaMedium' align='center' size='0.75' color='#FEFEFE'>Level actuel :</t><t font='PuristaMedium' align='center' size='0.75' color='#FFED11'> %4</t>",_DA3F_value,DA3F_lvl_prog,(DA3F_lvl_next * DA3F_lvl_Combat),DA3F_lvl_Combat,_DA3F_Msg];

	    	_DA3F_TextInfo ctrlSetStructuredText parseText _DA3F_lvl;

	    	private _DA3F_AxeH 		= ctrlTextHeight _DA3F_TextInfo;
	    	private _DA3F_PosTxt 	= ctrlPosition _DA3F_TextInfo;
	    		_DA3F_PosTxt params["_DA3F_AxeX","_DA3F_AxeY","_DA3F_AxeW"];
	    		_DA3F_TextInfo ctrlSetPosition [_DA3F_AxeX,_DA3F_AxeY,_DA3F_AxeW,_DA3F_AxeH];
	    		_DA3F_TextInfo ctrlCommit 0;
//                [_DA3F_lvl,0.5,0.35,5,1.5] spawn BIS_fnc_dynamicText;
            private _sounds = "a3\missions_f_beta\data\sounds\firing_drills\drill_finish.wss";
            /*playSound3D [format["%1",_sounds], player, false, getPos player, 1, 1, 10];*/
            playSound3D [format["%1",_sounds], player];
            sleep 0.5;
				for "_a" from 0 to (_DA3F_value) do {
					_DA3F_oldVal = _DA3F_oldVal + 1;
					_DA3F_ProgPression 	= linearConversion [0, (DA3F_lvl_next * DA3F_lvl_Combat), _DA3F_oldVal , 0, 1, true];
					_DA3F_Progress  progressSetPosition _DA3F_ProgPression;
					sleep 0.08;
				};