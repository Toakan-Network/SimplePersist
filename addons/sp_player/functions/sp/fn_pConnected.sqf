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
_SPlayer = [_pid, _player] call spp_fnc_loadPlayerData;

// Player has no previous save data, set it now to avoid issues later.
if (count _SPlayer == 0) exitwith {	
	[3, format ["Player information not found"], _scriptName] call spp_fnc_log;
	[_player] call spp_fnc_setDefaults;	
};

[_player, _SPlayer, _mid] call spp_fnc_setPlayerData;