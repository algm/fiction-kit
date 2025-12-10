# Scenes Index: [STORY TITLE]

**Input**: Story documents from `/stories/[###-story-name]/`
**Prerequisites**: outline files (required), premise.md (required), characters/ (recommended), world/ (recommended)

**Organization**: Scenes are split into separate files by chapter groups to manage long scene lists efficiently.

---

## Scene File Structure

This scene breakdown is organized into multiple files:

- **scenes-index.md** (this file): Overview, tracking, pacing analysis, and conventions
- **scenes-ch01-05.md**: Detailed scenes for Chapters 1-5 (Act I)
- **scenes-ch06-12.md**: Detailed scenes for Chapters 6-12 (Act II-A)
- **scenes-ch13-18.md**: Detailed scenes for Chapters 13-18 (Act II-B)
- **scenes-ch19-24.md**: Detailed scenes for Chapters 19-24 (Act III)

*Adjust file groupings based on your story's chapter count and structure.*

---

## Language & Style *(inherited from premise.md)*

| Setting | Value |
|---------|-------|
| **Writing Language** | [e.g., Spanish (es)] |
| **Writing Style** | [literary / commercial / genre:X] |

> ⚠️ **Reminder**: All scene summaries, dialogue hints, and emotional beat descriptions MUST be written in the **Writing Language** specified above. This ensures consistency when the `/fiction.draft` command generates prose.

---

## Scene Format Convention

All scenes in the detailed files follow this format:

```markdown
- [ ] S### [POV] **Scene Name** - [Location], [Time]
  - **Type**: [Action/Dialogue/Reflection/Transition]
  - **Goal**: [What POV character wants]
  - **Conflict**: [What opposes them]
  - **Outcome**: [Yes-but / No-and / Yes / No]
  - **Summary**: [2-3 sentence description]
  - **Emotional beat**: [Reader emotion target]
```

---

## Scene Type Definitions

- **Action**: Physical events, movement, confrontation
- **Dialogue**: Conversation-focused, revelation through talk
- **Reflection**: Internal processing, decision-making, emotion
- **Transition**: Moving between locations/times, bridging scenes

---

## Scene Outcome Patterns

Following Scene-Sequel structure:

- **Yes-but**: Goal achieved, but new complication
- **No-and**: Goal failed, and things got worse
- **Yes**: Clean success (use sparingly)
- **No**: Clean failure (use sparingly)

---

## Story Overview

**Total Chapters**: [X]
**Total Scenes**: [Approximately X]
**Average Scenes per Chapter**: [Y]
**Estimated Total Words**: [Z based on word targets]

---

## Scene Distribution by Chapter

| Chapter | Title | Scenes | Est. Words | File Location |
|---------|-------|--------|------------|---------------|
| 1 | [Title] | [X] | [Words] | scenes-ch01-05.md |
| 2 | [Title] | [X] | [Words] | scenes-ch01-05.md |
| 3 | [Title] | [X] | [Words] | scenes-ch01-05.md |
| 4 | [Title] | [X] | [Words] | scenes-ch01-05.md |
| 5 | [Title] | [X] | [Words] | scenes-ch01-05.md |
| 6 | [Title] | [X] | [Words] | scenes-ch06-12.md |
| ... | ... | ... | ... | ... |

---

## Scene Tracking by Purpose

### Plot Advancement Scenes

**Primary plot movers** (scenes that directly advance the main storyline):

| Scene ID | Chapter | Type | What Advances |
|----------|---------|------|---------------|
| S001 | 1 | Action | [Opens story, establishes status quo] |
| S007 | 3 | Action | [Inciting incident] |
| S0XX | [X] | [Type] | [Midpoint turn] |
| S0XX | [X] | [Type] | [All Is Lost] |
| S0XX | [X] | [Type] | [Climax] |

*[List major plot-advancing scenes across the story]*

---

### Character Development Scenes

**Character arc focus** (scenes primarily for character growth):

| Scene ID | Chapter | Character | Development |
|----------|---------|-----------|-------------|
| S002 | 1 | [Protagonist] | [Establishes flaw] |
| S0XX | [X] | [Protagonist] | [Questions lie] |
| S0XX | [X] | [Character 2] | [Relationship development] |

*[List character-focused scenes]*

---

### World-Building Scenes

**Setting establishment** (scenes that establish or expand the world):

| Scene ID | Chapter | Location/Element | What's Established |
|----------|---------|------------------|-------------------|
| S0XX | [X] | [Location] | [What we learn] |
| S0XX | [X] | [System/Rule] | [How it works] |

*[List world-building scenes]*

---

### Relationship Scenes

**Key relationship developments**:

| Scene ID | Chapter | Characters | Relationship Moment |
|----------|---------|------------|---------------------|
| S0XX | [X] | [A & B] | [What develops] |
| S0XX | [X] | [A & C] | [Conflict/growth] |

