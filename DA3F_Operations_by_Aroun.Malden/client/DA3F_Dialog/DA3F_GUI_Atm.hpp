class DA3F_GUI_Atm
{
	idd 	= 180518;
	name 	= "DA3F_GUI_Atm";
	author	= "@roun";
	
	class controlsBackground
	{
		class DA3F_BackG: DA3F_BackG
		{
			idc = 1000;
			x = 0.408124 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.35 * safezoneH;
			colorBackground[] = {-1,0.02,0.08,0.9};
		};
		class DA3F_Txt_header: DA3F_StructuredText
		{
			idc = 1100;
			text = "<t color='#00F0F0' align='center' size='1.3'>A.T.M<t/>"; //--- ToDo: Localize;
			x = 0.408124 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.1};
		};		
	};

	class controls
	{
		class DA3F_Edit: DA3F_Edit
		{
			idc = 1400;
			text = "0"; //--- ToDo: Localize;
			x = 0.480312 * safezoneW + safezoneX;
			y = 0.472 * safezoneH + safezoneY;
			w = 0.0459375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class DA3F_Retrait: DA3F_Btn
		{
			idc = 2400;
			text = "Retrait"; //--- ToDo: Localize;
			x = 0.4475 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
			OnButtonClick = "0 = ''spawn DA3F_fnc_Retrait";
		};
		
		class DA3F_Depot: DA3F_Btn
		{
			idc = 2401;
			text = "Depot"; //--- ToDo: Localize;
			x = 0.4475 * safezoneW + safezoneX;
			y = 0.514 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
			OnButtonClick = "0 = ''spawn DA3F_fnc_Depot";
		};
		class DA3F_InfoBank : DA3F_StructuredText
		{
			idc = 1101;
			text = ".."; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.150937 * safezoneW;
			h = 0.112 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.1};
		};
		class DA3F_Btn: DA3F_Btn_Close 
		{
			idc = 2402;
			text = "X | Close"; //--- ToDo: Localize;
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};