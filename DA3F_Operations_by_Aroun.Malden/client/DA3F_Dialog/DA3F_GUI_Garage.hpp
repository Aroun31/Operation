
class DA3F_GUI_Garage
{
	Author 	= "@roun";
	name 	= "DA3F_GUI_Garage";
	idd 	= 290418;
	class controlsBackground
	{
		class DA3F_BackG: DA3F_BackG
		{
			idc = 1000;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = 0.588 * safezoneH;
			colorBackground[] = {-1,0.3,0.5,0.9};
		};
		class DA3F_Txt_head: DA3F_StructuredText
		{
			idc = 1100;
			text = "<t size='2' align='center' >Garage</t>"; //--- ToDo: Localize;
			x = 0.26375 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.4725 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,0.05,0.2,0.25};
		};
	};
	
	class controls
	{
		class DA3F_ListMyVehList: DA3F_RscListBox
		{
			idc = 1500;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.269062 * safezoneW;
			h = 0.448 * safezoneH;
			sizeEx = 0.035;
			colortext[] = {-1,0.35,0.4,0.95};
			colorBackground[] = {-1,0.1,0.2,0.35};
			onlbselchanged = "_this call DA3F_fnc_ShowInfoGarage;";
		};
		class DA3F_CtrlGrp: DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.28 * safezoneH;
			class Controls
			{
				class DA3F_Txt_Info: DA3F_StructuredText
				{
					idc = 1101;
					text = "<t size='2' align='center' >Infos</t>"; //--- ToDo: Localize;
					x = 0.00656249 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.170625 * safezoneW;
					h = 0.252 * safezoneH;
					colorBackground[] = {-1,0.05,0.1,0.1};
				};
			};
		};

		class DA3F_Btn_Close: DA3F_Btn_Close
		{
			idc = 2400;
			text = "X"; //--- ToDo: Localize;
			x = 0.755937 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,0.25,0.1,0.8};
			colorBackground2[] = {1,0.85,0.75,0.8};
		};
		class DA3F_Btn_Sortir: DA3F_Btn
		{
			idc = 2401;
			text = "Récupérer"; //--- ToDo: Localize;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.042 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_SpawnMyVehGarage";
		};
		class DA3F_Btn_Vendre: DA3F_Btn
		{
			idc = 2402;
			text = "Vendre"; //--- ToDo: Localize;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.042 * safezoneH;
			onbuttonclick = "hint format ['interaction : %1\nEn cours de dev',ctrlText (_this select 0)]";
		};
	};	
};