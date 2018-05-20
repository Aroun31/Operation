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
    *           fn_Addaction.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	params[
	    ["_DA3F_Unit",objNull,[objNull]],
		["_DA3F_Title","",[""]],
		["_DA3F_Code","",["",{},false]],
		["_DA3F_Args",[],[[],""]],
		["_DA3F_Condition","",[""]]
	];
	if (_DA3F_Condition isEqualTo "") then [{
	_DA3F_Condition = _DA3F_Condition + "!(isNull _target) && (_this distance _target) < 5";
		},{
	_DA3F_Condition = _DA3F_Condition + "&& !(isNull _target) && (_this distance _target) < 5";
	}];

	_DA3F_Unit addAction [_DA3F_Title,_DA3F_Code,_DA3F_Args,200,true,false,"",_DA3F_Condition];