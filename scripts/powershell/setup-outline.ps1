#!/usr/bin/env pwsh

param(
    [switch]$Json,
    [switch]$Split
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

# Determine which template structure to use
$useSplit = $Split
if ($useSplit) {
    # Create split outline structure
    $templateIndex = Join-Path $paths.REPO_ROOT ".fiction/templates/outline-index-template.md"
    $templateActs = Join-Path $paths.REPO_ROOT ".fiction/templates/outline-acts-template.md"
    $templateChapters = Join-Path $paths.REPO_ROOT ".fiction/templates/outline-chapters-template.md"
    $templateArcs = Join-Path $paths.REPO_ROOT ".fiction/templates/outline-arcs-template.md"
    
    if ((Test-Path $templateIndex) -and `
        (Test-Path $templateActs) -and `
        (Test-Path $templateChapters) -and `
        (Test-Path $templateArcs)) {
        Copy-Item $templateIndex $paths.OUTLINE_INDEX
        Copy-Item $templateActs $paths.OUTLINE_ACTS
        Copy-Item $templateChapters $paths.OUTLINE_CHAPTERS
        Copy-Item $templateArcs $paths.OUTLINE_ARCS
        Write-Host "Copied split outline templates to $($paths.STORY_DIR)"
    } else {
        Write-Warning "Split outline templates not found, falling back to single file"
        $useSplit = $false
    }
}

# If not split mode, use single file template (or as fallback)
if (-not $useSplit) {
    $template = Join-Path $paths.REPO_ROOT ".fiction/templates/outline-template.md"
    if (Test-Path $template) {
        Copy-Item $template $paths.OUTLINE
        Write-Host "Copied outline template to $($paths.OUTLINE)"
    } else {
        Write-Warning "Outline template not found at $template"
        New-Item -ItemType File -Path $paths.OUTLINE -Force | Out-Null
    }
}

# Output
if ($Json) {
    if ($useSplit) {
        @{
            PREMISE = $paths.PREMISE
            OUTLINE_INDEX = $paths.OUTLINE_INDEX
            OUTLINE_ACTS = $paths.OUTLINE_ACTS
            OUTLINE_CHAPTERS = $paths.OUTLINE_CHAPTERS
            OUTLINE_ARCS = $paths.OUTLINE_ARCS
            STORY_DIR = $paths.STORY_DIR
            BRANCH = $paths.CURRENT_BRANCH
            HAS_GIT = $paths.HAS_GIT.ToString().ToLower()
            SPLIT = $true
        } | ConvertTo-Json -Compress
    } else {
        @{
            PREMISE = $paths.PREMISE
            OUTLINE = $paths.OUTLINE
            STORY_DIR = $paths.STORY_DIR
            BRANCH = $paths.CURRENT_BRANCH
            HAS_GIT = $paths.HAS_GIT.ToString().ToLower()
            SPLIT = $false
        } | ConvertTo-Json -Compress
    }
} else {
    Write-Host "PREMISE: $($paths.PREMISE)"
    if ($useSplit) {
        Write-Host "OUTLINE_INDEX: $($paths.OUTLINE_INDEX)"
        Write-Host "OUTLINE_ACTS: $($paths.OUTLINE_ACTS)"
        Write-Host "OUTLINE_CHAPTERS: $($paths.OUTLINE_CHAPTERS)"
        Write-Host "OUTLINE_ARCS: $($paths.OUTLINE_ARCS)"
        Write-Host "SPLIT: true"
    } else {
        Write-Host "OUTLINE: $($paths.OUTLINE)"
        Write-Host "SPLIT: false"
    }
    Write-Host "STORY_DIR: $($paths.STORY_DIR)"
    Write-Host "BRANCH: $($paths.CURRENT_BRANCH)"
    Write-Host "HAS_GIT: $($paths.HAS_GIT)"
}

