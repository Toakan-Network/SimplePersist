params ["_player", "_aceRations", "_MID"];
private _RationArray = [1,1];
if (!(isClass (configFile >> "CfgPatches" >> "ace_field_rations"))) exitwith {
	[1, format["ACE Field Rations are not detected"]] call spp_fnc_log;
	_RationArray;
};

private _thirst = param [_aceRations select 0, 0];
private _hunger = param [_aceRations select 1, 0];

_player setvariable ["acex_field_rations_thirst", _thirst];
_player setvariable ["acex_field_rations_hunger", _hunger];

[3, format["Restored Survival for %1", _player]] call spp_fnc_log;