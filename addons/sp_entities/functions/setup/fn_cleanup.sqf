params ["_networkId"];
[2,"Admin logged out, figuring out Player Identity"] call spp_fnc_log;
private _player = [_networkId] call spp_fnc_machineplayerlookup;

private _SaveActionId =	_player getvariable ["SPESaveActionID", 0];
private _LoadActionID =	_player getvariable ["SPELoadActionID", 0];

_player removeAction _SaveActionId;
_player removeAction _LoadActionID;