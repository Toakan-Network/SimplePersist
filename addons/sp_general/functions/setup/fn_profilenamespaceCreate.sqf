params ["_variableName", "_array", "_callingFNC"];
private _filename = "fn_profileNamespaceCreate";

[3, format ["Saving ProfileNamespace: %1, %2", _variableName, _array], _filename] call spp_fnc_log;
// Setup the Namespace first.
profileNameSpace setVariable [_variableName, _array]; 
saveProfileNamespace;