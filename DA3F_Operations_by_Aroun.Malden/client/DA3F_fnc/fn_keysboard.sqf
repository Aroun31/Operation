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
    *           fn_KeyBord.sqf
    *
    *       DESCRIPTION :
    *               Attribution des actions pour les raccourcis clavier
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
  */


  Mcf_One_Touche            = 0;
  private _ctrl             = _this select 0;
  private _key              = _this select 1;
  _shift                    = _this select 2;
  private _ctrlKey          = _this select 3;
  _alt                      = _this select 4;
  private _speed            = speed cursorObject;
  _handled                  = false;
  private _WinKeysAction    = if(count (actionKeys "User10") isEqualTo 0) then {219} else {(actionKeys "User10") select 0};
  private _mapKey           = actionKeys "ShowMap" select 0;
  private _interruptionKeys = [17,30,31,32]; //A,S,W,D
  // hintSilent format ["%1", _key]; // Verif keys

  if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18,83]) && {(player getVariable ["DA3F_isComa",false])}) exitWith {
    true;
    };

      if (_code in [83]) exitWith {
        true
      };

  if(DA3F_IsAction) exitWith {
    if(!DA3F_Stop_Action && _key in _interruptionKeys) then {DA3F_Stop_Action = true;};
    _handled;
  };

   switch (_key) do
        {

      case _WinKeysAction: {
          if (dialog) then [{
            closeDialog 0
        },{
            if (!DA3F_IsAction) then {
                [] spawn  {
                    private "_handle";
          _handle = [] spawn DA3F_fnc_Farming;
                    waitUntil {scriptDone _handle};
                    DA3F_IsAction = false;
                };
            };
        }];
    };

    // Sound
    case 9: {
       ["down"]spawn DA3F_fnc_SoundVolume;
    };
    // Sound
    case 10: {
       ["up"]spawn DA3F_fnc_SoundVolume;
    };
/*
    // F3 for Admin mission
    case 61: {
        if (dialog) then [{
          closeDialog 0;
        },{
          []spawn DA3F_fnc_Admin_CreateDialog;
      }];
    };
*/
/*
    case 38: {
        if(_alt && !_ctrlKey) then {
          call DA3F_fnc_LightBackpack;
        };
    };
*/
    case 22: {

      if (cursorObject isKindOf "Man") exitWith {};
      if (cursorObject isKindOf "House") exitWith {};
        switch (locked cursorObject) do {
            case 0: {
                cursorObject lock 2;
                cutText [localize "DA3F_CloseVeh","PLAIN UP",1];
            };

            case 1: {
                cursorObject lock 2;
                cutText [localize "DA3F_CloseVeh","PLAIN UP",1];
            };


            case 2: {
                cursorObject lock 0;
                cutText [localize "DA3F_OpenVeh","PLAIN UP",1];
            };
        };
        []spawn {
            sleep 4;
            cutText ["","PLAIN",0];
        };
    };

    // keys ² | Menu player
    case 41: {
          if (dialog) then [{
            closeDialog 0
        },{
            if (!DA3F_IsAction) then {
              [] spawn  {
                private _handle = [] spawn DA3F_fnc_initGuiPlayer;
                  if !(isNil "_handle") then {
                            waitUntil {scriptDone _handle};
                            DA3F_IsAction = false;
                  };
                };
            };
        }];
    };

    // H | Holster / recall weapon. (Shift + H)
    case 35: {

        if (_shift && !_ctrlKey && !(currentWeapon player isEqualTo "")) then {
            DA3F_WeaponPlayer = currentWeapon player;
            player action ["SwitchWeapon", player, player, 100];
            player switchCamera cameraView;
        };

        if (!_shift && _ctrlKey && !isNil "DA3F_WeaponPlayer" && {!(DA3F_WeaponPlayer isEqualTo "")}) then {
            if (DA3F_WeaponPlayer in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
                player selectWeapon DA3F_WeaponPlayer;
            };
        };
    };


};
_handled