class DA3F_GUI_Spawn
{
	idd = 1090518;
	name = "DA3F_GUI_Spawn";
	author = "@roun";
	class controlsBackground
	{
		class DA3F_BackG: DA3F_BackG
		{
			idc = 1000;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.63 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.9};
		};

		class DA3F_txt_head: DA3F_StructuredText
		{
			idc = 1100;
			text = "<t color='#00B5E8'  size='1.5' align='center' >Spawn Menu<t/>"; //--- ToDo: Localize;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.492187 * safezoneW;
			h = 0.056 * safezoneH;
		};

		class DA3F_MapView: DA3F_CtrlMap
		 {
			idc = 31400;
			x = 0.493437 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.238 * safezoneH;
			 maxSatelliteAlpha = 0.75;
			 alphaFadeStartScale = 1.15;
			 alphaFadeEndScale = 1.29;
		 };		

		class DA3F_CtrlGrp: DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.493437 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.182 * safezoneH;
			class Controls
			{
				class DA3F_txt_ctrlGrp: DA3F_StructuredText
				{
					idc = 1101;
					text = "<t color='#00B5E8'  size='1.5' align='center' >Info sur le spawn<t/>"; //--- ToDo: Localize;
					x = 0.00656249 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.23625 * safezoneW;
					h = 0.154 * safezoneH;
				};
			};
		};		 
	};

	class controls
	{
		
		class DA3F_ListSpawn: DA3F_RscListBox
		{
			idc = 1500;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.21 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.9};
			OnLbSelChanged = "_this call DA3F_fnc_SelectSpawnMap;";
		};

		class ListPlayer: DA3F_RscListBox
		{
			idc = 1501;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.28 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.9};
			OnLbSelChanged = "_this call DA3F_fnc_SelectSpawnMap;";
		};

		class DA3F_Btn_Spawn: DA3F_Btn
		{
			idc = 2400;
			text = "Spawn"; //--- ToDo: Localize;
			x = 0.565625 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.028 * safezoneH;
			OnButtonClick = "_this spawn DA3F_fnc_SpawnConfirme";
		};

		class DA3F_Btn_Grp: DA3F_Btn
		{
			idc = 2402;
			text = "Spawn"; //--- ToDo: Localize;
			x = 0.565625 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.028 * safezoneH;
			OnButtonClick = "_this spawn DA3F_fnc_SpawnConfirme";
		};
		
		class DA3F_btn_BackLobby: DA3F_Btn_Close
		{
			idc = 2401;
			text = "Retour lobby"; //--- ToDo: Localize;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,0.4,0.1,0.9};
			OnButtonClick = "_this call DA3F_fnc_BackLobby";
		};
	};
};