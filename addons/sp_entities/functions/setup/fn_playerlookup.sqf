params ["_networkId"];

private _allUserIDs = allUsers;
private _playerOBJ = objNull;
private _userFound = 0;

// Find the UserObj for the admin.
for "_i" from 0 to (count _allUserIds - 1) do
{
	private _player = _allUserIDs select _i;
	if (getplayerid _player == _networkId) exitwith {
		
		[2,	format["SPE %1 Logged in as Admin", name _player]] call spp_fnc_log;
		_playerOBJ = _player;
		_userFound = 1;

	};

	_userFound = 0;
};

// Exit if values are in expected range.
if ((_userFound = 0) || (isnull(_player))) exitwith {
	[2,	format["Error finding player based on %1", _networkId]] call spp_fnc_log;
};

_player;