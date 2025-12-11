#!/usr/bin/env pwsh

param(
    [switch]$Json,
    [string]$ShortName,
    [int]$Number,
    [Parameter(ValueFromRemainingArguments)]
    [string[]]$Description
)

$ErrorActionPreference = 'Stop'

$StoryDescription = $Description -join ' '

if (-not $StoryDescription) {
    Write-Host "Usage: create-new-story.ps1 [-Json] [-ShortName <name>] [-Number N] <story_description>"
    exit 1
}

function Find-RepoRoot {
    param([string]$StartDir)
    $dir = $StartDir
    while ($dir -ne [System.IO.Path]::GetPathRoot($dir)) {
        if ((Test-Path (Join-Path $dir ".git")) -or (Test-Path (Join-Path $dir ".fiction"))) {
            return $dir
        }
        $dir = Split-Path $dir -Parent
    }
    return $null
}

function Get-HighestFromStories {
    param([string]$StoriesDir)
    $highest = 0
    if (Test-Path $StoriesDir) {
        Get-ChildItem -Path $StoriesDir -Directory | ForEach-Object {
            if ($_.Name -match '^(\d+)-') {
                $num = [int]$matches[1]
                if ($num -gt $highest) { $highest = $num }
            }
        }
    }
    return $highest
}

function Clean-BranchName {
    param([string]$Name)
    $Name.ToLower() -replace '[^a-z0-9]', '-' -replace '-+', '-' -replace '^-|-$', ''
}

function Generate-BranchName {
    param([string]$Description)
    
    $stopWords = @('i','a','an','the','to','for','of','in','on','at','by','with','from','is','are','was','were','be','been','being','have','has','had','do','does','did','will','would','should','could','can','may','might','must','shall','this','that','these','those','my','your','our','their','want','need','add','get','set','about','story','novel','book','tale','write','writing')
    
    $words = ($Description.ToLower() -replace '[^a-z0-9]', ' ') -split '\s+' | Where-Object { $_ -and $_.Length -ge 3 -and $_ -notin $stopWords }
    
    if ($words.Count -gt 0) {
        $maxWords = [Math]::Min($words.Count, 4)
        return ($words[0..($maxWords-1)] -join '-')
    }
    
    return Clean-BranchName $Description
}

# Determine repo root
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$HasGit = $false

try {
    $RepoRoot = git rev-parse --show-toplevel 2>$null
    if ($LASTEXITCODE -eq 0) {
        $HasGit = $true
    } else {
        $RepoRoot = Find-RepoRoot $ScriptDir
    }
} catch {
    $RepoRoot = Find-RepoRoot $ScriptDir
}

if (-not $RepoRoot) {
    Write-Error "Error: Could not determine repository root."
    exit 1
}

Set-Location $RepoRoot

$StoriesDir = Join-Path $RepoRoot "stories"
if (-not (Test-Path $StoriesDir)) {
    New-Item -ItemType Directory -Path $StoriesDir | Out-Null
}

# Generate branch name
if ($ShortName) {
    $BranchSuffix = Clean-BranchName $ShortName
} else {
    $BranchSuffix = Generate-BranchName $StoryDescription
}

# Determine branch number
if (-not $Number) {
    $Number = (Get-HighestFromStories $StoriesDir) + 1
}

$StoryNum = "{0:D3}" -f $Number
$BranchName = "$StoryNum-$BranchSuffix"

# Truncate if too long
if ($BranchName.Length -gt 244) {
    $MaxSuffix = 244 - 4
    $BranchSuffix = $BranchSuffix.Substring(0, $MaxSuffix) -replace '-$', ''
    Write-Warning "[fiction] Branch name truncated to 244 characters"
    $BranchName = "$StoryNum-$BranchSuffix"
}

# Create git branch if in a git repository
if ($HasGit) {
    # Check if branch already exists
    git show-ref --verify --quiet "refs/heads/$BranchName" 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Warning "[fiction] Branch '$BranchName' already exists. Using existing branch."
        git checkout $BranchName 2>$null
        if ($LASTEXITCODE -ne 0) {
            Write-Error "[fiction] Error: Failed to checkout existing branch '$BranchName'"
            exit 1
        }
    } else {
        # Create and checkout new branch
        git checkout -b $BranchName 2>$null
        if ($LASTEXITCODE -ne 0) {
            Write-Error "[fiction] Error: Failed to create branch '$BranchName'"
            exit 1
        }
        Write-Warning "[fiction] Created and checked out new branch: $BranchName"
    }
} else {
    Write-Warning "[fiction] Git not detected; skipped branch creation for $BranchName (expected)."
}

# Create story directory structure
$StoryDir = Join-Path $StoriesDir $BranchName
New-Item -ItemType Directory -Path $StoryDir -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $StoryDir "characters") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $StoryDir "world") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $StoryDir "drafts") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $StoryDir "research") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $StoryDir "checklists") -Force | Out-Null

# Copy template
$Template = Join-Path $RepoRoot ".fiction/templates/premise-template.md"
$PremiseFile = Join-Path $StoryDir "premise.md"
if (Test-Path $Template) {
    Copy-Item $Template $PremiseFile
} else {
    New-Item -ItemType File -Path $PremiseFile | Out-Null
}

# Set environment variable
$env:FICTION_STORY = $BranchName

# Output
if ($Json) {
    @{
        BRANCH_NAME = $BranchName
        PREMISE_FILE = $PremiseFile
        STORY_NUM = $StoryNum
        STORY_DIR = $StoryDir
    } | ConvertTo-Json -Compress
} else {
    Write-Host "BRANCH_NAME: $BranchName"
    Write-Host "PREMISE_FILE: $PremiseFile"
    Write-Host "STORY_NUM: $StoryNum"
    Write-Host "STORY_DIR: $StoryDir"
    Write-Host "FICTION_STORY environment variable set to: $BranchName"
}

