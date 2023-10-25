params ["_networkId"];

private _allUsers = allPlayers - entities "HeadlessClient_F";
private _userFound = 0;
private _playerUID = 0;

// Find the UID (SteamID) for the admin.
for "_i" from 0 to (count _allUsers - 1) do
{
	private _player = _allUsers select _i;
	if (getplayerid _player == _networkId) exitwith {
		_playerUID = getplayerUID _player;
		_userFound = 1;
		[2,	format["SPE %1 Logged in as Admin", name _player]] call spp_fnc_log;
	};
};

// Exit if values are in expected range.
if ((_userFound isEqualTo 0) || (_playerUID isEqualTo 0)) exitwith {
	[2,	format["Error finding player based on %1", _networkId]] call spp_fnc_log;
};

// After all this, get the playerOBJ.
private _playerOBJ = [_playerUID] call spp_fnc_getPlayerObj;
_playerOBJ;