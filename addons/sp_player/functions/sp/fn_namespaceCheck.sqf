
// Setup uiNamespace
private _SPInfo = profileNameSpace getVariable ["playerInformation", []]; 
if (count _SPInfo == 0) then {
	{
		[_x] call spp_fnc_setDefaults;
	} foreach allplayers;
	profileNameSpace setVariable ["playerInformation", []]; 
	saveProfileNamespace;
};
