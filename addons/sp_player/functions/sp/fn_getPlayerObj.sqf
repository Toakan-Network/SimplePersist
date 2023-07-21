params ["_pid"];
private _scriptName = "spp_fnc_getPlayerObj";
private _player = objNull;
{	// Get player object
	if (getPlayerUID _x isEqualTo _Pid) exitWith { 
		_player = _x; 
		[3, format ["Player Object for %1 is %2", name _x, _x], _scriptName] call spp_fnc_log;
	};
} forEach playableUnits; 
_player;