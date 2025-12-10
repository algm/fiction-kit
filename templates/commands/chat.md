---
description: Interactive brainstorming session or roleplay conversation with story characters to explore voice, motivation, and story possibilities.
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

Provide an interactive space for:
1. **Character roleplay**: Converse AS a character to discover their voice and psychology
2. **Brainstorming**: Explore story possibilities through dialogue
3. **Interview**: Ask characters questions to reveal backstory and motivation
4. **Scene exploration**: Test character interactions before formal drafting

**Single Source of Truth Principle**: Character information lives in `characters/[name].md`. Update these files with discoveries from chat sessions.

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

### 2. Load Language & Style Configuration (CRITICAL)

Read `/memory/principles.md` and extract:
- **Writing Language**: ALL conversation must be in this language
- **Writing Style**: Affects character voice and responses
- **Regional Variant**: For culturally appropriate expressions

**ABORT if Writing Language not defined** in principles.md.

### 3. Load Character Context

**Navigation Setup**:
- Consult `STORY_DIR/navigation-guide.md` to locate character files
- **Single source of truth**: Character profiles live in `characters/[name].md` only

If a character is specified:
- Read `STORY_DIR/characters/[name].md` (authoritative source for all character information)
- Load voice notes, personality, speech patterns (from Dialogue & Voice section)
- Note relationships to other characters (link to other character files if referenced)
- Load wound, lie, truth for psychological depth (from Psychology section)
- **Cross-reference world elements**: If character background references events or locations, load from `world/events/[event].md` or `world/world-bible.md#key-locations`

If no character specified:
- Read PREMISE_FILE for character overview
- Allow user to choose or create character on the fly

### 4. Determine Chat Mode

Based on user input:

| Mode | Description | AI Role |
|------|-------------|---------|
| **Roleplay** | User talks TO character | AI responds AS character |
| **Interview** | User asks character questions | AI answers in character, reveals backstory |
| **Brainstorm** | User explores ideas | AI as collaborative partner |
| **Scene Test** | User sets up scenario | AI plays character(s) in that scene |
| **Dual Roleplay** | User is one character | AI plays another character |

Default: **Interview** mode (safest starting point)

### 5. Chat Session Guidelines

**CRITICAL**: Entire conversation in **Writing Language**.

**Roleplay/Interview Mode**:
- AI fully embodies character
- Uses character's vocabulary, speech patterns, verbal tics
- Responds based on character's psychology (wound, lie, beliefs)
- Maintains character even when uncomfortable topics arise
- Character may lie, evade, or get emotional—authentically
- Never break character unless user explicitly exits

**Brainstorm Mode**:
- AI as collaborative creative partner
- Builds on user's ideas
- Offers alternatives and "what ifs"
- Challenges weak ideas constructively
- Stays grounded in established story context

**Scene Test Mode**:
- User describes scenario
- AI plays specified character(s)
- Focus on dialogue and reaction
- Note: Not full prose, just character interaction

### 6. Character Voice Enforcement

When in character:
- Use speech patterns from character profile
- Respect vocabulary level
- Include verbal tics naturally
- React according to personality traits
- Show wound/lie influence subtly
- Maintain consistent knowledge (character doesn't know everything author knows)

**Example voice calibration** (Spanish story, gruff mentor character):
```
User: ¿Por qué me ayudas?
Character: [gruff sigh] No te confundas, chico. No es ayuda. Es deuda. 
Una que llevo arrastrando demasiados años. [looks away] Ahora muévete.
```

### 7. Session Management

**Starting a session**:
- Confirm character and mode
- Load character context
- Establish scene/situation if relevant
- Begin interaction

**During session**:
- Stay in character/mode
- Track emotional state shifts
- Note interesting discoveries for later capture

**Ending session**:
- User says "exit", "done", or "end chat"
- AI exits character mode
- Offers to save insights

### 8. Capture Insights

After session (or on request), offer to capture:
- **Update single source**: All character information goes to `characters/[name].md` only
- New voice insights → update character profile (Dialogue & Voice section)
- Backstory discoveries → add to character background (Background section)
- Relationship revelations → update relationship notes (Relationships section, link to other character files)
- Story ideas → note for premise/outline (update premise.md or outline files)
- **Create cross-references**: If discoveries reference world events or locations, link to `world/events/[event].md` or `world/world-bible.md`

Output format:
```markdown
## Chat Session Insights: [Character Name]

**Date**: [DATE]
**Mode**: [Roleplay/Interview/etc.]

### Voice Notes
- [New speech pattern discovered]
- [Verbal tic that emerged]

### Backstory Discoveries
- [New background information revealed]

### Relationship Insights
- [How character relates to others]

### Story Ideas
- [Plot possibilities that emerged]

### Emotional Beats
- [What triggers strong reactions]
```

### 9. Guidelines for Specific Modes

**Interview Questions to Try** (suggest to user):
- "Cuéntame sobre tu infancia" / "Tell me about your childhood"
- "¿Qué es lo que más te asusta?" / "What scares you most?"
- "Si pudieras cambiar una cosa de tu pasado..." / "If you could change one thing..."
- "¿Qué piensas de [otro personaje]?" / "What do you think of [other character]?"
- "¿Por qué haces lo que haces?" / "Why do you do what you do?"

**Scene Test Prompts**:
- "You're confronted by [antagonist]. What do you say?"
- "You've just received terrible news. React."
- "You meet [character] for the first time. How does it go?"

### 10. Boundaries

- Character stays true to profile (no sudden personality shifts)
- Mature themes handled with writer's intent, not gratuitously
- If user pushes character to OOC behavior, gently note: "That feels out of character because [reason]. Want to explore why they might do that?"

## Context

{ARGS}

