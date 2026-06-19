class spp {
    tag = "spp";

    class Medical {
        file = "tad\sp\addons\player\functions\medical";
        class medicalCheck {};
        class ACEMedCompat {};
    };

    class EventHandlers {
        file = "tad\sp\addons\player\functions\eh";
        class missionEH {};
    };

    class sp_playerinit {
        file = "tad\sp\addons\player\functions\init";
        class startSPP {
                postInit = 1;
            };
    };

    class sp_radio {
        file = "tad\sp\addons\player\functions\radios";
        class getRadioAddons {};
        class setRadioAddons {};
    };

    class sp_radio_acre {
        file = "tad\sp\addons\player\functions\radios\acre";
        class getACRERadio {};
        class setACRERadio {};
    };

    class sp_p_survival {
        file = "tad\sp\addons\player\functions\survival";
        class getPlayerACERations {};
        class setPlayerACERations {};
    };

    class SP_Radio_TFAR {

    };

    class legacy {
        file = "tad\sp\addons\player\functions\legacy";
        class getLegacyData {};
        class legacyCheck {};
    };

    class SimplePersist {
        file = "tad\sp\addons\player\functions\sp";
        
        class getPlayerData {};
        class getPlayerNamespace {};
        class getPlayerObj {};

        class loadPlayerdata {};
        class pConnected {};
        class pDConnected {};
        
        class setDefaults {};
        class setPlayerData {};
        class setPlayerLoadout {};
        class setPlayerMedical {};
        class setObjPos {};
    };
};
