params ["_player"];
private _ppos = getpos _player;
private _Pid = getplayerUID _player;
private _pload = [];
private _pDMG = [];
private _SPInfo = profileNameSpace getVariable ["playerInformation", []]; 

_SPInfo pushback [_Pid, _PLoad, _ppos, _pDMG];
profileNameSpace setvariable ["playerInformation", _SPInfo]; 
saveProfileNamespace;