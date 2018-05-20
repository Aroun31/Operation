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
    *           fn_Attach_Light.sqf
    *
    *
    *       DESCRIPTION :
    *               Light sur logic de jeu
    *       ARGUMENTS :
    *               0 = object
    *               1 = radius action light
    *               2 = colors ("Red","Blue","Green","White")
    *       EXEMPLES :
    *               init de la logic ou l'objet :
    *               _DA3F=[this,50,"Green"] call DA3F_fnc_Attach_Light;
    *
	*/



_this spawn {
        params[
            ["_DA3F_Logic",objNull,[objNull]],
            ["_DA3F_Value",100,[0]],
            ["_DA3F_Colors","Yellow",[""]]
        ];

        private _DA3F_Color = switch (_DA3F_Colors) do {
            case "Red": {[[250,30,20],[0.8,0.35,0.1]]};
            case "Blue": {[[20,50,250],[0.1,0.5,0.8]]};
            case "Green": {[[20,250,20],[0.25,0.8,0.1]]};
            case "White": {[[250,250,250],[0.8,0.75,0.65]]};
            case "Yellow": {[[250,200,180],[0.8,0.75,0.65]]};

            default {[[250,250,250],[0.8,0.75,0.65]]};
        };

        if (isNull _DA3F_Logic) exitWith {};

        while {true} do
        	{
        	waitUntil {sleep 1;(player distance _DA3F_Logic < _DA3F_Value)};
            private _obj = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
            _obj setObjectTexture [0,""];
            _obj enableSimulation false;
            _obj setPos getPos _DA3F_Logic;
            private _light = "#lightpoint" createVehicleLocal [0,0,0];
            _light lightAttachObject [_obj,[0,0,2.2]];
            _light setLightColor ((_DA3F_Color)select 0);
            _light setLightAmbient ((_DA3F_Color)select 0);
            _light setLightDayLight false;
            _light setLightIntensity 15;
            _light setLightFlareSize 0.3;
            _light setLightFlareMaxDistance 20;
        	waitUntil
                {
                sleep (20 + (random 10));
                if ((random 100)<50) then
                    [{
                   //     _light setLightIntensity (2 + (round (random 4)));
                        _light setLightIntensity (10 + random 5);
                        _light setLightColor ((_DA3F_Color)select 0);
                        _light setLightAmbient ((_DA3F_Color)select 0);
                    },{
                        _light setLightIntensity 10;
                        _light setLightColor [200,150,20];
                        _light setLightAmbient [0.7,0.3,0.1];
                    }];
                    (player distance _DA3F_Logic > _DA3F_Value)
                };

        		{
        			deleteVehicle _x;
        		} forEach [_light,_obj];
                sleep 1;
            };
        };