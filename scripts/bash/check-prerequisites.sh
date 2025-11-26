#!/usr/bin/env bash

# Consolidated prerequisite checking script for Fiction Kit
#
# This script provides unified prerequisite checking for Fiction Writing workflow.
# It replaces the functionality previously spread across multiple scripts.
#
# Usage: ./check-prerequisites.sh [OPTIONS]
#
# OPTIONS:
#   --json              Output in JSON format
#   --require-scenes    Require scenes.md to exist (for drafting phase)
#   --include-scenes    Include scenes.md in AVAILABLE_DOCS list
#   --paths-only        Only output path variables (no validation)
#   --help, -h          Show help message
#
# OUTPUTS:
#   JSON mode: {"STORY_DIR":"...", "AVAILABLE_DOCS":["..."]}
#   Text mode: STORY_DIR:... \n AVAILABLE_DOCS: \n ✓/✗ file.md
#   Paths only: REPO_ROOT: ... \n BRANCH: ... \n STORY_DIR: ... etc.

set -e

# Parse command line arguments
JSON_MODE=false
REQUIRE_SCENES=false
INCLUDE_SCENES=false
PATHS_ONLY=false

# Support both old and new argument names for compatibility
for arg in "$@"; do
    case "$arg" in
        --json)
            JSON_MODE=true
            ;;
        --require-scenes|--require-tasks)
            REQUIRE_SCENES=true
            ;;
        --include-scenes|--include-tasks)
            INCLUDE_SCENES=true
            ;;
        --paths-only)
            PATHS_ONLY=true
            ;;
        --help|-h)
            cat << 'EOF'
Usage: check-prerequisites.sh [OPTIONS]

Consolidated prerequisite checking for Fiction Writing workflow.

OPTIONS:
  --json              Output in JSON format
  --require-scenes    Require scenes.md to exist (for drafting phase)
  --include-scenes    Include scenes.md in AVAILABLE_DOCS list
  --paths-only        Only output path variables (no prerequisite validation)
  --help, -h          Show this help message

EXAMPLES:
  # Check scene prerequisites (outline.md required)
  ./check-prerequisites.sh --json
  
  # Check drafting prerequisites (outline.md + scenes.md required)
  ./check-prerequisites.sh --json --require-scenes --include-scenes
  
  # Get story paths only (no validation)
  ./check-prerequisites.sh --paths-only
  
EOF
            exit 0
            ;;
        *)
            echo "ERROR: Unknown option '$arg'. Use --help for usage information." >&2
            exit 1
            ;;
    esac
done

# Source common functions
SCRIPT_DIR="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Get story paths and validate branch
eval $(get_story_paths)
check_story_branch "$CURRENT_BRANCH" "$HAS_GIT" || exit 1

# If paths-only mode, output paths and exit (support JSON + paths-only combined)
if $PATHS_ONLY; then
    if $JSON_MODE; then
        # Minimal JSON paths payload (no validation performed)
        printf '{"REPO_ROOT":"%s","BRANCH":"%s","STORY_DIR":"%s","PREMISE":"%s","OUTLINE":"%s","SCENES":"%s","PREMISE_FILE":"%s"}\n' \
            "$REPO_ROOT" "$CURRENT_BRANCH" "$STORY_DIR" "$PREMISE" "$OUTLINE" "$SCENES" "$PREMISE"
    else
        echo "REPO_ROOT: $REPO_ROOT"
        echo "BRANCH: $CURRENT_BRANCH"
        echo "STORY_DIR: $STORY_DIR"
        echo "PREMISE: $PREMISE"
        echo "OUTLINE: $OUTLINE"
        echo "SCENES: $SCENES"
        echo "CHARACTERS_DIR: $CHARACTERS_DIR"
        echo "WORLD_DIR: $WORLD_DIR"
        echo "DRAFTS_DIR: $DRAFTS_DIR"
    fi
    exit 0
fi

# Validate required directories and files
if [[ ! -d "$STORY_DIR" ]]; then
    echo "ERROR: Story directory not found: $STORY_DIR" >&2
    echo "Run /fiction.premise first to create the story structure." >&2
    exit 1
fi

if [[ ! -f "$OUTLINE" ]]; then
    echo "ERROR: outline.md not found in $STORY_DIR" >&2
    echo "Run /fiction.outline first to create the story outline." >&2
    exit 1
fi

# Check for scenes.md if required
if $REQUIRE_SCENES && [[ ! -f "$SCENES" ]]; then
    echo "ERROR: scenes.md not found in $STORY_DIR" >&2
    echo "Run /fiction.scenes first to create the scene breakdown." >&2
    exit 1
fi

# Build list of available documents
docs=()

# Always check these optional docs
[[ -f "$PREMISE" ]] && docs+=("premise.md")
[[ -f "$SYNOPSIS" ]] && docs+=("synopsis.md")

# Check characters directory (only if it exists and has files)
if [[ -d "$CHARACTERS_DIR" ]] && [[ -n "$(ls -A "$CHARACTERS_DIR" 2>/dev/null)" ]]; then
    docs+=("characters/")
fi

# Check world directory
if [[ -d "$WORLD_DIR" ]] && [[ -n "$(ls -A "$WORLD_DIR" 2>/dev/null)" ]]; then
    docs+=("world/")
fi

# Check research directory
if [[ -d "$RESEARCH_DIR" ]] && [[ -n "$(ls -A "$RESEARCH_DIR" 2>/dev/null)" ]]; then
    docs+=("research/")
fi

# Check drafts directory
if [[ -d "$DRAFTS_DIR" ]] && [[ -n "$(ls -A "$DRAFTS_DIR" 2>/dev/null)" ]]; then
    docs+=("drafts/")
fi

# Include scenes.md if requested and it exists
if $INCLUDE_SCENES && [[ -f "$SCENES" ]]; then
    docs+=("scenes.md")
fi

# Output results
if $JSON_MODE; then
    # Build JSON array of documents
    if [[ ${#docs[@]} -eq 0 ]]; then
        json_docs="[]"
    else
        json_docs=$(printf '"%s",' "${docs[@]}")
        json_docs="[${json_docs%,}]"
    fi
    
    # Include both old and new variable names for compatibility
    printf '{"STORY_DIR":"%s","FEATURE_DIR":"%s","AVAILABLE_DOCS":%s,"PREMISE_FILE":"%s"}\n' \
        "$STORY_DIR" "$STORY_DIR" "$json_docs" "$PREMISE"
else
    # Text output
    echo "STORY_DIR:$STORY_DIR"
    echo "AVAILABLE_DOCS:"
    
    # Show status of each potential document
    check_file "$PREMISE" "premise.md"
    check_file "$OUTLINE" "outline.md"
    check_dir "$CHARACTERS_DIR" "characters/"
    check_dir "$WORLD_DIR" "world/"
    check_dir "$RESEARCH_DIR" "research/"
    check_dir "$DRAFTS_DIR" "drafts/"
    check_file "$SYNOPSIS" "synopsis.md"
    
    if $INCLUDE_SCENES; then
        check_file "$SCENES" "scenes.md"
    fi
fi
