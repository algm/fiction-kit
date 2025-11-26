---
description: Generate synopsis, blurb, or query letter in various lengths for pitching and marketing.
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

Generate compelling synopsis content at various lengths for different purposes: pitching to agents, back cover copy, social media promotion, or personal reference.

## Synopsis Types

| Type | Length | Purpose | Includes Ending? |
|------|--------|---------|------------------|
| **Logline** | 1-2 sentences | Quick pitch, social media | No |
| **Tagline** | 5-10 words | Marketing hook | No |
| **Blurb** | 150-200 words | Back cover, retailer listing | No (teaser) |
| **Short synopsis** | 300-500 words | Query letter | Yes |
| **Full synopsis** | 1-3 pages | Agent submission | Yes (complete) |
| **Tweet/Post** | 280 chars | Social media | No |
| **Pitch paragraph** | 100-150 words | Elevator pitch | No |

## Execution Steps

### 1. Setup

Run `{SCRIPT}` from repo root and parse JSON for:
- `STORY_DIR`: Path to story directory
- `PREMISE_FILE`: Path to premise.md

### 2. Load Language & Style Configuration (CRITICAL)

Read `/memory/principles.md` and extract:
- **Writing Language**: Synopsis must be in this language
- **Writing Style**: Affects pitch tone
- **Genre**: Affects marketing conventions

### 3. Load Story Content

**From premise.md**:
- Logline (if exists)
- Genre and subgenre
- Target audience
- Protagonist (name, want, flaw)
- Central conflict and stakes
- Theme

**From outline.md** (if exists):
- Major beats
- Character arc
- How story ends (for full synopsis)

### 4. Determine Output Type

Based on user input:
- Specific type: "write a query synopsis"
- Multiple types: "generate all marketing copy"
- Default: Logline + Blurb

### 5. Generate Synopsis Content

**CRITICAL**: ALL content in **Writing Language**.

#### Logline Formula

```
When [INCITING INCIDENT], [PROTAGONIST with flaw] must [GOAL], 
or else [STAKES]. But [MAIN OBSTACLE] stands in the way.
```

Example (Spanish):
```
Cuando su hermana desaparece sin dejar rastro, Elena—una detective 
obsesionada con casos perdidos—debe adentrarse en el submundo 
criminal de Barcelona antes de que sea demasiado tarde. Pero los 
secretos que descubra podrían destruir todo lo que creía saber 
sobre su propia familia.
```

#### Tagline

Punchy, memorable, evocative.

Examples (Spanish):
- "Algunos secretos no quieren ser encontrados."
- "La verdad tiene un precio. ¿Estás dispuesta a pagarlo?"
- "En la ciudad de los sueños, las pesadillas son reales."

#### Blurb Structure

1. **Hook** (1-2 sentences): Grab attention
2. **Setup** (2-3 sentences): World and protagonist
3. **Conflict** (2-3 sentences): What's at stake
4. **Tease** (1-2 sentences): Promise without spoiling

**Never reveal the ending in a blurb.**

#### Short Synopsis Structure (Query)

1. **Opening hook** (1-2 sentences)
2. **Setup**: Protagonist, world, status quo
3. **Inciting incident**: What changes everything
4. **Rising action**: Key complications
5. **Climax**: Final confrontation
6. **Resolution**: How it ends

**Must reveal the ending in a synopsis.**

#### Full Synopsis Structure

- Chronological narrative of story
- Focus on protagonist's journey
- Include major turning points
- Show character arc
- Clear cause-and-effect
- Complete ending

### 6. Apply Genre Conventions

Different genres have different pitch expectations:

| Genre | Blurb Focus | Key Elements |
|-------|-------------|--------------|
| Romance | Relationship, emotional stakes | Meet-cute hint, chemistry |
| Thriller | Danger, urgency | Ticking clock, high stakes |
| Fantasy | World uniqueness, adventure | Magic/quest, chosen one |
| Mystery | Puzzle, intrigue | Crime, clues teased |
| Literary | Theme, character depth | Prose style, emotional truth |
| Sci-Fi | Concept, future | Technology, social questions |

### 7. Quality Checks

For each synopsis type:
- [ ] In correct Writing Language
- [ ] Correct length
- [ ] Protagonist named and described
- [ ] Stakes are clear
- [ ] Genre is evident
- [ ] Hook is compelling
- [ ] Voice matches story tone
- [ ] For full synopsis: ending included
- [ ] For blurb: ending NOT included

### 8. Write Output

Save to: `STORY_DIR/synopsis.md`

Structure:
```markdown
# Story Synopsis: [Title]

**Genre**: [Genre]
**Writing Language**: [Language]
**Generated**: [DATE]

## Logline

[1-2 sentence logline]

## Tagline

[Punchy marketing tagline]

## Blurb (Back Cover)

[150-200 word blurb]

## Short Synopsis (Query)

[300-500 word synopsis with ending]

## Full Synopsis

[1-3 page detailed synopsis]

## Social Media

### Twitter/X Post
[280 characters]

### Instagram Caption  
[150 words + hashtag suggestions]
```

### 9. Report

Output:
- Path to synopsis.md
- Types generated
- Word counts for each
- Suggested refinements
- Notes on genre-specific elements

## Writing Tips by Type

**Logline**: 
- Active voice
- Specific, not generic
- Character + Goal + Stakes + Obstacle
- Under 50 words

**Blurb**:
- Start with action or question
- Create emotional connection
- End with unanswered question
- Read it aloud—does it flow?

**Synopsis**:
- Write in present tense
- Focus on protagonist
- Show causality
- Don't include subplots unless crucial
- Reveal the ending clearly

## Context

{ARGS}

