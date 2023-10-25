class spp {
    tag = "spp";

    class setup {
        file = "sp_general\functions\setup";
        class mpnamespaceSet {};
        class namespaceCheck {};
        class namespaceGet {};
        class namespaceUpdate {};
        class profilenamespaceSet {};
    };

    class sp_generalInit {
        file = "sp_general\functions\init";
        class initSP {
            postInit = 1;
        };
    };

    class log {
        file = "sp_general\functions\log";
        class log {};
    };

    class players {
        file = "sp_general\functions\players";
        class machineplayerlookup {};
    }
};