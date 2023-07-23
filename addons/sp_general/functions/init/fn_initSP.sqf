// Make sure to run when we're in a mission only.
if (allDisplays isEqualTo [findDisplay 0]) exitWith {};
// Only run on the server.
if !(isServer) exitwith {};

if ((getText (missionConfigFile >> "missionGroup") != "") && (profileNamespace getvariable ["SPSavelocation", 0] == 1)) then {
	[1, "SPSaveLocation is set to 1, however no missionGroup has been defined. Proceeding in this way will cause dataloss should the mission change."] call spp_fnc_log;
};