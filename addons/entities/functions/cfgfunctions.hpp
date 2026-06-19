class spe { 
    // SimplePersist Entities
    tag = "spe";

    class SPEinit {
        file = "tad\sp\addons\entities\functions\init";
        class initSPE {
            // postInit = 1;
        };
    };

    class setup {
        file = "tad\sp\addons\entities\functions\setup";
        class cleanup {};
        class unitSetup {};
    };

    class eh {
        file = "tad\sp\addons\entities\functions\eh";
        class missionEH {};
    };

    class actions {
        file = "tad\sp\addons\entities\functions\actions";
        class load {};
        class save {};
    };

    class vehicle {
        file = "tad\sp\addons\entities\functions\vehicle";
        class getVehLoadout {};
    };
};
