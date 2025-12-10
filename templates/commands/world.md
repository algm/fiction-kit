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

## Execution Steps

### 1. Setup

Run `{SCRIPT}` from repo root and parse JSON for:
- `STORY_DIR`: Path to the story directory
- `PREMISE_FILE`: Path to premise.md

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

**Core World Bible** (`world/world-bible.md`):
Use `.fiction/templates/world-template.md` as structure.

**Optional Specialized Documents** (create as needed):
- `world/magic-system.md` - If magic exists
- `world/technology.md` - If technology is significant
- `world/cultures/[culture-name].md` - For distinct cultures
- `world/locations/[location-name].md` - For key locations
- `world/history.md` - For detailed timeline
- `world/bestiary.md` - For creatures/beings
- `world/organizations.md` - For factions/groups

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

