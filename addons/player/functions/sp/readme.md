### For SP Logging in initServer.sqf
missionNamespace setVariable ["SPLogLevel", 3];

### For SP save locations
profileNamespace setVariable ["SPSavelocation", 1];

### For Role based saving.
The following command will enable the server to utilise Role based saving.
profileNamespace setVariable ["SPSaveRoles", 1];

For each player slot you will then need to set a UNIQUE variable
this setVariable ["SPRoleID", "Unique ID"];
