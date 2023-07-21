params ["_player", "_radioList", "_MID"];
[3, format ["Player %1 radios are: %2", _player, _radioList]] call spp_fnc_log;
private _pttList = [];
{
	private _radio = _x select 0;
	private _radioChannel = _x select 1;
	private _radioVolume = _x select 2;
	private _radioSpatial = _x select 3;
	private _radioPTT = _x select 4;
	// Set PTT assignment.
	switch (true) do {
		case (_radioPTT == 1): {
			_pttList set [0, _radio]
		};
		case (_radioPTT == 2): {
			_pttList set [1, _radio]
		};
		case (_radioPTT == 3): {
			_pttList set [2, _radio]
		};
		default {
			_pttList set [0, _radio]
		};
	};
	// Set the radio values.
	[_radio, _radioChannel] call acre_api_fnc_setRadioChannel;
	[_radio, _radioVolume] call acre_api_fnc_setRadioVolume;
	[_radio, _radioSpatial] call acre_api_fnc_setRadioSpatial;
} foreach _radioList;

[3, format ["Player %1 PTT Settings: %2", _player, _pttList]] call spp_fnc_log;
// Set the radio PTT settings.
private _ptt1 = _pttList param[0, 0];
private _ptt2 = _pttList param[1, 1]; 
private _ptt3 = _pttList param[2, 2]; 
_pttNewRadioList = [ [_ptt1, _ptt2, _ptt3] ] call acre_api_fnc_setMultiPushToTalkAssignment; 

["Your ACRE Settings have been restored"] remoteexec ["systemchat", _MID];