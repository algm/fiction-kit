---
description: Create or expand world-building documentation for settings, rules, history, and lore.
handoffs: 
  - label: Create Character
    agent: fiction.character
    prompt: Create a character profile for...
  - label: Develop Story
    agent: fiction.develop
    prompt: Help clarify and develop elements...
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

Create comprehensive world-building documentation that establishes settings, rules (magic/technology), history, cultures, and all elements that make the story world consistent and immersive.

**Single Source of Truth Principle**: World-building information should exist in ONE authoritative location. Use cross-references (markdown links) when referencing world elements from other files (scenes, characters, etc.).

**See**: [navigation-guide.md](../navigation-guide.md) for the complete information location map.

## Execution Steps

### 1. Setup

Run `{SCRIPT}` from repo root and parse JSON for:
- `STORY_DIR`: Path to the story directory
- `PREMISE_FILE`: Path to premise.md

**Navigation Setup**:
- Create `STORY_DIR/navigation-guide.md` from `.fiction/templates/navigation-guide.md` if it doesn't exist
- This file will serve as the master index for all story information

### 2. Load Language & Style Configuration (CRITICAL)

Read `/memory/principles.md` and extract:
- **Writing Language**: ALL world-building content must be in this language
- **Writing Style**: Affects description depth and tone
- **Regional Variant**: For culturally appropriate references

Read PREMISE_FILE for:
- Setting overview (world type, time period)
- Genre requirements (affects world-building depth)
- Existing world elements

- **Load Genre-Specific World-Building Guidance**:
  - If Writing Style is `genre:fantasy`, read `.fiction/templates/guidance/genres/fantasy.md` for fantasy world-building requirements (magic systems, cultures, geography, history, economy)
  - If Writing Style is `genre:scifi`, apply similar sci-fi world-building conventions (technology systems, future societies, scientific rigor)
  - If Writing Style is `genre:thriller`, read `.fiction/templates/guidance/genres/thriller.md` for thriller setting requirements (atmospheric locations, supports tension and danger)
  - If Writing Style is `literary`, read `.fiction/templates/guidance/styles/literary.md` for integrated, symbolic world-building approach
  - If Writing Style is `commercial`, read `.fiction/templates/guidance/styles/commercial.md` for accessible world-building that supports plot
  - **Apply this guidance** to world development throughout

### 3. Determine World-Building Scope

Based on user input and story needs, identify focus:

| World Type | Key Elements to Define |
|------------|----------------------|
| **Real World** | Specific location details, time period accuracy, cultural nuances |
| **Real + Supernatural** | Real world base + supernatural rules, how magic is hidden/revealed |
| **Alternate History** | Point of divergence, cascading differences, what stayed same |
| **Secondary World** | Geography, cultures, history, magic/technology, religions |
| **Futuristic/Sci-Fi** | Technology level, social changes, what's lost/gained |

### 4. Create World Documents

Create `STORY_DIR/world/` directory if needed.

**Directory Structure** (creates these as needed):
```
world/
├── world-bible.md              # Main world document (single source of truth)
├── events/                     # Detailed historical event files (optional)
│   └── [event-name].md
├── magic/                      # Detailed spell/ability files (optional)
│   └── [spell-name].md
├── cultures/                   # Detailed culture files (optional, if needed)
│   └── [culture-name].md
└── locations/                  # Detailed location files (optional, if needed)
    └── [location-name].md
```

**Note**: Only create subdirectories as needed. Simple stories may only need world-bible.md. Complex world-building benefits from separate event and magic files.
    └── [spell-name].md
