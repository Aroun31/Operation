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
    *           mission_1.sqf
    *
    *       DESCRIPTION :
    *               Vip
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

private _DA3F_PosStart = call DA3F_fnc_Pos_Mission_Start;
scriptName "mission 1";
_DA3F_Unit_Bot = [_DA3F_PosStart,side player,0.7,"MAJOR"]spawn DA3F_fnc_Create_Unit;
diag_log str ["Unité créé pour : ",_DA3F_Unit_Bot];

	hint parseText format ["<t align='center' color='#00FF00' >VIP Mission</t><br/><br/><t align='center' color='#00FF00' >Allez cherchez le VIP et escortez le à son point de rendez-vous pour la réunion des chefs d'état.</t>", nil];
	waitUntil
	{
		scriptDone _DA3F_Unit_Bot
	};

	DA3F_Bob setCaptive true;
	private _DA3F_CountUnit = 0;
	private _DA3F_UnitProxy = objNull;
	private _arrPlayer 		= [];
		[position DA3F_Bob,"VIP","hd_dot","ColorYellow",side player,"true"] call DA3F_fnc_Create_Marker;
		[getPosASLW DA3F_Bob,0,(5 + (ceil random 3)),250,110]spawn DA3F_fnc_Spawn_hostile;
		waitUntil
		{
		sleep 0.01;
//		_arrPlayer = [];
			_DA3F_CountUnit = {if(isPlayer _x && {((_x distance DA3F_Bob)< 5)})then{_arrPlayer pushBack _x}; isPlayer _x && {((_x distance DA3F_Bob)< 400)}} count allUnits;
			_DA3F_CountUnit > 0
		};

		_DA3F_UnitProxy = _arrPlayer select 0;
		private _DA3F_Wait = [getPos DA3F_Bob,0,(5 + (ceil random 3)),150,110]spawn DA3F_fnc_Spawn_hostile;
		waitUntil {sleep 0.01;scriptDone _DA3F_Wait};
		_arrPlayer = [];
		waitUntil
		{
		sleep 0.01;
//		_arrPlayer = [];
			_DA3F_CountUnit = {if(isPlayer _x && {((_x distance DA3F_Bob)< 5)})then{_arrPlayer pushBack _x}; isPlayer _x && {((_x distance DA3F_Bob)< 5)}} count allUnits;
			_DA3F_CountUnit > 0
		};

		_DA3F_UnitProxy = _arrPlayer select 0;

		private _DA3F_Pos_End_Or_Desti = []call DA3F_fnc_Pos_Mission_End;

			DA3F_Bob setName ["Bob FreeStyler","Bob","Bob FreeStyler"];
			DA3F_Bob joinAs [(group _DA3F_UnitProxy), (count(units(group _DA3F_UnitProxy)))+1];
			DA3F_Bob enableAI "Move";
			DA3F_Bob setCaptive false;
			[format ["%1 à rejoind le groupe\nGardez le en vie jusqu'à destination !", name DA3F_Bob]] remoteExecCall ["hint",0];

			[_DA3F_Pos_End_Or_Desti,"Zone destination","hd_dot","ColorRed",side player,"true"] call DA3F_fnc_Create_Marker;

				waitUntil
				{
					sleep 0.01;
					!(alive DA3F_Bob) || (DA3F_Bob distance _DA3F_Pos_End_Or_Desti)< 10
				};

				if !(alive DA3F_Bob) exitWith {
					[format ["Le Vip %1\nest mort !\nLa mission est un échec", name DA3F_Bob]] remoteExecCall ["hint",0];
				};

				{
					deleteMarker _x;
				} forEach DA3F_Stock_Mrk_Mission;

			hint format ["%1 à quitté le groupe", name DA3F_Bob];

				private _DA3F_Wait = [getPosASLW DA3F_Bob,0,(5 + (ceil random 3)),250,70]spawn DA3F_fnc_Spawn_hostile;
				waitUntil {sleep 0.01;scriptDone _DA3F_Wait};
 				[DA3F_Bob] joinSilent (grpNull);
 				sleep 2;
 				DA3F_Bob playMoveNow "AmovPercMstpSnonWnonDnon_SaluteIn";
 				sleep 4;
 				DA3F_Bob switchMove "AmovPercMstpSnonWnonDnon_SaluteOut";
 				(position DA3F_Bob) params["_DA3F_AxeX","_DA3F_AxeY","_DA3F_AxeZ"];
 				private _DA3F_Winners = [];
 					{
 						if (isPlayer _x) then {
 							if (_x distance DA3F_Bob <= 50) then {
 								_DA3F_Winners pushBack _x;
 							};
 						};
	 				}count allUnits;

 				["Mission succès",250] remoteExec ["DA3F_fnc_add_Xp",_DA3F_Winners];

 				private _DA3F_PosBye = [(_DA3F_AxeX) + (100 + random 300),(_DA3F_AxeY) + (100 + random 300),_DA3F_AxeZ];
 				DA3F_Bob doMove _DA3F_PosBye;
 				waitUntil {
 				sleep 0.01;
 				(DA3F_Bob distance _DA3F_PosBye) <= 10
 			};
 			DA3F_Bob setDamage 1;
 			sleep (60*2);
 			deleteVehicle DA3F_Bob;
 			DA3F_Bob = nil;