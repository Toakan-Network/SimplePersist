class tcz {
    tag = "tcz";

    class EventHandlers {
        file = "sp_player\functions\eh";
        class missionEH {};
    };

    class init {
        file = "sp_player\functions\init";
        class startSPP {
                postInit = 1;
            };
    };

    class log {
        file = "sp_player\functions\log";
        class log {};
    };

    class SimplePersist {
        file = "sp_player\functions\sp";
        class namespaceCheck {};
        class pConnected {};
        class pDConnected {};
    };
};