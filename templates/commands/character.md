---
description: Create or develop a detailed character profile including backstory, psychology, arc, and voice.
handoffs: 
  - label: Create World Elements
    agent: fiction.world
    prompt: Build world elements related to this character...
  - label: Develop Story
    agent: fiction.develop
    prompt: Clarify story elements...
  - label: Chat with Character
    agent: fiction.chat
    prompt: Have a conversation with this character...
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

Create comprehensive character profiles that establish identity, psychology, motivation, relationships, arc, and distinctive voice for each significant character.

**Single Source of Truth Principle**: Each character's information should exist in ONE file (`characters/[character-name].md`). Use cross-references (markdown links) when referencing characters from other files.

**See**: [navigation-guide.md](../navigation-guide.md) for the complete information location map.

## Execution Steps

### 1. Setup

Run `{SCRIPT}` from repo root and parse JSON for:
- `STORY_DIR`: Path to the story directory
- `PREMISE_FILE`: Path to premise.md

**Navigation Setup**:
- Ensure `STORY_DIR/navigation-guide.md` exists (create from template if needed)
- This file serves as the master index for locating character information

### 2. Load Language & Style Configuration (CRITICAL)

Read `/memory/principles.md` and extract:
- **Writing Language**: ALL character content must be in this language
- **Writing Style**: Affects character depth and description approach
- **Regional Variant**: For culturally appropriate names and references

