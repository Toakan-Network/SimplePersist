params ["_player", "_aceRations", "_MID"];
private _filename = "fn_setPlayerACERations";
private _RationArray = [1,1];
if (!(isClass (configFile >> "CfgPatches" >> "ace_field_rations"))) exitwith {
	[1, format["ACE Field Rations are not detected"]] call spp_fnc_log;
	_RationArray;
};

[3, format ["Ration Values passed are %1, Thirst: %2, Hunger: %3",_aceRations, _aceRations select 0, _aceRations select 1], _filename] call spp_fnc_log;
private _thirst = _aceRations select 0;
private _hunger = _aceRations select 1;

_player setvariable ["acex_field_rations_thirst", _thirst];
_player setvariable ["acex_field_rations_hunger", _hunger];

[3, format["Restored ACE Rations for %1", _player], _filename] call spp_fnc_log;