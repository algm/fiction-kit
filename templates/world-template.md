# World Bible: [WORLD/SETTING NAME]

**Story**: [Story Title]
**World Type**: [Real World / Alternate History / Secondary World / Future / Hybrid]
**Created**: [DATE]
**Last Updated**: [DATE]

---

## Navigation

**Purpose**: This is the **single source of truth** for world-building information.

**Quick Links**:
- [Overview](#overview) - World summary and atmosphere
- [Geography](#geography) - Locations and map
- [History](#history) - Timeline and historical events
- [Society & Culture](#society--culture) - Social structures and daily life
- [Magic/Technology System](#magictechnology-system) - Rules and abilities
- [Organizations & Factions](#organizations--factions) - Groups and their relationships

**Detailed Information**:
- For **major historical events**, create detailed files in `world/events/[event-name].md` and link from [Timeline](#timeline)
- For **specific spells/abilities**, create detailed files in `world/magic/[spell-name].md` and link from [Magic System](#magictechnology-system)

**See Also**: [navigation-guide.md](../navigation-guide.md) for the complete story information map

---

## Language Configuration

| Setting | Value |
|---------|-------|
| **Documentation Language** | [Inherited from story - e.g., Spanish (es)] |
| **In-World Languages** | [Languages spoken within the fictional world] |
| **Naming Conventions** | [Cultural basis for names of people/places] |

> **Note**: All world descriptions, history, and setting details should be written in the story's **Writing Language**. Maintain consistency with the **Writing Style** from principles.md when describing atmosphere and sensory details.

---

## Overview

### World Summary

[2-3 paragraph overview of the world, its defining characteristics, and what makes it unique]

### Tone & Atmosphere

- **Overall Feel**: [Dark, whimsical, gritty, hopeful, etc.]
- **Visual Aesthetic**: [What it would look like as a film]
- **Comparable Worlds**: [Published works with similar settings]

### Time Period

- **Era**: [When the story takes place]
- **Technology Level**: [What technology exists]
- **Historical Equivalent**: [Real-world era it most resembles, if any]

---

## Geography

### Map Overview

[Description of the overall geography - continents, countries, regions]

### Key Locations

#### [Location 1 Name]

- **Type**: [City / Town / Region / Landmark / Building]
- **Description**: [Physical description]
- **Significance**: [Why it matters to the story]
- **Atmosphere**: [How it feels to be there]
- **Key Features**: [Notable elements]
- **Story Scenes Set Here**: [Which chapters/scenes]

#### [Location 2 Name]

- **Type**: [Type]
- **Description**: [Description]
- **Significance**: [Significance]
- **Atmosphere**: [Atmosphere]
- **Key Features**: [Features]
- **Story Scenes Set Here**: [Scenes]

#### [Location 3 Name]

- **Type**: [Type]
- **Description**: [Description]
- **Significance**: [Significance]
- **Atmosphere**: [Atmosphere]
- **Key Features**: [Features]
- **Story Scenes Set Here**: [Scenes]

### Climate & Environment

- **Climate Zones**: [Weather patterns, seasons]
- **Natural Resources**: [What the land provides]
- **Environmental Challenges**: [Natural threats, harsh conditions]
- **Flora & Fauna**: [Notable plants and animals]

---

## History

### Timeline

**Single Source of Truth**: This timeline is the authoritative chronology. **Reference this from other files** rather than duplicating dates.

| Era/Year | Event | Significance | Details |
|----------|-------|--------------|---------|
| [Date] | [Event name] | [Why it matters] | [Link to detailed file if exists](events/event-name.md) |
| [Date] | [Event name] | [Why it matters] | [Link to detailed file](events/event-name.md) |
| [Date] | [Event name] | [Why it matters] | [Brief note if no detailed file] |
| [Date] | [Story begins] | Present day | — |

**Cross-Reference Pattern**:
```markdown
<!-- In other files (scenes, characters, etc.), reference timeline like this: -->
During [the Great Schism](world/world-bible.md#timeline) of 1523...
<!-- Or link to detailed event file: -->
She witnessed [the Plaza Massacre](world/events/plaza-massacre.md) at age twelve...
```

### Key Historical Events

**Note**: For **major events** that need extensive detail (multiple factions, complex timeline, character involvement), create a separate file in `world/events/[event-name].md` using the world-event-template.md. Link to it from the Timeline table above.

For **minor events** that only need brief context, document them below.

#### [Event 1] - [Link to detailed file if exists](events/event-1.md)

- **When**: [Time period]
- **What Happened**: [Brief description - full details in linked file if complex event]
- **Consequences**: [Long-term effects]
- **How It Affects the Story**: [Relevance to plot]
- **Referenced In**: [Links to characters or scenes that reference this](../characters/protagonist.md#background), [scene](../scenes/ch01-05.md#scene-003)

#### [Event 2]

- **When**: [Time period]
- **What Happened**: [Description]
- **Consequences**: [Long-term effects]
- **How It Affects the Story**: [Relevance to plot]
- **Referenced In**: [Where this event is mentioned]

### Historical Conflicts

[Major wars, revolutions, disasters that shaped the world]

### Lost/Hidden History

[Secrets about the past that may be revealed in the story]

---

## Society & Culture

### Social Structure

- **Class System**: [How society is stratified]
- **Social Mobility**: [Can people change their status?]
- **Power Structures**: [Who holds power and how]
- **Marginalized Groups**: [Who is oppressed or overlooked]

### Government & Politics

- **Government Type**: [Monarchy, democracy, oligarchy, etc.]
- **Current Leaders**: [Who is in charge]
- **Political Factions**: [Different groups vying for power]
- **Laws & Justice**: [How law is enforced]
- **Corruption Level**: [How corrupt is the system]

### Economy

- **Economic System**: [Capitalism, feudalism, etc.]
- **Currency**: [What people use for trade]
- **Major Industries**: [What drives the economy]
- **Wealth Distribution**: [Rich vs poor divide]
- **Trade**: [Who trades with whom]

### Religion & Belief

- **Dominant Religion(s)**: [Main faiths]
- **Religious Practices**: [Rituals, holidays, customs]
- **Clergy/Religious Figures**: [Who leads spiritually]
- **Superstitions**: [Common beliefs, good/bad luck]
- **Relationship to Magic (if applicable)**: [How religion views magic]

### Daily Life

- **Typical Day**: [How ordinary people live]
- **Food & Cuisine**: [What people eat]
- **Entertainment**: [What people do for fun]
- **Family Structure**: [How families are organized]
- **Gender Roles**: [Expectations for different genders]

### Language & Communication

- **Languages Spoken**: [Major languages]
- **Slang & Idioms**: [Unique expressions]
- **Writing Systems**: [How people write]
- **Long-Distance Communication**: [How news travels]

### Art & Education

- **Artistic Traditions**: [Music, visual art, literature]
- **Education System**: [Who gets educated, how]
- **Intellectual Pursuits**: [Science, philosophy, etc.]

---

## Magic/Technology System

*Include this section if your world has magic, advanced technology, or special abilities*

**Single Source of Truth**: This section defines the **authoritative rules** for your magic/technology system. All spells, abilities, and tech usage **must follow these rules**.

### Overview

- **Name of System**: [What it's called]
- **Source/Origin**: [Where it comes from]
- **Who Can Use It**: [Limitations on users]
- **How It's Viewed**: [Feared, revered, common, hidden]

### Rules & Limitations

**Note**: These are the **core rules** that govern all magic/technology in your world. Every spell, ability, or tech use **must conform** to these rules.

#### Hard Rules (Never Broken)

1. [Absolute rule that cannot be violated - e.g., "Cannot resurrect the dead"]
2. [Another hard rule - e.g., "Requires line of sight to target"]
3. [Another hard rule - e.g., "Magic draws from user's life force"]

**Consistency Check**: When writing scenes with magic/tech, verify against these hard rules.

#### Soft Rules (Generally True)

1. [Rule that usually applies but may have exceptions - e.g., "Most magic users tire after an hour"]
2. [Another soft rule - e.g., "Elemental magic is easier in corresponding environments"]

### Costs & Consequences

**Reference**: These general costs apply to all magic/tech. Specific abilities may have additional costs detailed in their individual files.

- **Energy Cost**: [What it takes to use]
- **Physical Cost**: [Toll on the body]
- **Psychological Cost**: [Mental/emotional effects]
- **Social Cost**: [How using it affects relationships/standing]
- **Unintended Consequences**: [What can go wrong]

### Types/Schools/Categories

| Type | Description | Practitioners | Story Relevance | Details |
|------|-------------|---------------|-----------------|---------|
| [Type 1] | [What it does] | [Who uses it] | [How it matters] | [Link if detailed](magic/type1-overview.md) |
| [Type 2] | [What it does] | [Who uses it] | [How it matters] | [Brief note or link] |

### Key Abilities/Spells/Tech

**Note**: For **complex or frequently-used abilities**, create detailed files in `world/magic/[spell-name].md` using the magic-ability-template.md. Link to them from this table.

| Name | Effect | Cost | Who Uses It | Details |
|------|--------|------|-------------|---------|
| [Ability] | [Brief effect] | [What it costs] | [Characters - link](../characters/mage.md) | [Link to detailed file](magic/ability-name.md) |
| [Simple ability] | [Brief effect] | [Cost] | [Users] | [Inline notes if simple] |

**Cross-Reference Pattern**:
```markdown
<!-- In scenes or character files, reference spells like this: -->
She cast [Lumina's Shield](world/magic/luminas-shield.md), which...
```

### Forbidden/Lost Knowledge

[Powers or technologies that are banned, forgotten, or dangerously powerful]

**Referenced In**: [Link to scenes or characters that deal with forbidden knowledge]

---

## Organizations & Factions

### [Organization 1]

- **Name**: [Official name]
- **Type**: [Guild, government body, secret society, etc.]
- **Purpose**: [What they do/want]
- **Leadership**: [Who runs it]
- **Membership**: [Who joins, how]
- **Resources**: [What power they have]
- **Symbols/Identifying Marks**: [How to recognize them]
- **Story Relevance**: [How they affect the plot]

### [Organization 2]

- **Name**: [Name]
- **Type**: [Type]
- **Purpose**: [Purpose]
- **Leadership**: [Leadership]
- **Membership**: [Membership]
- **Resources**: [Resources]
- **Symbols/Identifying Marks**: [Symbols]
- **Story Relevance**: [Relevance]

### Faction Relationships

| Faction A | Faction B | Relationship |
|-----------|-----------|--------------|
| [Faction] | [Faction] | [Allied / Neutral / Hostile / Complex] |

---

## Creatures & Beings

*For fantasy/sci-fi worlds with non-human entities*

### Sentient Races/Species

| Race/Species | Description | Culture | Role in Story |
|--------------|-------------|---------|---------------|
| [Name] | [Physical traits] | [Society/customs] | [How they appear] |

### Notable Creatures

| Creature | Description | Habitat | Danger Level | Story Use |
|----------|-------------|---------|--------------|-----------|
| [Name] | [Description] | [Where found] | [Low/Medium/High] | [Scene] |

---

## Sensory Details

### Sights

[Vivid visual details unique to this world]

### Sounds

[Ambient sounds, music, noise of daily life]

### Smells

[Distinct smells of different locations]

### Tastes

[Food, drink, unique flavors]

### Textures

[What things feel like in this world]

---

## Rules of This World

### What's Different from Real World

1. [Key difference and its implications]
2. [Key difference and its implications]
3. [Key difference and its implications]

### What's the Same as Real World

1. [Human elements that remain constant]
2. [Universal truths that apply]

### Internal Consistency Rules

[Rules the author must follow to maintain world integrity]

---

## Story-Specific Details

### How the World Affects the Plot

[Specific ways the world's nature drives or constrains the story]

### World Elements by Chapter

| Chapter | Location | World Details Needed |
|---------|----------|---------------------|
| [Ch X] | [Place] | [What needs to be established] |

### Mysteries/Secrets to Reveal

| Secret | When Revealed | Impact |
|--------|---------------|--------|
| [Hidden truth] | [Chapter/scene] | [How it changes things] |

---

## Research & References

### Real-World Inspiration

- [Historical period or culture that inspired elements]
- [Scientific concepts incorporated]
- [Architectural or artistic references]

### Research Needed

- [ ] [Topic requiring deeper research]
- [ ] [Detail to verify]

### Reference Images/Materials

[Links or descriptions of visual references for the world]

---

## Notes

### Consistency Reminders

[Things to remember when writing in this world]

### Common Mistakes to Avoid

[Pitfalls that would break world consistency]

### Questions to Resolve

- [ ] [Unanswered question about the world]
- [ ] [Detail to decide later]

