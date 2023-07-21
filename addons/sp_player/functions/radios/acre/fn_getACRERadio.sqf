params ["_player","_MID"];

// ACRE Radio recording
private _newRadioList = [];
_newRadioList set [0, 1];
_newRadioList set [1, 1];
_newRadioList set [2, 1];

{
	private _radioType = _x;
	private _radios = [_radioType, _player] call acre_api_fnc_getAllRadiosByType; //return array of unique Radio IDs from corpse
	private _radioChannel = [];
	private _radioVolume = [];
	private _radioSpatial = [];
	private _pttList = [];
	_pttRadioList = [] call acre_api_fnc_getMultiPushToTalkAssignment; //return array of radioIDs assigned to each PTT key
	{
		//iterate through all radios by IDs, add their properties to arrays in a set order
		private _radioID = _x;
		private _currentChannel = [_radioID] call acre_api_fnc_getRadioChannel; //get channel of Radio
		private _currentVolume = [_radioID] call acre_api_fnc_getRadioVolume; //get volume of Radio
		private _currentSpatial = [_radioID] call acre_api_fnc_getRadioSpatial; //get spatial of Radio
		switch (_radioID) do 
		{ 
			//if ptt1 radio, add int 1
			case (_pttRadioList select 0): 
			{ 
				(_pttList pushBack 1); 
			}; 
			//if ptt2 radio, add int 2
			case (_pttRadioList select 1): 
			{ 
				(_pttList pushBack 2); 
			}; 
			//if ptt3 radio, add int 3
			case (_pttRadioList select 2): 
			{ 
				(_pttList pushBack 3); 
			}; 
			//if radio without ptt set, add int 9
			default 
			{ 
				(_pttList pushBack 9); 
			}; 
		};
		_radioChannel pushBack _currentChannel; //add channel to radioChannel
		_radioVolume pushBack _currentVolume; //add volume to radioVolume
		_radioSpatial pushBack _currentSpatial; //add spatial to radioSpatial
		_newRadioList pushBack [_radioType, _radioChannel, _radioVolume, _radioSpatial, _pttList]
	} forEach _radios;
} forEach ["ACRE_PRC77", "ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC343", "ACRE_SEM52SL", "ACRE_SEM70", "ACRE_BF888S"];

_newRadioList;