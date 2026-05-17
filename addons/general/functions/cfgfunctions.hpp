class spp {
    tag = "spp";

    class setup {
        file = "tad\sp\addons\general\functions\setup";
        class mpnamespaceSet {};
        class namespaceCheck {};
        class namespaceGet {};
        class namespaceUpdate {};
        class profileNamespaceSet {};
    };

    class sp_generalInit {
        file = "tad\sp\addons\general\functions\init";
        class initSP {
            postInit = 1;
        };
    };

    class log {
        file = "tad\sp\addons\general\functions\log";
        class log {};
    };

    class players {
        file = "tad\sp\addons\general\functions\players";
        class machinePlayerLookup {};
    };
};
