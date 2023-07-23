// Does the legacy Namespace contain data? Returns true if data found, else false.
params[""];

private _legacyNamespace = 'playerInformation';
private _SPInfo = [_legacyNamespace] call spp_fnc_namespaceGet;
if (count _spinfo == 0) exitwith {false};
true;