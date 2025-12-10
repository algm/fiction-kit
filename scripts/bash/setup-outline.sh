#!/usr/bin/env bash

set -e

# Parse command line arguments
JSON_MODE=false
SPLIT_MODE=false
ARGS=()

for arg in "$@"; do
    case "$arg" in
        --json) 
            JSON_MODE=true 
            ;;
        --split)
            SPLIT_MODE=true
            ;;
        --help|-h) 
            echo "Usage: $0 [--json] [--split]"
            echo "  --json    Output results in JSON format"
            echo "  --split   Create split outline structure (multiple files)"
            echo "  --help    Show this help message"
            exit 0 
            ;;
        *) 
            ARGS+=("$arg") 
            ;;
    esac
done

# Get script directory and load common functions
SCRIPT_DIR="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Get all paths and variables from common functions
eval $(get_story_paths)

# Check if we're on a proper story branch (only for git repos)
check_story_branch "$CURRENT_BRANCH" "$HAS_GIT" || exit 1

# Ensure the story directory exists
mkdir -p "$STORY_DIR"

# Determine which template structure to use
if $SPLIT_MODE; then
    # Create split outline structure
    TEMPLATE_INDEX="$REPO_ROOT/.fiction/templates/outline-index-template.md"
    TEMPLATE_ACTS="$REPO_ROOT/.fiction/templates/outline-acts-template.md"
    TEMPLATE_CHAPTERS="$REPO_ROOT/.fiction/templates/outline-chapters-template.md"
    TEMPLATE_ARCS="$REPO_ROOT/.fiction/templates/outline-arcs-template.md"
    
    if [[ -f "$TEMPLATE_INDEX" ]] && \
       [[ -f "$TEMPLATE_ACTS" ]] && \
       [[ -f "$TEMPLATE_CHAPTERS" ]] && \
       [[ -f "$TEMPLATE_ARCS" ]]; then
        cp "$TEMPLATE_INDEX" "$OUTLINE_INDEX"
        cp "$TEMPLATE_ACTS" "$OUTLINE_ACTS"
        cp "$TEMPLATE_CHAPTERS" "$OUTLINE_CHAPTERS"
        cp "$TEMPLATE_ARCS" "$OUTLINE_ARCS"
        echo "Copied split outline templates to $STORY_DIR"
    else
        echo "Warning: Split outline templates not found"
        # Fall back to single file if split templates don't exist
        SPLIT_MODE=false
    fi
fi

# If not split mode, use single file template (or as fallback)
if ! $SPLIT_MODE; then
    TEMPLATE="$REPO_ROOT/.fiction/templates/outline-template.md"
    if [[ -f "$TEMPLATE" ]]; then
        cp "$TEMPLATE" "$OUTLINE"
        echo "Copied outline template to $OUTLINE"
    else
        echo "Warning: Outline template not found at $TEMPLATE"
        # Create a basic outline file if template doesn't exist
        touch "$OUTLINE"
    fi
fi

# Output results
if $JSON_MODE; then
    if $SPLIT_MODE; then
        printf '{"PREMISE":"%s","OUTLINE_INDEX":"%s","OUTLINE_ACTS":"%s","OUTLINE_CHAPTERS":"%s","OUTLINE_ARCS":"%s","STORY_DIR":"%s","BRANCH":"%s","HAS_GIT":"%s","SPLIT":true}\n' \
            "$PREMISE" "$OUTLINE_INDEX" "$OUTLINE_ACTS" "$OUTLINE_CHAPTERS" "$OUTLINE_ARCS" "$STORY_DIR" "$CURRENT_BRANCH" "$HAS_GIT"
    else
        printf '{"PREMISE":"%s","OUTLINE":"%s","STORY_DIR":"%s","BRANCH":"%s","HAS_GIT":"%s","SPLIT":false}\n' \
            "$PREMISE" "$OUTLINE" "$STORY_DIR" "$CURRENT_BRANCH" "$HAS_GIT"
    fi
else
    echo "PREMISE: $PREMISE"
    if $SPLIT_MODE; then
        echo "OUTLINE_INDEX: $OUTLINE_INDEX"
        echo "OUTLINE_ACTS: $OUTLINE_ACTS"
        echo "OUTLINE_CHAPTERS: $OUTLINE_CHAPTERS"
        echo "OUTLINE_ARCS: $OUTLINE_ARCS"
        echo "SPLIT: true"
    else
        echo "OUTLINE: $OUTLINE"
        echo "SPLIT: false"
    fi
    echo "STORY_DIR: $STORY_DIR"
    echo "BRANCH: $CURRENT_BRANCH"
    echo "HAS_GIT: $HAS_GIT"
fi

