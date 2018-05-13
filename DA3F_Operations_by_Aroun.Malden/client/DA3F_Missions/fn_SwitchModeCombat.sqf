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
    *           fn_SwitchModeCombat.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/


		params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
        if (isNil "DA3F_CombatModeActif") then {
            DA3F_CombatModeActif = false;
        };
			if (DA3F_CombatModeActif) exitWith{ /*systemChat str [_unit,_firer] */};
				DA3F_CombatModeActif = true;
					_unit setBehaviour selectRandom(["COMBAT","STEALTH"]);
					_unit setSpeedMode selectRandom(["NORMAL","FULL"]);

					DA3F_TimeSwitch = (time + (20 + random 120));
						_unit spawn {
							waitUntil {
							sleep 0.5;
							//hintSilent format ["Unités en combat\n\n%1\n\n%2",DA3F_TimeSwitch,time];
								(time >= DA3F_TimeSwitch)
							};
								_this setBehaviour selectRandom(["CARELESS","SAFE"]);
								_this setSpeedMode selectRandom(["LIMITED","NORMAL"]);
								DA3F_CombatModeActif = false;
						};