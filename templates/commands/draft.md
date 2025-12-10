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

## Outline

1. Run `{SCRIPT}` from repo root and parse STORY_DIR and AVAILABLE_DOCS list. All paths must be absolute.

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

4. **Drafts Directory Setup**:
   - Create STORY_DIR/drafts/ directory if it doesn't exist
   - Each chapter will be saved as `chapter-XX.md`
   - Maintain draft metadata (word count, status, last edited)

5. Parse scenes structure and extract:
   - **Chapters**: Ordered list with goals and POV
   - **Scenes per chapter**: Scene details with all metadata (from appropriate file)
   - **Pacing notes**: Tension levels and emotional beats
   - **Word targets**: Per-chapter word count goals
   
   **Note**: If using split structure, load scenes from the appropriate scenes-chXX-XX.md file(s) as needed for each chapter.

6. Execute drafting following the scene plan:
   - **Chapter-by-chapter**: Complete each chapter before moving to the next
   - **Scene-by-scene within chapters**: Write scenes in order
   - **Follow principles.md**: Maintain voice, style, and rules throughout
   - **Track word counts**: Compare against targets
   - **Mark progress**: Update scenes.md as scenes are drafted

7. **Drafting execution rules**:
   
   **Before each chapter**:
   - Review chapter goal and beats to hit
   - Review POV character's voice (from characters/ if available)
   - Note emotional arc for the chapter
   
   **For each scene**:
   - Write prose following the scene summary and emotional beat
   - Include sensory details appropriate to setting
   - End scenes with forward momentum (especially chapter-ending scenes)
   - Maintain consistent POV and tense per principles.md
   
   **After each chapter**:
   - Save to drafts/chapter-XX.md
   - Update word count tracking
   - Mark scenes as complete in scenes.md

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

