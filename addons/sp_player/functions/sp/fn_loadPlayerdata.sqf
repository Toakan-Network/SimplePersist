params ["_pid", "_player"];
private _scriptName = "spp_fnc_loadplayerdata";
private _DefaultnamespaceName = "playerInformation";
private _namespaceName = [_pid] call spp_fnc_getplayernamespace;

// Check if Legacy Namespace contains player data.
private _SPInfo = [_DefaultnamespaceName] call spp_fnc_namespaceGet;
_splayer = [_spinfo] call spp_fnc_getLegacyData; 

if (_splayer IsEqualTo [""]) then {
	// Legacy Namespace Empty. Use new verison.
	[3, format["Using Gen2 Namespace: %1", _namespaceName],	_scriptName] call spp_fnc_log;
	_SPlayer = [_namespaceName] call spp_fnc_namespaceGet; 
};

if (count _Splayer == 0) exitwith {
	[1, "No player data found in storage", _scriptName] call spp_fnc_log;
};
// Found data!
[3, format ["Player information: %1, OBJ: %2", _SPlayer, _player], _scriptName] call spp_fnc_log;

// Return player information
_SPlayer;