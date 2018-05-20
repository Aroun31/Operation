#include "DefineCtrl_Medix.hpp"
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
    *           fn_init_GUI_Medical.sqf
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
	if !(createDialog "DA3F_GUI_MedicalMenu") exitWith {};


        /*
        {
            [_DA3F_Veh,_x,(_DA3F_dmg select _foreachindex)] call BIS_fnc_setHitPointDamage;
        } forEach ((getAllHitPointsDamage _DA3F_veh)select 0);
        */