params ["_player", "_ppos", "_MID"];
private _scriptName = "spp_fnc_setplayerpos";

if (_ppos isEqualTo [0,0,0]) exitwith {
	[1, format ["Invalid Position data for %1, skipping.", name _player], _scriptName] call spp_fnc_log; 
};

[3, format ["Restoring position for %1 at %2", name _player, _ppos], _scriptName] call spp_fnc_log;
private _safepos = ([_PPos,0,10,5,0] call BIS_fnc_findSafePos);
_safepos set [2, 0]; // Set ground height.
[3, format["Preferred Position for %1: %2",name _player, _safepos], _scriptName] call spp_fnc_log;
[_player, _safepos] remoteexec ["setPosATL", _MID];
// _player setPos _safepos;