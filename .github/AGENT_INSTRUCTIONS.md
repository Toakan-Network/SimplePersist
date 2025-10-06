# Agent Instructions for SimplePersist Development

## Core Directive: Always Update These Instructions

**CRITICAL:** When receiving new instructions or directives from the user, this file MUST be updated to incorporate and retain those instructions. This ensures continuity and prevents loss of important guidance.

## Verification and Source Checking

### Before Making Changes
1. **Check existing documentation** - Review `.github/COMMIT_STRATEGY.md` for commit guidelines
2. **Verify file locations** - Follow Git best practices:
   - Documentation goes in `.github/` directory
   - Project files follow existing structure
   - Check `README.md` for project-specific conventions
3. **Validate against existing patterns** - Ensure consistency with current codebase
4. **Cross-reference scope** - Use proper scopes from COMMIT_STRATEGY.md

### Source Verification Checklist
- [ ] Check existing repository structure
- [ ] Review current documentation files
- [ ] Validate against established patterns
- [ ] Confirm file placement follows Git conventions
- [ ] Ensure commit messages match COMMIT_STRATEGY.md format

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
**IMPORTANT:** Follow the format defined in `.github/COMMIT_STRATEGY.md`

Use conventional commits format:
```
<type>(<scope>): <subject>

<body>

<footer>
```

**For Syntax/Code Quality Fixes:**
```
fix(player): resolve syntax errors in radio functions

- Fixed missing semicolons in ACRE radio functions
- Fixed missing semicolon in radio addon detection
- Ensures proper SQF syntax compliance
```

**For Documentation Updates:**
```
docs(general): update agent instructions with verification process

- Added source verification checklist
- Integrated with existing COMMIT_STRATEGY.md
- Moved documentation to proper .github directory
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

## Module-Specific Scopes (from COMMIT_STRATEGY.md)

- **player**: SP_Player module changes
- **entities**: SP_Entities module changes  
- **markers**: SP_Markers module changes
- **general**: SP_General module changes
- **medical**: ACE medical integration
- **radios**: ACRE/TFAR radio integration
- **survival**: ACE survival/rations integration
- **config**: Configuration and build files
- **docs**: Documentation updates

## Git Workflow Notes

- Always check `git status` before committing
- Use `git diff` to review changes before staging
- Follow `.github/COMMIT_STRATEGY.md` for commit message format
- Consider using `git add -p` for selective staging when multiple unrelated changes exist
- Documentation files belong in `.github/` directory per Git conventions

## Integration with Existing Documentation

This file works in conjunction with:
- `.github/COMMIT_STRATEGY.md` - Primary commit guidelines and formatting
- `README.md` - Project overview and features
- Project structure follows Arma 3 addon conventions

---

**Remember:** This workflow ensures proper version control, maintains clean commit history, and integrates with the established SimplePersist project standards. Always verify sources and check existing documentation before making changes.