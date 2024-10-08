params ["_pDMG", "_player", "_MID"];

// ACE Medical System
private _filename = "fn_medicalCheck";
if ((isClass (configFile >> "CfgPatches" >> "ace_medical_engine"))) exitwith {
	[3, format["ACE Medical detected"], _filename] call spp_fnc_log;
	[_pDMG, _player, _MID] call spp_fnc_ACEMedCompat;
};

// Default Arma 3 Medical System
[3, format ["Restoring HP for %1", name _player], _filename] call spp_fnc_log;
for "_i" from 0 to ((count (_pDMG select 0)) -1) do {
	private _a = _pDMG select 0 select _i;
	private _b = _pDMG select 2 select _i;
	[_player, [_a, _b]] remoteexec ["setHitPointDamage", _MID];
};