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
_player allowDamage false;

[_player, _pDMG, _MID] 	call spp_fnc_setplayermedical;
[_player, _ppos, _MID] 	call spp_fnc_setplayerpos;
[_player, _pload, _MID]	call spp_fnc_setplayerLoadout;
[_player, _aceRations, _MID] call spp_fnc_setPlayerACERations;

if !(isDamageAllowed _player) then {
	[3, format["Enabling player damage for %1", name _player], _filename] call spp_fnc_log;
	// Re-enable Player Damage.
	_player allowDamage true;
};
