// Setup uiNamespace
private _SPInfo = profileNameSpace getVariable ["playerInformation", []]; 
if (count _SPInfo == 0) then {
	// Setup the Namespace first.
	profileNameSpace setVariable ["playerInformation", []]; 
	saveProfileNamespace;
};