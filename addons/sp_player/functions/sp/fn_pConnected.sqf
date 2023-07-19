// PlayerConnected
if !(isServer) exitwith {};
_Pid = _this select 0; 
_pname = _this select 1; 
_MID = _this select 2;
if (_pname isequalto "__SERVER__") exitwith {};

// Double check the ProfileNameSpace, it shouldn't happen but it may do if someone resets it mid game.
private _SPInfo = profileNameSpace getVariable ["playerInformation", []]; 
if (count _SPInfo == 0) exitwith {[1, "No data in Profilenamespace"] call spp_fnc_log};

private _player = objNull;
waitUntil {
	sleep 5;
	_player = call spp_fnc_getPlayerObj;
	!isnull _player;
};

private _SPlayer = [];
private _PLoad = [];
private _PPos = [0,0,0];
private _pDMG = [];
private _arrayPos = 0;

{  // find the users info.
  private _local = _x select 0;
  if (_Pid isEqualTo _local) exitWith {
		[2, format ["Player data found for %1, %2", _pname, _pid]] call spp_fnc_log;
		_SPlayer  = _x; 
		[3, format ["Player information: %1", _SPlayer]] call spp_fnc_log;
		_arraypos = _forEachIndex;
	};
} foreach _SPInfo;

[3, format ["Player information: %1, OBJ: %2", _SPlayer, _player]] call spp_fnc_log;

// Player has no previous save data, set it now to avoid issues later.
if (count _SPlayer == 0) exitwith {	
	[3, format ["Player information not found"]] call spp_fnc_log;
	[_player] call spp_fnc_setDefaults;	
};

// Assuming everything goes well now, and we've caught the other issues. Restore time.
[2, format ["Restoring %1", name _player]] call spp_fnc_log;
private _PID = _Splayer select 0;
private _PLoad = _Splayer select 1;
private _PPos = _SPLayer select 2;
private _pDMG = _SPlayer select 3;

// We have to wait for the player to get in ect. This just holds them for a moment.
waituntil {
			sleep 10; 
			alive _player;
		};

[_pDMG, _player, _MID] call spp_fnc_medicalCheck;

[3, format ["Restoring position for %1", name _player]] call spp_fnc_log;
_player setPos _PPos;
[3, format ["Restoring loadout for %1", name _player]] call spp_fnc_log;
_player setUnitLoadout _PLoad;
