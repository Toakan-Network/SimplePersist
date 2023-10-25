//when a player connects
[2, format ["Adding Event handlers"]] call spp_fnc_log;

addMissionEventHandler ["OnUserAdminStateChanged", {
	params ["_networkId", "_loggedIn", "_votedIn"];
	if (_loggedIn == false) exitwith {
		[_networkId] call spe_fnc_cleanup;
	};
	if (_loggedIn == true) exitwith {
		[_networkId] call spe_fnc_unitSetup;
	};
}];
