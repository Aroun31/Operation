#include "DA3F_Define_PlayerGUI.hpp"
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
    *           fn_initGuiPlayer.sqf
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
	if !(createDialog "DA3F_GUI_PlayerMenu") exitWith {};

		_DA3F_items = player getVariable ["DA3F_InvVirtUnit",[]];



Btn_Act_Use ctrlSetStructuredText parseText format ["<img size='1.2' image='\A3\ui_f\data\map\MapControl\waypointcompleted_CA.paa' />", nil];
Btn_Act_Close ctrlSetStructuredText parseText format ["<img align='left' size='0.65' image='images\GUI\boutons\Icone_Croix.paa' /><t align='center' >Close</t>", nil];
Btn_Act_Del ctrlSetStructuredText parseText format ["<img size='1.2' image='images\GUI\boutons\Poubelle_by_Aurel.paa' />", nil];

		if !(str _DA3F_items isEqualTo "[]") then {
            private _DA3F_ListItems     = _DA3F_items select 0;
            private _DA3F_ListNrbItems  = _DA3F_items select 1;
			private _DA3F_ItemName		= "";
            {
                private _DA3F_Item  	= _x;
                _DA3F_ItemName  		= Cfg_OP_ItemInfo(getText,_DA3F_Item,"displayname");
                private _DA3F_value = _DA3F_ListNrbItems select _foreachindex;

                ListItems lbAdd format ["[x%2] %1", _DA3F_ItemName,_DA3F_value];
                ListItems lbsetdata [(lbSize ListItems)-1,str([_DA3F_Item,_DA3F_value])];
            } forEach _DA3F_ListItems;
		};

	_DA3F_ProgPressionLife 		= (1 - (damage player));

	_DA3F_ProgPressionFood 		= linearConversion [0, 100, DA3F_Faim , 0, 1, true];

	_DA3F_ProgPressionWather	= linearConversion [0, 100, DA3F_Soif , 0, 1, true];

	_DA3F_ProgPressionExp 		= linearConversion [0, (DA3F_lvl_next * DA3F_lvl_Combat), DA3F_lvl_prog , 0, 1, true];

	for "_a" from 0 to _DA3F_ProgPressionLife step 0.05 do {
			Progress_Life progressSetPosition _a;
			sleep 0.02;
		};

	for "_a" from 0 to _DA3F_ProgPressionFood step 0.05 do {
			Progress_Food progressSetPosition _a;
			sleep 0.02;
		};

	for "_a" from 0 to _DA3F_ProgPressionWather step 0.05 do {
			Progress_Wather progressSetPosition _a;
			sleep 0.02;
		};

	for "_a" from 0 to _DA3F_ProgPressionExp step 0.05 do {
			Progress_Exp progressSetPosition _a;
			sleep 0.02;
		};

		Txt_Head ctrlSetStructuredText parseText format ["<t align='left' size='0.85' color='#00A9E3' >Player Menu</t><t align='center' size='0.85' color='#00A9E3' >Cash : %1µ</t><t align='right' size='0.85' color='#00A9E3' >Bank : %2µ</t>",DA3F_Cash,DA3F_Bank];

		Txt_Life ctrlSetStructuredText parseText format ["<t align='left' size='0.85' color='#00A9E3' >Santé</t><t align='right' size='0.85' color='#00A9E3' >%1</t>",(round(1 - (damage player))*100),"%"];

		Txt_Food ctrlSetStructuredText parseText format ["<t align='left' size='0.85' color='#00A9E3' >Faim</t><t align='right' size='0.85' color='#00A9E3' >%1</t>",DA3F_Faim,"%"];

		Txt_Wather ctrlSetStructuredText parseText format ["<t align='left' size='0.85' color='#00A9E3' >Soif</t><t align='right' size='0.85' color='#00A9E3' >%1</t>",DA3F_Soif,"%"];

		Txt_Exp ctrlSetStructuredText parseText format ["<t align='left' size='0.85' color='#00A9E3' >Exp.</t><t align='right' size='0.85' color='#00A9E3' >%2/%1</t>",(DA3F_lvl_next * DA3F_lvl_Combat),DA3F_lvl_prog];

	    []spawn{
	    #include "DA3F_Define_PlayerGUI.hpp"
	    	disableSerialization;
	    	while {!(isNull(findDisplay 150518))} do {
	    	/*
		for "_a" from 0 to (random 1) step 0.05 do {
					if (isNull(findDisplay 150518)) exitWith {};
	    			BackG_Color ctrlSetBackgroundColor [_a,(random 1),(random 1),0.75];

    		for "_b" from 0 to (random 1) step 0.05 do {
					if (isNull(findDisplay 150518)) exitWith {};
	    			BackG_Color ctrlSetBackgroundColor [(random 1),_b,(random 1),0.75];
	    			sleep 0.05;
	    		for "_c" from 0 to (random 1) step 0.05 do {
					if (isNull(findDisplay 150518)) exitWith {};
	    			BackG_Color ctrlSetBackgroundColor [(random 1),(random 1),_c,0.75];
	    			sleep 0.05;
	    		    };
	    	    };
	    	    sleep 0.08;
	    	};*/

    			BackG_Color ctrlSetBackgroundColor [(random 1),(random 1),(random 1),0.85];
	    		sleep (4 + (random 7));
				if (isNull(findDisplay 150518)) exitWith {};
	    	};
		};