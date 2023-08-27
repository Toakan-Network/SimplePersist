class spp {
    tag = "spp";

    class setup {
        file = "sp_general\functions\setup";
        class namespaceCheck {};
        class namespaceUpdate {};
        class namespaceGet {};
        class mpnamespaceCreate {};
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
};