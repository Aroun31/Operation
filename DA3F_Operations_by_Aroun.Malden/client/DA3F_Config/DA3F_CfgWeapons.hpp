		class DA3F_Set_Armes_Default
		{
			title 		= "Arme par défaut";
			Condition 	= "";
			items[]		= {
				{"arifle_TRG20_F",500,750,""},
				{"arifle_AK12_F",0,0,"[""Admin_Op""] call DA3F_fnc_CheckCondition"},
				{"arifle_Katiba_C_F",0,0,"[""Admin_Op""] call DA3F_fnc_CheckCondition"},
				{"LMG_Mk200_F",0,0,"[""Admin_Op""] call DA3F_fnc_CheckCondition"}
			};		
		};

		class DA3F_Set_Medic_1
		{
			title 		= "Medic";
			Condition 	= "";
			items[]		= {
				{"FirstAidKit",150,750,""},
				{"Medikit",450,625,""}
			};		
		};

		class DA3F_Set_Armes_1
		{
			title 		= "Niveau 1";
			Condition 	= "DA3F_lvl_Combat >= 1";
			items[]		= {
				{"hgun_Pistol_heavy_01_F",1500,710,"DA3F_lvl_Combat >= 1"},
				{"arifle_Mk20_plain_F",2420,1100,"DA3F_lvl_Combat >= 1"},
				{"arifle_MX_Black_F",2830,1310,"DA3F_lvl_Combat >= 1"},

				{"optic_MRD",375,140,"DA3F_lvl_Combat >= 1"},
				{"optic_Arco_blk_F",500,175,"DA3F_lvl_Combat >= 1"},
				{"optic_ERCO_blk_F",500,175,"DA3F_lvl_Combat >= 1"}
			};		
		};

		class DA3F_Set_Armes_2
		{
			title 		= "Niveau 2";
			Condition 	= "DA3F_lvl_Combat >= 2";
			items[]		= {
				{"arifle_AK12_F",18500,625,"[""Assault""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 2"},
				{"arifle_MX_SW_Black_F",21500,865,"[""Assault""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 2"},
				{"arifle_SPAR_01_blk_F",20500,785,"[""Medic""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 2"},


				{"optic_MRD",3750,140,"DA3F_lvl_Combat >= 2"},
				{"optic_Arco_blk_F",5000,175,"DA3F_lvl_Combat >= 2"},
				{"optic_ERCO_blk_F",5000,175,"DA3F_lvl_Combat >= 2"},
				{"optic_MRCO",10500,425,"DA3F_lvl_Combat >= 2"},
				{"optic_Hamr",10500,425,"DA3F_lvl_Combat >= 2"},
				{"optic_DMS",10500,425,"DA3F_lvl_Combat >= 2"}
			};		
		};

		class DA3F_Set_Armes_Support
		{
			title 		= "Support";
			Condition 	= "DA3F_lvl_Combat >= 3";
			items[]		= {
				{"arifle_SPAR_02_khk_F",18500,625,"[""Assault""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 3"},
				{"MMG_02_black_F",23500,925,"[""Assault""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 3"},
				{"LMG_Zafir_F",24000,980,"[""Assault""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 3"},
				{"LMG_Mk200_F",23800,955,"[""Assault""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 3"},


				{"optic_MRD",3750,140,"DA3F_lvl_Combat >= 2"},
				{"optic_Arco_blk_F",5000,175,"DA3F_lvl_Combat >= 2"},
				{"optic_ERCO_blk_F",5000,175,"DA3F_lvl_Combat >= 2"},
				{"optic_MRCO",10500,425,"DA3F_lvl_Combat >= 2"},
				{"optic_Hamr",10500,425,"DA3F_lvl_Combat >= 2"},
				{"optic_DMS",10500,425,"DA3F_lvl_Combat >= 2"},
				{"optic_Nightstalker",12500,535,"DA3F_lvl_Combat >= 3"}
			};		
		};

		class DA3F_Set_Armes_Snip
		{
			title 		= "Sniper";
			Condition 	= "DA3F_lvl_Combat >= 3";
			items[]		= {
				{"srifle_GM6_F",35000,750,"[""Sniper""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 3"},
				{"LMG_03_F",12500,425,"[""Sniper""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 3"},
				{"srifle_LRR_F",12500,425,"[""Sniper""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 3"},

				{"optic_Nightstalker",12500,535,"[""Sniper""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 3"},
				{"optic_AMS",12500,535,"[""Sniper""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 3"},
				{"optic_LRPS",12500,535,"[""Sniper""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 3"},
				{"optic_KHS_blk",12500,535,"[""Sniper""] call DA3F_fnc_CheckCondition && DA3F_lvl_Combat >= 3"}
			};		
		};
