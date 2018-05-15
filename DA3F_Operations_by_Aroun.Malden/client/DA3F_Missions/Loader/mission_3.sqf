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
    *           mission_3.sqf
    *
    *       DESCRIPTION :
    *               Chef rebelle
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

		private _DA3F_Wait = [getPosASLW DA3F_Bob,0,(5 + (ceil random 3)),250,110]spawn DA3F_fnc_Spawn_hostile;

		waitUntil {
				scriptDone _DA3F_Wait
			};

				_DA3F_leader = leader DA3F_GrpCreate;
				_DA3F_leader setSkill 0.75;

				private _DA3F_NameLeader = name _DA3F_leader;
				private _DA3F_Info = format ["Trouvez et tuez le chef rebelle :\n\n %1 \nUn marker indique la zone dans la quel il opère", _DA3F_NameLeader];

				[_DA3F_Info] remoteExecCall ["hint",0];

								_markerstr = createMarker [format ["PosSp_%1", getPos _DA3F_leader],getPos _DA3F_leader];
								_markerstr setMarkerShape "ICON";
								_markerstr setMarkerType "hd_dot";
								_markerstr setMarkerText format ["Chef rebelle", nil];

								[_DA3F_leader,_markerstr]spawn{
									_this params[
									    ["_DA3F_Leader",objNull,[objNull]],
										["_DA3F_mrk","",[""]]
									];

								private _DA3F_NameLeader = name _DA3F_Leader;
									waitUntil {
									sleep 0.1;
									_DA3F_mrk setMarkerPos getpos _DA3F_Leader;
									!(alive _DA3F_Leader)
								};
									[format ["%1\na été abbatu.", _DA3F_NameLeader]] remoteExecCall ["hint",0];
									deleteMarker _DA3F_mrk;
								};