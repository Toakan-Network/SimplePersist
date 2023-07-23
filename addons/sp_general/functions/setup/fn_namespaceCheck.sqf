// Setup uiNamespace
params ["_variableName"];
private _filename = "spp_fnc_namespacecheck";
if (isnil "_variableName") exitwith {[1,"Namespace not passed to function", _filename] call spp_fnc_log;};
switch (true) do {
	case (profileNamespace getvariable ["SPSavelocation", 0] == 1): {
		// Save to missionProfileNamespace.
		[3, "Using MissionProfileNamespace storage", _filename] call spp_fnc_log;
		private _array = missionProfileNameSpace getVariable [_variableName, []]; 
		if (count _array == 0) then {
			// Setup the Namespace first.
			[2, "MissionProfileNamespace not found, creating."] call spp_fnc_log;
			missionProfileNameSpace setVariable [_variableName, _array]; 
			saveMissionProfileNamespace;
		};
	};

	default {
		// Default save to profilenamespace.
		[3, "Defaulting to ProfileNamespace storage", _filename] call spp_fnc_log;
		private _array = profileNameSpace getVariable [_variableName, []]; 
		if (count _array == 0) then {
			// Setup the Namespace first.
			profileNameSpace setVariable [_variableName, _array]; 
			saveProfileNamespace;
		};
	};
};