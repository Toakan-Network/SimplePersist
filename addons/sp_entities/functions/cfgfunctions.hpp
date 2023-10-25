class spe { 
    // SimplePersist Entities
    tag = "spe";

    class SPEinit {
        file = "sp_entities\functions\init";
        class initSPE {
            postInit = 1;
        };
    };

    class setup {
        file = "sp_entities\functions\setup";
        class cleanup {};
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