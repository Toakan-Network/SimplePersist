private _filename = "spe_fnc_save";

// Object Data
private _objectType = "";		// What is it?
private _objectGroup = "";		// Rebuild Groups
private _objectpos = [0,0,0]; 	// Where is it?
private _objectHealth = [];		// How damaged is it?
private _objectContents = [];	// What inventory does it have.

// Persist Object Array
private _entityDataList = [];

// We only care about "alive" objects, ie not dead / destroyed.
// Private options which can be overwritten in initServer.sqf file.
private _SPEExclusionArray = profileNamespace getVariable ['SPEExclusionArray', []];
private _SPEInclusionArray = profileNamespace getVariable ['SPEInclusionArray', []];
private _SPEIncludeCrew = 	profileNamespace getVariable ['SPEIncludeCrew', true];
private _SPEExcludeDead = 	profileNamespace getVariable ['SPEExcludeDead', true];

// IncludeTypes, ExcludeTypes, IncludeCrew, ExcludeDead
_entityObjects = entities [_SPEExclusionArray, _SPEInclusionArray, _SPEIncludeCrew, _SPEExcludeDead];

// Data gatherer
{
	// Simple check, if a case is used we can push it back to the array.
	private _dataUsed = 0;

	switch (true) do {
		// If is a player, drop. Only want to save players during disconnect.
		case (isPlayer _x): {
			[3, "Skipping player entity", _filename] call spp_fnc_log;
			_dataUsed = 0;
		 };

		case ( _x isKindOf "Man"): {
			_objectType = typeOf _x;
			_objectGroup = group _x;
			_objectContents = getUnitLoadout _x;
			_objectpos = getPosATL _x;
			_objectHealth = getAllHitPointsDamage _x;

			[3, format["Found unit of type: %1, pos: %2, health: %3, contents: %4", _objectType, _objectpos, _objectHealth, _objectContents], _filename] call spp_fnc_log;
			_dataUsed = 1;
		};

		case ( _x isKindOf "LandVehicle"): {
			_objectType = typeOf _x;
			_objectGroup = group vehicle _x;
			_objectContents = [_x] call spe_fnc_getVehLoadout;
			_objectpos = getPosATL _x;
			_objectHealth = getAllHitPointsDamage _x;

			[3, format["Found Vehicle of type: %1, pos: %2, health: %3, contents: %4", _objectType, _objectpos, _objectHealth, _objectContents], _filename] call spp_fnc_log;
			_dataUsed = 1;
		};

		case ( _x isKindOf "Air"): {
			[3, "Skipping Air entity", _filename] call spp_fnc_log;
			_dataUsed = 0;
		};

		default {
			_dataUsed = 0;
		};
	};

	if (_dataUsed == 1) then {
		_entityDataList pushBack [_objectType, _objectGroup, _objectpos, _objectHealth, _objectContents];
	};

} forEach _entityObjects;

_entityObjects;
