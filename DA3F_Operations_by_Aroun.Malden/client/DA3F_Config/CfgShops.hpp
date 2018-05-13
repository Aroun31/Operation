class Cfg_Shops_Weapons
{
	class CfgShops_PNJ
	{
		class DA3F_PNJ_Default
		{
			NameShop 	= "Joey";
			Condition 	= "";
			markerSp	= "DA3F_Spawn_veh_01";
			Set_List[]	= {
				"DA3F_Set_Armes_Default","DA3F_Set_Vehicles_1"
			};
		};

		class DA3F_PNJ_CO
		{
			NameShop 	= "Jerry";
			Condition 	= "";
			markerSp	= "DA3F_Spawn_veh_01";
			Set_List[]	= {
				"DA3F_Set_Armes_1","DA3F_Set_Armes_2"
			};
		};		
	};

/*
	SÉPARE !!!!
*/

	class CfgShops_Sets
	{
		class DA3F_Set_Armes_Default
		{
			title = "Arme par défaut";
			Condition = "";
			items[]= {
				{"arifle_MX_SW_Black_F",500,750,""},
				{"arifle_AK12_F",0,0,"[""Admin_Op""] call DA3F_fnc_CheckCondition"},
				{"arifle_Katiba_C_F",0,0,"[""Admin_Op""] call DA3F_fnc_CheckCondition"},
				{"LMG_Mk200_F",0,0,"[""Admin_Op""] call DA3F_fnc_CheckCondition"}
			};		
		};

		class DA3F_Set_Armes_1
		{
			title = "Niveau 1";
			Condition = "DA3F_lvl_Combat >= 1";
			items[]= {
				{"arifle_Mk20_GL_ACO_F",-1,750,""},
				{"arifle_AK12_F",1850,625,"[""Assault""] call DA3F_fnc_CheckCondition"},
				{"arifle_Katiba_C_F",1050,425,"[""Medic""] call DA3F_fnc_CheckCondition"},
				{"LMG_Mk200_F",2550,825,"[""Sniper""] call DA3F_fnc_CheckCondition"}
			};		
		};

		class DA3F_Set_Armes_2
		{
			title = "Niveau 2";
			Condition = "DA3F_lvl_Combat >= 2";
			items[]= {
				{"srifle_GM6_F",3500,750,""},
				{"LMG_03_F",1250,425,""},
				{"srifle_LRR_F",1250,425,""}
			};		
		};


		/*
			Vehicule
		*/

		class DA3F_Set_Vehicles_1
		{
			title = "Véhicule";
			Condition = "";
			items[]= {
				{"B_LSV_01_unarmed_F",3500,750,""},
				{"B_LSV_01_armed_F",1250,425,""},
				{"B_MRAP_01_F",1250,425,""},
				{"I_G_Van_02_vehicle_F",1250,425,""},
				{"I_G_Offroad_01_armed_F",1250,425,""}
			};		
		};
	};
};