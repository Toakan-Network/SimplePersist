params ["_spinfo", "_pid", ["_pname", ""]];
private _splayer = [""];
private _arrayPos = -1;
private _scriptname = "fn_getlegacydata";
if (count _SPInfo == 0) exitWith {
	[3, "No data in Legacy Profilenamespace to restore", _scriptname] call spp_fnc_log;
	_splayer;
};

{  // find the users info.
  private _local = _x select 0;
  if (_pid isEqualTo _local) exitWith {
		[2, format ["Player data found for %1, %2", _pname, _pid]] call spp_fnc_log;
		_SPlayer  = _x;
		[3, format ["Player information: %1", _SPlayer], _scriptName] call spp_fnc_log;
		_arrayPos = _forEachindex;
	};
} forEach _SPInfo;

if (_arrayPos < 0) exitWith {
	[3, format ["No legacy player data found for %1, %2", _pname, _pid], _scriptname] call spp_fnc_log;
	_splayer;
};

// Remove legacy information after load.
private _legacyNS = "playerInformation";
_spinfo deleteAt _arrayPos;
[_legacyNS, _spinfo] call spp_fnc_namespaceUpdate;
// Return player information.
_splayer;
