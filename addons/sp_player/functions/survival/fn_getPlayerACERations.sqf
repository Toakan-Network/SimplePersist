params ["_player"];
private _filename = "fn_getPlayerACERations";
private _RationArray = [];
if (!(isClass (configFile >> "CfgPatches" >> "ace_field_rations"))) exitwith {
	[1, format["ACE Field Rations are not detected"]] call spp_fnc_log;
	_RationArray;
};
[3, format["Retrieving ACE Rations for %1", name _player], _filename] call spp_fnc_log;

private _thirst = _player getvariable ["acex_field_rations_thirst",0];
private _hunger = _player getvariable ["acex_field_rations_hunger", 0];

_RationArray = [_thirst, _hunger];
_RationArray;