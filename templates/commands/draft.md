---
description: Execute the drafting workflow by processing and writing all scenes defined in scenes.md
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --require-scenes --include-scenes
  ps: scripts/powershell/check-prerequisites.ps1 -Json -RequireScenes -IncludeScenes
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Goal

Draft prose **scene by scene**, creating individual prose files in `drafts/scenes/` and tracking progress in `drafts/prose-index.md`.

**Single Source of Truth**: 
- Scene planning lives in `scenes/` directory (metadata, goals, conflicts)
- Prose lives in `drafts/scenes/` directory (actual narrative)
- `drafts/prose-index.md` connects planning to prose and tracks references

**See**: [navigation-guide.md](../navigation-guide.md) for the complete information location map.

## Outline

1. Run `{SCRIPT}` from repo root and parse STORY_DIR and AVAILABLE_DOCS list. All paths must be absolute.

   **Prose Tracking Setup**:
   - Verify `STORY_DIR/drafts/prose-index.md` exists (create from `.fiction/templates/prose-index-template.md` if needed)
   - Verify `STORY_DIR/drafts/scenes/` directory exists (create if needed)
   - Load prose-index.md to check which scenes are already drafted

2. **Check checklists status** (if STORY_DIR/checklists/ exists):
   - Scan all checklist files in the checklists/ directory
   - For each checklist, count total, completed, and incomplete items
   - Create a status table showing pass/fail for each checklist
   
   - **If any checklist is incomplete**:
     - Display the table with incomplete item counts
     - **STOP** and ask: "Some checklists are incomplete. Do you want to proceed with drafting anyway? (yes/no)"
     - Wait for user response before continuing
   
   - **If all checklists are complete**:
     - Display the table showing all checklists passed
     - Automatically proceed to step 3

3. Load and analyze the story context:
   - **REQUIRED - Scenes**: Read scene information:
     - **If split structure exists**: Read scenes/index.md for overview, then relevant scenes/chXX-XX.md file(s)
     - **Otherwise**: Read scenes.md for complete scene list
   - **REQUIRED - Outline**: Read outline information:
     - **If split structure exists**: Read outline/index.md, outline/chapters.md, and outline/arcs.md
     - **Otherwise**: Read outline.md for structure, beats, and pacing
   - **REQUIRED**: Read premise.md for theme, characters overview, tone, **AND Language & Style Configuration**
   - **REQUIRED**: Read /memory/principles.md for voice and style rules, **especially Writing Language & Style section**
   - **IF EXISTS**: Read characters/ for character voices and details
   - **IF EXISTS**: Read world/ for setting details
   - **IF EXISTS**: Read research/ for authentic details

   **CRITICAL - Language & Style Enforcement**:
   - Extract **Writing Language** from premise.md or principles.md
   - Extract **Writing Style** (literary/commercial/genre:X) from principles.md
   - Extract **Regional Variant** for idioms and spelling conventions
   - ALL generated prose MUST be in the specified Writing Language
   - ALL prose MUST follow the Writing Style conventions
   
   - **Load Style-Specific Prose Guidance**:
     - If Writing Style is `literary`, read `.fiction/templates/guidance/styles/literary.md` for literary prose techniques
     - If Writing Style is `commercial`, read `.fiction/templates/guidance/styles/commercial.md` for commercial prose requirements
     - If Writing Style is `genre:fantasy`, read `.fiction/templates/guidance/genres/fantasy.md` for fantasy prose conventions
     - If Writing Style is `genre:thriller`, read `.fiction/templates/guidance/genres/thriller.md` for thriller pacing and prose style
     - If Writing Style is `genre:scifi`, `genre:romance`, `genre:mystery`, or `genre:horror`, apply similar genre prose conventions
     - **Apply this guidance** to ALL prose generation throughout drafting

4. **Scene-by-Scene Drafting Setup**:
   - Create STORY_DIR/drafts/scenes/ directory if it doesn't exist
   - For each scene being drafted, create individual file: `drafts/scenes/s[###]-[scene-name].md`
   - Use `.fiction/templates/scene-prose-template.md` as structure for each scene file
   - Track all drafted scenes in `drafts/prose-index.md`

