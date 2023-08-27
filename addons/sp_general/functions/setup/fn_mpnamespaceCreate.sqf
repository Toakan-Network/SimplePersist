params ["_variableName", "_array", "_callingFNC"];
private _filename = "fn_MPNamespaceCreate";

[3, format ["Saving missionProfileNamespace: %1, %2", _variableName, _array], _filename] call spp_fnc_log;
// Set default empty array for Variable.
missionProfileNamespace setVariable [_variableName, _array]; 
saveMissionProfileNamespace;