```

**Core World Bible** (`world/world-bible.md`):
Use `.fiction/templates/world-template.md` as structure.

**Cross-Reference System**:
- **For major historical events** that need extensive detail (multiple factions, complex timeline, character involvement):
  - Create separate files in `world/events/[event-name].md` using `.fiction/templates/world-event-template.md`
  - Link from world-bible.md timeline: `[Event Name](events/event-name.md)`
  - This keeps world-bible.md manageable while providing detailed context

- **For specific spells/abilities** that are complex or frequently used:
  - Create separate files in `world/magic/[spell-name].md` using `.fiction/templates/magic-ability-template.md`
  - Link from world-bible.md magic system: `[Spell Name](magic/spell-name.md)`
  - Include mechanics, costs, counters, and story usage

**Optional Specialized Documents** (create as needed):
- `world/cultures/[culture-name].md` - For distinct cultures
- `world/locations/[location-name].md` - For key locations requiring extensive detail

### 5. World-Building by Category

**Geography & Environment**:
- Map overview (describe, don't require visual)
- Key locations with atmosphere
- Climate and its story impact
- Natural resources and conflicts they create

**History & Lore**:
- Creation myth or origin (if relevant)
- Key historical events that affect present
- What's forgotten/hidden (story potential)
- Timeline with story-relevant dates

**Society & Culture**:
- Social structure and mobility
- Government and politics
- Economy and trade
- Religion and beliefs
- Daily life details
- Art, music, customs

**Magic/Technology System** (if applicable):
- Clear rules (hard magic) or mysterious limits (soft magic)
- Costs and consequences
- Who can use it
- How it's viewed by society

**Language Configuration**:
- In-world languages (names, phrases)
- Naming conventions for people and places
- How to represent foreign speech

### 6. Apply Language & Style

**CRITICAL**: ALL content must be in the story's **Writing Language**.

**Writing Style affects world-building**:
- `literary`: Atmospheric descriptions, symbolic meanings
- `commercial`: Functional details, story-relevant focus
- `genre:[X]`: Genre-appropriate depth (epic fantasy = deep, thriller = minimal)

**Sensory Details Section** - Include:
- What does this world smell like?
- What sounds fill the air?
- What textures are common?
- What flavors define the cuisine?

### 7. Consistency Rules

Generate a "Rules of This World" section:
- Hard rules that cannot be broken
- Soft rules with exceptions
- What's different from our world
- What's surprisingly the same

### 8. Story Integration

Map world elements to story needs:
- Which locations are scene-critical?
- Which world rules affect plot?
- What world elements reveal theme?

**Cross-Reference Creation**:
When world elements connect to other story documents:

```markdown
<!-- In world-bible.md, link to where elements are used -->
- **Story Scenes Using This Location**: [Scene 3](../scenes/ch01-05.md#scene-003)
- **Characters from This Culture**: [Protagonist](../characters/protagonist.md)
- **Timeline References**: Link events from timeline table to detailed event files

<!-- In other files, link back to world-bible.md -->
<!-- From scenes/ch01-05.md: -->
The scene takes place in [The Rusty Anchor](../world/world-bible.md#key-locations)...
During [the Revolution](../world/events/1847-revolution.md)...
She cast [Lumina's Shield](../world/magic/luminas-shield.md)...
```

**Reference Tracking**: Add "Referenced In" sections to detailed event and magic files listing all scenes, characters, and prose that reference them.

### 9. Validation

- [ ] All content in Writing Language
- [ ] Key locations defined for all major scenes
- [ ] Magic/tech rules are clear (if applicable)
- [ ] Culture supports character backgrounds
- [ ] History provides necessary context
- [ ] Sensory details for immersion
- [ ] No contradictions with premise

### 10. Report

- Output paths to created world documents
- Summarize key elements defined
- List elements that need more development
- Suggest: `/fiction.character` for characters rooted in this world

## World-Building Depth by Genre

| Genre | Recommended Depth |
|-------|-------------------|
| Epic Fantasy | Deep - extensive history, magic system, cultures |
| Urban Fantasy | Moderate - real world + hidden supernatural layer |
| Science Fiction | Deep for tech, moderate for society |
| Romance | Light - setting supports character dynamics |
| Thriller | Minimal - only what affects plot |
| Literary | Variable - thematic relevance determines depth |
| Mystery | Moderate - procedural details, location atmosphere |
| Historical | Deep for accuracy - research-backed |

## Templates Structure

Main world bible sections:
1. Overview (summary, tone, comparable worlds)
2. Geography (locations, climate, environment)
3. History (timeline, key events, secrets)
4. Society & Culture (structure, politics, economy, religion, daily life)
5. Magic/Technology (rules, costs, practitioners)
6. Organizations & Factions (groups, relationships)
7. Creatures & Beings (races, monsters)
8. Sensory Details (sights, sounds, smells, tastes, textures)
9. Story-Specific Notes (how world elements drive the plot)

## Context

{ARGS}

