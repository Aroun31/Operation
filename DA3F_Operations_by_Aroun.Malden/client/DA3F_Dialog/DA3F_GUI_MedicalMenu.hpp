class DA3F_GUI_MedicalMenu
{
	idd 	= 1605182;
	name 	= "DA3F_GUI_MedicalMenu";
	author 	= "@roun";
	class controlsBackground
	{
		class DA3F_BackG: DA3F_BackG
		{
			idc = 1000;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.644 * safezoneH;
			colorBackground[] = {-1,0.03,0.075,0.9};
			tooltip = "Medical Systeme"; //--- ToDo: Localize;
		};
		class DA3F_Txt_header: DA3F_StructuredText
		{
			idc = 1100;
			text = "<t color='#00FF00' size='1.4'  align='center'>Medical Systeme</t>"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class DA3F_Txt_infoTarget: DA3F_StructuredText
		{
			idc = 1101;
			text = "<t color='#00F0F0' size='1'  align='center'>Info target</t>"; //--- ToDo: Localize;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};

		class DA3F_ProgressSoins : DA3F_Progress
		{
			idc = 1800;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.014 * safezoneH;
		};
		class DA3F_Txt_Soin: DA3F_StructuredText
		{
			idc = 1102;
			text = "<t color='#00F0F0' size='1'  align='center'>soins</t>"; //--- ToDo: Localize;
			x = 0.257708 * safezoneW + safezoneX;
			y = 0.744482 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};

		class DA3F_CtrlGrp: DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.154 * safezoneH;
			class Controls
			{
				class DA3F_Txt_infoSoins: DA3F_StructuredText
				{
					idc = 1103;
					text = "<t color='#00FF00' size='1.4'  align='center'>Info soins.</t>"; //--- ToDo: Localize;
					x = 0.00656248 * safezoneW;
					y = 0.0139999 * safezoneH;
					w = 0.223125 * safezoneW;
					h = 0.126 * safezoneH;
					colorBackground[] = {-1,-1,-1,0};
				};
			};
		};		
	
		class Btn_MembreBase: DA3F_btn
		{

			idc 	= -1;
			x 		= 0;
			y 		= 0;
			w 		= 0;
			h 		= 0;	

			colorBackground[] 			= {0,0.8,0,0.85};
			colorBackgroundFocused[] 	= {1,0.85,0.3,0.7};
			colorBackground2[] 			= {0,1,0,1};
			animTextureNormal 			= "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled 		= "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver 			= "#(argb,8,8,3)color(1,1,1,1)";
			animTextureFocused 			= "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed 			= "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDefault 			= "#(argb,8,8,3)color(1,1,1,1)";			
			tooltip = ""; //--- ToDo: Localize;
		};
		class Btn_Main_gauche: Btn_MembreBase
		{
			idc = 2401;
			x = 0.577396 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.0142708 * safezoneW;
			h = 0.0495185 * safezoneH;
			colorBackground[] = {-1,0.9,-1,0.25};
			tooltip = "Main gauche"; //--- ToDo: Localize;
		};
		class Btn_Main_droite: Btn_MembreBase
		{
			idc = 2402;
			x = 0.660104 * safezoneW + safezoneX;
			y = 0.458926 * safezoneH + safezoneY;
			w = 0.0153125 * safezoneW;
			h = 0.0467408 * safezoneH;
			colorBackground[] = {-1,0.9,-1,0.25};
			tooltip = "Main droite"; //--- ToDo: Localize;
		};
		class Btn_Jambe_Left: Btn_MembreBase
		{
			idc = 2403;
			x = 0.605 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.0178125 * safezoneW;
			h = 0.196 * safezoneH;
			colorBackground[] = {-1,0.9,-1,0.25};
			tooltip = "Jambe gauche"; //--- ToDo: Localize;
		};
		class Btn_Jambe_Right: Btn_MembreBase
		{
			idc = 2404;
			x = 0.628646 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.0183334 * safezoneW;
			h = 0.196 * safezoneH;
			colorBackground[] = {-1,0.9,-1,0.25};
			tooltip = "Jambe droite"; //--- ToDo: Localize;
		};
		class Btn_Bras_gauche: Btn_MembreBase
		{
			idc = 2405;
			x = 0.587916 * safezoneW + safezoneX;
			y = 0.376074 * safezoneH + safezoneY;
			w = 0.0157292 * safezoneW;
			h = 0.0819259 * safezoneH;
			colorBackground[] = {-1,0.9,-1,0.25};
			tooltip = "Bras gauche"; //--- ToDo: Localize;
		};
		class Btn_Bras_right: Btn_MembreBase
		{
			idc = 2406;
			x = 0.648333 * safezoneW + safezoneX;
			y = 0.377 * safezoneH + safezoneY;
			w = 0.0157291 * safezoneW;
			h = 0.081 * safezoneH;
			colorBackground[] = {-1,0.9,-1,0.25};
			colorBackgroundFocused[] = {0,0.95,0,0.25};
			tooltip = "Bras droit"; //--- ToDo: Localize;
		};
		class Btn_Torse: Btn_MembreBase
		{
			idc = 2407;
			x = 0.611562 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = {-1,0.9,-1,0.25};
			colorBackgroundFocused[] = {0,0.95,0,0.25};
			tooltip = "Torse"; //--- ToDo: Localize;
		};
		class Btn_Ventre: Btn_MembreBase
		{
			idc = 2408;
			x = 0.611562 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.0288542 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = {-1,0.9,-1,0.25};
			tooltip = "Ventre"; //--- ToDo: Localize;
		};
		class Btn_tete: Btn_MembreBase
		{
			idc = 2409;
			x = 0.618333 * safezoneW + safezoneX;
			y = 0.261075 * safezoneH + safezoneY;
			w = 0.0158333 * safezoneW;
			h = 0.0598148 * safezoneH;
			colorBackground[] = {-1,0.9,-1,0.25};
			tooltip = "tete"; //--- ToDo: Localize;
		};
		class Btn_pied_Droit: Btn_MembreBase
		{
			idc = 2410;
			x = 0.629687 * safezoneW + safezoneX;
			y = 0.687963 * safezoneH + safezoneY;
			w = 0.0184374 * safezoneW;
			h = 0.0374814 * safezoneH;
			colorBackground[] = {-1,0.9,-1,0.25};
			tooltip = "Pied droit"; //--- ToDo: Localize;
		};
		class Btn_Pied_gauche: Btn_MembreBase
		{
			idc = 2411;
			x = 0.604687 * safezoneW + safezoneX;
			y = 0.688889 * safezoneH + safezoneY;
			w = 0.0179167 * safezoneW;
			h = 0.0365555 * safezoneH;
			colorBackground[] = {-1,0.9,-1,0.25};
			tooltip = "Pied Gauche"; //--- ToDo: Localize;
		};

	};

	class controls
	{
		class DA3F_Close : DA3F_Btn_Close
		{
			idc = 2418;
			text = "X | Close"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,0,-1,0.7};
			tooltip = "Close"; //--- ToDo: Localize;
		};

		class ListAction: DA3F_RscListBox
		{
			idc = 1500;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.168 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
		};
		class DA3F_Btn_Check: DA3F_Btn
		{
			idc = 2400;
			text = "Pulse"; //--- ToDo: Localize;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,1,-1,0.7};
			tooltip = "Check target"; //--- ToDo: Localize;
			OnButtonClick = "[]call DA3F_fnc_Pulse_Target;";
		};

		class DA3F_Btn_Act_01: DA3F_Btn
		{
			idc = 2412;
			text = "1"; //--- ToDo: Localize;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.0270833 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,0,-1,0.7};
			tooltip = "action 1"; //--- ToDo: Localize;
		};
		class DA3F_Btn_Act_02: DA3F_Btn
		{
			idc = 2413;
			text = "2"; //--- ToDo: Localize;
			x = 0.296562 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.0270833 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,0,-1,0.7};
			tooltip = "action 2"; //--- ToDo: Localize;
		};
		class DA3F_Btn_Act_03: DA3F_Btn
		{
			idc = 2414;
			text = "3"; //--- ToDo: Localize;
			x = 0.335938 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.0270833 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,0,-1,0.7};
			tooltip = "action 3"; //--- ToDo: Localize;
		};
		class DA3F_Btn_Act_04: DA3F_Btn
		{
			idc = 2415;
			text = "4"; //--- ToDo: Localize;
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.0270833 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,0,-1,0.7};
			tooltip = "action 4"; //--- ToDo: Localize;
		};
		class DA3F_Btn_Act_05: DA3F_Btn
		{
			idc = 2416;
			text = "5"; //--- ToDo: Localize;
			x = 0.414687 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.0270833 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,0,-1,0.7};
			tooltip = "Action 5"; //--- ToDo: Localize;
		};
		class DA3F_Btn_Act_06: DA3F_Btn
		{
			idc = 2417;
			text = "6"; //--- ToDo: Localize;
			x = 0.454062 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.0270833 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,0,-1,0.7};
			tooltip = "Action 6"; //--- ToDo: Localize;
		};
		class DA3F_Btn_Prodigue: DA3F_Btn
		{
			idc = 2419;
			text = "Prodiguer les soins"; //--- ToDo: Localize;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {1,0.85,0.31,0.7};
			tooltip = "Appliquer les soins"; //--- ToDo: Localize;
			OnButtonClick = "call DA3F_fnc_UpdateProgress;";
		};

		class DA3F_PixHuman: DA3F_Pix
		{
			idc = 1200;
			text = "images\GUI\Medical\Img_Human3.paa";
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.504 * safezoneH;
		};
	};
};
