params ["_player", "_radioList", "_MID"];
if ((isClass (configFile >> "CfgPatches" >> "acre_main"))) exitwith {
    [2, format ["Setting radios for %1", name _player]] call spp_fnc_log;
    [_player, _radioList, _MID] call spp_fnc_setACRERadio;
}; 

// TO DO - Add TFAR support?

[3, format["Radio Mods not found."]] call spp_fnc_log;