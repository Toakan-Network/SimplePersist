// Setup uiNamespace
params ["_variableName"];
if (isnil "_variableName") exitwith {[1,"Namespace not passed to function", _filename] call spp_fnc_log;};

private _filename = "spp_fnc_namespacecheck";
private _MissionGroup = getText (missionConfigFile >> "missionGroup");
private _array = [];

[3, format ["Storage Check for: %1", _variableName], _filename] call spp_fnc_log;

switch (true) do {
	case ((profileNamespace getvariable ["SPSavelocation", 0] == 1) && (_MissionGroup != "")): {
		// Save to missionProfileNamespace.
		[3, format ["Using MissionProfileNamespace storage for group: %1", _MissionGroup], _filename] call spp_fnc_log;
		private _array = missionProfileNameSpace getVariable [_variableName, []]; 
		if (count _array == 0) then {
			// Variable Not found, creating.
			[_variableName, _array, _filename] call spp_fnc_mpnamespacecreate;
		};
	};

	case ((profileNamespace getvariable ["SPSavelocation", 0] == 1) && (_MissionGroup == "")): {
		// Invalid MissionGroup set, send warninig and save to ProfileNamespace instead.
		[3, format["MissionGroup is empty, defaulting to ProfileNamespace Storage."], _filename] call spp_fnc_log;
		private _array = profileNameSpace getVariable [_variableName, []]; 
		if (count _array == 0) then {
			[_variableName, _array, _filename] call spp_fnc_profilenamespacecreate;
		};
	};

	default {
		// Default save to profilenamespace.
		[3, "Defaulting to ProfileNamespace storage", _filename] call spp_fnc_log;
		private _array = profileNameSpace getVariable [_variableName, []]; 
		if (count _array == 0) then {
			[_variableName, _array, _filename] call spp_fnc_profilenamespacecreate;
		};
	};
};

_array;