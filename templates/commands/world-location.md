---
description: Develop detailed locations with rich sensory details that immerse readers in your story world.
handoffs: 
  - label: Plan Scenes
    agent: fiction.scenes
    prompt: Plan scenes set in this location...
  - label: Create World Elements
    agent: fiction.world
    prompt: Expand world-building for this region...
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

Create vivid, immersive locations that ground your story in physical space. Locations should be memorable, support the story's mood, and provide rich sensory details that bring scenes to life.

**Single Source of Truth Principle**: Location information should exist in ONE authoritative location. Use cross-references (markdown links) when referencing locations from other files.

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
- **Writing Language**: ALL location content must be in this language
- **Writing Style**: Affects description depth and tone
- **Regional Variant**: For culturally appropriate references

Read PREMISE_FILE for:
- Setting and time period
- Genre requirements
- Existing locations mentioned
- Central theme (locations should support theme)

### 3. Determine Location Scope

Based on user input and story needs, identify focus:

| Location Type | Development Needed |
|--------------|-------------------|
| **Scene-Specific** | Detailed room/building where key scenes occur |
| **City/Town** | Neighborhoods, districts, key buildings, atmosphere |
| **Region** | Geography, climate, settlements, travel routes |
| **Natural Feature** | Landscape, ecosystem, weather patterns, resources |
| **Interior Space** | Architecture, layout, furnishings, atmosphere |

**Key Principle**: Develop locations that **serve the story**. Focus on:
- Locations where important scenes occur
- Places that create mood/atmosphere
- Settings that support character development
- Environments that drive plot

### 4. Load Existing World Documents

Read `STORY_DIR/world/world-bible.md` (create if needed) to check:
- Existing location information
- Geography already defined
- Gaps that need filling

### 5. Create Location Structure

**Directory Structure** (create as needed):
```
world/
├── world-bible.md              # Main document with location overview
└── locations/                  # Detailed location files (if needed)
    └── [location-name].md
```

**Organization**:
- **Overview**: In `world/world-bible.md#geography` or `#key-locations` (for simple locations)
- **Detailed Locations**: Separate files in `world/locations/[location-name].md` for locations requiring extensive detail

### 6. Develop Location Elements

**Physical Description**:
- **Geography**: Terrain, elevation, natural features
- **Climate**: Temperature, seasons, weather patterns
- **Architecture**: Building styles, materials, layout (if built environment)
- **Scale**: Size, boundaries, how it's organized
- **Natural Features**: Rivers, mountains, forests, etc.

**Sensory Details** (CRITICAL for immersion):

**Sight**:
- Colors, lighting, visual atmosphere
- What stands out visually?
- Time-of-day variations
- Seasonal changes

**Sound**:
- Ambient noise (traffic, nature, machinery)
- Distinctive sounds
- Quiet vs. loud areas
- How sound carries

**Smell**:
- Dominant scents (food, industry, nature, decay)
- Pleasant vs. unpleasant odors
- How smell changes by location/weather
- Distinctive aromas that identify the place

**Touch/Texture**:
- Ground surfaces (cobblestone, dirt, metal)
- Air quality (humid, dry, dusty)
- Temperature variations
- Textures characters encounter

**Taste** (if relevant):
- Air quality affecting taste
- Local food/drink flavors
- Environmental tastes (salt air, smoke, etc.)

**Atmosphere & Mood**:
- **Overall Feel**: Safe, dangerous, mysterious, welcoming, oppressive?
- **Time of Day Effects**: How does it change?
- **Weather Effects**: How does weather alter the mood?
- **Emotional Resonance**: What emotions does this place evoke?

**History & Significance**:
- **Historical Importance**: What happened here?
- **Cultural Significance**: What does it mean to locals?
- **Secrets**: Hidden aspects, forgotten history
- **Stories**: Legends, rumors, local tales

**Inhabitants & Activity**:
- **Who Lives/Works Here**: Demographics, social classes
- **Daily Rhythms**: When is it busy/quiet?
- **Activities**: What happens here regularly?
- **Social Dynamics**: Tensions, communities, relationships

**Practical Details**:
- **Access**: How do people get here?
- **Resources**: What's available (food, water, materials)?
- **Safety**: Is it safe? What are the dangers?
- **Services**: What facilities exist (inns, markets, etc.)?

**Story Function**:
- **Scene Locations**: Which scenes take place here?
- **Plot Relevance**: How does this location drive plot?
- **Character Connections**: Which characters are tied to this place?
- **Thematic Role**: How does it support theme?

