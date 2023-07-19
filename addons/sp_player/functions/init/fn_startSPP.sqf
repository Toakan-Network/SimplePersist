// Make sure to run when we're in a mission only.
if (allDisplays isEqualTo [findDisplay 0]) exitWith {};
// Only run on the server.
if !(isServer) exitwith {};

[2, format ["INIT Started"]] call tcz_fnc_log;

[2, format ["Setting up ProfileNamespace"]] call tcz_fnc_log;
0 = call tcz_fnc_namespaceCheck;
[2, format ["Adding Event handlers"]] call tcz_fnc_log;
0 = call tcz_fnc_missionEH;

[2, format ["INIT Completed"]] call tcz_fnc_log;

