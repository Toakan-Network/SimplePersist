params ["_SPMarkers"];
if !(count _SPMarkers == 0) exitwith {
	profileNameSpace setVariable ["SPMarkerInformation", _SPMarkers]; 
	saveProfileNamespace;
};