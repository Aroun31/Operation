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
    *           fn_convert_STR.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               ["hitface"]call DA3F_fnc_convert_STR; // return : Visage
    *
    */

	private _DA3F_Part = param[0,[[""],[""]]];
	private _DA3F_Convert = "";

	if (_DA3F_Part isEqualTo "") exitWith {};

	_DA3F_Convert = switch (true) do {
	    case (_DA3F_Part in ["hitface","face_hub"]): 	{"Visage"};
	    case (_DA3F_Part in ["hitneck","neck"]): 		{"Cou"};
	    case (_DA3F_Part in ["hithead","head"]): 		{"Tête"};
	    case (_DA3F_Part in ["hitpelvis","pelvis"]): 	{"Bassin"};
	    case (_DA3F_Part in ["hitabdomen","spine1"]): 	{"Abdomen"};
	    case (_DA3F_Part in ["hitdiaphragm","spine2"]): {"Diaphragm"};
	    case (_DA3F_Part in ["hitchest","spine3"]): 	{"Torse"};
	    case (_DA3F_Part in ["hitbody","body"]): 		{"Corps"};
	    case (_DA3F_Part in ["hitarms","arms"]): 		{"Bras"};
	    case (_DA3F_Part in ["hithands","hands"]): 		{"mains"};
	    case (_DA3F_Part in ["hitlegs","legs"]): 		{"jambes"};
	    case (_DA3F_Part in ["incapacitated","body"]): 	{"Incapacité"};
	};

    _DA3F_Convert