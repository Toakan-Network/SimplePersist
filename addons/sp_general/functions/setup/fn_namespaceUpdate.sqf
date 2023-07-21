// Update the Variable, flush to disk.
params ["_variableName", "_array"];
switch (true) do {
	case (profileNamespace getvariable ["SPSavelocation", 0] == 1): {
		// Save to missionProfileNamespace.
		if !(count _array == 0) exitwith {
			missionProfileNamespace setVariable [_variableName, _array]; 
			saveMissionProfileNamespace;
		};
	};

	default {
		// Default save to profilenamespace.
		if !(count _array == 0) exitwith {
			profileNameSpace setVariable [_variableName, _array]; 
			saveProfileNamespace;
		};
	};
};
