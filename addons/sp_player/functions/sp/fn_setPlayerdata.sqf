params["_player", "_splayer", "_MID"];
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
private _aceRations = _splayer 	param [4, []];

[_player, _pDMG, _MID] 	call spp_fnc_setplayermedical;
[_player, _ppos, _MID] 	call spp_fnc_setplayerpos;
[_player, _pload, _MID]	call spp_fnc_setplayerLoadout;
[_player, _aceRations, _MID] call spp_fnc_setPlayerACERations;