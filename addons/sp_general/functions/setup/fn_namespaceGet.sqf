// Setup uiNamespace
params ["_variableName"];
private _filename = "fn_namespaceGet";
if (isnil "_variableName") exitwith {
	[1,"Namespace not passed to function", _filename] call spp_fnc_log;
};
private _MissionGroup = getText (missionConfigFile >> "missionGroup");
private _array = [];

[3, format ["Storage Request for: %1", _variableName], _filename] call spp_fnc_log;

switch (true) do {
	case (profileNamespace getvariable ["SPSavelocation", 0] == 1): {
		// Save to missionProfileNamespace.
		[3, format ["Using MissionProfileNamespace storage for group: %1", _MissionGroup], _filename] call spp_fnc_log;
		_array = missionProfileNameSpace getVariable [_variableName, []]; 

		if (count _array == 0) then {
			// Setup the Namespace first.
			// Variable Not found, creating.
			[_variableName, _array, _filename] call spp_fnc_mpnamespacecreate;
		}
		else {
			[2, format["MissionProfileNamespace data found for: %1", _variableName]] call spp_fnc_log;
		};
	};

	default {
		// Default save to profilenamespace.
		[3, "Defaulting to ProfileNamespace storage",  _filename] call spp_fnc_log;
		_array = profileNameSpace getVariable [_variableName, []]; 
		if (count _array == 0) then {
			[_variableName, _array, _filename] call spp_fnc_profilenamespacecreate;
		} else {
			[2, format["ProfileNamespace data found for: %1", _variableName]] call spp_fnc_log;
		};
	};
};
_array;