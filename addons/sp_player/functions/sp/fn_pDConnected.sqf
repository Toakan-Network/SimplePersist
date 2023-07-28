// playerDisconnect.sqf
if !(isServer) exitwith {};
private _scriptname = "spp_fnc_pDConnected";
private _player = _this select 0;
private _pID = _this select 1;
private _pName = name _player;
if (_pname == "__SERVER__") exitwith {};

// [ [123,[loadout],[pos]], [124,[loadout],[pos]] ]
private _SPlayer = [];
if !(isNull _player) then {	
	_splayer = [_player] call spp_fnc_getPlayerData;
};

// Get Current Profile information
if (call spp_fnc_legacyCheck) then {
	// Legacy checks
	private _namespaceName = "playerInformation"; 
	private _SPinfo = [_namespaceName] call spp_fnc_namespaceget;

	{	// Quick blank check.
		if (count _x == 0) then {	
			_SPInfo deleteat _foreachIndex;
		};
	} foreach _SPInfo;

	// find the users info.
	{
		_playerArray = _x;
		if (_pID == _playerArray select 0) exitWith { 
			_Splayer  = _x; 
			_spInfo deleteat _forEachIndex;
			[_namespaceName, _SPInfo] call spp_fnc_namespaceUpdate;
		};
	} foreach _SPInfo;
	
	{	// Cleanup Duplicates.
		if (_pID == _x select 0) then {
			[1, format ["Duplicate entry found for %1, removing.", _pID]] call spp_fnc_log;
			_SPInfo deleteat _foreachindex;
			[_namespaceName, _SPInfo] call spp_fnc_namespaceUpdate;
		};
	} foreach _SPInfo;

	// _SPInfo pushback _SPlayer;
	[_namespaceName, _SPInfo] call spp_fnc_namespaceUpdate;

	// Use the new Save System
	private _namespaceName = [_pid] call spp_fnc_getplayernamespace;
	[_namespaceName, _splayer] call spp_fnc_namespaceUpdate;
} else {
	// New way, just overwrite profile on exit. 
	// Prevents duplication and other issues being found.
	private _namespaceName = [_pid] call spp_fnc_getplayernamespace;
	[_namespaceName, _splayer] call spp_fnc_namespaceUpdate;
};

[2, format["Player Save Completed for %1", name _player]] call spp_fnc_log;
