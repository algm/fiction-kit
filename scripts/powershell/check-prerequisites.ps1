#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Consolidated prerequisite checking for Fiction Kit workflow.

.PARAMETER Json
    Output in JSON format

.PARAMETER RequireScenes
    Require scenes.md to exist (for drafting phase)

.PARAMETER IncludeScenes
    Include scenes.md in AVAILABLE_DOCS list

.PARAMETER PathsOnly
    Only output path variables (no prerequisite validation)

.PARAMETER RequireTasks
    Alias for RequireScenes (backward compatibility)

.PARAMETER IncludeTasks
    Alias for IncludeScenes (backward compatibility)
#>

param(
    [switch]$Json,
    [switch]$RequireScenes,
    [switch]$IncludeScenes,
    [switch]$PathsOnly,
    [switch]$RequireTasks,
    [switch]$IncludeTasks
)

$ErrorActionPreference = 'Stop'

# Handle legacy parameter names
if ($RequireTasks) { $RequireScenes = $true }
if ($IncludeTasks) { $IncludeScenes = $true }

# Load common functions
. (Join-Path $PSScriptRoot 'common.ps1')

# Get paths
$paths = Get-StoryPathsEnv

# Validate branch
if (-not (Test-StoryBranch -Branch $paths.CURRENT_BRANCH -HasGit $paths.HAS_GIT)) {
    exit 1
}

# Paths-only mode
if ($PathsOnly) {
    if ($Json) {
        @{
            REPO_ROOT = $paths.REPO_ROOT
            BRANCH = $paths.CURRENT_BRANCH
            STORY_DIR = $paths.STORY_DIR
            PREMISE = $paths.PREMISE
            OUTLINE = $paths.OUTLINE
            SCENES = $paths.SCENES
            PREMISE_FILE = $paths.PREMISE
        } | ConvertTo-Json -Compress
    } else {
        Write-Host "REPO_ROOT: $($paths.REPO_ROOT)"
        Write-Host "BRANCH: $($paths.CURRENT_BRANCH)"
        Write-Host "STORY_DIR: $($paths.STORY_DIR)"
        Write-Host "PREMISE: $($paths.PREMISE)"
        Write-Host "OUTLINE: $($paths.OUTLINE)"
        Write-Host "SCENES: $($paths.SCENES)"
        Write-Host "CHARACTERS_DIR: $($paths.CHARACTERS_DIR)"
        Write-Host "WORLD_DIR: $($paths.WORLD_DIR)"
        Write-Host "DRAFTS_DIR: $($paths.DRAFTS_DIR)"
    }
    exit 0
}

# Validate required files
if (-not (Test-Path $paths.STORY_DIR)) {
    Write-Error "ERROR: Story directory not found: $($paths.STORY_DIR)"
    Write-Host "Run /fiction.premise first to create the story structure."
    exit 1
}

# Check for outline - accept either single file or split structure
$outlineExists = $false
$outlineSplit = $false
if (Test-Path $paths.OUTLINE_INDEX) {
    # Split structure detected
    $outlineExists = $true
    $outlineSplit = $true
} elseif (Test-Path $paths.OUTLINE) {
    # Single file structure
    $outlineExists = $true
    $outlineSplit = $false
} else {
    Write-Error "ERROR: No outline found in $($paths.STORY_DIR)"
    Write-Host "Run /fiction.outline first to create the story outline."
    exit 1
}

# Check for scenes - accept either single file or split structure
if ($RequireScenes) {
    $scenesExists = $false
    $scenesSplit = $false
    if (Test-Path $paths.SCENES_INDEX) {
        # Split structure detected
        $scenesExists = $true
        $scenesSplit = $true
    } elseif (Test-Path $paths.SCENES) {
        # Single file structure
        $scenesExists = $true
        $scenesSplit = $false
    }
    
    if (-not $scenesExists) {
        Write-Error "ERROR: No scenes found in $($paths.STORY_DIR)"
        Write-Host "Run /fiction.scenes first to create the scene breakdown."
        exit 1
    }
}

# Build available docs list
$docs = @()

if (Test-Path $paths.PREMISE) { $docs += "premise.md" }
if (Test-Path $paths.SYNOPSIS) { $docs += "synopsis.md" }

if ((Test-Path $paths.CHARACTERS_DIR) -and (Get-ChildItem $paths.CHARACTERS_DIR -ErrorAction SilentlyContinue)) {
    $docs += "characters/"
}

if ((Test-Path $paths.WORLD_DIR) -and (Get-ChildItem $paths.WORLD_DIR -ErrorAction SilentlyContinue)) {
    $docs += "world/"
}

if ((Test-Path $paths.RESEARCH_DIR) -and (Get-ChildItem $paths.RESEARCH_DIR -ErrorAction SilentlyContinue)) {
    $docs += "research/"
}

if ((Test-Path $paths.DRAFTS_DIR) -and (Get-ChildItem $paths.DRAFTS_DIR -ErrorAction SilentlyContinue)) {
    $docs += "drafts/"
}

if ($IncludeScenes) {
    if (Test-Path $paths.SCENES_INDEX) {
        $docs += "scenes-index.md"
        # Also include split scene files
        Get-ChildItem -Path $paths.STORY_DIR -Filter "scenes-ch*.md" | ForEach-Object {
            $docs += $_.Name
        }
    } elseif (Test-Path $paths.SCENES) {
        $docs += "scenes.md"
    }
}

# Output
if ($Json) {
    @{
        STORY_DIR = $paths.STORY_DIR
        FEATURE_DIR = $paths.STORY_DIR  # Legacy alias
        AVAILABLE_DOCS = $docs
        PREMISE_FILE = $paths.PREMISE
    } | ConvertTo-Json -Compress
} else {
    Write-Host "STORY_DIR:$($paths.STORY_DIR)"
    Write-Host "AVAILABLE_DOCS:"
    
    Test-FileExists -Path $paths.PREMISE -Description "premise.md"
    Test-FileExists -Path $paths.OUTLINE -Description "outline.md"
    Test-DirHasFiles -Path $paths.CHARACTERS_DIR -Description "characters/"
    Test-DirHasFiles -Path $paths.WORLD_DIR -Description "world/"
    Test-DirHasFiles -Path $paths.RESEARCH_DIR -Description "research/"
    Test-DirHasFiles -Path $paths.DRAFTS_DIR -Description "drafts/"
    Test-FileExists -Path $paths.SYNOPSIS -Description "synopsis.md"
    
    if ($IncludeScenes) {
        Test-FileExists -Path $paths.SCENES -Description "scenes.md"
    }
}
