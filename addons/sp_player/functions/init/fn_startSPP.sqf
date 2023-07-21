// Make sure to run when we're in a mission only.
if (allDisplays isEqualTo [findDisplay 0]) exitWith {};
// Only run on the server.
if !(isServer) exitwith {};
private _namespaceName = "playerInformation";

[2, format ["SimplePersist Player Module Loading."]] call spp_fnc_log;

0 = [_namespaceName] call spp_fnc_namespaceCheck;
0 = call spp_fnc_missionEH;

[2, format ["SimplePersist Player Module Loaded."]] call spp_fnc_log;

