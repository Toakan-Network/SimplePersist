// playerDisconnect.sqf
if !(isServer) exitwith {};
private _namespaceName = "playerInformation";
private _scriptname = "spp_fnc_pDConnected";
private _player = _this select 0;
private _pID = _this select 1;
private _pName = name _player;
if (_pname == "__SERVER__") exitwith {};

// Get Current Profile information
private _SPInfo = [_namespaceName] call spp_fnc_namespaceGet;
// [ [123,[loadout],[pos]], [124,[loadout],[pos]] ]
private _SPlayer = [];
private _PLoad = [];
private _PPos = [0,0,0];
private _pDMG = [];

{
	if (count _x == 0) then {
		// Quick blank check.
		_SPInfo deleteat _foreachIndex;
	};
} foreach _SPInfo;

if (count _spinfo == 0) then {	
	// Set player defaults on DC
	_SPlayer = [_pID, _Pload, _ppos, _pDMG]; 
} else {	// find the users info.
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
};

if !(isNull _player) then {	
	[2, format ["Getting %1 info to save.", _pName]] call spp_fnc_log;
	_pDMG = getAllHitPointsDamage _player;
	_PLoad = getUnitLoadout _player;
	_PPos = getpos _player;
	_Splayer = [_pid, _PLoad, _PPos, _pDMG];
};

_SPInfo pushback _SPlayer;
[_namespaceName, _SPInfo] call spp_fnc_namespaceUpdate;
[2, format["Player Disconnect Completed"]] call spp_fnc_log;