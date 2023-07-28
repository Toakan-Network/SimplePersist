params ["_player"];

private _RationArray = [];
if (!(isClass (configFile >> "CfgPatches" >> "ace_field_rations"))) exitwith {
	[1, format["ACE Field Rations are not detected"]] call spp_fnc_log;
	_RationArray;
};
[3, format["Retrieving Survival for %1", _player]] call spp_fnc_log;

private _thirst = _player getvariable ["acex_field_rations_thirst",0];
private _hunger = _player getvariable ["acex_field_rations_hunger", 0];

_RationArray = [_thirst, _hunger];
_RationArray;