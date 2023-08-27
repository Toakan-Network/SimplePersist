// Setup uiNamespace
params ["_variableName"];
private _filename = "spp_fnc_namespacecheck";
private _MissionGroup = getText (missionConfigFile >> "missionGroup");
if (isnil "_variableName") exitwith {[1,"Namespace not passed to function", _filename] call spp_fnc_log;};

[3, format ["Storage Check for: %1", _variableName], _filename] call spp_fnc_log;

switch (true) do {
	case (profileNamespace getvariable ["SPSavelocation", 0] == 1): {
		// Save to missionProfileNamespace.
		[3, format ["Using MissionProfileNamespace storage for group: %1", _MissionGroup], _filename] call spp_fnc_log;
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