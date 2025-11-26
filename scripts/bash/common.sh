#!/usr/bin/env bash
# Common functions and variables for all scripts

# Get repository root, with fallback for non-git repositories
get_repo_root() {
    if git rev-parse --show-toplevel >/dev/null 2>&1; then
        git rev-parse --show-toplevel
    else
        # Fall back to script location for non-git repos
        local script_dir="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
        (cd "$script_dir/../../.." && pwd)
    fi
}

# Get current branch, with fallback for non-git repositories
get_current_branch() {
    # First check if FICTION_STORY environment variable is set
    if [[ -n "${FICTION_STORY:-}" ]]; then
        echo "$FICTION_STORY"
        return
    fi

    # Then check git if available
    if git rev-parse --abbrev-ref HEAD >/dev/null 2>&1; then
        git rev-parse --abbrev-ref HEAD
        return
    fi

    # For non-git repos, try to find the latest story directory
    local repo_root=$(get_repo_root)
    local stories_dir="$repo_root/stories"

    if [[ -d "$stories_dir" ]]; then
        local latest_story=""
        local highest=0

        for dir in "$stories_dir"/*; do
            if [[ -d "$dir" ]]; then
                local dirname=$(basename "$dir")
                if [[ "$dirname" =~ ^([0-9]{3})- ]]; then
                    local number=${BASH_REMATCH[1]}
                    number=$((10#$number))
                    if [[ "$number" -gt "$highest" ]]; then
                        highest=$number
                        latest_story=$dirname
                    fi
                fi
            fi
        done

        if [[ -n "$latest_story" ]]; then
            echo "$latest_story"
            return
        fi
    fi

    echo "main"  # Final fallback
}

# Check if we have git available
has_git() {
    git rev-parse --show-toplevel >/dev/null 2>&1
}

check_story_branch() {
    local branch="$1"
    local has_git_repo="$2"

    # For non-git repos, we can't enforce branch naming but still provide output
    if [[ "$has_git_repo" != "true" ]]; then
        echo "[fiction] Warning: Git repository not detected; skipped branch validation" >&2
        return 0
    fi

    if [[ ! "$branch" =~ ^[0-9]{3}- ]]; then
        echo "ERROR: Not on a story branch. Current branch: $branch" >&2
        echo "Story branches should be named like: 001-story-name" >&2
        return 1
    fi

    return 0
}

# Alias for backward compatibility
check_feature_branch() {
    check_story_branch "$@"
}

get_story_dir() { echo "$1/stories/$2"; }

# Find story directory by numeric prefix instead of exact branch match
# This allows multiple branches to work on the same story (e.g., 004-fix-chapter, 004-revise-ending)
find_story_dir_by_prefix() {
    local repo_root="$1"
    local branch_name="$2"
    local stories_dir="$repo_root/stories"

    # Extract numeric prefix from branch (e.g., "004" from "004-whatever")
    if [[ ! "$branch_name" =~ ^([0-9]{3})- ]]; then
        # If branch doesn't have numeric prefix, fall back to exact match
        echo "$stories_dir/$branch_name"
        return
    fi

    local prefix="${BASH_REMATCH[1]}"

    # Search for directories in stories/ that start with this prefix
    local matches=()
    if [[ -d "$stories_dir" ]]; then
        for dir in "$stories_dir"/"$prefix"-*; do
            if [[ -d "$dir" ]]; then
                matches+=("$(basename "$dir")")
            fi
        done
    fi

    # Handle results
    if [[ ${#matches[@]} -eq 0 ]]; then
        # No match found - return the branch name path (will fail later with clear error)
        echo "$stories_dir/$branch_name"
    elif [[ ${#matches[@]} -eq 1 ]]; then
        # Exactly one match - perfect!
        echo "$stories_dir/${matches[0]}"
    else
        # Multiple matches - this shouldn't happen with proper naming convention
        echo "ERROR: Multiple story directories found with prefix '$prefix': ${matches[*]}" >&2
        echo "Please ensure only one story directory exists per numeric prefix." >&2
        echo "$stories_dir/$branch_name"  # Return something to avoid breaking the script
    fi
}

# Alias for backward compatibility
find_feature_dir_by_prefix() {
    find_story_dir_by_prefix "$@"
}

get_story_paths() {
    local repo_root=$(get_repo_root)
    local current_branch=$(get_current_branch)
    local has_git_repo="false"

    if has_git; then
        has_git_repo="true"
    fi

    # Use prefix-based lookup to support multiple branches per story
    local story_dir=$(find_story_dir_by_prefix "$repo_root" "$current_branch")

    cat <<EOF
REPO_ROOT='$repo_root'
CURRENT_BRANCH='$current_branch'
HAS_GIT='$has_git_repo'
STORY_DIR='$story_dir'
PREMISE='$story_dir/premise.md'
OUTLINE='$story_dir/outline.md'
SCENES='$story_dir/scenes.md'
CHARACTERS_DIR='$story_dir/characters'
WORLD_DIR='$story_dir/world'
DRAFTS_DIR='$story_dir/drafts'
RESEARCH_DIR='$story_dir/research'
CHECKLISTS_DIR='$story_dir/checklists'
SYNOPSIS='$story_dir/synopsis.md'
EOF
}

# Alias for backward compatibility
get_feature_paths() {
    # Output both new and old variable names for compatibility
    local repo_root=$(get_repo_root)
    local current_branch=$(get_current_branch)
    local has_git_repo="false"

    if has_git; then
        has_git_repo="true"
    fi

    local story_dir=$(find_story_dir_by_prefix "$repo_root" "$current_branch")

    cat <<EOF
REPO_ROOT='$repo_root'
CURRENT_BRANCH='$current_branch'
HAS_GIT='$has_git_repo'
STORY_DIR='$story_dir'
FEATURE_DIR='$story_dir'
PREMISE='$story_dir/premise.md'
FEATURE_SPEC='$story_dir/premise.md'
OUTLINE='$story_dir/outline.md'
IMPL_PLAN='$story_dir/outline.md'
SCENES='$story_dir/scenes.md'
TASKS='$story_dir/scenes.md'
CHARACTERS_DIR='$story_dir/characters'
WORLD_DIR='$story_dir/world'
DRAFTS_DIR='$story_dir/drafts'
RESEARCH='$story_dir/research'
RESEARCH_DIR='$story_dir/research'
DATA_MODEL='$story_dir/world/world-bible.md'
QUICKSTART='$story_dir/synopsis.md'
CONTRACTS_DIR='$story_dir/world'
CHECKLISTS_DIR='$story_dir/checklists'
EOF
}

check_file() { [[ -f "$1" ]] && echo "  ✓ $2" || echo "  ✗ $2"; }
check_dir() { [[ -d "$1" && -n $(ls -A "$1" 2>/dev/null) ]] && echo "  ✓ $2" || echo "  ✗ $2"; }
