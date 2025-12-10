---
description: Develop detailed history, timelines, and historical events that shape your story world.
handoffs: 
  - label: Create World Elements
    agent: fiction.world
    prompt: Expand world-building based on this history...
  - label: Create Character
    agent: fiction.character
    prompt: Create a character who lived through this event...
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --paths-only
  ps: scripts/powershell/check-prerequisites.ps1 -Json -PathsOnly
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Goal

Develop comprehensive historical foundations for your story world, including timelines, key events, and the historical context that shapes the present narrative. History should support the story's theme and provide depth without overwhelming the reader.

**Single Source of Truth Principle**: Historical information should exist in ONE authoritative location. Use cross-references (markdown links) when referencing historical events from other files.

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

## Execution Steps

### 1. Setup

Run `{SCRIPT}` from repo root and parse JSON for:
- `STORY_DIR`: Path to the story directory
- `PREMISE_FILE`: Path to premise.md

**Navigation Setup**:
- Ensure `STORY_DIR/navigation-guide.md` exists (create from template if needed)

### 2. Load Language & Style Configuration (CRITICAL)

Read `/memory/principles.md` and extract:
- **Writing Language**: ALL historical content must be in this language
- **Writing Style**: Affects historical depth and presentation
- **Regional Variant**: For culturally appropriate historical references

Read PREMISE_FILE for:
- Time period and setting
- Genre requirements (historical accuracy needs)
- Existing historical elements mentioned
- Central theme (history should support theme)

### 3. Determine Historical Scope

Based on user input and story needs, identify focus:

| Story Type | Historical Depth Needed |
|-----------|----------------------|
| **Real World** | Research-backed accuracy, specific dates, real events |
| **Alternate History** | Point of divergence, cascading changes, what stayed same |
| **Secondary World** | Creation/origin, major epochs, key turning points |
| **Futuristic/Sci-Fi** | Past that led to present, what was lost/gained |
| **Urban Fantasy** | Hidden history, supernatural events, secret wars |

**Key Principle**: Develop history that **affects the present story**. Not everything needs deep detail—focus on events that:
- Shape current politics/society
- Create character motivations
- Provide plot complications
- Support thematic exploration

### 4. Load Existing World Documents

Read `STORY_DIR/world/world-bible.md` (create if needed) to check:
- Existing timeline entries
- Historical events already mentioned
- Gaps that need filling

### 5. Create Historical Structure

**Directory Structure** (create as needed):
```
world/
├── world-bible.md              # Main document with timeline overview
└── events/                     # Detailed historical event files
    └── [event-name].md
```

**Timeline Organization**:
- **Overview Timeline**: In `world/world-bible.md#timeline` (table format)
- **Detailed Events**: Separate files in `world/events/[event-name].md` for complex events

### 6. Develop Historical Elements

**Creation/Origin** (if applicable):
- How did this world come to be?
- Creation myths vs. actual history
- What's forgotten or hidden?

**Major Epochs/Periods**:
- Define distinct historical periods
- What marks transitions between periods?
- How do periods differ in culture, technology, society?

**Key Historical Events**:
For each significant event, develop:

1. **Event Basics**:
   - Name and date (or relative time)
   - Location(s) affected
   - Duration and scale

2. **Causes**:
   - What led to this event?
   - Underlying tensions or conflicts
   - Triggering incident

3. **Key Participants**:
   - Major factions/individuals involved
   - Their motivations
   - Link to character files if characters were involved

4. **Consequences**:
   - Immediate effects
   - Long-term changes to society
   - How it shapes the present story
   - What was lost/gained

5. **Hidden Truths**:
   - What's publicly known vs. what actually happened?
   - Secrets that could affect the plot
   - Misconceptions characters might have

**Historical Secrets**:
- What's been forgotten or suppressed?
- Lost knowledge or technologies
- Events that "never happened" (but did)
- These create story potential

**Timeline Construction**:
Create a chronological timeline table in `world/world-bible.md`:

