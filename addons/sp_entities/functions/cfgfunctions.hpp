class spe { 
    //Simple Persist Entities
    tag = "spe";

    class setup {
        file = "sp_entities\functions\setup";
        class mpnamespaceSet {};
        class namespaceCheck {};
        class namespaceGet {};
        class namespaceUpdate {};
        class profilenamespaceSet {};
    };

    class sp_generalInit {
        file = "sp_entities\functions\init";
        class initSPE {
            postInit = 1;
        };
    };
};