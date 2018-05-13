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
    *           fn_EventHandlerKill.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               _this call DA3F_fnc_EventHandlerKill;
    *
	*/

		params[
		    ["_DA3F_Unit",objNull,[objNull]],
			["_DA3F_Killer",objNull,[objNull]]
		];
   	 				private _DA3F_distance = round(_DA3F_Unit distance _DA3F_Killer);
   	 				private _DA3F_CalculDis= (10 +(ceil(_DA3F_distance/100)));
				    private _DA3F_NextLvl = (DA3F_lvl_next * DA3F_lvl_Combat);
				    private _DA3F_prog = _DA3F_distance;
				    DA3F_lvl_prog = DA3F_lvl_prog + _DA3F_CalculDis;

				            if (DA3F_lvl_prog >= _DA3F_NextLvl) then {

				                DA3F_lvl_Combat = DA3F_lvl_Combat + 1;

				               private _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>! Nouveau level !</t><br/><t font='PuristaMedium' size='0.8'  color='#16C500' >+ 1<br/>pour un total de : %1</t>",DA3F_lvl_Combat];
				                          [_msg,0.5,0.35,5,1.5] spawn BIS_fnc_dynamicText;

				                    private _sounds = "a3\missions_f_beta\data\sounds\firing_drills\drill_finish.wss";
				                    playSound3D [format["%1",_sounds], player, false, getPos player, 1, 1, 10];

				                private _DA3F_Diff = DA3F_lvl_prog - _DA3F_NextLvl;
				                DA3F_lvl_prog = _DA3F_Diff;
				            };

				    private _DA3F_lvl = format ["+ %1pts Combat\n%2/%3\nLevel actuel : %4",_DA3F_prog,DA3F_lvl_prog,(DA3F_lvl_next * DA3F_lvl_Combat),DA3F_lvl_Combat];
				    [_DA3F_Unit]spawn{
				    sleep 300;
				    deleteVehicle (_this select 0);
				};