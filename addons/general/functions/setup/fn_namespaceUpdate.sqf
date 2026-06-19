// Update the Variable, flush to disk.
params ["_variableName", "_array", "_fncCaller"];
private _SaveSystem = profileNamespace getVariable ["SPSavelocation", 0];
private _filename = "fn_namespaceUpdate";

switch (true) do {
	case (_SaveSystem == 1): {
		// Save to missionProfileNamespace.
		missionProfileNamespace setVariable [_variableName, _array];
		saveMissionProfileNamespace;

		if ((count _array) isNotEqualTo 0) exitWith {
			[_variableName, _array, _filename] call spp_fnc_mpnamespaceSet;
		};

	};

	default {
		// Default save to profileNamespace.
		if ((count _array) isNotEqualTo 0) exitWith {
			[_variableName, _array, _filename] call spp_fnc_profileNamespaceSet;
		};
	};
};
