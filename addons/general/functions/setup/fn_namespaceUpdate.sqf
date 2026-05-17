// Update the Variable, flush to disk.
params ["_variableName", "_array", "_fncCaller"];
private _SaveSystem = profileNamespace getvariable ["SPSavelocation", 0];
private _filename = "fn_namespaceUpdate";

switch (true) do {
	case (_SaveSystem == 1): {
		// Save to missionProfileNamespace.
		missionProfileNamespace setVariable [_variableName, _array]; 
		saveMissionProfileNamespace;

		if !(count _array == 0) exitwith {
			[_variableName, _array, _filename] call spp_fnc_mpnamespaceSet;
		};

	};

	default {
		// Default save to profilenamespace.
		if !(count _array == 0) exitwith {
			[_variableName, _array, _filename] call spp_fnc_profilenamespaceSet;
		};
	};
};

