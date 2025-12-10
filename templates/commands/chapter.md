---
description: Generate a complete chapter draft from outline and scene breakdown.
handoffs: 
  - label: Refine Chapter
    agent: fiction.refine
    prompt: Improve this chapter...
  - label: Review Story
    agent: fiction.review
    prompt: Check consistency...
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

Generate a complete, polished chapter draft by combining scene-level planning with prose generation, following all established voice, style, and character guidelines.

**Single Source of Truth Principle**: Reference information from authoritative locations. Use cross-references when needed.

**See**: [navigation-guide.md](../navigation-guide.md) for the complete information location map.

## Execution Steps

### 1. Setup

Run `{SCRIPT}` from repo root and parse JSON for:
- `STORY_DIR`: Path to story directory
- Construct scenes path from `STORY_DIR/scenes.md` (or `STORY_DIR/scenes/index.md` if split structure exists)

### 2. Load Language & Style Configuration (CRITICAL)

Read `/memory/principles.md` and extract:
- **Writing Language**: ALL prose must be in this language
- **Regional Variant**: For spelling, idioms, cultural references
- **Writing Style**: literary / commercial / genre:[X]
- **Voice settings**: POV, tense, narrative distance, prose style
- **Things to ALWAYS/NEVER do**

**ABORT if Writing Language not defined**.

### 3. Identify Target Chapter

From user input, determine which chapter to draft:
- By number: "chapter 3", "capítulo 5"
- By title: "The Awakening"
- Next in sequence: "next chapter"
- Specific scenes: "scenes S012-S015"

If not specified, suggest starting with the next undrafted chapter.

### 4. Load Chapter Context

**Navigation Setup**:
- Consult `STORY_DIR/navigation-guide.md` to locate authoritative information sources

**From outline files** (load appropriate structure):
- **If split structure exists**:
  - Read outline/chapters.md for chapter goal, emotional arc, POV, word target
  - Read outline/arcs.md for character arc context
- **Otherwise**: Read outline.md for chapter details

**From scenes files** (load appropriate structure):
- **If split structure exists**:
  - Read scenes/index.md for overview
  - Read appropriate scenes/chXX-XX.md file containing this chapter
- **Otherwise**: Read scenes.md for all scenes for this chapter
- Scene details: POV, type, goal, conflict, outcome, emotional beat
- **References field**: Load all linked character, world, and event files from scene References
- Chapter checkpoint (what should be achieved)

