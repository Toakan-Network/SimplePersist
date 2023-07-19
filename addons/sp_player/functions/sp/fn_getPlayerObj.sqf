params ["_pid"];
private _player = objNull;
{	// Get player object
	if (getPlayerUID _x isEqualTo _Pid) exitWith { 
		_player = _x; 
		[3, format ["Player Object for %1 is %2", name _x, _x]] call spp_fnc_log;
	};
} forEach playableUnits; 
_player;