Read PREMISE_FILE for:
- Character overview from premise
- Story theme (character should explore theme)
- Central conflict (character's relationship to it)

- **Load Style-Specific Character Guidance**:
  - If Writing Style is `literary`, read `.fiction/templates/guidance/styles/literary.md` for literary character depth requirements (complex, contradictory characters with psychological depth, ambiguous morality)
  - If Writing Style is `commercial`, read `.fiction/templates/guidance/styles/commercial.md` for commercial character requirements (relatable, clear wants/needs, active protagonists with satisfying arcs)
  - If Writing Style is `genre:fantasy`, read `.fiction/templates/guidance/genres/fantasy.md` for fantasy character archetypes and considerations
  - If Writing Style is `genre:thriller`, read `.fiction/templates/guidance/genres/thriller.md` for thriller protagonist/antagonist requirements (competent, resourceful, vulnerable)
  - If Writing Style is `genre:scifi`, `genre:romance`, `genre:mystery`, or `genre:horror`, apply similar genre character conventions
  - **Apply this guidance** to character development throughout

### 3. Identify Character to Develop

Based on user input, determine:
- Character name (or generate one appropriate to world/culture)
- Role: Protagonist / Antagonist / Supporting / Minor
- Relationship to main story conflict

### 4. Create Character Profile

Create `STORY_DIR/characters/` directory if needed.
Create file: `characters/[character-name].md`

Use `.fiction/templates/character-template.md` as structure.

### 5. Character Development Sections

**Language & Voice Configuration**:
- Story's Writing Language
- Character's native language (if different from narrative)
- Accent/dialect markers
- Formality level

**Core Identity**:
- Full name and any aliases
- Age, gender, pronouns
- Physical appearance (what readers will visualize)
- First impression (what people notice)

**The Wound & Lie**:
- **The Wound**: Formative painful experience
- **The Lie They Believe**: False belief born from wound
- **The Truth They Need**: What they must learn
- **The Ghost**: Specific haunting memory

This is the engine of character arc.

**Want vs. Need**:
- **Want** (External Goal): What they consciously pursue
- **Need** (Internal Goal): What they actually need
- These SHOULD be different for interesting characters

**Personality & Traits**:
- Core traits (3-5 dominant characteristics)
- Strengths (skills, virtues)
- Weaknesses (flaws, blind spots)
- Quirks and habits
- How they behave under stress

**Background**:
- Origin and family
- Key life events (connect to wound)
- Education and skills
- How past shapes present

**Relationships**:
- Key relationship dynamics
- How they show affection
- Conflict style
- Trust patterns

**Arc Tracking**:
- Beginning state (belief, behavior)
- Midpoint shift (what cracks the lie)
- End state (transformation)
- Arc type: Positive / Flat / Negative / Disillusionment

**Voice & Dialogue**:
- Speaking style and patterns
- Vocabulary level
- Verbal tics and favorite phrases
- What they avoid talking about
- Sample dialogue (stress, casual, formal)

### 6. Apply Language & Style

**CRITICAL**: ALL content in the story's **Writing Language**.

**Writing Style affects character depth**:
- `literary`: Deep psychology, symbolic elements, subtext
- `commercial`: Clear motivations, relatable flaws, active goals
- `genre:[X]`: Genre-appropriate tropes and archetypes

**Sample dialogue MUST be in Writing Language**:
- Shows how character actually speaks
- Different registers for different situations
- Reflects their background and education

### 7. Character-World Integration

Connect character to world elements using **cross-references**:

**Location Links**:
- Birthplace: Link to `world/world-bible.md#key-locations`
- Home: Link to relevant location
- Significant places in background

**Historical Event Links**:
- Key life events that tie to world history: Link to `world/events/[event-name].md` or `world/world-bible.md#timeline`
- "The Ghost" event if it involves historical context

**Magic/Tech Links**:
- Abilities or skills: Link to `world/world-bible.md#magic-system` or `world/magic/[ability-name].md`
- Technology use or expertise

**Organization Links**:
- Memberships: Link to `world/world-bible.md#organizations`
- Political affiliations

**Character Relationship Links**:
- Family members: Link to other character files `characters/[name].md`
- Friends, enemies, love interests: Link to their profiles
- Mentors: Link to their profiles

**Example Cross-References**:
```markdown
<!-- In character file -->
- **Birthplace**: [Barcelona](../world/world-bible.md#key-locations)
- **Key Life Event**: Witnessed [the Plaza Massacre](../world/events/plaza-massacre.md) at age 12
- **Abilities**: Trained in [Fire Binding](../world/magic/fire-binding.md)
- **Relationships**: Daughter of [Maria Santos](maria-santos.md), enemy of [The Guild](../world/world-bible.md#organizations)
```

### 8. Character-Story Integration

Map character to story needs and **create forward references**:

**Scene Appearances**:
- Link to scenes where this character appears: `scenes/ch01-05.md#scene-X`
- Link to prose files where they're featured: `drafts/scenes/s001-opening.md`

**Plot Function**:
- Link to relevant theme from premise: `premise.md#theme`
- Connection to central conflict

**Character Arc Tracking**:
- Link to outline arcs: `outline/arcs.md` (if split structure) or `outline.md#character-arcs`

**Example Story Integration**:
```markdown
<!-- In character file -->
### First Appearance
- **Scene**: [S001 - Opening Scene](../scenes/ch01-05.md#scene-001)
- **Prose**: [Opening prose file](../drafts/scenes/s001-opening.md)

### Key Scenes
1. [S001](../scenes/ch01-05.md#scene-001) - Introduction
2. [S015](../scenes/ch06-12.md#scene-015) - Revelation
3. [S042](../scenes/ch13-18.md#scene-042) - Climax

### Thematic Function
Represents [redemption theme](../premise.md#theme)
```

### 9. Validation

- [ ] All content in Writing Language
- [ ] Name fits world/culture
- [ ] Wound, Lie, Truth defined (main characters)
- [ ] Want differs from Need
- [ ] Flaw is actionable (shown, not told)
- [ ] Arc tracked if significant character
- [ ] Voice is distinct with sample dialogue
- [ ] Relationships to other characters defined
- [ ] Role in story is clear

### 10. Report

- Output path to created character profile
- Summarize: role, arc type, key relationships
- List elements that need development
- Suggest next:
  - `/fiction.character` for related characters
  - `/fiction.chat` to explore this character through conversation
  - `/fiction.world` for world elements related to character

## Character Role Guidelines

### Protagonist
- Must have clear Want and Need
- Wound and Lie are essential
- Arc is central to story
- Deepest development required

### Antagonist
- Must have compelling motivation (not evil for evil's sake)
- May have their own Wound and Lie
- Should challenge protagonist's beliefs
- Equal development to protagonist recommended

### Supporting Characters
- Should have relationship function (mentor, ally, rival, love interest)
- Need at least one defining trait and motivation
- May have simpler arc or serve protagonist's arc
- Distinct voice required

### Minor Characters
- Clear function in scene
- One memorable trait
- Brief voice notes
- No arc required

## Character Voice Quick Reference

Include at end of profile:

```markdown
## AI Writing Notes

When writing [Character Name]:
- Speaks in [sentence style]
- Uses [vocabulary type]
- Often says "[catchphrase or verbal tic]"
- Never says/does [thing to avoid]
- Under stress: [behavior]
- Key relationship dynamic: [with protagonist]
```

## Context

{ARGS}

