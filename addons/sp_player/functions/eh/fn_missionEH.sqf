//when a player connects
[2, format ["Adding Event handlers"]] call spp_fnc_log;

addMissionEventHandler ["PlayerConnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	if (_name == "__SERVER__") exitwith {};
	[_uid, _name, _owner] spawn {
		params ["_uid", "_name", "_owner"];
		[2, format ["Player %1 Connected, restoring data", _name]] call spp_fnc_log;
		[_uid, _name, _owner] call spp_fnc_pConnected;
	};
}];

// When a Player DCs
addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	if (_name == "__SERVER__") exitwith {};
	[2, format ["Player %1 Disconnected, saving data", _name]] call spp_fnc_log;
	[_unit, _uid] call spp_fnc_pDConnected;
}];
