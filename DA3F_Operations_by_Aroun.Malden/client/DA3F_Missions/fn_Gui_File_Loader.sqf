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
    *           fn_init_Loader.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	disableSerialization;
	params[["_DA3F_Display",displayNull,[displayNull]]];

	private _DA3F_List 		= _DA3F_Display displayCtrl 1500;
	private _DA3F_Valide 	= _DA3F_Display displayCtrl 2400;
	private _DA3F_Close 	= _DA3F_Display displayCtrl 2401;
	private _DA3F_TxtInfo 	= _DA3F_Display displayCtrl 1101;
    private _DA3F_PathVal   = "\A3\ui_f\data\map\MapControl\waypointcompleted_CA.paa";
    private _DA3F_PathClose = "images\GUI\boutons\Icone_Croix.paa";
    private _DA3F_PathInfo  = "\A3\ui_f\data\map\Diary\signal_ca.paa";

    {
        private _DA3F_Index = _DA3F_List lbAdd _x;
        _DA3F_List lbSetData [_DA3F_Index,str[_foreachindex,_x]];
    } forEach [
        localize "STR_DA3F_Mission_Vip",
        localize "STR_DA3F_Mission_Boom",
        localize "STR_DA3F_ChefRebel",
        "Random"
    ];

    _DA3F_Valide ctrlSetStructuredText parseText format ["<img align='left' image='%1'/><t align='center'>%2</t>", _DA3F_PathVal,localize "STR_DA3FValideMission"];
    _DA3F_Close ctrlSetStructuredText parseText format ["<img align='left' image='%1'/><t align='center'>%2</t>", _DA3F_PathClose,localize "STR_DA3FCloseGui"];

    _DA3F_TxtInfo ctrlSetStructuredText parseText format ["<img align='left' image='%1'/><t size='1.2'>Info :</t><br/><t align='center' size='0.9' >...</t>", _DA3F_PathInfo];