class spp {
    tag = "spp";

    class Medical {
        file = "sp_player\functions\medical";
        class medicalCheck {};
        class ACEMedCompat {};
    };

    class EventHandlers {
        file = "sp_player\functions\eh";
        class missionEH {};
    };

    class sp_playerinit {
        file = "sp_player\functions\init";
        class startSPP {
                postInit = 1;
            };
    };

    class sp_radio {
        file = "sp_player\functions\radios";
        class getradioAddons {};
        class setradioAddons {};
    };

    class sp_radio_acre {
        file = "sp_player\functions\radios\acre";
        class getACRERadio {};
        class setACRERadio {};
    };

    class sp_p_survival {
        file = "sp_player\functions\survival";
        class getPlayerACERations {};
        class setPlayerACERations {};
    };

    class SP_Radio_TFAR {

    };

    class legacy {
        file = "sp_player\functions\legacy";
        class getLegacyData {};
        class legacyCheck {};
    };

    class SimplePersist {
        file = "sp_player\functions\sp";
        
        class getPlayerData {};
        class getPlayerNamespace {};
        class getPlayerObj {};

        class loadPlayerdata {};
        class pConnected {};
        class pDConnected {};
        
        class setDefaults {};
        class setPlayerData {};
        class setplayerloadout {};
        class setplayerMedical {};
        class setObjPos {};
    };
};