**From characters/** (for POV character):
- Load character file from scene References field: `characters/[name].md`
- Voice notes and speech patterns
- Current emotional state (based on prior chapters)
- Knowledge at this point in story

**From world/**:
- Load location files from scene References: `world/world-bible.md#key-locations` or detailed location files
- Load event files if referenced: `world/events/[event].md`
- Load magic/tech files if referenced: `world/magic/[spell].md` or `world/world-bible.md#magic-system`
- Setting details for chapter locations
- Sensory details to include

**From drafts/** (if prior chapters exist):
- Continuity reference
- Established elements to maintain

### 5. Pre-Writing Checklist

Before generating prose:
- [ ] Writing Language confirmed
- [ ] POV character voice loaded
- [ ] All scene summaries understood
- [ ] Emotional arc for chapter mapped
- [ ] Key sensory details for settings noted
- [ ] Continuity from prior chapters checked

### 6. Generate Chapter Prose

**CRITICAL**: ALL prose in the specified **Writing Language**.

**Structure** (write scene by scene):
- Each scene is written to: `drafts/scenes/c[NNN]/c[NNN]s[MMM].md`
  - Format: `c001s001.md`, `c002s001.md`, `c025s002.md`, etc.
- Each scene file follows `.fiction/templates/scene-prose-template.md` structure
- Scenes are written individually, then consolidated using Makefile

**Scene File Format**:
```markdown
# Scene c[NNN]s[MMM]: [Scene Name]

**Chapter**: [N]
**POV**: [Character]
**Location**: [Location Name]
**Time**: [Time of day / Timeline marker]

---

## Prose

[Scene prose content - opening, transitions, ending hook]

---

## Scene Metadata
- **Word Count**: [X words]
- **Status**: Draft
- **Generated**: [DATE]
```

**Prose Generation Rules**:

1. **Follow POV strictly**: 
   - First person: "I" narrator, limited to their perception
   - Third limited: Close to POV character's thoughts
   - Third omniscient: Can access multiple minds, wider view

2. **Maintain tense**:
   - Past: "She walked..." (most common)
   - Present: "She walks..." (immediate, urgent)

3. **Apply Writing Style**:
   - `literary`: Rich prose, subtext, thematic imagery, varied sentences
   - `commercial`: Clear, punchy, forward momentum, strong hooks
   - `genre:[X]`: Genre conventions (romance: emotional interiority; thriller: short sentences in action)

4. **Scene-by-scene execution**:
   - Honor scene goal, conflict, outcome from scenes.md
   - Hit the emotional beat
   - Transition smoothly between scenes
   - End scenes with micro-hooks (except chapter end = major hook)

5. **Character voice in dialogue**:
   - Each character sounds distinct
   - Use speech patterns from profiles
   - Dialogue advances plot OR reveals character (ideally both)

6. **Sensory grounding**:
   - Include appropriate sensory details from world/
   - Anchor scenes in physical space
   - Balance description with action

7. **Show don't tell** (mostly):
   - Convey emotion through action and detail
   - Use telling strategically for pacing
   - Internalize less in action scenes, more in reflection scenes

### 7. Chapter Quality Checks

After generation, verify:
- [ ] All scene files created in correct chapter directory: `drafts/scenes/c[NNN]/`
- [ ] Word count within target range (sum of all scenes)
- [ ] All scenes from scenes.md are included
- [ ] Chapter goal is achieved
- [ ] Emotional arc follows plan
- [ ] POV is consistent across all scenes
- [ ] Tense is consistent across all scenes
- [ ] Character voices are distinct
- [ ] Chapter ends with forward momentum
- [ ] Scene transitions are smooth

### 8. Write Output

**Scene-by-scene structure**: Write each scene to its chapter directory:
- Determine chapter number (NNN) from chapter metadata (zero-padded: 001, 002, etc.)
- Determine scene number within chapter (MMM) by counting existing scenes in that chapter directory (zero-padded: 001, 002, etc.)
- Create chapter directory if it doesn't exist: `drafts/scenes/c[NNN]/` (e.g., `c001/`, `c002/`, `c025/`)
- Save each scene to: `drafts/scenes/c[NNN]/c[NNN]s[MMM].md`
  - Format: `c001s001.md` (Chapter 1, Scene 1)
  - Format: `c002s001.md` (Chapter 2, Scene 1)
  - Format: `c025s002.md` (Chapter 25, Scene 2)
- Use `.fiction/templates/scene-prose-template.md` as structure for each scene file

**Directory Naming**: Use format `c[NNN]` where:
- `NNN` is zero-padded chapter number (001, 002, 003, etc.)

**Scene File Naming**: Use format `c[NNN]s[MMM].md` where:
- `NNN` is zero-padded chapter number (001, 002, 003, etc.)
- `MMM` is zero-padded scene number within the chapter (001, 002, 003, etc.)

**Consolidation**: After writing scenes, use the Makefile to consolidate:
- `make chapters` - Consolidates scenes into chapter files in `drafts/chapters/chapter-[NN]_[name].md`
- `make book` - Consolidates all chapters into `drafts/book.md`

Update scenes: Mark chapter scenes as drafted [X] in the appropriate scenes file (scenes.md or scenes/chXX-XX.md)

**Inserting or moving scenes/chapters**:
- When inserting scenes:
  - Use the existing chapter directory `c[NNN]/`
  - Assign the next available `s[MMM]` within that chapter (zero-padded)
  - If resequencing, rename scene files to keep numbering contiguous
- When moving scenes between chapters:
  - Move to the destination `c[NNN]/`, renumber `s[MMM]`, and update scene metadata
  - Update `drafts/prose-index.md` with the new path and status
  - Update planning files (scenes.md or scenes/chXX-XX.md) to reflect the new order
- After any renumber/move:
  - Re-run `make chapters` (and `make book` if needed) to rebuild outputs
  - Verify paths and references in `drafts/prose-index.md`

### 9. Report

Output:
- Path to generated chapter
- Word count (actual vs. target)
- Scenes covered
- Any deviations from plan (with reasoning)
- Suggested next: `/fiction.refine` or next chapter

## Style Application Examples

**Literary style** (English):
```
The late light slid through the broken window, sketching dusty grids
across the wooden floor. Elena paused at the threshold, breathing in
the scent of time held still—old paper, dry lavender, secrets kept
far too long.
```

**Commercial style** (English):
```
Elena shoved the door. The smell hit first: dust, dead lavender,
something else. Something that shouldn’t be there. She stepped in,
each board creaking. Her grandmother’s house kept secrets. She was
going to find them.
```

**Genre: Thriller** (English):
```
Thirty seconds. That was all she had.

Elena crossed the threshold. Darkness. Stale air. She moved on instinct,
shoulder to the wall, eyes adjusting.

Twenty seconds.

The stairs. She had to reach the stairs.
```

## Context

{ARGS}

