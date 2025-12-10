---
description: Design consistent magic or technology systems with clear rules, limitations, and costs that maintain internal logic.
handoffs: 
  - label: Create Character
    agent: fiction.character
    prompt: Create a character who uses this system...
  - label: Create World Elements
    agent: fiction.world
    prompt: Expand world-building around this system...
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

Create coherent magic or technology systems with well-defined rules, limitations, and costs that maintain believability and prevent plot holes. Systems should support the story without becoming convenient plot devices.

**Single Source of Truth Principle**: System information should exist in ONE authoritative location. Use cross-references (markdown links) when referencing system elements from other files.

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
- **Writing Language**: ALL system content must be in this language
- **Writing Style**: Affects system depth and presentation
- **Regional Variant**: For culturally appropriate references

Read PREMISE_FILE for:
- Genre requirements (magic vs. technology focus)
- Existing system elements mentioned
- Central theme (system should support theme)

### 3. Determine System Type

Based on user input and story needs, identify focus:

| System Type | Development Needed |
|------------|-------------------|
| **Hard Magic** | Strict rules, clear limitations, predictable outcomes |
| **Soft Magic** | Mysterious, less defined, maintains wonder |
| **Technology** | Scientific principles, capabilities, limitations |
| **Hybrid** | Magic + technology interaction, combined systems |

**Key Principle**: Choose system type based on **story needs**:
- **Hard Magic**: When magic solves problems (readers need to understand rules)
- **Soft Magic**: When magic creates problems (mystery enhances story)
- **Technology**: When tech drives plot (scientific rigor or speculative concepts)

### 4. Load Existing World Documents

Read `STORY_DIR/world/world-bible.md` (create if needed) to check:
- Existing system information
- Rules already defined
- Gaps that need filling

### 5. Create System Structure

**Directory Structure** (create as needed):
```
world/
├── world-bible.md              # Main document with system overview
└── magic/                      # Detailed spell/ability files (if needed)
    └── [spell-name].md
```

**Organization**:
- **Overview**: In `world/world-bible.md#magictechnology-system` (for system rules)
- **Detailed Abilities**: Separate files in `world/magic/[ability-name].md` for complex abilities

### 6. Develop System Elements

**System Foundation**:

**Source/Origin**:
- Where does magic/technology come from?
- Natural force, divine gift, scientific discovery, etc.?
- Has it always existed or was it discovered?

**Nature of the System**:
- **Hard Magic**: What are the exact rules?
- **Soft Magic**: What are the general principles?
- **Technology**: What are the scientific/technical foundations?

**Core Rules** (CRITICAL for consistency):
- **What It Can Do**: Capabilities and applications
- **What It Cannot Do**: Clear limitations
- **How It Works**: Mechanics, processes, requirements
- **Who Can Use It**: Requirements, restrictions, accessibility
- **When It Works**: Conditions, triggers, timing

**Limitations & Costs**:
- **Energy Cost**: What powers it? (mana, fuel, physical energy, etc.)
- **Physical Cost**: Does use cause exhaustion, pain, aging?
- **Material Cost**: Are components needed? (ingredients, materials, etc.)
- **Time Cost**: How long does it take to use/prepare?
- **Risk Cost**: What happens if it fails or is misused?
- **Social Cost**: How is it viewed? Legal restrictions?

**Power Levels & Scaling**:
- **Beginner vs. Master**: How does skill affect capability?
- **Natural Talent**: Can some people use it better?
- **Training Required**: How do people learn?
- **Limits of Power**: What's the maximum possible?

**System Categories** (if applicable):
- **Types/Varieties**: Different schools, elements, specializations
- **Interactions**: How do different types interact?
- **Counters**: What can block or neutralize it?

**Integration with World**:

**Societal Impact**:
- **Common or Rare**: How widespread is its use?
- **Social Status**: Does using it affect social standing?
- **Professions**: Are there magic/tech-based jobs?
- **Education**: How is it taught? Who has access?
- **Regulation**: Is it controlled, restricted, or free?

**Economic Impact**:
- **Cost**: Is it expensive to use/learn?
- **Trade**: Are there magic/tech markets?
- **Wealth Distribution**: Does it create inequality?

**Political Impact**:
- **Power Structures**: Who controls it?
- **Warfare**: How does it affect conflict?
- **Laws**: What are the legal restrictions?

**Technological/Magical Interaction**:
- **With Technology**: How does magic interact with tech?
- **With Science**: Can it be studied scientifically?
- **Evolution**: Has it changed over time?

### 7. Create Detailed Ability Files

