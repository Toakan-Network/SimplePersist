params ["_pid", "_pname", "_mid"];
// PlayerConnected
if !(isServer) exitwith {};
if (_pname isequalto "__SERVER__") exitwith {};
private _scriptName = 'spp_fnc_pconnected';

// Player Loop, we can't do anything until they are actually loaded in.
private _player = objNull;
waitUntil {
	sleep 5;
	_player = [_pid] call spp_fnc_getPlayerObj;
	!isnull _player;
};

private _SPlayer = [];
_SPlayer = [_pid, _player] call spp_fnc_getPlayerData;

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

[_player, _pDMG, _MID] 	call spp_fnc_setplayermedical;
[_player, _ppos, _MID] 	call spp_fnc_setplayerpos;
[_player, _pload, _MID]	call spp_fnc_setplayerLoadout;