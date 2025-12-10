---
description: Create detailed cultures, societies, and social structures that shape character behavior and world dynamics.
handoffs: 
  - label: Create Character
    agent: fiction.character
    prompt: Create a character from this culture...
  - label: Create World Elements
    agent: fiction.world
    prompt: Expand world-building for this culture...
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

Develop comprehensive cultural and social systems that create believable societies, shape character behavior, and provide rich context for your story. Cultures should feel authentic, internally consistent, and support the narrative themes.

**Single Source of Truth Principle**: Cultural information should exist in ONE authoritative location. Use cross-references (markdown links) when referencing cultures from other files.

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
- **Writing Language**: ALL cultural content must be in this language
- **Writing Style**: Affects cultural depth and presentation
- **Regional Variant**: For culturally appropriate references

Read PREMISE_FILE for:
- Setting and time period
- Genre requirements
- Existing cultural elements mentioned
- Central theme (culture should explore theme)

### 3. Determine Cultural Scope

Based on user input and story needs, identify focus:

| Story Type | Cultural Depth Needed |
|-----------|---------------------|
| **Single Culture Focus** | Deep development of one primary culture |
| **Multi-Cultural** | Moderate depth for multiple cultures, focus on differences |
| **Real World** | Research-backed accuracy, cultural sensitivity required |
| **Secondary World** | Complete cultural systems from scratch |
| **Urban/Modern** | Subcultures, social groups, contemporary dynamics |

**Key Principle**: Develop cultures that **affect character behavior and story**. Focus on:
- Cultural norms that create conflict
- Social structures that shape opportunities
- Beliefs that drive character motivations
- Practices that add authenticity

### 4. Load Existing World Documents

Read `STORY_DIR/world/world-bible.md` (create if needed) to check:
- Existing cultural information
- Social structures already defined
- Gaps that need filling

### 5. Create Cultural Structure

**Directory Structure** (create as needed):
```
world/
├── world-bible.md              # Main document with culture overview
└── cultures/                   # Detailed culture files (if needed)
    └── [culture-name].md
```

**Organization**:
- **Overview**: In `world/world-bible.md#society--culture` (for single or primary culture)
- **Detailed Cultures**: Separate files in `world/cultures/[culture-name].md` for distinct cultures requiring extensive detail

### 6. Develop Cultural Elements

**Social Hierarchy & Class Systems**:
- **Class Structure**: Lower, middle, upper classes and sub-strata
- **Social Mobility**: Can people move between classes? How?
- **Caste Systems**: If applicable, rigid inherited status
- **Power Distribution**: Who holds influence and why?
- **Status Markers**: How is status displayed (clothing, titles, behavior)?

**Family Structure**:
- **Family Units**: Nuclear, extended, communal, or other?
- **Gender Roles**: Expectations for different genders
- **Marriage/Coupling**: Customs, ceremonies, arrangements
- **Child-Rearing**: Who raises children, how are they educated?
- **Inheritance**: How are property and titles passed down?
- **Deviations**: How are non-standard families viewed?

**Beliefs & Values**:
- **Religious Beliefs**: Deities, spiritual practices, organized religion
- **Moral Codes**: What's considered right/wrong?
- **Philosophical Ideas**: Core worldview principles
- **Taboos**: What's forbidden or deeply frowned upon?
- **Sacred vs. Profane**: What's revered vs. mundane?

**Customs & Traditions**:
- **Rituals**: Birth, coming-of-age, marriage, death ceremonies
- **Festivals**: Annual celebrations, their meanings
- **Daily Practices**: Morning routines, meal customs, greetings
- **Etiquette**: Politeness rules, social expectations
- **Gift-Giving**: Customs around presents, hospitality

**Art & Expression**:
- **Visual Arts**: Painting, sculpture, architecture styles
- **Music**: Instruments, genres, when music is used
- **Literature**: Storytelling traditions, written works
- **Performance**: Theater, dance, oral traditions
- **Crafts**: Textiles, pottery, metalwork, etc.

**Political & Legal Systems**:
- **Government Type**: Democracy, monarchy, oligarchy, theocracy, etc.
- **Law Creation**: How are laws made and changed?
- **Law Enforcement**: Who enforces laws, how?
- **Justice System**: Courts, trials, punishment methods
- **Citizenship**: Who belongs, who doesn't?
- **Rights & Freedoms**: What are people allowed/not allowed?

**Economic Systems**:
- **Currency**: What's used for trade (coins, barter, digital)?
- **Trade Networks**: What's traded, with whom?
- **Occupations**: Common professions, their status
- **Wealth Distribution**: How is wealth spread?
- **Economic Classes**: Rich, middle, poor—how do they differ?
- **Markets**: Where/how do people buy and sell?

**Education & Knowledge**:
- **Educational Institutions**: Schools, universities, apprenticeships
- **Access**: Who gets education, who doesn't?
- **Curriculum**: What's taught, what's forbidden?
- **Knowledge Keepers**: Scholars, priests, elders, etc.
- **Literacy**: How common is reading/writing?
- **Oral Traditions**: How is knowledge passed without writing?

