params ["_player", "_pDMG", "_MID", ["_pACEMedicalState", ""]];
private _scriptName = "spp_fnc_setplayermedical";

if (isNil "_player") exitWith {
	[1, format ["No player information provided."], _scriptName] call spp_fnc_log;
};

if ((isNil "_pdmg") && {_pACEMedicalState isEqualTo ""}) exitWith {
	[3, format ["Invalid Medical Data for %1", name _player], _scriptName] call spp_fnc_log;
};

// We have to wait for the player to get in ect. This just holds them for a moment.
[_pDMG, _player, _MID, _pACEMedicalState] call spp_fnc_medicalCheck;
