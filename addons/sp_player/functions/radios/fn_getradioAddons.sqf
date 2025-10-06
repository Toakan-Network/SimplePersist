params ["_player"];
private _radioList = [];

if ((isClass (configFile >> "CfgPatches" >> "acre_main"))) then {
    [3, format["ACRE Found."]] call spp_fnc_log;
    _radioList = [_player] call spp_fnc_getACRERadio;
}; 

// TO DO - Add TFAR support?
if (count _radioList == 0) exitwith {
    [3, format["Radio Mods not found."]] call spp_fnc_log;
    _radioList;
};

_radiolist;