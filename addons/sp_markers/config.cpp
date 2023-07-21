#include "BIS_AddonInfo.hpp"
class CfgPatches {
    class sp_markers {
        units[]={};
        weapons[]={};
        requiredVersion=0.1;
        requiredAddons[] = {"sp_general"};
    };
};

class CfgFunctions {
    #include "functions\CfgFunctions.hpp"
};