class DA3F_ShopWeapon
{
	idd = 10805184;
	name= "DA3F_ShopWeapon";
	author= "@roun";

	class controlsBackground
	{

		class DA3F_BackG: DA3F_BackG
		{
			idc = 1000;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = 0.574 * safezoneH;
			colorBackground[] = {-1,0.05,0.2,0.9};
		};		

		class DA3F_Txt_ShopType: DA3F_StructuredText
		{
			idc = 1101;
			text = "<t size='1.5' color='#00F0F0'  align='center' >Armurerie<t/>"; //--- ToDo: Localize;
			x = 0.414687 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.056 * safezoneH;
		};
		
		class DA3F_Txt_infoCash: DA3F_StructuredText
		{
			idc = 1102;
			text = "<t size='1' color='#00F0F0'  align='center' >Récupération des informations ...<t/>"; //--- ToDo: Localize;
			x = 0.559062 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class DA3F_txt_MyPanier: DA3F_StructuredText
		{
			idc = 1103;
			text = "<t size='1.2' color='#00F0F0'  align='center' >Mon panier<t/>"; //--- ToDo: Localize;
			x = 0.554583 * safezoneW + safezoneX;
			y = 0.425926 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.028 * safezoneH;
		};		
	};

	class controls
	{

		class DA3F_ListCatego: DA3F_Combo
		{
			idc = 2100;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.241185 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.0205926 * safezoneH;
			onLbselchanged = "_this call DA3F_fnc_loadList";
			colorBackground[] = {-1,0.05,0.2,0.9};
		};
		
		class DA3F_ListWeapons: DA3F_RscListBox
		{
			idc = 1500;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.269062 * safezoneW;
			h = 0.238 * safezoneH;
			onLbselchanged = "_this call DA3F_fnc_showInfos";
			//colorBackground[] = {-1,0.05,0.2,0.9};
		};

		class DA3F_ListAmmo: DA3F_RscListBox
		{
			idc = 1501;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.269062 * safezoneW;
			h = 0.21 * safezoneH;
			//colorBackground[] = {-1,0.05,0.2,0};
		};

		class DA3F_ListPanier: DA3F_RscListBox
		{
			idc = 1502;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.28 * safezoneH;
			sizeEx = 0.025;			
			wholeHeight = 0.35;
			rowHeight = 0.04;
			colorBackground[] = {-1,0.05,0.2,0};
		};
		
		class DA3F_ctrlGrp: DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.168 * safezoneH;
			class Controls
			{
				class DA3F_Txt_info: DA3F_StructuredText
				{
					idc = 1100;
					text = "Sélectionnez un item"; //--- ToDo: Localize;
					x = 0.00656249 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.18375 * safezoneW;
					h = 0.14 * safezoneH;
					colorBackground[] = {0.45,0.45,0.45,0.3};
				};
			};
		};

		class DA3F_AddWeapon : DA3F_Btn
		{
			onbuttonclick = "_this call DA3F_fnc_addItemsInMyPanier";

			idc = 2400;
			x = 0.191563 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.07 * safezoneH;
			tooltip = "Ajouter au panier"; //--- ToDo: Localize;
		};
		class DA3F_AddMags : DA3F_Btn
		{
			onbuttonclick = "_this call DA3F_fnc_addItemsInMyPanier";

			idc = 2401;
			x = 0.191563 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class DA3F_Switch_info : DA3F_Btn
		{
			onbuttonclick = "_this call DA3F_fnc_switchInfo";

			idc = 2402;
			x = 0.755937 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class DA3F_QuantitWeapon: DA3F_Combo
		{
			idc = 2101;
			x = 0.191563 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.014 * safezoneH;
			colorBackground[] = {-1,0.05,0.2,0.9};
		};
		class DA3F_QuantitMags: DA3F_Combo
		{
			idc = 2102;
			x = 0.191563 * safezoneW + safezoneX;
			y = 0.556926 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.014 * safezoneH;
			colorBackground[] = {-1,0.05,0.2,0.9};
		};
		class DA3F_ClearMyPanier : DA3F_Btn
		{
			onbuttonclick = "missionNamespace setVariable [""DA3F_My_Panier"",[[],[]]];[]call DA3F_fnc_loadMyPanier;";
			tooltip = $STR_DA3F_ClearMyBasket;
			idc = 2403;
			x = 0.755937 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class DA3F_RemoveArticle : DA3F_Btn
		{
			onbuttonclick = "";
			tooltip = $STR_DA3F_RemoveArt;
			idc = 2404;
			x = 0.755937 * safezoneW + safezoneX;
			y = 0.563518 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class DA3F_ValideBuyMyPanier : DA3F_Btn
		{
			tooltip = $STR_DA3F_ValidBuy;
			onbuttonclick = "[] call DA3F_fnc_ValideBuy;";
			idc = 2405;
			x = 0.755937 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class DA3F_Close : DA3F_Btn
		{
			onbuttonclick = "CloseDialog 0";

			idc = 2406;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.766 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.07 * safezoneH;
		};
	};
};