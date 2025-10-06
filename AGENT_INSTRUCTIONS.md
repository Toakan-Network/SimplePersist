# Agent Instructions for SimplePersist Development

## Post-Change Workflow

After making any code changes to the SimplePersist codebase, the following steps must be completed:

### 1. Stage Changes
Add all modified files to Git staging area:
```powershell
git add .
```

Or add specific files:
```powershell
git add path/to/modified/file.sqf
```

### 2. Create Commit Message
Create a descriptive commit message that follows this format:

**For Bug Fixes:**
```
fix: [brief description of what was fixed]

- Detailed explanation of the issue
- What files were modified
- Impact of the changes
```

**For Feature Additions:**
```
feat: [brief description of new feature]

- Description of the new functionality
- Files added/modified
- Usage instructions if applicable
```

**For Syntax/Code Quality Fixes:**
```
fix: resolve syntax errors in SQF files

- Fixed missing semicolons in [list specific files]
- Ensured proper statement termination
- No functional changes, syntax compliance only
```

### 3. Commit Changes
```powershell
git commit -m "Your commit message here"
```

## Code Quality Standards

### Syntax Requirements
- All SQF statements must end with semicolons (`;`)
- Switch statement cases must have proper semicolon termination
- Function calls and variable assignments require semicolons
- exitWith blocks must have semicolons on all statements

### File Types to Monitor
- `.sqf` files (SQF script files)
- `.cpp` files (Configuration files)
- `.hpp` files (Header files)

### Common Syntax Patterns to Check
1. Variable assignments: `_variable = value;`
2. Function calls: `[params] call function_name;`
3. Switch cases: `case condition: { statement; };`
4. exitWith blocks: `exitWith { statement; };`

## Git Workflow Notes

- Always check `git status` before committing
- Use `git diff` to review changes before staging
- Ensure commit messages are descriptive and follow the format above
- Consider using `git add -p` for selective staging when multiple unrelated changes exist

## Example Recent Fix

**Issue:** Missing semicolons in multiple SQF files
**Files Fixed:**
- `addons/sp_player/functions/radios/acre/fn_getACRERadio.sqf`
- `addons/sp_player/functions/radios/acre/fn_setACRERadio.sqf`
- `addons/sp_player/functions/radios/fn_getradioAddons.sqf`
- `addons/sp_general/functions/log/fn_log.sqf`
- `addons/sp_entities/functions/actions/fn_save.sqf`

**Commit Message Used:**
```
fix: resolve syntax errors in SQF files

- Fixed missing semicolons in ACRE radio functions
- Fixed missing semicolon in radio addon detection
- Fixed missing semicolon in logging function
- Fixed missing semicolon in entity save function
- Ensures proper SQF syntax compliance across codebase
```

---

**Remember:** This workflow ensures proper version control and maintains a clean commit history for the SimplePersist project.