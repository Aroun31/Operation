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
	*       fnc_NearAllVeh.sqf
	*
	*
	*       [position,radius]call DA3F_fnc_NearAllVeh;
	*
	*
	*       ARGUMENTS :
	*           0 : position    | Object or Array or STRING
	*           1 : radius      | SCALAR
    *       EXEMPLES :
	*       [getmarkerpos "MarkerName",50]call DA3F_fnc_NearAllVeh;     // is ok
	*       ["My_Marker_name",nil,30]call DA3F_fnc_NearAllVeh;  // !! is not ok !!!
	*
	*       [position player,nil,20]call DA3F_fnc_NearAllVeh;   // is ok
	*       [player,nil,20]call DA3F_fnc_NearAllVeh;            // !! is not ok !!!
	*       [getpos player,nil,20]call DA3F_fnc_NearAllVeh;     // is ok
	*
	*       [[1544,54545,0],nil,30]call DA3F_fnc_NearAllVeh;    // is ok
	*       [getpos My_Vehicle,nil,30]call DA3F_fnc_NearAllVeh; // is ok
	*       [getpos My_Object,nil,30]call DA3F_fnc_NearAllVeh;  // is ok
	*       [getpos My_Object,["Car","Air"],30]call DA3F_fnc_NearAllVeh;  // is ok
    *
	*/

    params[
	    ["_pos",position player,[[]]],
	    ["_Class",["Car","Air","Ship","Armored","Submarine","Support","Tank"],[[]]],
	    ["_radius",50,[0]]
    ];

        private _nearAllVeh = nearestObjects [_pos,_Class,_radius];

_nearAllVeh