*[List relationship-focused scenes]*

---

## Pacing Analysis

### Overall Pacing Table

| Chapter | Scene Count | Est. Words | Tension Level | Type Balance | Notes |
|---------|-------------|------------|---------------|--------------|-------|
| 1 | 3 | 3,500 | Low-Medium | 2A, 1D | Setup |
| 2 | 3 | 3,500 | Medium | 1A, 2D | Rising |
| 3 | 4 | 4,000 | Medium-High | 2A, 1D, 1R | Inciting incident |
| ... | ... | ... | ... | ... | ... |

**Type codes**: A=Action, D=Dialogue, R=Reflection, T=Transition

---

### Tension Curve

Track emotional intensity across the story:

```
High |           *           *****
     |         * *         **   **
     |       **   *       *       *
     |     **     *     **         **
     |   **        *  **             **
Low  | **           **                 ***
     +------------------------------------>
       Ch1   Ch6   Ch12  Ch18   Ch22  Ch24
```

**Key tension points**:
- Chapter [X]: [Inciting incident spike]
- Chapter [X]: [Midpoint peak]
- Chapter [X]: [All Is Lost low]
- Chapter [X]: [Climax highest point]

---

### Scene Type Balance

Track variety across acts to ensure pacing diversity:

| Act | Action | Dialogue | Reflection | Transition | Total |
|-----|--------|----------|------------|------------|-------|
| I | [X] | [X] | [X] | [X] | [Total] |
| II-A | [X] | [X] | [X] | [X] | [Total] |
| II-B | [X] | [X] | [X] | [X] | [Total] |
| III | [X] | [X] | [X] | [X] | [Total] |

**Balance notes**:
- [Any acts with too many of one type]
- [Sections that might feel monotonous]
- [Recommended adjustments]

---

## Drafting Strategy

Choose an approach based on your preferences:

### Sequential Approach (Recommended for first draft)

1. Draft Chapter 1 completely using scenes-ch01-05.md
2. Review for flow and hooks
3. Continue to Chapter 2
4. Maintain momentum over polish

**Best for**: Maintaining narrative flow and momentum

---

### Key Scenes First

1. Draft all major beats first (files listed in "Plot Advancement Scenes")
2. Fill in connecting scenes
3. Add texture and depth in revision

**Best for**: Ensuring emotional peaks land correctly

---

### POV Character Focus

1. Draft all [Protagonist] scenes in sequence across files
2. Draft supporting character scenes
3. Review transitions between POVs

**Best for**: Maintaining character voice consistency

---

### Act-by-Act

1. Complete all Act I scenes (scenes-ch01-05.md)
2. Complete all Act II-A scenes (scenes-ch06-12.md)
3. Continue through remaining acts

**Best for**: Ensuring act structure is solid before moving forward

---

## Scene Drafting Notes

### General Guidelines

- Each scene should have a clear purpose (plot, character, or theme)
- Scene endings should propel reader forward
- Balance scene types (not all action, not all dialogue)
- Track time passage between scenes
- Note any scenes that feel redundant or missable
- Mark scenes requiring research with [RESEARCH: topic]

### Before Drafting

- [ ] Review character voices (from characters/ directory)
- [ ] Review world rules and setting details (from world/ directory)
- [ ] Review tone and style guidelines (from /memory/principles.md)
- [ ] Confirm Writing Language and Regional Variant settings

### During Drafting

- Mark completed scenes with [X] in the appropriate scenes-chXX-XX.md file
- Track word counts against targets
- Note any scenes that diverged from plan
- Flag scenes that may need revision

### After Drafting

- Verify all scenes maintain consistent POV
- Check for sensory details and setting grounding
- Ensure hooks at chapter ends
- Validate emotional beats land as intended

---

## Progress Tracking

### Completion Status

Track which scene files are complete:

- [ ] scenes-ch01-05.md (Act I)
- [ ] scenes-ch06-12.md (Act II-A)
- [ ] scenes-ch13-18.md (Act II-B)
- [ ] scenes-ch19-24.md (Act III)

### Scene Completion Count

**Total Scenes**: [X]
**Drafted**: [Y]
**Remaining**: [Z]
**Percentage Complete**: [Y/X * 100]%

---

## Next Steps

1. Review scene files (scenes-ch01-05.md, etc.) and refine as needed
2. Use `/fiction.draft` to begin writing prose
3. Use `/fiction.chapter [number]` to draft individual chapters
4. Use `/fiction.review` to check consistency across scenes

---

## Notes & Adjustments

*Track any changes or insights during the scene breakdown process:*

- [Any scenes added beyond initial plan]
- [Any scenes removed or merged]
- [Pacing adjustments made]
- [Character moments that need stronger setup]
