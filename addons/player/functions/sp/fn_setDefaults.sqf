params ["_player"];
private _scriptName = "fn_setDefaults";
private _ppos = getPosATL _player;
private _Pid = getPlayerUID _player;
private _pload = [];
private _pDMG = [];
//"playerInformation";
private _namespaceName = [_pid, _player] call spp_fnc_getplayernamespace;
// Get the current PI Variable.
private _SPInfo = [_namespaceName] call spp_fnc_namespaceGet;

[3, format ["Setting defaults for %1", name _player], _scriptName] call spp_fnc_log;
_SPInfo pushBack [_Pid, _PLoad, _ppos, _pDMG];
[_namespaceName, _SPInfo] call spp_fnc_namespaceUpdate;
_SPInfo;
