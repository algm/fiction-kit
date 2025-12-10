---
description: Generate an actionable, chapter-organized scenes.md for the story based on the outline and available story artifacts.
handoffs: 
  - label: Analyze For Consistency
    agent: fiction.review
    prompt: Run a story analysis for consistency
    send: true
  - label: Write Draft
    agent: fiction.draft
    prompt: Start drafting the story
    send: true
scripts:
  sh: scripts/bash/check-prerequisites.sh --json
  ps: scripts/powershell/check-prerequisites.ps1 -Json
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `{SCRIPT}` from repo root and parse STORY_DIR and AVAILABLE_DOCS list. All paths must be absolute.
   
   **Determine scenes structure**:
   - **Single-file**: Use scenes.md for shorter stories (default, < 20 scenes total)
   - **Split structure**: Use multiple scene files for longer stories (recommended for 20+ scenes):
     - `scenes-index.md` - Overview, tracking, pacing analysis
     - `scenes-ch01-05.md` - Scenes for chapters 1-5 (typically Act I)
     - `scenes-ch06-12.md` - Scenes for chapters 6-12 (typically Act II-A)
     - `scenes-ch13-18.md` - Scenes for chapters 13-18 (typically Act II-B)
     - `scenes-ch19-24.md` - Scenes for chapters 19-24 (typically Act III)
     - Adjust chapter groupings based on actual story structure
   
   If user specifies preference with "--split" or "--single" in arguments, honor that.
   Otherwise, suggest split structure for stories with many chapters or complex scene requirements.

2. **Load story documents**: Read from STORY_DIR:
   - **Required**: premise.md (concept, characters overview, **Language & Style Configuration**)
   - **Required**: /memory/principles.md (voice, style, **Writing Language & Style section**)
   - **Required - Outline files**: Load outline information:
     - **If split structure exists**: Read outline-index.md, outline-acts.md, outline-chapters.md, outline-arcs.md
     - **Otherwise**: Read outline.md
   - **Optional**: characters/ (character profiles), world/ (world-building docs), research/ (research notes)
   - Note: Not all projects have all documents. Generate scenes based on what's available.
   
   **CRITICAL - Extract Language & Style Settings**:
   - **Writing Language**: The language ALL scene content must be written in
   - **Writing Style**: literary / commercial / genre:[X]
   - **Regional Variant**: For idioms and cultural references in scene descriptions

3. **Execute scene generation workflow**:
   - Load outline files and extract chapter plan, beats, and pacing notes
   - Load premise.md and extract character arcs, conflict, and theme
   - If characters/ exists: Extract character voices and arc details
   - If world/ exists: Extract setting details for scene descriptions
   - Determine total chapter count and scene count to decide on file structure
   - Generate scenes organized by chapter (see Scene Generation Rules below)
   - Generate scene type distribution (action/dialogue/reflection balance)
   - Create emotional beat tracking
   - Validate scene completeness (each chapter has all needed scenes)

4. **Generate scenes files**:
   
   **For single-file structure**:
   - Use `.fiction/templates/scenes-template.md` as structure
   - Fill with all scenes in one scenes.md file
   - Include all tracking and pacing analysis
   
   **For split structure**:
   - Use `.fiction/templates/scenes-index-template.md` for scenes-index.md:
     - Story overview and scene statistics
     - Scene tracking by purpose (plot, character, world, relationship)
     - Pacing analysis and tension curve
     - Drafting strategy recommendations
   - Use `.fiction/templates/scenes-chapter-group-template.md` for each chapter group file:
     - Group chapters logically by act or by groups of 5-7 chapters
     - Each file contains detailed scene breakdowns for its chapters
     - Include transition notes between sections
   - Ensure consistent Language & Style section in all files
   - Cross-reference files appropriately

5. **Report**: Output path(s) to generated scenes file(s) and summary:
   - Note whether using single-file or split structure
   - If split: list all scene files created
   - Total scene count
   - Scene count per chapter
   - Scene type distribution
   - Emotional arc summary
   - Suggested drafting approach

Context for scene generation: {ARGS}

The scenes.md should be immediately usable - each scene must be specific enough that the writer (human or AI) can draft it without additional context.

## Scene Generation Rules

**CRITICAL**: Scenes MUST be organized by chapter to enable focused drafting sessions.

### Scene Format (REQUIRED)

Every scene MUST strictly follow this format:

```text
- [ ] S### [POV] **Scene Name** - [Location], [Time]
  - **Type**: [Action/Dialogue/Reflection/Transition]
  - **Goal**: [What POV character wants]
  - **Conflict**: [What opposes them]
  - **Outcome**: [Yes-but / No-and / Yes / No]
  - **Summary**: [2-3 sentence description]
  - **Emotional beat**: [Reader emotion target]
```

### Scene Types

- **Action**: Physical events, movement, confrontation
- **Dialogue**: Conversation-focused, revelation through talk
- **Reflection**: Internal processing, decision-making, emotion
- **Transition**: Moving between locations/times, bridging scenes

### Scene Outcomes (Scene-Sequel Pattern)

- **Yes-but**: Goal achieved, but new complication
- **No-and**: Goal failed, and things got worse
- **Yes**: Clean success (use sparingly)
- **No**: Clean failure (use sparingly)

### Chapter Organization

Each chapter should include:
1. **Chapter Goal**: What must be accomplished
2. **POV**: Primary point-of-view character
3. **Word Target**: Estimated word count
4. **Beats to Hit**: Key story beats from outline

### Scene Distribution Guidelines

- Mix scene types for pacing variety
- Avoid more than 3 consecutive scenes of same type
- Every chapter should end with a hook
- Balance dialogue-heavy and action-heavy chapters
- Include breathing room after intense sequences

### Tracking Purposes

Tag scenes by their primary story function:
- **Plot**: Advances main storyline
- **Character**: Develops character depth/arc
- **World**: Establishes or expands setting
- **Relationship**: Develops key relationships
- **Theme**: Illuminates central theme

A scene can serve multiple purposes - note the primary one.

