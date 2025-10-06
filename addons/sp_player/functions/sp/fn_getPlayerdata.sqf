params ["_player", "_pID", "_pname"];
private _filename = "fn_getPlayerData";
// Accepts: _player = Player Object

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

// Get ACE Medical State if ACE is loaded
_pACEMedicalState = [];
if (isClass (configFile >> "CfgPatches" >> "ace_medical_engine")) then {
	_pACEMedicalState = [_player] call ace_medical_fnc_serializeState;
	[3, format["ACE Medical state serialized for %1", _pName], _filename] call spp_fnc_log;
};

_Splayer = [
	_pID,
	_PLoad,
	_PPos,
	_pDMG,
	_pACERations,
	_roleID,
	_pACEMedicalState
];

{	// Debugging loop, skipped on loglevel.
	private _msg = "GET Debug value: %1";
	[3, format[_msg, _x], _filename] call spp_fnc_log;
} foreach _splayer;

[3, format ["Player Data Storing: %1", _Splayer], _filename] call spp_fnc_log;

_Splayer;