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

2. **Load story documents**: Read from STORY_DIR:
   - **Required**: outline.md (structure, beats, chapters), premise.md (concept, characters overview, **Language & Style Configuration**)
   - **Required**: /memory/principles.md (voice, style, **Writing Language & Style section**)
   - **Optional**: characters/ (character profiles), world/ (world-building docs), research/ (research notes)
   - Note: Not all projects have all documents. Generate scenes based on what's available.
   
   **CRITICAL - Extract Language & Style Settings**:
   - **Writing Language**: The language ALL scene content must be written in
   - **Writing Style**: literary / commercial / genre:[X]
   - **Regional Variant**: For idioms and cultural references in scene descriptions

3. **Execute scene generation workflow**:
   - Load outline.md and extract chapter plan, beats, and pacing notes
   - Load premise.md and extract character arcs, conflict, and theme
   - If characters/ exists: Extract character voices and arc details
   - If world/ exists: Extract setting details for scene descriptions
   - Generate scenes organized by chapter (see Scene Generation Rules below)
   - Generate scene type distribution (action/dialogue/reflection balance)
   - Create emotional beat tracking
   - Validate scene completeness (each chapter has all needed scenes)

4. **Generate scenes.md**: Use `.fiction/templates/scenes-template.md` as structure, fill with:
   - Correct story name from premise.md
   - **Language & Style section** (inherited from premise.md)
   - One section per chapter
   - Each chapter includes: chapter goal, POV, word target, beats to hit
   - Each scene includes: ID, POV, type, goal, conflict, outcome, summary, emotional beat
   - Scene tracking by purpose (plot, character, world-building, relationship)
   - Pacing analysis table
   - Drafting strategy recommendations
   
   **IMPORTANT**: ALL scene descriptions, summaries, and emotional beats MUST be written in the **Writing Language** specified in the story configuration.

5. **Report**: Output path to generated scenes.md and summary:
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

