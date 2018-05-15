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
    *           fn_Name.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	class DA3F_initCfg_Mission
	{
        DA3F_Name_Mission = "°Opération°";
		DA3F_MaxUnits     = 50;
	};

	class DA3F_initCfg_Spawn
	{
		DA3F_List_Spawn[] = {
			//{"NameMarker","Title","Description"}
			{"DA3F_Medic_center",$STR_DA3F_Mrk_MedicCenter,"Vous permet de récupérer des soins."},
			{"DA3F_Mrk_ConcessAndGarage_Air","Concess/Garage Air","Achetez ou récupérez un véhicule (aérien) à partir de cette position"},
			{"DA3F_Mrk_ConcessAndGarage_Car","Concess/Garage Car","Achetez ou récupérez un véhicule (terrestre) à partir de cette position"},
            {"DA3F_Mrk_Sp_Maritime","Centre maritime","Centre maritime improvisé"},
			{"DA3F_Mrk_Ope_Center","Centre d'opération","Centre d'opération improvisé"},
		};
	};