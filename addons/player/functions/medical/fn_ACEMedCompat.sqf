params ["_pDMG", "_player", "_MID", ["_pACEMedicalState", ""]];
private _filename = "fn_ACEMedCompat";

if (!(isClass (configFile >> "CfgPatches" >> "ace_medical"))) exitWith {
	[1, format["ACE Medical not detected"], _filename] call spp_fnc_log;
};

if ((_pACEMedicalState isEqualType "") && {_pACEMedicalState isNotEqualTo ""}) exitWith {
	[3, format["Restoring ACE medical state using deserializeState for %1", name _player], _filename] call spp_fnc_log;
	[_player, _pACEMedicalState] remoteExecCall ["ace_medical_fnc_deserializeState", _player];
	[3, format["ACE medical state restored for %1", name _player], _filename] call spp_fnc_log;
};

if (_pDMG isEqualTo []) exitWith {
	[2, "No Medical settings to restore", _filename] call spp_fnc_log;
};

// set damage head
private _dmg = _pdmg select 2 select 2;
private _DMGpart = "head";
if (_dmg > 0) then {
	[3, format["Setting Damage = %1 to part %2", _dmg, _DMGpart], _filename] call spp_fnc_log;
	[_player, _dmg, _MID] spawn {
		params ["_player", "_dmg", "_MID"];
		[_player, _dmg, "head" , "bullet"] remoteExec ["ace_medical_fnc_addDamageToUnit", _MID]
	};
};

// set damage body
private _dmg = _pdmg select 2 select 11;
private _DMGpart = "Body";
if (_dmg > 0) then {
	[3, format["Setting Damage = %1 to part %2", _dmg, _DMGpart], _filename] call spp_fnc_log;
	[_player, _dmg, _MID] spawn {
		params ["_player", "_dmg", "_MID"];
		[_player, _dmg, "body" , "bullet"] remoteExec ["ace_medical_fnc_addDamageToUnit", _MID];
	};
};

// set damage arms
private _dmg = _pdmg select 2 select 8;
private _DMGpart = "Arms";
if (_dmg > 0) then {
	[3, format["Setting Damage = %1 to part %2", _dmg, _DMGpart], _filename] call spp_fnc_log;
	[_player, _dmg, _MID] spawn {
		params ["_player", "_dmg", "_MID"];
		private _part = ["RightArm", "LeftArm"];
		if (_dmg >= .8) then {
			// Share the damage over both, Vanilla sucks.
			_dmg = _dmg /2;
			[_player, _dmg, "RightArm" , "bullet"] remoteExec ["ace_medical_fnc_addDamageToUnit", _MID];
			[_player, _dmg, "LeftArm" , "bullet"] remoteExec ["ace_medical_fnc_addDamageToUnit", _MID];
		} else {
			// Pick an arm to sacrifice
			private _selection = selectRandom _part;
			[_player, _dmg, _selection , "bullet"] remoteExec ["ace_medical_fnc_addDamageToUnit", _MID];
		};
	};
};

// set damage legs
private _dmg = _pdmg select 2 select 10;
private _DMGpart = "Legs";
if (_dmg > 0) then {
	[3, format["Setting Damage = %1 to part %2", _dmg, _DMGpart], _filename] call spp_fnc_log;
	[_player, _dmg, _MID] spawn {
		params ["_player", "_dmg", "_MID"];
		private _part = ["RightLeg", "LeftLeg"];
		if (_dmg >= .8) then {
			// Share the damage over both, Vanilla sucks.
			_dmg = _dmg /2;
			[_player, _dmg, "RightLeg" , "bullet"] remoteExec ["ace_medical_fnc_addDamageToUnit", _MID];
			[_player, _dmg, "LeftLeg" , "bullet"] remoteExec ["ace_medical_fnc_addDamageToUnit", _MID];
		} else {
			// Pick a leg to sacrifice
			private _selection = selectRandom _part;
			[_player, _dmg, _selection , "bullet"] remoteExec ["ace_medical_fnc_addDamageToUnit", _MID];

		};
	};
};
