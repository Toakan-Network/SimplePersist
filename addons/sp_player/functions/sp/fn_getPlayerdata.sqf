params ["_pid", "_player"];
private _scriptName = "spp_fnc_getplayerdata";
private _namespaceName = "playerInformation";
private _arrayPos = 0;

// Double check the ProfileNameSpace, it shouldn't happen but it may do if someone resets it mid game.
private _SPInfo = [_namespaceName] call spp_fnc_namespaceGet;
if (count _SPInfo == 0) exitwith {[1, "No data in Profilenamespace to restore", _scriptname] call spp_fnc_log};

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

// Return player information
_SPlayer;