5. Parse scenes structure and extract:
   - **Scenes**: Load from scenes/ files or scenes.md
   - **For each scene, extract**:
     - Scene ID (S###)
     - Scene name
     - POV character
     - Location, time
     - Goal, conflict, outcome
     - Summary and emotional beat
     - **References field**: All linked characters, world elements, events

6. Execute drafting **scene by scene**:
   
   **For each scene to draft**:
   
   a. **Prepare**:
      - Read scene metadata from scenes file
      - Extract References field links
      - Load all referenced materials:
        - Character files for voices and backgrounds
        - World-bible.md sections for locations/magic/tech
        - Event files for historical context
        - Research files if linked
      - Review principles.md for voice/style
   
   b. **Draft prose**:
      - Create `drafts/scenes/s[###]-[scene-name].md` from template
      - Fill in scene metadata section (chapter, POV, location, etc.)
      - List all references consulted in References Consulted section
      - **Write the prose** following:
        - Scene summary and emotional beat from planning
        - Character voices from character files
        - World details from world-bible.md
        - Writing Language and Style from principles.md
        - **NO cross-reference links in the prose itself** - prose should be clean narrative
   
   c. **Update tracking**:
      - Add scene metadata to prose file
      - Update `drafts/prose-index.md`:
        - Add row in Scene-to-Prose Mapping table
        - Set prose file path
        - Set status (Draft/In Progress)
        - Copy references from scene References field
        - Record word count
        - Set last updated date
      - Mark scene as complete in scenes file (check the box)

7. **Drafting execution rules**:
   
   **Scene Selection**:
   - Draft scenes in story order (S001, S002, S003, etc.)
   - Or draft specific scenes if user requests certain scenes/chapters
   - Check prose-index.md to skip already-drafted scenes
   
   **Reference Loading**:
   - For each scene, load materials from the References field
   - Character files: Voice, mannerisms, background
   - World elements: Locations, magic/tech, history
   - Research: Factual accuracy
   
   **Prose Writing**:
   - Write in individual scene file: `drafts/scenes/s###-name.md`
   - Follow scene-prose-template.md structure
   - Use scene summary and emotional beat as guide
   - Apply Writing Language and Writing Style
   - **Keep prose clean** - no inline markdown links in the narrative
   - Include sensory details appropriate to setting
   - Maintain POV and tense per principles.md
   
   **After each scene**:
   - Save scene prose file
   - Update prose-index.md entry
   - Mark scene complete in scenes file
   - Update word count statistics

8. **Voice, Style, and Language Enforcement**:
   - **WRITE ALL PROSE IN THE SPECIFIED WRITING LANGUAGE** (from principles.md)
   - Use the **Regional Variant** for spelling, idioms, and cultural references
   - Apply **Writing Style** conventions:
     - `literary`: Rich prose, symbolism, subtext, thematic depth
     - `commercial`: Clear, accessible, strong pacing, hook-driven
     - `genre:[X]`: Follow genre-specific conventions and reader expectations
   - Follow all rules in principles.md
   - Maintain character voice consistency
   - Apply genre conventions appropriately
   - Honor the established tone

9. Progress tracking:
   - Report progress after each completed chapter
   - Track word count vs. target
   - Note any scenes that diverged from plan (for later review)
   - **IMPORTANT**: Mark completed scenes with [X] in the appropriate scenes file (scenes.md or scenes/chXX-XX.md)

10. Completion validation:
    - Verify all scenes are drafted
    - Check total word count against target
    - Confirm all chapters saved to drafts/
    - Report final status with summary

## Drafting Strategies

**Sequential (Recommended for first draft)**:
- Draft chapters 1 through N in order
- Maintain narrative momentum
- Don't go back to revise until draft is complete

**Key Scenes First**:
- Draft major beats first (Inciting Incident, Midpoint, Climax)
- Fill in connecting chapters
- Good for ensuring emotional peaks land

**Character Arc Focus**:
- Draft all scenes for protagonist's arc
- Then add supporting character scenes
- Good for maintaining character consistency

## Output Format

Each chapter file (drafts/chapter-XX.md) should include:

```markdown
# Chapter X: [Title]

[Prose content]

---
<!-- Draft Metadata
Word Count: XXXX
Target: XXXX
Status: Draft
Scenes: S001, S002, S003
Last Updated: YYYY-MM-DD
-->
```

Note: This command assumes a complete scene breakdown exists. If scenes are incomplete or missing, suggest running `/fiction.scenes` first.

**File Location Note**: The command will automatically detect whether the story uses single-file (scenes.md) or split structure (scenes/index.md + scenes/chXX-XX.md files) and read from the appropriate files.

