private _filename = 'spe_fnc_save';

private _objectType = '';		// What is it?
private _objectpos = [0,0,0]; 	// Where is it?
private _objectHealth = [];		// How damaged is it?
private _objectContents = [];	// What inventory does it have.

// We only care about "alive" objects, ie not dead / destroyed.
// Private options which can be overwritten in initServer.sqf file.
private SPEExclusionArray = profilenamespace getvariable ['SPEExclusionArray', []];
private SPEInclusionArray = profilenamespace getvariable ['SPEInclusionArray', []];
private SPEIncludeCrew = 	profilenamespace getvariable ['SPEIncludeCrew', true];
private SPEExcludeDead = 	profilenamespace getVariable ['SPEExcludeDead', true];

// IncludeTypes, ExcludeTypes, IncludeCrew, ExcludeDead
_entityObjects = entities [SPEExclusionArray, SPEInclusionArray, SPEIncludeCrew, SPEExcludeDead];
{
	
	switch (true) do {
		case (_x typeof 'Man'): {

		};

		case (_x typeof 'LandVehicle'): {

		};

		case (_x typeof 'Man'): {

		};

	};

} foreach _entityObjects;

