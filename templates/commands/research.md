---
description: Research historical, technical, or cultural details to ensure story authenticity and accuracy.
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

Gather accurate information for story authenticity. Research historical periods, technical processes, cultural practices, locations, professions, and any element that requires factual grounding.

**Single Source of Truth Principle**: Research notes live in `research/[topic].md`. Reference these from scenes and world-building files when needed.

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

## Research Categories

| Category | Examples |
|----------|----------|
| **Historical** | Time periods, events, daily life, social norms |
| **Technical** | Professions, procedures, equipment, terminology |
| **Cultural** | Customs, beliefs, traditions, taboos |
| **Geographic** | Locations, landscapes, climate, architecture |
| **Scientific** | Physics, biology, medicine, technology |
| **Legal/Procedural** | Law enforcement, courts, regulations |
| **Language** | Period speech, regional dialects, jargon |

## Execution Steps

### 1. Setup

Run `{SCRIPT}` from repo root and parse JSON for:
- `STORY_DIR`: Path to story directory

### 2. Load Story Context

Read `/memory/principles.md` for:
- **Writing Language**: Research notes in this language
- **Genre**: Affects research depth (historical fiction > contemporary thriller)

Read premise.md and world/ for:
- Setting (time, place)
- Elements requiring research
- Already established world facts (don't contradict)

### 3. Identify Research Needs

From user input or story documents:
- What specific topic needs research?
- What level of detail is needed?
- What's the purpose? (background knowledge, specific scene, world-building)

### 4. Research Approach

**For historical research**:
- Period daily life (food, clothing, transportation)
- Social structures and norms
- Major events and their impact
- Language and speech patterns
- Technology available
- What DIDN'T exist yet

**For technical research**:
- Accurate terminology
- Step-by-step processes
- Common mistakes/misconceptions
- Expert perspective vs. layperson
- Safety considerations
- Time requirements

**For cultural research**:
- Traditions and their meanings
- Social expectations
- Religious/spiritual practices
- Family structures
- Taboos and consequences
- Insider vs. outsider perspective

**For geographic research**:
- Physical layout and landmarks
- Climate and seasons
- Local flora and fauna
- Transportation options
- Sensory details (smells, sounds)
- Cultural character of place

### 5. Document Research

Create `STORY_DIR/research/` directory if needed.

Structure research notes:
```markdown
# Research: [Topic]

**Date**: [DATE]
**Relevance**: [Which story elements this supports]
**Writing Language**: [Language]

## Summary

[Brief overview of key findings]

## Detailed Findings

### [Subtopic 1]

[Information with source notes]

### [Subtopic 2]

[Information]

## Story Application

- [How to apply finding 1 in narrative]
- [How to apply finding 2 in narrative]

## Authenticity Notes

**Do**:
- [Accurate detail to include]
- [Authentic terminology]

**Don't**:
- [Common anachronism to avoid]
- [Misconception to correct]

## Sensory Details

- **Sights**: [Visual details]
- **Sounds**: [Auditory details]
- **Smells**: [Olfactory details]
- **Textures**: [Tactile details]

## Language Notes

- [Period-appropriate terms]
- [Words that didn't exist yet]
- [Slang of the era/place]

## Sources

- [Source 1]
- [Source 2]

## Questions Remaining

- [What still needs verification]
```

### 6. Research Depth by Purpose

| Purpose | Depth | Focus |
|---------|-------|-------|
| **Background** | Overview | General understanding, avoid errors |
| **Scene-specific** | Detail | Exact process/setting for one scene |
| **World-building** | Deep | Extensive detail for recurring elements |
| **Expert character** | Thorough | POV character's profession/expertise |
| **Historical accuracy** | Exhaustive | Period fiction requiring precision |

### 7. Apply Language Settings

**CRITICAL**: Research notes in **Writing Language**.

Research affects language in narrative:
- Period-appropriate vocabulary
- Regional expressions
- Professional jargon
- Avoiding anachronisms (words that didn't exist)

### 8. Integration with Story

Connect research to narrative needs:
- Which scenes use this research?
- How to weave details naturally (not info-dump)?
- What can be implied vs. stated?
- What reader assumptions can be leveraged?

### 9. Verify Against Established Canon

**Navigation Setup**:
- Consult `STORY_DIR/navigation-guide.md` to locate authoritative world information

Cross-check with existing world/docs:
- **Reference single sources**: Check against `world/world-bible.md` for world facts, `world/events/[event].md` for historical events, `world/magic/[spell].md` for magic systems
- No contradictions with established facts
- Research supports, doesn't override creative choices
- Flag any conflicts for resolution
- **Create cross-references**: Link research files from scenes that use them (in scene References field) and from world-building files when relevant

### 10. Report

Output:
- Path to research notes
- Key findings summary
- Story application suggestions
- Remaining questions
- Suggested next steps

## Research Best Practices

**Balance accuracy with story**:
- Accuracy serves story, not the reverse
- Readers forgive small errors if story is compelling
- Don't let research delay writing (research enough, then write)

**Show expertise through specificity**:
- One perfect detail > ten generic facts
- Sensory details ground research in experience
- Characters notice what experts notice

**Avoid common pitfalls**:
- Info-dumping research (character lectures reader)
- Anachronistic language (modern idioms in historical)
- Over-researching (procrastination disguised as work)
- Inconsistent detail level (some scenes researched, others not)

## Example Research Note (Spanish)

```markdown
# Research: Vida cotidiana en Barcelona, 1936

**Fecha**: 2024-01-15
**Relevancia**: Capítulos 1-3, establecer el mundo antes de la guerra

## Resumen

Barcelona en julio de 1936 era una ciudad industrial y anarquista,
con tensiones políticas extremas justo antes del alzamiento militar...

## Detalles Sensoriales

- **Olores**: Carbón de las fábricas, mar Mediterráneo, aceite de oliva
  de las cocinas, tabaco negro
- **Sonidos**: Tranvías, vendedores ambulantes, radio (muy popular),
  mítines políticos frecuentes
- **Ropa**: Hombres en mono azul (trabajadores), alpargatas, gorras;
  mujeres en vestidos sencillos, delantales

## Notas de Lenguaje

- "Salud" como saludo (anarquistas) vs "¡Arriba España!" (falangistas)
- Tuteo generalizado entre trabajadores
- Mezcla catalán-castellano en diálogos
```

## Context

{ARGS}

