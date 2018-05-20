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
    *           fn_playerEH.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/
/*
	_index = player addMPEventHandler ["mpkilled", {Null = _this execVM "playerkilled.sqf";}];

	player addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
	}];
*/
//	player addEventHandler ["HandleDamage","private _handle = false; _handle = _this spawn DA3F_fnc_handleDamagePlayer;_handle"];

	//Roger addEventHandler ["HandleDamage","_this call DA3F_fnc_handleDamageIA"];
//	Roger addEventHandler ["HandleDamage","private _handle = false; _handle = _this spawn DA3F_fnc_handleDamageIA;_handle"];

/*
	player addEventHandler ["Respawn", {
		params ["_unit", "_corpse"];
	}];
*/