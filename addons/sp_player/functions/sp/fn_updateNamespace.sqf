params ["_spinfo"];
[2, format ["Setting up ProfileNamespace"]] call spp_fnc_log;
profileNameSpace setvariable ["playerInformation", _SPInfo]; 
saveProfileNamespace;