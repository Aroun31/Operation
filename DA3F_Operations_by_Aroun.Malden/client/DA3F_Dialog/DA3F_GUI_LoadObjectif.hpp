class DA3F_GUI_LoadObjectif
{
	idd=120518;
	name="DA3F_GUI_LoadObjectif";
	author="@roun";
	onload = "_this spawn DA3F_fnc_Gui_File_Loader";
	class controlsBackground
	{
		class DA3F_BackG: DA3F_BackG
		{
			idc = 1000;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.588 * safezoneH;
			colorBackground[] = {0.2,0.18,0.09,0.85};
		};
		class DA3F_txt_header: DA3F_StructuredText
		{
			idc = 1100;
			text = "<t align='center' size='2.5' >°Operation°<t/>"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.084 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class DA3F_CtrlGrp: DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.308 * safezoneH;
			class Controls
			{
				class DA3F_Txt_Info: DA3F_StructuredText
				{
					idc = 1101;
					text = "<t align='center' size='1.5' >Description<t/>"; //--- ToDo: Localize;
					x = 0.00656249 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.23625 * safezoneW;
					h = 0.28 * safezoneH;
					colorBackground[] = {-1,-1,-1,0};
				};
			};
		};
	};

	class controls
	{

		class DA3F_listObjectifs: DA3F_RscListBox
		{
			idc = 1500;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.448 * safezoneH;
		};
		class DA3F_ValidObjectif : DA3F_Btn
		{
			idc = 2400;
			tooltip = "valide"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,1,-1,1};
			onButtonClick = "[]call DA3F_fnc_ValideMission";
		};
		class DA3F_Close: DA3F_Btn_Close
		{
			idc = 2401;
			tooltip = "Close"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {1,0,-1,0.25};
			colorBackground2[] = {1,0.4,-1,0.25};
		};
	};
};