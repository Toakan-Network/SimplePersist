### For SP Logging in initServer.sqf
missionNamespace setvariable ["SPLogLevel", 3];

### For SP save locations
profileNamespace setvariable ["SPSavelocation", 1];

### For Role based saving.
The following command will enable the server to utilise Role based saving.
profileNamespace setvariable ["SPSaveRoles", 1];

For each player slot you will then need to set a UNIQUE variable
this setvariable ["SPRoleID", "Unique ID"];