```markdown
| Date/Period | Event | Significance | Link |
|-------------|-------|-------------|------|
| -5000 | [Creation/Origin] | World's beginning | - |
| -2000 | [Major Event] | Shaped society | [Event Name](events/event-name.md) |
| -500 | [War/Revolution] | Current political structure | [Event Name](events/event-name.md) |
| -50 | [Recent Event] | Directly affects plot | [Event Name](events/event-name.md) |
| Present | Story begins | - | - |
```

### 7. Create Detailed Event Files

For complex events that need extensive detail, create `world/events/[event-name].md`:

**Event File Structure**:
```markdown
# [Event Name]

**Date**: [Specific date or relative time]
**Location**: [Where it occurred]
**Duration**: [How long it lasted]
**Scale**: [Local / Regional / Global]

## Overview

[2-3 paragraph summary of the event]

## Causes

[What led to this event]

## Key Participants

- **[Faction/Person]**: [Role and motivation]
- Link to character files if applicable: [Character Name](../characters/name.md)

## The Event

[Detailed account of what happened]

## Immediate Consequences

[Short-term effects]

## Long-Term Impact

[How it changed the world]
- Political changes
- Social changes
- Cultural shifts
- Technological/magical developments

## Hidden Truths

[What's not publicly known]

## Story Connections

- **Referenced In**: [Link to scenes/characters that reference this]
- **Plot Relevance**: [How this event affects the current story]
```

### 8. Historical-Story Integration

**Map History to Story Needs**:
- Which historical events directly affect the plot?
- What historical knowledge do characters need?
- What secrets from history could be revealed?
- How does history support the theme?

**Cross-Reference Creation**:
When historical events connect to other story documents:

```markdown
<!-- In world-bible.md timeline -->
| 1847 | [The Revolution](events/1847-revolution.md) | Changed government structure |

<!-- In character file -->
- **Key Life Event**: Witnessed [the Revolution](../world/events/1847-revolution.md) at age 12

<!-- In scene planning -->
- **Historical Context**: Takes place during aftermath of [the Revolution](../world/events/1847-revolution.md)
```

**Reference Tracking**: Add "Referenced In" sections to event files listing all scenes, characters, and prose that reference them.

### 9. Apply Best Practices

**Show, Don't Tell**:
- Reveal history through character dialogue, artifacts, ruins
- Avoid info-dumps—integrate naturally
- Let readers discover history alongside characters

**Internal Logic**:
- Events should have logical causes and consequences
- Timeline must be consistent
- No contradictions with established world elements

**Relevance Over Completeness**:
- Focus on history that matters to the story
- Not every period needs equal detail
- Develop depth where it serves the narrative

**Sensory History**:
- What do historical sites look/sound/smell like?
- What artifacts remain?
- How is history remembered (monuments, stories, songs)?

### 10. Validation

- [ ] All content in Writing Language
- [ ] Timeline is chronologically consistent
- [ ] Events have clear causes and consequences
- [ ] Historical elements support story theme
- [ ] No contradictions with existing world/character files
- [ ] Cross-references are accurate
- [ ] History affects present story in meaningful ways

### 11. Report

- Output paths to created/updated historical documents
- Summarize key historical periods and events
- List events that directly affect the plot
- Identify historical secrets that could drive story
- Suggest next:
  - `/fiction.world` for other world elements
  - `/fiction.character` for characters shaped by history
  - `/fiction.develop` to explore how history affects plot

## Historical Depth Guidelines

| Genre | Recommended Historical Depth |
|-------|----------------------------|
| Epic Fantasy | Deep - extensive timeline, major wars, ancient secrets |
| Urban Fantasy | Moderate - hidden history, supernatural events |
| Science Fiction | Deep for past that led to future, moderate for ancient history |
| Historical Fiction | Very Deep - research-backed accuracy required |
| Thriller | Minimal - only history that affects current plot |
| Literary | Variable - history that supports thematic exploration |

## Context

{ARGS}
