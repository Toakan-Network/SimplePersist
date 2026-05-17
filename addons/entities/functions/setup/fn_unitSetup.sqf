params ["_networkId"];
private _scriptName = 'spe_fnc_unitSetup';
private _Namespace = 'SP_E_EntityList';

[2,"Admin logged in, figuring out Player Identity"] call spp_fnc_log;
private _player = objNull;

waitUntil {
	sleep 5;
	_player = [_networkId] call spp_fnc_machineplayerlookup;
	!isnull _player;
};

[2, "Adding SPE Actions to Admin"] call spp_fnc_log;

// Script for Player setup.
[nil,{
	private _playerSaveObj = player addaction ["SPE | Save Entities",  {remoteExec ["spe_fnc_save", 2]}, nil, 30, false, true, "", "", 5];
	private _playerLoadObj = player addaction ["SPE | Load Entities", 	{remoteExec ["spe_fnc_load", 2]}, nil, 29, false, true, "", "", 5];
	player setvariable ["SPESaveActionID", _playerSaveObj];
	player setvariable ["SPELoadActionID", _playerLoadObj];
}] remoteexec ['',	[_networkId], true]


// Setup the action options for the players.


// private _playerSaveObj = _player addaction ["SPE | Save Entities",  {remoteExec ["spe_fnc_save", 2]}, nil, 30, false, true, "", "", 5];
// private _playerLoadObj = _player addaction ["SPE | Load Entities", 	{remoteExec ["spe_fnc_load", 2]}, nil, 29, false, true, "", "", 5];

// Add the Variables to the admins for cleanup later.