For complex abilities requiring extensive detail, create `world/magic/[ability-name].md`:

**Ability File Structure**:
```markdown
# [Ability/Spell Name]

**Type**: [Magic / Technology / Hybrid]
**Category**: [Element, School, Specialization]
**Difficulty**: [Beginner / Intermediate / Advanced / Master]
**Cost**: [Energy, materials, time required]

## Overview

[2-3 paragraph summary of the ability, what it does]

## Mechanics

[How it works, step-by-step process]

## Capabilities

[What it can do, specific applications]

## Limitations

[What it cannot do, restrictions]

## Costs

[Energy, physical, material, time, risk costs]

## Requirements

[Who can use it, training needed, prerequisites]

## Counters & Defenses

[What can block or neutralize it]

## Story Usage

[How it appears in the story, examples]

## Referenced In

- **Characters Who Use This**: [Link to character files]
- **Scenes Where Used**: [Link to scene files]
- **Plot Relevance**: [How this ability affects the story]
```

### 8. System-Story Integration

**Map System to Story Needs**:
- Which abilities are used in key scenes?
- How does the system create conflict or solve problems?
- What limitations drive plot complications?
- How does the system support theme?

**Cross-Reference Creation**:
When system elements connect to other story documents:

```markdown
<!-- In world-bible.md -->
- **Magic System**: [Fire Binding](magic/fire-binding.md), [Water Shaping](magic/water-shaping.md)

<!-- In character file -->
- **Abilities**: Trained in [Fire Binding](../world/magic/fire-binding.md)
- **Limitation**: Can only use fire magic, cannot use water magic

<!-- In scene planning -->
- **System Use**: Character uses [Fire Binding](../world/magic/fire-binding.md) to escape
- **Cost**: Exhaustion after use, must rest

<!-- In prose files -->
She cast [Fire Binding](../world/magic/fire-binding.md), feeling the energy drain...
```

**Character-System Links**: Update character files to reference their abilities and limitations.

### 9. Apply Best Practices

**Consistency is Key**:
- Once rules are established, don't break them
- Document all rules clearly
- Check for contradictions before adding new elements
- If rules must change, show why (discovery, evolution, etc.)

**Show, Don't Tell**:
- Reveal system through use, not explanation
- Let readers discover rules alongside characters
- Avoid info-dumps—integrate naturally
- Show costs and limitations in action

**Internal Logic**:
- Rules should make logical sense
- Limitations should have reasons
- Costs should be meaningful
- No "because magic" hand-waving

**Balance Power**:
- Powerful abilities need significant costs
- Limitations create interesting problems
- Weaknesses make characters vulnerable
- System shouldn't solve all problems easily

**Thematic Integration**:
- System should support story themes
- Use system to explore themes (power, responsibility, etc.)
- Show how system affects characters' choices

### 10. Validation

- [ ] All content in Writing Language
- [ ] Rules are clearly defined and consistent
- [ ] Limitations and costs are meaningful
- [ ] No contradictions with existing world/character files
- [ ] Cross-references are accurate
- [ ] System supports story without being too convenient
- [ ] Rules can be shown in scenes (not just explained)

### 11. Report

- Output paths to created/updated system documents
- Summarize key rules and limitations
- List abilities that appear in the story
- Identify system elements that drive plot
- Suggest next:
  - `/fiction.character` for characters who use this system
  - `/fiction.world` for other world elements
  - `/fiction.scenes` to plan scenes using the system

## System Depth Guidelines

| Genre | Recommended System Depth |
|-------|------------------------|
| Epic Fantasy | Deep - extensive magic system, detailed rules |
| Urban Fantasy | Moderate - magic with clear limits, hidden from world |
| Science Fiction | Deep for technology, scientific rigor or speculation |
| Soft Magic Fantasy | Moderate - mysterious, less defined |
| Thriller | Minimal - only system elements that affect plot |
| Literary | Variable - system that supports thematic exploration |

## Hard vs. Soft Magic Quick Reference

**Hard Magic** (Rules are clear):
- Readers understand what's possible
- Magic can solve problems (readers see how)
- Requires detailed rules and limitations
- Examples: Allomancy (Mistborn), Nen (Hunter x Hunter)

**Soft Magic** (Rules are mysterious):
- Readers don't fully understand capabilities
- Magic creates problems or atmosphere
- Maintains sense of wonder
- Examples: Lord of the Rings magic, most fairy tales

**Choose based on story function**: If magic solves problems → Hard. If magic creates problems → Soft.

## Context

{ARGS}
