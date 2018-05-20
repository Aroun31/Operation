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
    *           fn_handleDamageIA.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

    if (DA3F_IsAction) exitWith {};

    private _DA3F_Exit = false;

    hintSilent str [_damage,_selection,_projectile,_hitIndex,_instigator,_hitPoint];

    if (_unit getVariable ["DA3F_isComa",false]) exitWith {
            _damage = 1;
            _unit setDamage _damage;
            _unit setVariable ["DA3F_isComa",false,true];
        systemChat "Cible exécuté";
            _damage
    };

    if (_damage >= 1) exitWith {
    //    _unit setUnconscious true;
        _unit setVariable ["DA3F_isComa",true,true];
        systemChat "Unconscious actif";
        DA3F_IsAction = true;
       // _damage = 0.8;

            [Roger,"Soumettre",{
            private _DA3F_Unit = (_this select 0);
            private _DA3F_Caller = (_this select 1);
            systemChat str [_DA3F_Unit,_DA3F_Caller];

                removeAllWeapons _DA3F_Unit;
                _DA3F_Unit setCaptive true;
                _DA3F_Unit joinAsSilent [(group _DA3F_Caller),(count units(group _DA3F_Caller))+1];
                hintSilent format ["Vous venez de capturer :\n %1\nGardez un oeil dessus, on ne sait jamais...", name _DA3F_Unit];
            },"","damage _this < 0.9"] remoteExecCall ["DA3F_fnc_Addaction",0];

           _this spawn {
            params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

               sleep 0.5;
               DA3F_IsAction = false;

                (getAllHitPointsDamage _unit)params[
                    ["_DA3F_HitPart", [], [[]]],
                    ["_DA3F_memory", [], [[]]],
                    ["_DA3F_Values", [], [[]]]
                ];


                {
                    private _DA3F_Dmg = _DA3F_Values select _foreachindex;
                    if (_x isEqualTo _hitPoint) then [{
                                    [_unit, _x, _damage] call BIS_fnc_setHitPointDamage;
                                },{
                                [_unit, _x, _DA3F_Dmg] call BIS_fnc_setHitPointDamage;
                            }];
                } forEach _DA3F_HitPart;

               private _DA3F_Wait = time + (15 + random 5);
                   waitUntil {
                   sleep 0.001;
                    time >= _DA3F_Wait
                };

            if !(_unit getVariable ["DA3F_isComa",false]) exitWith {};

            systemChat "Unconscious inactif";

            _unit setVariable ["DA3F_isComa",false,true];
            _unit setUnconscious false;


            removeAllActions _unit;
       };
       _damage
    };

