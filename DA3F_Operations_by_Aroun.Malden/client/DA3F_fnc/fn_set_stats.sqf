#include "..\..\DA3F_macros.hpp"
    /*
    *
    *       Project :
    *               Projet Alice
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur | inspired of script tonic's
    *
    *       File :
    *           fn_set_stats.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
    */

DA3F_fnc_Vap = {
    if (isNil "DA3F_DecompteInVap") then {
        DA3F_DecompteInVap = DA3F_Cnt_Effect;
    };
    if (DA3F_DecompteInVap isEqualTo 0) exitWith {
        DA3F_DecompteInVap = DA3F_Cnt_Effect;
    };
};

private _DA3F_faim =  {
    if (DA3F_Faim < 2) then {
            player forceWalk true;
            [1,format["Tu es affamé tu ne peux plus courir.",nil]]call DA3F_fnc_hint;
            []spawn {
            [50] call BIS_fnc_bloodEffect;
                sleep (30 + random 30);
                [50] call BIS_fnc_bloodEffect;
                player forceWalk false;
            };
    }
    else
    {
    private _DA3F_ValRand = selectRandom([5,10,15]);
     if ((speed player)> 12 && !((vehicle player) isEqualTo player)) then [{
        DA3F_Faim = DA3F_Faim - (5 + _DA3F_ValRand);
     },{
        DA3F_Faim = DA3F_Faim - 5;
 }];
        [] call DA3F_fnc_hud_Update;
        if (DA3F_Faim < 2) then {
            player forceWalk true;
            [1,format["Tu es affamé tu ne peux plus courir.",nil]]call DA3F_fnc_hint;
            []spawn {
                [50] call BIS_fnc_bloodEffect;
                sleep (30 + random 30);
                [50] call BIS_fnc_bloodEffect;
                player forceWalk false;
            };
        };
        switch (DA3F_Faim) do {
            case 30: {[1,format["La faim se fait sentir.",nil]]call DA3F_fnc_hint;};
            case 20: {
            [5] call BIS_fnc_bloodEffect;
            [1,format["Le ventre commence à réclamer",nil]]call DA3F_fnc_hint;
        };
            case 10: {
            [10] call BIS_fnc_bloodEffect;
            [1,format["Ton ventre cri famine, pense à manger quelque chose.",nil]]call DA3F_fnc_hint;
                if !(DA3F_Cfg(getNumber,"DA3F_FatigueActive") isEqualTo 1) then {
                    player setFatigue 1;
                    [1,format["Tu te fatigue, pense à manger quelque chose.",nil]]call DA3F_fnc_hint;
                };
            };
        };
    };
};

private _DA3F_soif = {
    if (DA3F_Soif < 2) then {
        [25] call BIS_fnc_bloodEffect;
        player forceWalk true;
        [1,format["Tu es déshydraté tu ne peux plus courir.",nil]]call DA3F_fnc_hint;
    }
    else
    {
    private _DA3F_ValRand = selectRandom([5,10,15]);
     if ((speed player)> 12 && !((vehicle player) isEqualTo player)) then [{
        DA3F_Soif = DA3F_Soif - (5 + _DA3F_ValRand);
     },{
        DA3F_Soif = DA3F_Soif - 5;
 }];

        [] call DA3F_fnc_hud_Update;
        if (DA3F_Soif < 2) then {
            [25] call BIS_fnc_bloodEffect;
            player forceWalk true;
            [1,format["Tu es déshydraté tu ne peux plus courir.",nil]]call DA3F_fnc_hint;
            []spawn {
                sleep (30 + random 30);
                player forceWalk false;
            };
        };
        switch (DA3F_Soif) do  {
            case 30: {[1,format["Tu te déshydrate, pense à boire quelque chose.",nil]]call DA3F_fnc_hint;};
            case 20: {
            [5] call BIS_fnc_bloodEffect;
                [1,format["Tu te déshydrate, pense à boire quelque chose.",nil]]call DA3F_fnc_hint;
                if !(DA3F_Cfg(getNumber,"DA3F_FatigueActive") isEqualTo 1) then {
                    player setFatigue 1;
                    [1,format["Tu te déshydrate et te fatigue, pense à boire quelque chose.",nil]]call DA3F_fnc_hint;
                };
            };
            case 10: {
            [10] call BIS_fnc_bloodEffect;
                [1,format["Tu te déshydrate, pense à boire quelque chose.",nil]]call DA3F_fnc_hint;
                if !(DA3F_Cfg(getNumber,"DA3F_FatigueActive") isEqualTo 1) then {
                    player setFatigue 1;
                    [1,format["Tu te déshydrate et te fatigue, pense à boire quelque chose.",nil]]call DA3F_fnc_hint;
                };
            };
        };
    };
};

/*
    private _DA3F_Check_Walk = isForcedWalk player;

        if !(_DA3F_Check_Walk  && DA3F_isInfected) then {
            player forceWalk true;
        };
*/
//Setup the time-based variables.
private _foodTime   = time;
private _waterTime  = time;
private _walkDis    = 0;
private _bp         = "";
private _lastPos    = visiblePosition player;
private _lastPos    = (_lastPos select 0) + (_lastPos select 1);
private _lastState  = vehicle player;

for "_i" from 0 to 1 step 0 do {
    /* Thirst / Hunger adjustment that is time based */

    if ((time - _waterTime) > 600) then {[] call _DA3F_soif; _waterTime = time;};
    if ((time - _foodTime) > 850) then {[] call _DA3F_faim; _foodTime = time;};
/*
    // Check if the player's state changed?
    if (!(vehicle player isEqualTo _lastState) || {!alive player}) then {
        [] call life_fnc_updateViewDistance;
        _lastState = vehicle player;
    };
*/
    if (!alive player) then {_walkDis = 0;} else {
        private _curPos = visiblePosition player;
        _curPos = (_curPos select 0) + (_curPos select 1);
        if (!(_curPos isEqualTo _lastPos) && {(isNull objectParent player)}) then {
            _walkDis = _walkDis + 1;
            if (_walkDis isEqualTo 650) then {
                _walkDis = 0;
                DA3F_Soif = DA3F_Soif - 5;
                DA3F_Faim = DA3F_Faim - 5;
                    private _DA3F_dmg = damage player;
                    if (DA3F_Soif > 85 && DA3F_Faim > 85) then {
                        player setDamage (_DA3F_dmg - 0.2);
                    };
                [] call DA3F_fnc_hud_Update;
            };
        };
        _lastPos = visiblePosition player;
        _lastPos = (_lastPos select 0) + (_lastPos select 1);
    };
    uiSleep 1;
};
