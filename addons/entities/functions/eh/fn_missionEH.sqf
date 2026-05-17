//when a player connects
[2, format ["SPE | Adding Event handlers"]] call spp_fnc_log;

addMissionEventHandler ["OnUserAdminStateChanged", {
	params ["_networkId", "_loggedIn", "_votedIn"];
	if (_loggedIn == false) exitwith {
		[_networkId] spawn {
			params ["_networkId"];
			[_networkId] call spe_fnc_cleanup;
		};
	};
	if (_loggedIn == true) exitwith {
		// Throw it in a delayed script.
		[_networkId] spawn {
			params ["_networkId"];
			[_networkId] call spe_fnc_unitSetup;
		};
	};
}];
