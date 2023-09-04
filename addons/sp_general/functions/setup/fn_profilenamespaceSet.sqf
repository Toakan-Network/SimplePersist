params ["_variableName", "_array", "_callingFNC"];
private _filename = "fn_profileNamespaceSet";

[3, format ["Saving ProfileNamespace: %1, %2", _variableName, _array], _filename] call spp_fnc_log;
// Setup the Namespace first.
profileNameSpace setVariable [_variableName, _array]; 
saveProfileNamespace;

[3, (profileNameSpace getVariable [_variableName, "Variable not found"]), _filename] call spp_fnc_log;