**Language & Communication**:
- **Languages**: What languages are spoken?
- **Naming Conventions**: How are people/places named?
- **Formality Levels**: How does speech change by context?
- **Non-Verbal**: Gestures, body language, eye contact rules
- **Written Communication**: Scripts, writing materials

**Daily Life**:
- **Work Patterns**: When do people work, typical schedules?
- **Meals**: What/when/how do people eat?
- **Housing**: Typical homes, living arrangements
- **Clothing**: What people wear, status markers
- **Leisure**: How do people relax, have fun?
- **Time**: How is time measured, what's the calendar?

**Interaction with Other Cultures**:
- **Relationships**: Alliances, rivalries, neutral
- **Trade**: What's exchanged, trade routes
- **Cultural Exchange**: Borrowed customs, shared practices
- **Conflicts**: Historical or current tensions
- **Prejudices**: Stereotypes, biases between cultures

### 7. Create Detailed Culture Files

For distinct cultures requiring extensive detail, create `world/cultures/[culture-name].md`:

**Culture File Structure**:
```markdown
# [Culture Name]

**Region**: [Where this culture is found]
**Population**: [Approximate size]
**Primary Language**: [Language(s) spoken]
**Dominant Religion**: [If applicable]

## Overview

[2-3 paragraph summary of the culture, its defining characteristics]

## Social Structure

### Class System
[Detailed class hierarchy]

### Family Structure
[Family organization and roles]

## Beliefs & Values

[Core beliefs, religion, moral codes]

## Customs & Traditions

[Key rituals, festivals, daily practices]

## Arts & Expression

[Artistic traditions and forms]

## Political & Legal Systems

[Government, laws, justice]

## Economic Systems

[Trade, currency, occupations]

## Daily Life

[Typical day, housing, clothing, food]

## Language & Communication

[Languages, naming, communication styles]

## Relationships with Other Cultures

[How this culture interacts with others]

## Story Connections

- **Characters from This Culture**: [Link to character files]
- **Referenced In**: [Link to scenes/world elements]
- **Plot Relevance**: [How this culture affects the story]
```

### 8. Cultural-Story Integration

**Map Culture to Story Needs**:
- Which cultural norms create character conflict?
- How do social structures limit/empower characters?
- What cultural beliefs drive character motivations?
- How do cultural practices appear in scenes?

**Cross-Reference Creation**:
When cultural elements connect to other story documents:

```markdown
<!-- In character file -->
- **Culture**: [Northern Tribes](../world/cultures/northern-tribes.md)
- **Social Class**: Merchant (middle class)
- **Religious Belief**: Follows [The Old Ways](../world/world-bible.md#religion)

<!-- In scene planning -->
- **Cultural Context**: Takes place during [Harvest Festival](../world/cultures/northern-tribes.md#festivals)
- **Social Dynamics**: Class conflict between nobles and merchants

<!-- In world-bible.md -->
- **Primary Cultures**: [Northern Tribes](cultures/northern-tribes.md), [Southern Empire](cultures/southern-empire.md)
```

**Character-Culture Links**: Update character files to reference their cultural background.

### 9. Apply Best Practices

**Diversity & Authenticity**:
- Create varied cultures (not monolithic)
- Show internal diversity within cultures
- Avoid stereotypes—show complexity
- Research real-world cultural practices for inspiration (don't copy)

**Show Through Behavior**:
- Reveal culture through character actions
- Use dialogue to show cultural norms
- Let customs appear naturally in scenes
- Avoid info-dumps—integrate organically

**Internal Consistency**:
- Cultural elements should logically connect
- Beliefs should align with practices
- Social structure should make sense
- No contradictions with established world elements

**Thematic Integration**:
- Cultures should support story themes
- Use cultural differences to explore themes
- Show how culture shapes individual choices

### 10. Validation

- [ ] All content in Writing Language
- [ ] Social structure is internally consistent
- [ ] Cultural elements support story theme
- [ ] No contradictions with existing world/character files
- [ ] Cross-references are accurate
- [ ] Culture affects character behavior in meaningful ways
- [ ] Cultural practices can be shown in scenes (not just described)

### 11. Report

- Output paths to created/updated cultural documents
- Summarize key cultural elements developed
- List cultural norms that create story conflict
- Identify cultural practices that appear in scenes
- Suggest next:
  - `/fiction.character` for characters from this culture
  - `/fiction.world` for other world elements
  - `/fiction.scenes` to plan scenes showing cultural elements

## Cultural Depth Guidelines

| Genre | Recommended Cultural Depth |
|-------|--------------------------|
| Epic Fantasy | Deep - multiple distinct cultures, extensive customs |
| Urban Fantasy | Moderate - subcultures, hidden societies |
| Science Fiction | Deep for alien/future cultures, moderate for contemporary |
| Historical Fiction | Very Deep - research-backed accuracy required |
| Thriller | Minimal - only culture that affects plot |
| Literary | Variable - culture that supports thematic exploration |

## Context

{ARGS}
