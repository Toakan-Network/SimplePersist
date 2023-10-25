params ["_networkId"];
private _scriptName = 'spe_fnc_unitSetup';
private _Namespace = 'SP_E_EntityList';

[2,"Admin logged in, figuring out Player Identity"] call spp_fnc_log;
private _player = [_networkId] call spe_fnc_playerlookup;

// Setup the action options for the players.
private _playerSaveObj = _player addaction ["SPE | Save Entities", call spe_fnc_save, null, 30, false, false, "", "", 5];
private _playerLoadObj = _player addaction ["SPE | Load Entities", call spe_fnc_load, null, 29, false, false, "", "", 5];

// Add the Variables to the admins for cleanup later.
_player setvariable ["SPESaveActionID", _playerSaveObj];
_player setvariable ["SPELoadActionID", _playerLoadObj];