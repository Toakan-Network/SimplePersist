params ["_player", "_ppos", "_MID"];
private _scriptName = "spp_fnc_setplayerpos";

if (_ppos isEqualTo [0,0,0]) exitwith {
	[1, format ["Invalid Position data for %1, skipping.", name _player], _scriptName] call spp_fnc_log; 
};

[3, format ["Restoring position for %1", name _player], _scriptName] call spp_fnc_log;
_player setPos ([_PPos,0,10,5,0] call BIS_fnc_findSafePos);
