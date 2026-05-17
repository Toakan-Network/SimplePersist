// Make sure to run when we're in a mission only.
if (allDisplays isEqualTo [findDisplay 0]) exitWith {};
// Only run on the server.
if !(isServer) exitwith {};
private _filename = "SPP_fnc_initSPE";
[2, "SimplePersist Entity Module Loading."] call spp_fnc_log;

call spe_fnc_missionEH;

[2, "SimplePersist Entity Module Loaded."] call spp_fnc_log;
