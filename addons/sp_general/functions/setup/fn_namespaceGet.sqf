// Setup uiNamespace
params ["_variableName"];
private _filename = "spp_fnc_namespaceGet";
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
			[2, "MissionProfileNamespace is empty, creating."] call spp_fnc_log;
			missionProfileNameSpace setVariable [_variableName, _array]; ; 
			saveMissionProfileNamespace;
		}
		else {
			[2, "MissionProfileNamespace found, using."] call spp_fnc_log;
		};
	};

	default {
		// Default save to profilenamespace.
		[3, "Defaulting to ProfileNamespace storage",  _filename] call spp_fnc_log;
		_array = profileNameSpace getVariable [_variableName, []]; 
		if (count _array == 0) then {
			// Setup the Namespace first.
			profileNameSpace setVariable [_variableName, _array]; ; 
			saveProfileNamespace;
		};
	};
};
_array;