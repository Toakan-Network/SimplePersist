params ["_player", "_pID", "_pname"];
private _filename = "fn_getPlayerData";
// Accepts: _player = Player Object

private _PLoad = [];
private _PPos = [0,0,0];
private _pDMG = [];

[2, format ["Getting %1 info to save.", _pName]] call spp_fnc_log;

_PLoad = getUnitLoadout _player;
_PPos = getpos _player;
_pDMG = getAllHitPointsDamage _player;
_pACERations = [_player] call spp_fnc_getPlayerACERations;

private _msg = "GET Debug value: %1";
[3, format[_msg, _pid], _filename] call spp_fnc_log;
[3, format[_msg, _PLoad], _filename] call spp_fnc_log;
[3, format[_msg, _PPos], _filename] call spp_fnc_log;
[3, format[_msg, _pDMG], _filename] call spp_fnc_log;
[3, format[_msg, _aceRations], _filename] call spp_fnc_log;

_Splayer = [_pid, _PLoad, _PPos, _pDMG, _pACERations];
[3, format ["Player Data Storing: %1", _Splayer], _filename] call spp_fnc_log;

_Splayer;