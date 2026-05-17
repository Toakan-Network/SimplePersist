params["_pid", "_player"];
private _saveRole = profileNamespace getVariable ["SPSaveRoles", 0];
private _prefix = "SP_P";
private _roleID = _player getVariable ["SPRoleID", ""];
if (_saveRole isEqualTo 1 && _roleID != "") then {
	_prefix = format["%1_%2", _prefix, _roleID] ;
};

private _namespace = format["%1_%2", _prefix, _pid];
_namespace;
