#!/usr/bin/env pwsh

param(
    [switch]$Json
)

$ErrorActionPreference = 'Stop'

# Load common functions
. (Join-Path $PSScriptRoot 'common.ps1')

# Get paths
$paths = Get-StoryPathsEnv

# Validate branch
if (-not (Test-StoryBranch -Branch $paths.CURRENT_BRANCH -HasGit $paths.HAS_GIT)) {
    exit 1
}

# Ensure story directory exists
if (-not (Test-Path $paths.STORY_DIR)) {
    New-Item -ItemType Directory -Path $paths.STORY_DIR -Force | Out-Null
}

# Copy outline template
$Template = Join-Path $paths.REPO_ROOT ".fiction/templates/outline-template.md"
if (Test-Path $Template) {
    Copy-Item $Template $paths.OUTLINE
    Write-Host "Copied outline template to $($paths.OUTLINE)"
} else {
    Write-Warning "Outline template not found at $Template"
    New-Item -ItemType File -Path $paths.OUTLINE -Force | Out-Null
}

# Output
if ($Json) {
    @{
        PREMISE = $paths.PREMISE
        OUTLINE = $paths.OUTLINE
        STORY_DIR = $paths.STORY_DIR
        BRANCH = $paths.CURRENT_BRANCH
        HAS_GIT = $paths.HAS_GIT.ToString().ToLower()
    } | ConvertTo-Json -Compress
} else {
    Write-Host "PREMISE: $($paths.PREMISE)"
    Write-Host "OUTLINE: $($paths.OUTLINE)"
    Write-Host "STORY_DIR: $($paths.STORY_DIR)"
    Write-Host "BRANCH: $($paths.CURRENT_BRANCH)"
    Write-Host "HAS_GIT: $($paths.HAS_GIT)"
}

