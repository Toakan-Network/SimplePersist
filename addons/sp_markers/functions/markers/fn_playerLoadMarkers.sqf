// PlayerConnected
params ["_pid", "_pname", "_mid"];
if !(isServer) exitwith {};
if (_pname isequalto "__SERVER__") exitwith {};
private _scriptName = 'spp_fnc_playerLoadMarkers]';