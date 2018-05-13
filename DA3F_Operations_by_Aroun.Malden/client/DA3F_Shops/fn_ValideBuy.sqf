#include "..\..\DA3F_OP_macros.hpp"
	/*
    *
    *       Project :
    *               °Opération°
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_ValideBuy.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               [] call DA3F_fnc_ValideBuy;
    *
	*/

	    private _DA3F_Class_objet           = "Box_NATO_Ammo_F";
	    private _DA3F_ListBox 				= nearestObjects [DA3F_ShopPnj,["Box_NATO_Ammo_F"],10];
	    private _DA3F_objet					= objNull;
	    private _DA3F_Exit					= false;

			if (DA3F_TotalMyPanier > DA3F_Cash) exitWith {
				hint localize "DA3F_NotCash";
			};

		private _DA3F_ClearBox = {
			params[["_DA3F_Veh",objNull,[objNull]]];
				if (isNull _DA3F_Veh) exitWith {};
				    clearBackpackCargoGlobal _DA3F_Veh;
			        clearMagazineCargoGlobal _DA3F_Veh;
			        clearItemCargoGlobal _DA3F_Veh;
			        clearWeaponCargoGlobal _DA3F_Veh;
			};

			private _DA3F_CreateBox = {
				private _DA3F_objet		= _DA3F_Class_objet createVehicle [0,0,500];
		    	_DA3F_objet attachTo [DA3F_ShopPnj,[0.8,0.2,0.1]];
		    	detach _DA3F_objet;
		    	_DA3F_objet
			};

	    if (count _DA3F_ListBox isEqualTo 0) then [{
			_DA3F_objet		= call _DA3F_CreateBox;
			[_DA3F_objet]call DA3F_fnc_ClearObj;
	    },{
    	    if ((typeOf (_DA3F_ListBox select 0)) isEqualTo _DA3F_Class_objet) then [{
				_DA3F_objet		= _DA3F_ListBox select 0;
    		},{
				_DA3F_objet		= call _DA3F_CreateBox;
				[_DA3F_objet]call DA3F_fnc_ClearObj;
    	}];
	}];

	_DA3F_objet allowDamage false;

		_DA3F_objet addEventHandler ["ContainerClosed", {
			params ["_container", "_unit"];
			private _DA3F_val = 0;
			_container allowDamage true;
				if (DA3F_Active_debug) then {
					hintSilent str [(count ((getItemCargo _container) select 0)),_unit,(getItemCargo _container)];
				};
					_DA3F_val = _DA3F_val + (count ((getItemCargo _container) select 0));
					_DA3F_val = _DA3F_val + (count ((getMagazineCargo _container) select 0));
					_DA3F_val = _DA3F_val + (count ((getWeaponCargo _container) select 0));
			if (_DA3F_val isEqualTo 0) then {
				deleteVehicle _container;
			};
		}];

		DA3F_My_Panier params[
		    ["_DA3F_ListItems",[],[[]]],
			["_DA3F_ListQuantit",[],[[]]]
		];

	{
		_DA3F_ClassName = _x;
		_DA3F_Class 	= Cfg_Veh_A3(getText,_DA3F_ClassName,"vehicleClass");
		_DA3F_Nrb		= _DA3F_ListQuantit select _foreachindex;

		DA3F_Cash = DA3F_Cash - DA3F_TotalMyPanier;
		//[true,false] call DA3F_fnc_SaveStats;
		if (_DA3F_Class in ["Car","Air","Ship","Support","Tank"]) then {
			private _DA3F_Pos 		= [];
	        private _DA3F_MrkSp     = Cfg_ShopWeapons(getText,"CfgShops_PNJ",DA3F_TypeShop,"markerSp");
			if (count([getMarkerPos _DA3F_MrkSp,["Car","Air"],10]call DA3F_fnc_NearAllVeh)>0) then [{
				_VehGen =( [getMarkerPos _DA3F_MrkSp,["Car","Air"],10]call DA3F_fnc_NearAllVeh) select 0;
				_DA3F_Pos = _VehGen modelToWorld [5,0,0.1];
				//[1,format["Un connard occupe le lieu de livraison !",nil]]call DA3F_fnc_hint;
			},{
			_DA3F_Pos = getMarkerPos _DA3F_MrkSp
		}];
			// this is server version
			player setVariable ["DA3F_Mrk_SpawnVeh",_DA3F_MrkSp,true];
			[player,_DA3F_ClassName,getMarkerPos _DA3F_MrkSp,_DA3F_PriceSell,"µ",true,[]] remoteExec ["DA3F_fnc_Create_Veh",2];

			//next Only work version !
			/*
			private _DA3F_Veh = objNull;
			_DA3F_Veh = _DA3F_ClassName createVehicle [0,0,500];
			_DA3F_Veh allowDamage false;
			_DA3F_Veh setPos _DA3F_Pos;
			*/
			/*
			_DA3F_Veh setdir markerDir _DA3F_MrkSp;
			_DA3F_Veh allowDamage true;
			*/
			_DA3F_Exit = true;
		};

			if !(_DA3F_Exit) then {
				if (_DA3F_Class in ["Backpacks"]) then [{
						_DA3F_objet addBackpackCargoGlobal [_DA3F_ClassName, _DA3F_Nrb];
					},{
			        	_DA3F_objet addItemCargo [_DA3F_ClassName, _DA3F_Nrb];
				}];
			};

	} forEach _DA3F_ListItems;
	DA3F_TotalMyPanier = 0;
closeDialog 0;