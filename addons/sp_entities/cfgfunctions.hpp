class spe { 
    //Simple Persist Entities
    tag = "spe";

    class sp_generalInit {
        file = "sp_entities\functions\init";
        class initSPE {
            postInit = 1;
        };
    };

    class setup {
        file = "sp_entities\functions\setup";
        class cleanup {};
        class playerlookup {};
        class unitsetup {};
    };

    class eh {
        file = "sp_entities\functions\eh";
        class missionEH {};
    };

    class actions {
        file = "sp_entities\functions\actions";
        class load {};
        class save {};
    };

    class vehicle {
        file = "sp_entities\functions\vehicle"
        class getvehloadout {};
    };
};