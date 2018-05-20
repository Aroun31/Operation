#include "..\..\DA3F_OP_macros.hpp"
	/*
    *
    *       Project :
    *               Projet Alice
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_atm.sqf
    *
    *       DESCRIPTION :
    *              Script fait vite fait il est temps de dormir ! au moins y'a un ATM ^^
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	disableSerialization;
	if !(createDialog "DA3F_GUI_Atm") exitWith {};

		private _DA3F_Ctrl_txtInfo	= My_Ctrl(180518,1101);
		private _DA3F_Ctrl_Edit		= My_Ctrl(180518,1400);
		private _DA3F_Ctrl_Retrait	= My_Ctrl(180518,2400);
		private _DA3F_Ctrl_Depot	= My_Ctrl(180518,2401);
		private _DA3F_Confirm 		= false;

		DA3F_Atm_Update				= {
			_DA3F_Ctrl_txtInfo = My_Ctrl(180518,1101);
			_DA3F_Ctrl_txtInfo ctrlSetStructuredText parseText format ["<t color='#00F0F0' align='left' size='1.1'>Cash :<t/><t color='#00FF00' align='right' size='1.1'>%1µ<t/><br/><t color='#00F0F0' align='left' size='1.1'>Bank :<t/><t color='#00FF00' align='right' size='1.1'>%2µ<t/>", DA3F_Cash,DA3F_Bank];

			_pos 	= ctrlPosition _DA3F_Ctrl_txtInfo;
			_axeH 	= ctrlTextHeight _DA3F_Ctrl_txtInfo;

			_DA3F_Ctrl_txtInfo ctrlSetPosition [_pos param[0,[0,0]],_pos param[1,[0,0]],_pos param[2,[0,0]],_axeH];
			_DA3F_Ctrl_txtInfo ctrlCommit 0;

		};
		call DA3F_Atm_Update;
		// Casse les couilles de faire un fichier par fnc pour ça donc voilà !
	if !(isNil "DA3F_fnc_Retrait") then {
			DA3F_fnc_Retrait={
			#include "..\..\DA3F_OP_macros.hpp"
				if ((ctrltext (My_Ctrl(180518,1400)))isEqualTo "") exitWith {
					hint "Indique une somme d'argent";
				};
					_value = DA3F_Compil(ctrltext (My_Ctrl(180518,1400)));

						if (_value > 999999) exitWith {
							hint format["Tu ne peux pas déposer plus de 999.999µ à la fois",_value];
						};

						if (_value > DA3F_Bank) exitWith {
							hint format["Tu ne dispose pas de :\n%1µ\nArgent disponible :\n%2µ",_value];
						};

						if (_value isEqualTo DA3F_Bank) exitWith {
							private _DA3F_Confirm = ["<t color='#00F0F0' align='center' size='1.1' >Tu es sur le point de retirer la totalité de ton compte.<br/>Es-tu sure de vouloir faire cette action ?<t/>","Confirmation"]call bis_fnc_GUImessage;
							if (isNil "_DA3F_Confirm") exitWith {};
								if (isNull _DA3F_Confirm) exitWith {};
									DA3F_Cash = DA3F_Cash + _value;
									DA3F_Bank = DA3F_Bank - _value;
						};

					DA3F_Cash = DA3F_Cash + _value;
					DA3F_Bank = DA3F_Bank - _value;
					call DA3F_Atm_Update;
					sleep 0.05;
					hint format ["Retrait de :\n %1µ", _value];
			};
		};

	if !(isNil "DA3F_fnc_Retrait") then {
			DA3F_fnc_Depot={
			#include "..\..\DA3F_OP_macros.hpp"
				if ((ctrltext (My_Ctrl(180518,1400)))isEqualTo "") exitWith {
					hint "Indique une somme d'argent";
				};
					_value = DA3F_Compil(ctrltext (My_Ctrl(180518,1400)));

						if (_value > DA3F_Cash) exitWith {
							hint "Tu ne dispose pas de cette somme";
						};

							if (_value > 999999) exitWith {
								hint format["Tu ne peux pas déposer plus de 999.999µ à la fois",_value];
							};

							DA3F_Cash = DA3F_Cash - _value;
							DA3F_Bank = DA3F_Bank + _value;
							call DA3F_Atm_Update;
							sleep 0.05;
							hint format ["Dépot de :\n %1µ", _value];
			};
		};

			//_DA3F_Ctrl_Retrait buttonSetAction "";
			//_DA3F_Ctrl_Depot buttonSetAction "";