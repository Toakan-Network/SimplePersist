params ["_pid", "_pname", "_mid"];
// PlayerConnected
if !(isServer) exitwith {};
if (_pname isequalto "__SERVER__") exitwith {};
private _scriptName = 'spp_fnc_pconnected';
private _namespaceName = "playerInformation";

// Double check the ProfileNameSpace, it shouldn't happen but it may do if someone resets it mid game.
private _SPInfo = [_namespaceName] call spp_fnc_namespaceGet;
if (count _SPInfo == 0) exitwith {[1, "No data in Profilenamespace", _scriptname] call spp_fnc_log};

private _player = objNull;
waitUntil {
	sleep 5;
	_player = call spp_fnc_getPlayerObj;
	!isnull _player;
};

private _SPlayer = [];
private _arrayPos = 0;

{  // find the users info.
  private _local = _x select 0;
  if (_Pid isEqualTo _local) exitWith {
		[2, format ["Player data found for %1, %2", _pname, _pid]] call spp_fnc_log;
		_SPlayer  = _x; 
		[3, format ["Player information: %1", _SPlayer], _scriptName] call spp_fnc_log;
		_arraypos = _forEachIndex;
	};
} foreach _SPInfo;

[3, format ["Player information: %1, OBJ: %2", _SPlayer, _player], _scriptName] call spp_fnc_log;

// Player has no previous save data, set it now to avoid issues later.
if (count _SPlayer == 0) exitwith {	
	[3, format ["Player information not found"], _scriptName] call spp_fnc_log;
	[_player] call spp_fnc_setDefaults;	
};

// Assuming everything goes well now, and we've caught the other issues. Restore time.
[2, format ["Restoring %1", name _player]] call spp_fnc_log;
private _PID = _Splayer 		param [0, _PID];
private _PLoad = _Splayer 		param [1, []];
private _PPos = _SPLayer 		param [2, []];
private _pDMG = _SPlayer 		param [3, []];

// We have to wait for the player to get in ect. This just holds them for a moment.
[_pDMG, _player, _MID] call spp_fnc_medicalCheck;

[3, format ["Restoring position for %1", name _player], _scriptName] call spp_fnc_log;
_player setPos ([_PPos,0,10,5,0] call BIS_fnc_findSafePos);

[3, format ["Restoring loadout for %1", name _player], _scriptName] call spp_fnc_log;
_player setUnitLoadout _PLoad;
