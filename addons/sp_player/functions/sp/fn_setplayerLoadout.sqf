params ["_player", "_pload", "_MID"];
private _scriptName = "spp_fnc_setplayerLoadout";

if (isnil "_player") exitwith {
	[1, format ["No player information provided."], _scriptName] call spp_fnc_log;
};

if (isnil "_pload") exitwith {
	[3, format ["Invalid Loadout Data for %1", name _player], _scriptName] call spp_fnc_log;
};

if (_pload isequalto []) exitwith {
	[3, format ["No Loadout Data provided for %1", name _player], _scriptName] call spp_fnc_log;
};

[3, format ["Restoring loadout for %1", name _player], _scriptName] call spp_fnc_log;
_player setUnitLoadout _PLoad;