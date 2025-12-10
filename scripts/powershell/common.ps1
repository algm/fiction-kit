#!/usr/bin/env pwsh
# Common PowerShell functions for Fiction Kit

function Get-RepoRoot {
    try {
        $result = git rev-parse --show-toplevel 2>$null
        if ($LASTEXITCODE -eq 0) {
            return $result
        }
    } catch {
        # Git command failed
    }
    
    # Fall back to script location for non-git repos
    return (Resolve-Path (Join-Path $PSScriptRoot "../../..")).Path
}

function Get-CurrentBranch {
    # First check if FICTION_STORY environment variable is set
    if ($env:FICTION_STORY) {
        return $env:FICTION_STORY
    }
    
    # Then check git if available
    try {
        $result = git rev-parse --abbrev-ref HEAD 2>$null
        if ($LASTEXITCODE -eq 0) {
            return $result
        }
    } catch {
        # Git command failed
    }
    
    # For non-git repos, try to find the latest story directory
    $repoRoot = Get-RepoRoot
    $storiesDir = Join-Path $repoRoot "stories"
    
    if (Test-Path $storiesDir) {
        $latestStory = ""
        $highest = 0
        
        Get-ChildItem -Path $storiesDir -Directory | ForEach-Object {
            if ($_.Name -match '^(\d{3})-') {
                $num = [int]$matches[1]
                if ($num -gt $highest) {
                    $highest = $num
                    $latestStory = $_.Name
                }
            }
        }
        
        if ($latestStory) {
            return $latestStory
        }
    }
    
    # Final fallback
    return "main"
}

function Test-HasGit {
    try {
        git rev-parse --show-toplevel 2>$null | Out-Null
        return ($LASTEXITCODE -eq 0)
    } catch {
        return $false
    }
}

function Test-StoryBranch {
    param(
        [string]$Branch,
        [bool]$HasGit = $true
    )
    
    # For non-git repos, we can't enforce branch naming but still provide output
    if (-not $HasGit) {
        Write-Warning "[fiction] Warning: Git repository not detected; skipped branch validation"
        return $true
    }
    
    if ($Branch -notmatch '^[0-9]{3}-') {
        Write-Output "ERROR: Not on a story branch. Current branch: $Branch"
        Write-Output "Story branches should be named like: 001-story-name"
        return $false
    }
    return $true
}

# Alias for backward compatibility
function Test-FeatureBranch {
    param(
        [string]$Branch,
        [bool]$HasGit = $true
    )
    Test-StoryBranch -Branch $Branch -HasGit $HasGit
}

function Get-StoryDir {
    param([string]$RepoRoot, [string]$Branch)
    Join-Path $RepoRoot "stories/$Branch"
}

# Alias for backward compatibility
function Get-FeatureDir {
    param([string]$RepoRoot, [string]$Branch)
    Get-StoryDir -RepoRoot $RepoRoot -Branch $Branch
}

function Get-StoryPathsEnv {
    $repoRoot = Get-RepoRoot
    $currentBranch = Get-CurrentBranch
    $hasGit = Test-HasGit
    $storyDir = Get-StoryDir -RepoRoot $repoRoot -Branch $currentBranch
    
    [PSCustomObject]@{
        REPO_ROOT         = $repoRoot
        CURRENT_BRANCH    = $currentBranch
        HAS_GIT           = $hasGit
        STORY_DIR         = $storyDir
        PREMISE           = Join-Path $storyDir 'premise.md'
        OUTLINE           = Join-Path $storyDir 'outline.md'
        OUTLINE_INDEX     = Join-Path $storyDir 'outline-index.md'
        OUTLINE_ACTS      = Join-Path $storyDir 'outline-acts.md'
        OUTLINE_CHAPTERS  = Join-Path $storyDir 'outline-chapters.md'
        OUTLINE_ARCS      = Join-Path $storyDir 'outline-arcs.md'
        SCENES            = Join-Path $storyDir 'scenes.md'
        SCENES_INDEX      = Join-Path $storyDir 'scenes-index.md'
        CHARACTERS_DIR    = Join-Path $storyDir 'characters'
        WORLD_DIR         = Join-Path $storyDir 'world'
        DRAFTS_DIR        = Join-Path $storyDir 'drafts'
        RESEARCH_DIR      = Join-Path $storyDir 'research'
        CHECKLISTS_DIR    = Join-Path $storyDir 'checklists'
        SYNOPSIS          = Join-Path $storyDir 'synopsis.md'
        # Legacy aliases for backward compatibility
        FEATURE_DIR       = $storyDir
        FEATURE_SPEC      = Join-Path $storyDir 'premise.md'
        IMPL_PLAN         = Join-Path $storyDir 'outline.md'
        TASKS             = Join-Path $storyDir 'scenes.md'
        RESEARCH          = Join-Path $storyDir 'research'
        DATA_MODEL        = Join-Path $storyDir 'world/world-bible.md'
        QUICKSTART        = Join-Path $storyDir 'synopsis.md'
        CONTRACTS_DIR     = Join-Path $storyDir 'world'
    }
}

# Alias for backward compatibility
function Get-FeaturePathsEnv {
    Get-StoryPathsEnv
}

function Test-FileExists {
    param([string]$Path, [string]$Description)
    if (Test-Path -Path $Path -PathType Leaf) {
        Write-Output "  ✓ $Description"
        return $true
    } else {
        Write-Output "  ✗ $Description"
        return $false
    }
}

function Test-DirHasFiles {
    param([string]$Path, [string]$Description)
    if ((Test-Path -Path $Path -PathType Container) -and (Get-ChildItem -Path $Path -ErrorAction SilentlyContinue | Where-Object { -not $_.PSIsContainer } | Select-Object -First 1)) {
        Write-Output "  ✓ $Description"
        return $true
    } else {
        Write-Output "  ✗ $Description"
        return $false
    }
}
