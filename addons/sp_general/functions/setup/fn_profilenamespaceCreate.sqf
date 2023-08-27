params ["_variableName", "_array", "_callingFNC"];
private _filename = "fn_profileNamespaceCreate";
// ProfileNamspace Creation.
[2, format["ProfileNamespace called by %1 does not contain: %2", _callingFNC, _variableName]] call spp_fnc_log;

// Setup the Namespace first.
profileNameSpace setVariable [_variableName, _array]; 
saveProfileNamespace;