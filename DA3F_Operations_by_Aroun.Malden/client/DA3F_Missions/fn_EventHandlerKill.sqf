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
   	 				private _DA3F_distance 	= round(_DA3F_Unit distance _DA3F_Killer);
   	 				private _DA3F_CalculDis	= (10 +(ceil(_DA3F_distance/100)));

   	 				if (isPlayer _DA3F_Killer) then {
 						["Combat",_DA3F_CalculDis,[_DA3F_Unit,_DA3F_Killer]] remoteExec ["DA3F_fnc_add_Xp",_DA3F_Killer];
   	 				};

				    [_DA3F_Unit]spawn{
				    sleep 300;
				    deleteVehicle (_this select 0);
				};