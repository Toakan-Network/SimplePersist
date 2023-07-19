// PlayerConnected
if !(isServer) exitwith {};
_Pid = _this select 0; 
_pname = _this select 1; 
_MID = _this select 2;
if (_pname isequalto "__SERVER__") exitwith {};

// Double check the ProfileNameSpace, it shouldn't happen but it may do if someone resets it mid game.
private _SPInfo = profileNameSpace getVariable ["playerInformation", []]; 
if (count _SPInfo == 0) exitwith {[1, "No data in Profilenamespace"] call tcz_fnc_log};

private _SPlayer = [];
private _PLoad = [];
private _PPos = [0,0,0];
private _pDMG = [];
private _arrayPos = 0;
private _player = objNull;

{  // find the users info.
  private _local = _x select 0;
  if (_Pid isEqualTo _local) exitWith {
		[2, format ["Player Found: %1", _local]] call tcz_fnc_log;
		_SPlayer  = _x; 
		_arraypos = _forEachIndex;
	};
} foreach _SPInfo;

{	// Get player object
	if (getPlayerUID _x == _Pid) exitWith { _player = _x; };
} forEach playableUnits; 

if (!(isNull _player) && (count _SPlayer > 0)) then {	
	[_player, _Splayer, _MID] spawn {
		params ["_player", "_Splayer", "_MID"];
		[2, format ["Restoring %1", name _player]] call tcz_fnc_log;
		private _PID = _Splayer select 0;
		private _PLoad = _Splayer select 1;
		private _PPos = _SPLayer select 2;
		private _pDMG = _SPlayer select 3;

		// We have to wait for the player to get in ect. This just holds them for a moment.
		waituntil {
					[true] remoteexec ["disableUserInput", _MID] ;
					[0] remoteExec ["BIS_fnc_fadeEffect", _MID];
					sleep 10; 
					[1] remoteExec ["BIS_fnc_fadeEffect", _MID];
					alive _player;
				};

		for "_i" from 0 to ((count (_pDMG select 0)) -1) do {
			private _a = _pDMG select 0 select _i;
			private _b = _pDMG select 2 select _i;
			[_player, [_a, _b]] remoteexec ["setHitPointDamage", _MID];
		};

		_player setPos _PPos;
		_player setUnitLoadout _PLoad;
		[false] remoteexec ["disableUserInput", _MID] 
	};
};

// PLayer has no previous save data, set it now to avoid issues later.
if (count _SPlayer == 0) then {
	_ppos = getpos _player;
	_pload = [];
	_pDMG = [];
	_SPInfo pushback [_Pid, _PLoad, _ppos, _pDMG];
	profileNameSpace setvariable ["playerInformation", _SPInfo]; 
	saveProfileNamespace;
};