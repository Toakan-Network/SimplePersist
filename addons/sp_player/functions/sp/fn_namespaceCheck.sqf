
// Setup uiNamespace
private _SPInfo = profileNameSpace getVariable ["playerInformation", []]; 
if (count _SPInfo == 0) then {
	{
		private _uid = getplayerUID _x;
		private _pload = [];
		private _pPos = [];
		private _pDMG = [];
		_spinfo pushback [_uid, _pload, _pPos, _pDMG];
	} foreach allplayers;
	profileNameSpace setVariable ["playerInformation", []]; 
	saveProfileNamespace;
};
