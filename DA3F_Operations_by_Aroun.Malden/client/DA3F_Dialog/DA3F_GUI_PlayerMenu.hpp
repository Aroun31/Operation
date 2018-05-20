class DA3F_GUI_PlayerMenu
{
	idd 	= 150518;
	name 	= "DA3F_GUI_PlayerMenu";
	author 	= "@roun";

	class controlsBackground
	{
		class DA3F_BG: DA3F_BackG
		{
			idc = 1000;
			x = 0.335938 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.328125 * safezoneW;
			h = 0.406 * safezoneH;
			colorBackground[] = {1,0.25,0.15,0.85};
		};		
		class DA3F_BG_Black: DA3F_BackG
		{
			idc = 1001;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.315 * safezoneW;
			h = 0.35 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.95};
		};
		class DA3F_txt_Head : DA3F_StructuredText
		{
			idc = 1100;
			text = "<t align='center' size='1.5' color='#E34900' > Player Menu</t>"; //--- ToDo: Localize;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.315 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.1};
		};

		class DA3F_txt_Life : DA3F_StructuredText
		{
			idc = 1101;
			text = "<t align='center' size='0.85' color='#00A9E3' >Sante</t>"; //--- ToDo: Localize;
			x = 0.545937 * safezoneW + safezoneX;
			y = 0.416 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.1};
		};

		class DA3F_txt_Food : DA3F_StructuredText
		{
			idc = 1102;
			text = "<t align='center' size='0.85' color='#00A9E3' >Faim</t>"; //--- ToDo: Localize;
			x = 0.545937 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.1};
		};
		class DA3F_txt_wather : DA3F_StructuredText
		{
			idc = 1103;
			text = "<t align='center' size='0.85' color='#00A9E3' >Soif</t>"; //--- ToDo: Localize;
			x = 0.545937 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.1};
		};				
		class DA3F_txt_Exp : DA3F_StructuredText
		{
			idc = 1104;
			text = "<t align='center' size='0.85' color='#00A9E3' >Exp.</t>"; //--- ToDo: Localize;
			x = 0.545937 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.1};
		};
		class DA3F_Progress_life : DA3F_Progress
		{
			idc = 1800;
			x = 0.545937 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.014 * safezoneH;
		};
		class DA3F_Progress_Food : DA3F_Progress
		{
			idc = 1801;
			x = 0.545937 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.014 * safezoneH;
		};
		class DA3F_Progress_wather : DA3F_Progress
		{
			idc = 1802;
			x = 0.545937 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.014 * safezoneH;
		};
		class DA3F_Progress_Exp : DA3F_Progress
		{
			idc = 1803;
			x = 0.545937 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.014 * safezoneH;
		};
	};

	class controls
	{
		class ListMyItemsVirt : DA3F_RscListBox
		{
			idc = 1500;
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.416 * safezoneH + safezoneY;
			w = 0.150937 * safezoneW;
			h = 0.196 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class DA3F_Btn_Action_Use : DA3F_Btn
		{
			idc = 2400;
			x = 0.506562 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,1,-1,0.85};
		};
		class DA3F_Btn_Action_Delete : DA3F_Btn
		{
			idc = 2401;
			x = 0.506562 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {1,-1,-1,0.8};
		};
		class DA3F_Btn_Action_Close : DA3F_Btn_Close
		{
			idc = 2402;
			text = "X | Close"; //--- ToDo: Localize;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.315 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,-1,-1,1};
		};
		class DA3F_Btn_Action_01 : DA3F_Btn
		{
			idc = 2403;
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,0.3,0.5,0.5};
		};
		class DA3F_Btn_Action_02 : DA3F_Btn
		{
			idc = 2404;
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,0.3,0.5,0.5};
		};
		class DA3F_Btn_Action_03 : DA3F_Btn
		{
			idc = 2405;
			x = 0.414687 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,0.3,0.5,0.5};
		};
		class DA3F_Btn_Action_04 : DA3F_Btn
		{
			idc = 2406;
			x = 0.4475 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,0.3,0.5,0.5};
		};
		class DA3F_Btn_Action_05 : DA3F_Btn
		{
			idc = 2407;
			x = 0.480312 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,0.3,0.5,0.5};
		};
	};
};