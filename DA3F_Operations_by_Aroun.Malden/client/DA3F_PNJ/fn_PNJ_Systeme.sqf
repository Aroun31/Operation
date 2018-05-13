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
    *           fn_PNJ_Systeme.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/
	"DA3F_mrk_PNJ_Sys" setMarkerPos getPos _this;
	_this disableAI "all";
	_this addAction [localize"STR_DA3F_ReloadMyStats",{
	private _DA3F_Confirme = [format["<t color='#FF0000'>%1<t/>",localize "STR_DA3F_WarningReloadStats"],"Confirmation","OUI","NON"]call bis_fnc_GUImessage;
		if (isNil "_DA3F_Confirme") exitWith {};
		if !(_DA3F_Confirme) exitWith {};
        profileNamespace setVariable ["DA3F_Stats_Life",nil];
        profileNamespace setVariable ["DA3F_Stats_Lvl",nil];
        profileNamespace setVariable ["DA3F_Inventory_Unit",nil];
        profileNamespace setVariable ["DA3F_InvVirt",nil];
        profileNamespace setVariable ["DA3F_MyGarage",nil];
        saveProfileNamespace;
        hint localize "STR_DA3F_ReloadStatsSucces";
}];