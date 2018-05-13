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
    *           fn_init_SpawnMenu.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/


	if !(createDialog "DA3F_GUI_Spawn") exitWith {};
		"" cutText ["","BLACK FADED"];
		private _DA3F_Display 	= (findDisplay 1090518);
		private _DA3F_Map 		= My_Ctrl(1090518,31400);
		private _DA3F_ListMrk 	= My_Ctrl(1090518,1500);
		private _DA3F_ListUnit 	= My_Ctrl(1090518,1501);
		private _DA3F_SpawnMrk 	= My_Ctrl(1090518,2400);
		private _DA3F_SpawnUnit	= My_Ctrl(1090518,2401);
		private _DA3F_BackLobby	= My_Ctrl(1090518,2402);

		private _DA3F_ArrSpawn = DA3F_CfgSpawn(getArray,"DA3F_List_Spawn");
 		//systemChat str [_DA3F_ArrSpawn];
		{
			_x params[
			    ["_DA3F_Name_Marker","",[""]],
				["_DA3F_Title","",[""]],
				["_DA3F_Description","",[""]]
			];
			private _DA3F_Index = _DA3F_ListMrk lbAdd format ["%1",_DA3F_Title];
			_DA3F_ListMrk lbSetData [_DA3F_Index,str(_x)];
		} forEach _DA3F_ArrSpawn;

		{
			private _DA3F_Unit = _x;
			if !(isNull _DA3F_Unit) then {
				if (alive _DA3F_Unit) then {
					if ((_DA3F_Unit distance getMarkerPos "respawn_guerrila") > 300) then {
						private _DA3F_Name = name _DA3F_Unit;
						private _DA3F_Index = _DA3F_ListUnit lbAdd _DA3F_Name;
						_DA3F_ListUnit lbSetData [_DA3F_Index,str(_DA3F_Unit)];
					};
				};
			};
		} forEach ((units DA3F_Grp_Player)-[player]);

		[_DA3F_Display]spawn{
		disableSerialization;
		if (isNil "DA3F_LoopActiv") then {
			DA3F_LoopActiv = false;
		};
		if (DA3F_LoopActiv) exitWith {};
			DA3F_LoopActiv = true;
			_DA3F_AttachMrk	= [];
				{
				private _DA3F_MrkPosUnit = createMarkerLocal [format ["DA3F_Unit_%1", _x],getPos _x];
				_DA3F_MrkPosUnit setMarkerShapeLocal "ICON";
				_DA3F_MrkPosUnit setMarkerTypeLocal "hd_dot";
				_DA3F_MrkPosUnit setMarkerColorLocal "ColorGreen";
				_DA3F_MrkPosUnit setMarkerTextLocal format ["%1", name _x];
				_DA3F_AttachMrk pushBack [_x,_DA3F_MrkPosUnit];
				} forEach ((units DA3F_Grp_Player)-[player]);

			while {!(isNull (_this select 0))} do {
				{
					"" cutText ["","BLACK FADED"];
					_x params[
					    ["_DA3F_Unit",objNull,[objNull]],
						["_DA3F_Mrk","",[""]]
					];

					private _DA3F_PosUnit 	= getPos _DA3F_Unit;
					if (alive _DA3F_Unit) then [{
						_DA3F_Mrk setMarkerAlphaLocal 1
					},{
						_DA3F_Mrk setMarkerAlphaLocal 0
					}];

					_DA3F_Mrk setMarkerPos _DA3F_PosUnit;
				}forEach _DA3F_AttachMrk;
				sleep 0.001;
			};
	};