### 7. Create Detailed Location Files

For locations requiring extensive detail, create `world/locations/[location-name].md`:

**Location File Structure**:
```markdown
# [Location Name]

**Type**: [City / Town / Building / Natural Feature / Region]
**Region**: [Where it's located]
**Population**: [If applicable]
**Climate**: [Weather patterns]

## Overview

[2-3 paragraph summary of the location, its defining characteristics]

## Physical Description

[Geography, architecture, scale, natural features]

## Sensory Details

### Sight
[Visual details, lighting, colors, atmosphere]

### Sound
[Ambient sounds, distinctive noises]

### Smell
[Dominant scents, aromas]

### Touch/Texture
[Surfaces, air quality, temperatures]

### Taste
[If relevant - air quality, local flavors]

## Atmosphere & Mood

[Overall feel, time/weather effects, emotional resonance]

## History & Significance

[Historical importance, cultural meaning, secrets, stories]

## Inhabitants & Activity

[Who's here, daily rhythms, activities, social dynamics]

## Practical Details

[Access, resources, safety, services]

## Story Connections

- **Scenes Set Here**: [Link to scene files]
- **Characters Connected**: [Link to character files]
- **Plot Relevance**: [How this location affects the story]
- **Referenced In**: [Other files that mention this location]
```

### 8. Location-Story Integration

**Map Location to Story Needs**:
- Which scenes take place here?
- How does the location create conflict or opportunity?
- What secrets or resources does it hold?
- How does it support character development?

**Cross-Reference Creation**:
When locations connect to other story documents:

```markdown
<!-- In world-bible.md -->
- **Key Locations**: [The Rusty Anchor](locations/rusty-anchor.md), [Old Quarter](locations/old-quarter.md)

<!-- In scene planning -->
- **Location**: [The Rusty Anchor](../world/locations/rusty-anchor.md)
- **Atmosphere**: Dim, smoky, secrets hidden in shadows

<!-- In character file -->
- **Home**: [Old Quarter](../world/locations/old-quarter.md)
- **Frequent Location**: [The Rusty Anchor](../world/locations/rusty-anchor.md) (meets contacts here)

<!-- In prose files -->
The scene takes place in [The Rusty Anchor](../world/locations/rusty-anchor.md)...
```

**Scene-Location Links**: Update scene files to reference locations with sensory details.

### 9. Apply Best Practices

**Show Through Senses**:
- Reveal location through what characters experience
- Use sensory details to create atmosphere
- Let readers discover the place alongside characters
- Avoid listing details—integrate naturally

**Specificity Over Generality**:
- "The cobblestones were slick with rain" not "The street was wet"
- "Smell of fresh bread and coal smoke" not "It smelled like a city"
- Concrete details create vivid images

**Atmosphere Supports Story**:
- Locations should match scene tone
- Use sensory details to enhance mood
- Contrast locations for dramatic effect
- Let environment reflect character emotions

**Internal Consistency**:
- Geography should make logical sense
- Climate affects what grows/lives there
- Architecture matches available materials
- No contradictions with established world elements

**Thematic Integration**:
- Locations should support story themes
- Use place to explore themes visually
- Show how environment shapes characters

### 10. Validation

- [ ] All content in Writing Language
- [ ] Sensory details are rich and specific
- [ ] Location supports story mood/theme
- [ ] No contradictions with existing world files
- [ ] Cross-references are accurate
- [ ] Location can be shown in scenes (not just described)
- [ ] Practical details are consistent (access, resources, etc.)

### 11. Report

- Output paths to created/updated location documents
- Summarize key location characteristics
- List sensory details that bring it to life
- Identify scenes that take place here
- Suggest next:
  - `/fiction.scenes` to plan scenes in this location
  - `/fiction.world` for other world elements
  - `/fiction.chapter` to write scenes set here

## Location Depth Guidelines

| Genre | Recommended Location Depth |
|-------|--------------------------|
| Epic Fantasy | Deep - extensive geography, multiple detailed locations |
| Urban Fantasy | Moderate - key city locations, atmospheric details |
| Science Fiction | Deep for unique environments, moderate for familiar |
| Thriller | Moderate - locations that create tension/atmosphere |
| Literary | Variable - locations that support thematic exploration |
| Historical Fiction | Very Deep - research-backed accuracy required |

## Context

{ARGS}
