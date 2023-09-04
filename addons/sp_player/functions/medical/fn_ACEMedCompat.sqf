params ["_pDMG", "_player", "_MID"];
if (_pDMG isEqualTo []) exitwith {
	[2, "No Medical settings to restore"] call spp_fnc_log;
};

if (!(isClass (configFile >> "CfgPatches" >> "ace_medical_engine"))) exitwith {
	[1, format["ACE Medical not detected"]] call spp_fnc_log;
};
private _filename = "fn_ACEMedCompat";

// set damage head
private _dmg = _pdmg select 2 select 2;
private _DMGpart = "head";
if (_dmg > 0) then {
	[3, format["Setting Damage = %1 to part %2", _dmg, _DMGpart], _filename] call spp_fnc_log;
	[_player, _dmg, _MID] spawn {
		params ["_player", "_dmg", "_MID"];
		[_player, _dmg, "head" , "bullet"] remoteexec ["ace_medical_fnc_addDamageToUnit", _MID]
	};
};

// set damage body
private _dmg = _pdmg select 2 select 11;
private _DMGpart = "Body";
if (_dmg > 0) then {
	[3, format["Setting Damage = %1 to part %2", _dmg, _DMGpart], _filename] call spp_fnc_log;
	[_player, _dmg, _MID] spawn {
		params ["_player", "_dmg", "_MID"];
		[_player, _dmg, "body" , "bullet"] remoteexec ["ace_medical_fnc_addDamageToUnit", _MID];
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
			[_player, _dmg, "RightArm" , "bullet"] remoteexec ["ace_medical_fnc_addDamageToUnit", _MID];
			[_player, _dmg, "LeftArm" , "bullet"] remoteexec ["ace_medical_fnc_addDamageToUnit", _MID];
		} else {
			// Pick an arm to sacrifice
			private _selection = selectrandom _part;
			[_player, _dmg, _selection , "bullet"] remoteexec ["ace_medical_fnc_addDamageToUnit", _MID];
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
			[_player, _dmg, "RightLeg" , "bullet"] remoteexec ["ace_medical_fnc_addDamageToUnit", _MID];
			[_player, _dmg, "LeftLeg" , "bullet"] remoteexec ["ace_medical_fnc_addDamageToUnit", _MID];
		} else {
			// Pick a leg to sacrifice
			private _selection = selectrandom _part;
			[_player, _dmg, _selection , "bullet"] remoteexec ["ace_medical_fnc_addDamageToUnit", _MID];

		};
	};
};