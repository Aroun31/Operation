class DA3F_GUI_Spawn_New
{
	idd 	= 190518;
	name 	= "DA3F_GUI_Spawn_New";
	author 	= "@roun";

	class controlsBackground
	{
		class DA3F_bckgnd_center: DA3F_BackG
		{
			idc = 1000;
			x = 0.00125001 * safezoneW + safezoneX;
			y = -0.00399999 * safezoneH + safezoneY;
			w = 0.9975 * safezoneW;
			h = 1.008 * safezoneH;
			colorBackground[] = {-1,0.02,0.08,0.9};
		};

		class DA3F_bckgnd_left: DA3F_BackG
		{
			idc = 1001;
			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.0800002 * safezoneH + safezoneY;
			w = 0.479062 * safezoneW;
			h = 0.868 * safezoneH;
			//colorBackground[] = {-1,0.08,0.2,0.7};
			colorBackground[] = {0.45,0.45,0.5,0.4};
		};

		class DA3F_bckgnd_right: DA3F_BackG
		{
			idc = 1002;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.08 * safezoneH + safezoneY;
			w = 0.479062 * safezoneW;
			h = 0.868 * safezoneH;
			//colorBackground[] = {-1,0.08,0.2,0.7};
			colorBackground[] = {0.45,0.45,0.5,0.4};
		};

		class DA3F_txt_header: DA3F_StructuredText
		{
			idc = 1100;
			text = "<t color='#00F0F0' align='center' size='1.2' >Spawn menu<t/>"; //--- ToDo: Localize;
			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.01 * safezoneH + safezoneY;
			w = 0.984375 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};

		class DA3F_txt_spMrk: DA3F_StructuredText
		{
			idc = 1101;
			text = "<t color='#00F0F0' align='center' size='1.2' >Spawn marker<t/>"; //--- ToDo: Localize;
			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.08 * safezoneH + safezoneY;
			w = 0.479062 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};

		class DA3F_txt_spUnit: DA3F_StructuredText
		{
			idc = 1102;
			text = "<t color='#00F0F0' align='center' size='1.2' >Spawn unit group<t/>"; //--- ToDo: Localize;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.08 * safezoneH + safezoneY;
			w = 0.479062 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};	

		class DA3F_CtrlGrp_Marker: DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.21 * safezoneH;
			class Controls
			{
				class DA3F_txt_InfospMrk: DA3F_StructuredText
				{
					idc = 1103;
					text = "<t color='#00F0F0' align='center' size='1.2' >Info spawn marker<t/>"; //--- ToDo: Localize;
					x = 0.00656299 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.196875 * safezoneW;
					h = 0.182 * safezoneH;
					colorBackground[] = {-1,-1,-1,0.1};
				};
			};
		};

		class DA3F_CtrlGrp_Unit: DA3F_Ctrl_Grp
		{
			idc = 2301;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.21 * safezoneH;
			class Controls
			{
				class DA3F_txt_InfospUnit: DA3F_StructuredText
				{
					idc = 1104;
					text = "<t color='#00F0F0' align='center' size='1.2' >Info spawn Unit<t/>"; //--- ToDo: Localize;
					x = 0.00656252 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.196875 * safezoneW;
					h = 0.182 * safezoneH;
					colorBackground[] = {-1,-1,-1,0.1};
				};
			};
		};	

		class DA3F_Map_Marker: DA3F_CtrlMap
		{
			idc = 2900;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.0209375 * safezoneW + safezoneX;
			y = 0.444 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.238 * safezoneH;
		};
		class DA3F_Cam_Marker: DA3F_Pix
		{
			idc = 2800;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.250624 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.238 * safezoneH;
		};
		class DA3F_Map_Units: DA3F_CtrlMap
		{
			idc = 2901;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.52625 * safezoneW + safezoneX;
			y = 0.444 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.238 * safezoneH;
		};
		class DA3F_Cam_unit: DA3F_Pix
		{
			idc = 2801;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.755937 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.238 * safezoneH;
		};	
	};

	class controls
	{
		class DA3F_Btn_SpMrk: DA3F_Btn
		{
			idc = 2400;
			text = "Spawn Marker"; //--- ToDo: Localize;
			x = 0.0209375 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.126 * safezoneH;
			OnButtonClick = "_this spawn DA3F_fnc_SpawnConfirme";
		};

		class DA3F_Btn_SpUnit: DA3F_Btn
		{
			idc = 2402;
			text = "Spawn Unit"; //--- ToDo: Localize;
			x = 0.52625 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.126 * safezoneH;
			OnButtonClick = "_this spawn DA3F_fnc_SpawnConfirme";
		};

		class DA3F_List_Marker: DA3F_RscListBox
		{
			idc = 1500;
			x = 0.014375 * safezoneW + safezoneX;
			y = 0.136 * safezoneH + safezoneY;
			w = 0.465937 * safezoneW;
			h = 0.294 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
			colorSelectBackground[] = {0, 0.35, 0.5, 0.2};
			colorSelectBackground2[] = {1, 0.85, 0.35, 0};
			OnLbSelChanged = "_this call DA3F_fnc_SelectSpawnMap;";
		};

		class DA3F_ListUnit: DA3F_RscListBox
		{
			idc = 1501;
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.136 * safezoneH + safezoneY;
			w = 0.465937 * safezoneW;
			h = 0.294 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
			colorSelectBackground[] = {0, 0.35, 0.5, 0.2};
			colorSelectBackground2[] = {1, 0.85, 0.35, 0};
			OnLbSelChanged = "_this call DA3F_fnc_SelectSpawnMap;";
		};
		
		class DA3F_Btn_BackLobby: DA3F_Btn
		{
			idc = 2401;
			text = "Lobby"; //--- ToDo: Localize;
			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.948 * safezoneH + safezoneY;
			w = 0.984375 * safezoneW;
			h = 0.042 * safezoneH;
			OnButtonClick = "'end1'failmission;";
		};
	};
};