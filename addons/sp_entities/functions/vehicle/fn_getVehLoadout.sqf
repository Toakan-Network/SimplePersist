params ["_obj", objNull, [objNull]];
// Pass in Object to check, ie car, returns the Containers and their contents.
// Get all containers on object.
private _objCont = everyContainer _obj;
_objCont sort true;

// 
private _containerContents = [];
_containerContents pushBack [_obj, getItemCargo _obj, magazinesAmmoCargo _obj, weaponsItemsCargo _obj, backpackCargo _obj];

{
	_containerContents pushBack [_x select 0,getItemCargo (_x select 1),magazinesAmmoCargo (_x select 1),weaponsItemsCargo (_x select 1),[]]
} forEach _objCont;

_containerContents;