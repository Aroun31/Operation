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
    *           fn_PNJ_Car.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               this call DA3F_fnc_PNJ_Car;
    *
	*/

    _this addAction ["Concessionnaire",DA3F_fnc_initShop,"DA3F_PNJ_Car",0,true,false,"","_this distance _target < 5 && !(isNull _target)"];
    _this addAction ["Garage",DA3F_fnc_loadGarage,"DA3F_PNJ_Car",0,true,false,"","_this distance _target < 5 && !(isNull _target)"];
	_this addAction ["Ranger le véhicule",DA3F_fnc_vehicleGoInGarage,"DA3F_PNJ_Car",0,true,false,"","_this distance _target < 5 && !(isNull _target)"];