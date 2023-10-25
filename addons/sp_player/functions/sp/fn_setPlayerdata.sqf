params["_player", "_splayer", "_MID"];
private _filename = "fn_setPlayerData";
/*
Takes 
- _player = Player object
- _splayer = Player Restore Data
*/

// Assuming everything goes well now, and we've caught the other issues. Restore time.
[2, format ["Restoring %1", name _player]] call spp_fnc_log;
private _PID = _Splayer 		param [0, _PID];
private _PLoad = _Splayer 		param [1, []];
private _PPos = _SPLayer 		param [2, []];
private _pDMG = _SPlayer 		param [3, []];
private _aceRations = _splayer 	param [4, [0,0]];

// Disable Damage (Somehow there's an issue where moving gets damaged?)
if (isDamageAllowed _player) then {
	[3, format["Disabling player damage for %1", name _player], _filename] call spp_fnc_log;
	_player allowDamage false;
};

private _msg = "SET Debug value: %1";
[3, format[_msg, _pid], _filename] call spp_fnc_log;
[3, format[_msg, _PLoad], _filename] call spp_fnc_log;
[3, format[_msg, _PPos], _filename] call spp_fnc_log;
[3, format[_msg, _pDMG], _filename] call spp_fnc_log;
[3, format[_msg, _aceRations], _filename] call spp_fnc_log;

[_player, _pDMG, _MID] 	call spp_fnc_setplayermedical;
[_player, _ppos, _MID] 	call spp_fnc_setObjPos;
[_player, _pload, _MID]	call spp_fnc_setplayerLoadout;
[_player, _aceRations, _MID] call spp_fnc_setPlayerACERations;

if !(isDamageAllowed _player) then {
	[3, format["Enabling player damage for %1", name _player], _filename] call spp_fnc_log;
	// Re-enable Player Damage.
	_player allowDamage true;
};
