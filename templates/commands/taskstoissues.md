---
description: Convert story scenes into actionable, dependency-ordered GitHub issues for tracking writing progress.
tools: ['github/github-mcp-server/issue_write']
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --require-scenes --include-scenes
  ps: scripts/powershell/check-prerequisites.ps1 -Json -RequireScenes -IncludeScenes
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

**Single Source of Truth Principle**: Scene planning information lives in `scenes.md` or `scenes/` directory. Reference these files for scene details.

**See**: [navigation-guide.md](../navigation-guide.md) for the complete information location map.

## Critical Restriction: Do Not Develop Outline or Chapter Structure

**IMPORTANT**: This command MUST NOT develop, modify, or create:
- Outline structure (acts, beats, chapter plans)
- Chapter breakdowns or chapter summaries
- Scene planning or scene breakdowns
- Plot structure or story beats

**Only the following commands are authorized to develop outline and chapter information:**
- `/fiction.outline` - For creating and modifying story outlines
- `/fiction.scenes` - For creating and modifying scene breakdowns

**If outline or chapter development is needed**, direct the user to use the appropriate command (`/fiction.outline` or `/fiction.scenes`) instead.

**This command should:**
- Reference existing outline/scenes files when needed for context
- NOT create new outline elements
- NOT modify chapter structure
- NOT plan new scenes or chapters

1. Run `{SCRIPT}` from repo root and parse STORY_DIR and AVAILABLE_DOCS list. All paths must be absolute.

2. **Navigation Setup**:
   - Consult `STORY_DIR/navigation-guide.md` to locate scene files
   - **Determine scenes structure**: Check if split structure exists (scenes/index.md + scenes/chXX-XX.md) or single file (scenes.md)

3. From the executed script, extract the path to **scenes.md** (or scenes/index.md if split structure).

3. Get the Git remote by running:

```bash
git config --get remote.origin.url
```

**ONLY PROCEED TO NEXT STEPS IF THE REMOTE IS A GITHUB URL**

4. Parse scenes files and extract:
   - **If split structure**: Read scenes/index.md for overview, then scenes/chXX-XX.md files for scene details
   - **Otherwise**: Read scenes.md for complete scene list
   - Chapter-by-chapter scene organization
   - Scene IDs, summaries, and status
   - Dependencies between scenes
   - **References field**: Note which character, world, and event files are referenced (for issue context)

5. Create GitHub issues:
   - One issue per chapter (grouping scenes)
   - OR one issue per scene (granular tracking)
   - Include scene details in issue body
   - Add labels: `chapter`, `draft`, `story:[story-name]`

**UNDER NO CIRCUMSTANCES EVER CREATE ISSUES IN REPOSITORIES THAT DO NOT MATCH THE REMOTE URL**

## Issue Structure

For chapter-level issues:
```markdown
## Chapter [N]: [Title]

**Word Target**: [X] words
**Scenes**: [S001, S002, S003]

### Scenes to Draft
- [ ] S001 - [Scene summary]
- [ ] S002 - [Scene summary]
- [ ] S003 - [Scene summary]

### Notes
[Any chapter-specific notes]
```

For scene-level issues:
```markdown
## Scene [ID]: [Name]

**Chapter**: [N]
**POV**: [Character]
**Type**: [Action/Dialogue/Reflection]

### Scene Details
- **Goal**: [Character goal]
- **Conflict**: [Opposition]
- **Outcome**: [Expected outcome]

### Summary
[Scene summary from scenes.md]
```
