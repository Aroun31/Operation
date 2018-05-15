#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};
#define JIP(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
    jip = 1; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2
// #define HC HC_DA3F // On en est pas la.

class CfgRemoteExec {
        class Functions {
            mode = 1;
            jip = 0;
        /* DA3F Mission °Opération° */
            F(DA3F_fnc_Create_Veh,ANYONE)
            F(DA3F_fnc_add_Xp,CLIENT)
        /* fnc BIS */
            F(bis_fnc_reviveinitaddplayer,ANYONE)
            F(bis_fnc_execvm,ANYONE)
            F(bis_fnc_call,ANYONE)
            F(bis_fnc_earthquake,ANYONE)
        };

    class Commands {
        mode = 1;
        jip = 0;

        F(hint,ANYONE)
        F(systemChat,ANYONE)
        F(selectLeader,ANYONE)
        F(addHandgunItem,ANYONE)
        F(addMagazine,ANYONE)
        F(addPrimaryWeaponItem,ANYONE)
        F(addWeapon,ANYONE)
        F(addAction,ANYONE)
        F(setFuel,ANYONE)
        F(setFuelCargo,ANYONE)
        F(failMission,ANYONE)
        F(disableCollisionWith,ANYONE)
    };
};
