params ["_object", "_ppos", "_MID"];
private _scriptName = "spp_fnc_setObjPos";
private _ObjectName = name _object;

if (_ppos isEqualTo [0,0,0]) exitwith {
	[1, format ["Invalid Position data for %1, skipping.", _ObjectName], _scriptName] call spp_fnc_log; 
};

[3, format ["Restoring position for %1 at %2", _ObjectName, _ppos], _scriptName] call spp_fnc_log;
private _safepos = ([_PPos,0,10,5,0] call BIS_fnc_findSafePos);

// BIS_fnc_findSafePos returns 3 objects in array when it fails, 2 if it succeeds. 
// If it fails, we'll just set the object to the original position.
if (count _safepos > 2) then {
	[1, format ["Failed to find safe position for %1, setting to original position.", _ObjectName], _scriptName] call spp_fnc_log;
	_safepos = _ppos;
} else {
	_safepos set [2, 0]; // Set ground height.
	[3, format["Preferred Position for %1: %2",	_ObjectName, _safepos], _scriptName] call spp_fnc_log;
};

[_object, _safepos] remoteexec ["setPosATL", _MID];
// _object setPos _safepos;