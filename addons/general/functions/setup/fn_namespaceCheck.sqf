// Setup uiNamespace
params ["_variableName"];
if (isNil "_variableName") exitWith {[1,"Namespace not passed to function", _filename] call spp_fnc_log;};

private _filename = "spp_fnc_namespacecheck";
private _MissionGroup = getText (missionConfigFile >> "missionGroup");
private _array = [];

[3, format ["Storage Check for: %1", _variableName], _filename] call spp_fnc_log;

switch (true) do {
	case ((profileNamespace getVariable ["SPSavelocation", 0] == 1) && (_MissionGroup != "")): {
		// Save to missionProfileNamespace.
		[3, format ["Using MissionProfileNamespace storage for group: %1", _MissionGroup], _filename] call spp_fnc_log;
		private _array = missionProfileNamespace getVariable [_variableName, []];
		if (count _array == 0) then {
			// Variable Not found, creating.
			[_variableName, _array, _filename] call spp_fnc_MPNamespaceSet;
		};
	};

	case ((profileNamespace getVariable ["SPSavelocation", 0] == 1) && (_MissionGroup == "")): {
		// Invalid MissionGroup set, send warninig and save to ProfileNamespace instead.
		[3, format["MissionGroup is empty, defaulting to ProfileNamespace Storage."], _filename] call spp_fnc_log;
		private _array = profileNamespace getVariable [_variableName, []];
		if (count _array == 0) then {
			[_variableName, _array, _filename] call spp_fnc_profileNamespaceSet;
		};
	};

	default {
		// Default save to profileNamespace.
		[3, "Defaulting to ProfileNamespace storage", _filename] call spp_fnc_log;
		private _array = profileNamespace getVariable [_variableName, []];
		if (count _array == 0) then {
			[_variableName, _array, _filename] call spp_fnc_profileNamespaceSet;
		};
	};
};

_array;
