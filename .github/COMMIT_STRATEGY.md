# Git Commit Strategy for SimplePersist

This document outlines the commit strategy and guidelines for maintaining clean git history for the SimplePersist Arma 3 mod.

## Commit Message Format

Use conventional commits format:
```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types
- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **style**: Code style changes (formatting, etc.)
- **refactor**: Code refactoring without feature changes
- **test**: Adding or updating tests
- **chore**: Maintenance tasks, build updates
- **config**: Configuration file updates

### Scopes
- **player**: SP_Player module changes
- **entities**: SP_Entities module changes
- **markers**: SP_Markers module changes
- **general**: SP_General module changes
- **medical**: ACE medical integration
- **radios**: ACRE/TFAR radio integration
- **survival**: ACE survival/rations integration
- **config**: Configuration and build files
- **docs**: Documentation updates

## Examples

```bash
# New feature
git commit -m "feat(player): add ACE medical state serialization

- Implement ACE medical state persistence using serialize/deserialize
- Support for KAT and ACM medical compatibility
- Include proper state restoration on player reconnect"

# Bug fix
git commit -m "fix(player): resolve variable name typos in setPlayerdata

- Fix _SPLayer variable name typos causing script errors
- Correct case sensitivity issues in loadPlayerdata
- Ensure consistent variable naming throughout"

# Documentation
git commit -m "docs: update README with ACE medical requirements

- Add ACE medical dependency information
- Include configuration examples for medical persistence
- Update compatibility notes for medical mods"

# Configuration
git commit -m "config: standardize function naming in cfgfunctions.hpp

- Update radio functions to proper camelCase naming
- Ensure consistency across all module function definitions
- Maintain backward compatibility"

# Style improvements
git commit -m "style(general): modernize parameter handling to use params

- Convert _this select usage to modern params syntax
- Standardize string quoting to double quotes
- Fix spacing and indentation inconsistencies"
```

## Automatic Commit Workflow

For future development, consider implementing automatic commits after significant changes:

```powershell
# Add this to development workflow
function Commit-Changes {
    param(
        [string]$Type,
        [string]$Scope = "",
        [string]$Message,
        [string]$Body = ""
    )
    
    $commitMsg = "$Type"
    if ($Scope) { $commitMsg += "($Scope)" }
    $commitMsg += ": $Message"
    if ($Body) { $commitMsg += "`n`n$Body" }
    
    git add -A
    git commit -m $commitMsg
}

# Usage examples:
# Commit-Changes -Type "feat" -Scope "medical" -Message "add ACE medical state persistence"
# Commit-Changes -Type "fix" -Scope "player" -Message "resolve namespace variable errors"
```

## Pre-commit Checklist

Before each commit, ensure:

1. [ ] Code is tested in Arma 3 editor and multiplayer
2. [ ] No script errors in RPT logs
3. [ ] All SP modules load without errors
4. [ ] ACE/ACRE integration works if applicable
5. [ ] Documentation is updated if functionality changed
6. [ ] Version numbers updated if applicable
7. [ ] Function names match cfgfunctions.hpp declarations

## Branch Strategy

- **main**: Production-ready code for stable releases
- **develop**: Development integration branch
- **feature/***: Individual feature development (e.g., feature/ace-medical-integration)
- **hotfix/***: Critical bug fixes for production
- **docs/***: Documentation updates

## Release Process

1. Complete feature development in feature branch
2. Merge to develop branch
3. Test thoroughly in Arma 3 development environment
4. Create release branch from develop
5. Final testing and version updates in release branch
6. Merge release to main
7. Tag release with semantic version
8. Create PBO files and publish release

## Version Tagging

```bash
# Create version tags for releases
git tag -a v1.0.0 -m "Release version 1.0.0 - Initial SimplePersist release"
git tag -a v1.1.0 -m "Release version 1.1.0 - Add ACE medical serialization support"
git tag -a v1.2.0 -m "Release version 1.2.0 - Enhanced entity persistence and TFAR support"
git push origin --tags
```

## Module-Specific Guidelines

### SP_Player Module
- Focus on player data persistence, medical states, loadouts
- Test with ACE medical, ACRE radios, survival features
- Ensure compatibility with role-based saving

### SP_Entities Module  
- Handle vehicle and unit persistence
- Test with various vehicle types and equipment
- Verify proper cleanup and restoration

### SP_General Module
- Core namespace and logging functionality
- Ensure backward compatibility with existing saves
- Test profileNamespace and missionProfileNamespace storage

### SP_Markers Module
- Player-created marker persistence
- Test marker creation, deletion, and restoration
- Verify proper namespace management

This strategy ensures clean history and traceable changes for the SimplePersist Arma 3 mod.