// Update the Variable, flush to disk.
params ["_variableName", "_array"];
private _filename = "fn_namespaceUpdate";

switch (true) do {
	case (profileNamespace getvariable ["SPSavelocation", 0] == 1): {
		// Save to missionProfileNamespace.
		if !(count _array == 0) exitwith {
			[_variableName, _array, _filename]; call spp_fnc_mpnamespacecreate;
		};
	};

	default {
		// Default save to profilenamespace.
		if !(count _array == 0) exitwith {
			[_variableName, _array, _filename]; call spp_fnc_profilenamespacecreate;
		};
	};
};
