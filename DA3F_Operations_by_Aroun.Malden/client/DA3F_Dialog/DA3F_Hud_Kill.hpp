class DA3F_Hud_Kill
{
	idd 		= 180515;
	name 		= "DA3F_Hud_Kill";
	Author 		= "@roun";
   	duration 	= 15;
   	fadein 		= 0;
   	fadeout 	= 5;
   	onload		= "uinamespace setvariable [""DA3F_HudKill"",param [0,[[displayNull],[displayNull]]]]";

	class controlsBackground {};

	class controls
	{
        class background : DA3F_BackG
        {
            idc 		= 1000;
            x 			= 0.250625 * safezoneW + safezoneX;
            y 			= -0.00399999 * safezoneH + safezoneY;
            w 			= 0.492187 * safezoneW; 
            h 			= 0.182 * safezoneH;
            colorBackground[] = {0,0.3,0.5,0.75};
        };

        class ProgressBar : DA3F_Progress
        {
            idc 		= 1900;
            colorBar[] 	= {0.9,0.88,0.35,0.85};
            x 			= 0.3425 * safezoneW + safezoneX;
            y 			= 0.04 * safezoneH + safezoneY;
            w 			= 0.308437 * safezoneW; 
            h 			= 0.014 * safezoneH;
            colorBackground[] = {0,0,0.5,0.3};
        };
        class DA3F_Title: DA3F_StructuredText 
         {
            idc         = 1100;
            text        = $STR_DA3F_NameMission;
            shadow      = 1;
            x           = 0.362187 * safezoneW + safezoneX;
            y           = 0.01 * safezoneH + safezoneY;
            w           = 0.269062 * safezoneW; 
            h           = 0.028 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
        class DA3F_Kill_Info: DA3F_StructuredText 
         {
            idc         = 1101;
            text        = "! Kill !";
            shadow      = 1;
            x           = 0.362187 * safezoneW + safezoneX;
            y           = 0.066 * safezoneH + safezoneY;
            w           = 0.269062 * safezoneW; 
            h           = 0.098 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };

        class DA3F_PixOne: DA3F_Pix 
         {
            idc         = 1200;
            text        = "\A3\ui_f\data\Logos\arma3_expansion_ca.paa";
            x           = 0.257187 * safezoneW + safezoneX
            y           = 0.038 * safezoneH + safezoneY;
            w           = 0.07875 * safezoneW; 
            h           = 0.126 * safezoneH;
        };

		class DA3F_PixTwo: DA3F_Pix 
         {
	        idc 		= 1201;
	        text 		= "\A3\ui_f\data\Logos\arma3_expansion_ca.paa";
	        shadow		= 1;
	        x 			= 0.6575 * safezoneW + safezoneX;
	        y 			= 0.038 * safezoneH + safezoneY;
	        w 			= 0.07875 * safezoneW; 
	        h 			= 0.126 * safezoneH;
        };
	};
};