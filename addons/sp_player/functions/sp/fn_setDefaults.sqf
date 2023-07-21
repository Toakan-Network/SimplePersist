params ["_player"];
private _scriptName = "spp_fnc_setDefaults";
private _ppos = getpos _player;
private _Pid = getplayerUID _player;
private _pload = [];
private _pDMG = [];

// Get the current PI Variable.
private _SPInfo = profileNameSpace getVariable ["playerInformation", []]; 

[3, format ["Setting defaults for %1", name _player], _scriptName] call spp_fnc_log;
_SPInfo pushback [_Pid, _PLoad, _ppos, _pDMG];
[_SPInfo] call spp_fnc_updateNamespace;
