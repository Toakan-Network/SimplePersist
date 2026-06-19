params ["_SPMarkers"];
if ((count _SPMarkers) isNotEqualTo 0) exitWith {
	profileNamespace setVariable ["SPMarkerInformation", _SPMarkers];
	saveProfileNamespace;
};
