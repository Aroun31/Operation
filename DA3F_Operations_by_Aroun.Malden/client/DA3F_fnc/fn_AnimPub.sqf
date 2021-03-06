	/*
    *
    *       Project :
    *              °Opération°
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_AnimPub.sqf
    *
    *       DESCRIPTION :
    *               nouvelle version côté serveur
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *			// A mettre dans l'init des pannaux que vous souhaitez animer (Déclarer en functions.hpp et changez le Tag )
    *               	this spawn Tag_fnc_AnimPub;
    *
	*/

/**********************************************************************/
/*****************************EDITABLE*********************************/
/**********************************************************************/
if !(isServer) exitWith {};
private _DA3F_CountDown 	= 5; 	// Temps entre chaque load d'images en secondes
private _DA3F_RandomTime 	= 3;	//  Temps aléatoire en plus du temps définit... mettre -1 pour avoir une valeur fixe
private _DA3F_Distance 		= 5; 	//Distance à la quel le joueur verra les images switcher au dessus de cette distance l'image sera fixe
private _DA3F_PixDefault	= "\A3\ui_f\data\Logos\arma3_expansion_ca.paa"; // Logo A3 | image par défaut sur les pannaux

/*
	Chemin des textures,
	simple mission : "MonDossierImageDeLaMission\MonSousDossier\MonImage.paa ( or .jpg)" // .png no support in Arma3
	si mod "\NomDuPbo\DossierImages\Image.paa"
*/

	private _DA3F_RandomPix 	={
	selectRandom[
			"\A3\ui_f\data\GUI\Cfg\Debriefing\endDefault_ca.paa",
			"\A3\ui_f\data\GUI\Cfg\Hints\Disarm_ca.paa",
			"\A3\ui_f\data\GUI\Cfg\Hints\TGuide\air02_ca.paa",
			"\A3\ui_f\data\GUI\Cfg\LoadingScreens\GC_wallpaper_18_co.paa"					// Pour les No-vices pas de virgule sur la dernière ligne ;)
		];
	};

	/***********************************************************************/
	/*****************************NON EDITABLE******************************/
	/**********************************************************************/

	private _DA3F_Time 			= 0;
	private _DA3F_ArrPlayer 	= [];
	private _DA3F_ArrayUnit 	= [];
	private _DA3F_Check 		= false;

		if !(_DA3F_RandomTime isEqualTo -1) then [{
			_DA3F_Time = _DA3F_CountDown + ceil (random _DA3F_RandomTime);
		},{
			_DA3F_Time = _DA3F_CountDown;
		}];

			_this allowDamage false;
			_this enableSimulation false;

			_this setObjectTextureGlobal [0,_DA3F_PixDefault];
			_DA3F_ArrayUnit 	= nearestObjects [_this,["Man"],_DA3F_Distance];
			_DA3F_Player 		= objNull;
			_DA3F_Distance_Loop = _DA3F_Distance + 5;

				while {true} do
				{
					_DA3F_Check = false;
					waitUntil {
						uiSleep 1;
						_DA3F_ArrayUnit = nearestObjects [_this,["Man"],_DA3F_Distance];
						_DA3F_ArrPlayer = [];
								if !(str _DA3F_ArrayUnit isEqualTo "[]") then {
									{
										if (isPlayer _x) then {
											_DA3F_ArrPlayer pushBack _x,
										};
									} forEach _DA3F_ArrayUnit;
								};

							if !(str _DA3F_ArrPlayer isEqualTo "[]") then {
								_DA3F_Check = true;
						};
						_DA3F_Check
					};

					_DA3F_PathPix = call _DA3F_RandomPix;
						_this setObjectTextureGlobal [0,_DA3F_PathPix];
						uiSleep _DA3F_Time;
				};