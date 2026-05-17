// Setup uiNamespace
private _SPMarkers = profileNamespace getVariable ["SPMarkerInformation", []];
if (count _SPMarkers == 0) then {
	// Setup the Namespace first.
	profileNamespace setVariable ["SPMarkerInformation", []];
	saveProfileNamespace;
};
