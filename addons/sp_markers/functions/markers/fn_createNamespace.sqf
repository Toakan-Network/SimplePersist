// Setup uiNamespace
private _SPMarkers = profileNameSpace getVariable ["SPMarkerInformation", []]; 
if (count _SPMarkers == 0) then {
	// Setup the Namespace first.
	profileNameSpace setVariable ["SPMarkerInformation", []]; 
	saveProfileNamespace;
};