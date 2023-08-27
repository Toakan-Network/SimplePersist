// Does the legacy Namespace contain data? Returns true if data found, else false.
params[""];
private _filename = "fn_legacycheck";
private _legacyNamespace = 'playerInformation';
private _SPInfo = [_legacyNamespace] call spp_fnc_namespaceGet;

[3, "Checking for Legacy Namespace", _filename] call spp_fnc_log;

if (count _spinfo == 0) exitwith {false};
true;