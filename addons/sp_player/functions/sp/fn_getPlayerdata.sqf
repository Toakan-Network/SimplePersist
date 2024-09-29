params ["_player", "_pID", "_pname"];
private _filename = "fn_getPlayerData";
// Accepts: _player = Player Object

private _pid = _this select 1;
private _PLoad = [];
private _PPos = [0,0,0];
private _pDMG = [];
private _saveRole = profileNamespace getvariable ["SPSaveRoles", 0];
private _roleid = _player getvariable ["SPRoleID", ""];
[2, format ["Getting %1 info to save.", _pName]] call spp_fnc_log;

_PLoad = getUnitLoadout _player;
_PPos = getposATL _player;
_pDMG = getAllHitPointsDamage _player;
_pACERations = [_player] call spp_fnc_getPlayerACERations;

_Splayer = [
	_pid,
	_PLoad,
	_PPos,
	_pDMG,
	_pACERations,
	_roleID
];

{	// Debugging loop, skipped on loglevel.
	private _msg = "GET Debug value: %1";
	[3, format[_msg, _x], _filename] call spp_fnc_log;
} foreach _splayer;

[3, format ["Player Data Storing: %1", _Splayer], _filename] call spp_fnc_log;

_Splayer;