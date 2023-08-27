params ["_variableName", "_callingFNC"];
private _filename = "fn_MPNamespaceCreate";
// MissionProfileNamespace Creation.
[2, format["MissionProfileNamespace called by %1 does not contain: %2", _callingFNC, _variableName]] call spp_fnc_log;

// Set default empty array for Variable.
missionProfileNameSpace setVariable [_variableName, []]; 
saveMissionProfileNamespace;