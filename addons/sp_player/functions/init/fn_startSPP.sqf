// Make sure to run when we're in a mission only.
if (allDisplays isEqualTo [findDisplay 0]) exitWith {};
// Only run on the server.
if !(isServer) exitwith {};

[2, format ["INIT Started"]] call spp_fnc_log;

0 = call spp_fnc_namespaceCheck;
0 = call spp_fnc_missionEH;

[2, format ["INIT Completed"]] call spp_fnc_log;

