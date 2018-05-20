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
				"DA3F_Set_Armes_Default","DA3F_Set_Vehicles_Default"
			};
		};

		class DA3F_PNJ_Weapons
		{
			NameShop 	= "Jerry";
			Condition 	= "";
			markerSp	= "DA3F_Spawn_veh_01";
			Set_List[]	= {
				"DA3F_Set_Armes_1","DA3F_Set_Armes_2","DA3F_Set_Armes_Support","DA3F_Set_Armes_Snip"
			};
		};		

		class DA3F_PNJ_Car
		{
			NameShop 	= "Marthy";
			Condition 	= "";
			markerSp	= "DA3F_Sp_Veh_Car_01";
			Set_List[]	= {
				"DA3F_Set_Vehicles_1"
			};
		};	

		class DA3F_PNJ_Air
		{
			NameShop 	= "Brayan";
			Condition 	= "";
			markerSp	= "DA3F_Sp_Veh_Air_01";
			Set_List[]	= {
				"DA3F_Set_Vehicles_Air"
			};
		};		

		class DA3F_PNJ_Medic
		{
			NameShop 	= "Barney";
			Condition 	= "";
			markerSp	= "DA3F_Medic_center";
			Set_List[]	= {
				"DA3F_Set_Medic_1"
			};
		};		
	};

/*
	Sets des items
*/

	class CfgShops_Sets
	{
		/*
			Armes
		*/
		#include "DA3F_CfgWeapons.hpp"

		/*
			Vehicule
		*/
		#include "DA3F_CfgVehicles.hpp"
	};
};
