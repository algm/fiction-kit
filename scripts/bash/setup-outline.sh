#!/usr/bin/env bash

set -e

# Parse command line arguments
JSON_MODE=false
ARGS=()

for arg in "$@"; do
    case "$arg" in
        --json) 
            JSON_MODE=true 
            ;;
        --help|-h) 
            echo "Usage: $0 [--json]"
            echo "  --json    Output results in JSON format"
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

# Copy outline template if it exists
TEMPLATE="$REPO_ROOT/.fiction/templates/outline-template.md"
if [[ -f "$TEMPLATE" ]]; then
    cp "$TEMPLATE" "$OUTLINE"
    echo "Copied outline template to $OUTLINE"
else
    echo "Warning: Outline template not found at $TEMPLATE"
    # Create a basic outline file if template doesn't exist
    touch "$OUTLINE"
fi

# Output results
if $JSON_MODE; then
    printf '{"PREMISE":"%s","OUTLINE":"%s","STORY_DIR":"%s","BRANCH":"%s","HAS_GIT":"%s"}\n' \
        "$PREMISE" "$OUTLINE" "$STORY_DIR" "$CURRENT_BRANCH" "$HAS_GIT"
else
    echo "PREMISE: $PREMISE"
    echo "OUTLINE: $OUTLINE" 
    echo "STORY_DIR: $STORY_DIR"
    echo "BRANCH: $CURRENT_BRANCH"
    echo "HAS_GIT: $HAS_GIT"
fi

