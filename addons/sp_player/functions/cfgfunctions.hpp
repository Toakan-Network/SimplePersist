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

    class SP_Radio_TFAR {

    };

    class SimplePersist {
        file = "sp_player\functions\sp";
        class getPlayerObj {};
        class namespaceCheck {};
        class pConnected {};
        class pDConnected {};
        class setDefaults {};
        class updateNamespace {};
    };
};