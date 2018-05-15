#include "..\..\DA3F_FnCustom.hpp"
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
    *           DA3F_fnc_Spawn_hostile.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               [position,_DA3F_unit,_NrbWpoint,_radius,_distance,"VarGrp"]call DA3F_fnc_Spawn_hostile;
    *
	*/
/*
	DA3F_Test={

		player setPosASL _DA3F_Pos;
		systemChat str _DA3F_Pos;
		player allowDamage false;
		player setCaptive true;
		sleep 15;
	};
*/

		/*



			"West"
			"East"
			"Indep"

			"Armored"
			"Infantry"
			"Mechanized"
			"Motorized_MTP"
			"SpecOps"
			"Support"
			"UInfantry"
		*/


		private _DA3F_MaxUnits			= DA3F_CfgMission(getNumber,"DA3F_MaxUnits");
		if ((east countSide allUnits) >= _DA3F_MaxUnits) exitWith {};
/*		private _DA3F_Player			= (_this select 1);
		private _DA3F_PointsPassage 	= (3 + round(random 5));
		private _DA3F_StartPos			= (_this select 0);
		private _DA3F_Radius			= (150 + random 350);
		private _DA3F_distance			= 120;
*/
		private _DA3F_Pos 				= [];
		private _DA3F_Look_Mrk 			= true;
		private _DA3F_AllClass 			= [];

			_this params[
			    ["_DA3F_StartPos",[],[[],objNull]],
				["_DA3F_Player",objNull,[0,objNull]],
				["_DA3F_PointsPassage",3,[0]],
				["_DA3F_Radius",(50 + random 150),[0]],
				["_DA3F_distance",80,[0]]
			];

			waitUntil {
			sleep 1;
				_DA3F_Pos = selectRandom([
								[(_DA3F_StartPos select 0) + _DA3F_Radius,(_DA3F_StartPos select 1) + _DA3F_Radius,(_DA3F_StartPos select 2)],
								[(_DA3F_StartPos select 0) - _DA3F_Radius,(_DA3F_StartPos select 1) - _DA3F_Radius,(_DA3F_StartPos select 2)],
								[(_DA3F_StartPos select 0) - _DA3F_Radius,(_DA3F_StartPos select 1) + _DA3F_Radius,(_DA3F_StartPos select 2)],
								[(_DA3F_StartPos select 0) + _DA3F_Radius,(_DA3F_StartPos select 1) - _DA3F_Radius,(_DA3F_StartPos select 2)]
							]);
				!(surfaceIsWater _DA3F_Pos)
			};

				private _DA3F_TypeGrp = selectRandom([
					"Infantry",
					"Mechanized",
					/*"Motorized_MTP",*/
					"Support",
					"UInfantry"
				]);

		//call DA3F_Test;

		private _DA3F_GrpSpawn 	= call SelectGrp("East",_DA3F_TypeGrp);
		//missionNamespace setVariable [format ["_DA3F_GrpCreate_%1", _DA3F_VarGrp],[_DA3F_Pos, east, _DA3F_GrpSpawn] call BIS_fnc_spawnGroup];
		_DA3F_GrpCreate 		= [_DA3F_Pos, east, _DA3F_GrpSpawn] call BIS_fnc_spawnGroup;
		private _DA3F_prime 	= 250;
		private _DA3F_Unit 		= objNull;

			{
				DA3F_Stock_Obj_Mission pushBack _x;
				_DA3F_Unit = _x;
				_DA3F_Unit setVariable ["DA3F_BotRandom",true,true];
				_DA3F_Unit setVariable ["DA3F_PrimeKill",[round(random _DA3F_prime),"µ"],true];
   	 			_DA3F_Unit addMPEventHandler ["mpkilled",{_this call DA3F_fnc_EventHandlerKill}];
				_DA3F_Unit setSkill 0.4;
				DA3F_TimeSwitch = time;
				DA3F_CombatModeActif = false;
				_DA3F_Unit addEventHandler ["FiredNear", {_this call DA3F_fnc_SwitchModeCombat;}];
			sleep 0.1;
			} forEach (units (_DA3F_GrpCreate));

		private _DA3F_pos 		= [];
		private _DA3F_houses 	= [];
		private _DA3F_PosInBati = [];

				for "_b" from 0 to (_DA3F_PointsPassage-1) do {
	        		_DA3F_pos 	=  selectRandom[
				        			[
				        			(getpos _DA3F_unit select 0) - _DA3F_distance*sin(random 359),
				        			(getPos _DA3F_unit select 1) - _DA3F_distance*cos(random 359)
				        			],
				        			[
				        			(getpos _DA3F_unit select 0) + _DA3F_distance*sin(random 359),
				        			(getPos _DA3F_unit select 1) + _DA3F_distance*cos(random 359)
				        			],
				        			[
				        			(getpos _DA3F_unit select 0) + _DA3F_distance*sin(random 359),
				        			(getPos _DA3F_unit select 1) - _DA3F_distance*cos(random 359)
				        			],
				        			[
				        			(getpos _DA3F_unit select 0) - _DA3F_distance*sin(random 359),
				        			(getPos _DA3F_unit select 1) + _DA3F_distance*cos(random 359)
				        			]
	        					];

					_DA3F_houses = (nearestObjects [_DA3F_pos,["house"],100]);
	        		private _DA3F_wp = _DA3F_GrpCreate addWaypoint [_DA3F_pos,(5 + random 20),_b];

	        		_DA3F_GrpCreate setVariable ["DA3F_GetWP",_DA3F_wp];

							if !(str _DA3F_houses isEqualTo "[]") then {
								_DA3F_house 	= selectRandom(_DA3F_houses);
								_DA3F_PosInBati = call GetPosNumBuilding(_DA3F_house);
								_DA3F_wp setWaypointHousePosition selectRandom(_DA3F_PosInBati);
					        	_DA3F_wp setWaypointPosition [getPos _DA3F_house, 5];
							};

			        	_DA3F_wp setWaypointType selectRandom(["MOVE","TALK"]); //,"SENTRY","HOLD"
			        	_DA3F_wp setWaypointSpeed selectRandom(["NORMAL","LIMITED"]);// ,"NORMAL","FULL"
			        	_DA3F_wp setWaypointBehaviour selectRandom(["UNCHANGED","CARELESS","SAFE","AWARE"]);//,"COMBAT","STEALTH"
	        			_DA3F_wp setWaypointTimeout selectRandom([[5,10,20],[30,40,60]]); // ,[45,90,120]

							if (_DA3F_Look_Mrk) then {
								_markerstr = createMarker [format ["PosSp_%1", _DA3F_pos],_DA3F_pos];
								_markerstr setMarkerShape "ICON";
								_markerstr setMarkerType "hd_dot";
								_markerstr setMarkerText format ["spawn : %1", _b];
							};

						if (_b isEqualTo (_DA3F_PointsPassage-1)) then {_DA3F_wp setWaypointType "CYCLE";};
					sleep 0.1;
				};

			//[0,"Restez sur vos gardes l'ennemi n'est jamais loin"] remoteExecCall ["DA3F_fnc_hint",_DA3F_Player];
			["Restez sur vos gardes l'ennemi n'est jamais loin"] remoteExecCall ["systemChat",_DA3F_Player];

			[_DA3F_GrpCreate] spawn {
				private _DA3F_GrpCreate = param[0,[[grpNull],[grpNull]]];
				if (isNull _DA3F_GrpCreate) exitWith {_DA3F_GrpCreate = nil};
					waitUntil {
					sleep 1;
					(count(units _DA3F_GrpCreate) isEqualTo 0)
				};
				if (isNull _DA3F_GrpCreate) exitWith {_DA3F_GrpCreate = nil};
				deleteGroup _DA3F_GrpCreate;
				_DA3F_GrpCreate = nil;
			};