---
description: Generate a complete chapter draft from outline and scene breakdown.
handoffs: 
  - label: Refine Chapter
    agent: fiction.refine
    prompt: Improve this chapter...
  - label: Review Story
    agent: fiction.review
    prompt: Check consistency...
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --require-scenes --include-scenes
  ps: scripts/powershell/check-prerequisites.ps1 -Json -RequireScenes -IncludeScenes
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Goal

Generate a complete, polished chapter draft by combining scene-level planning with prose generation, following all established voice, style, and character guidelines.

## Execution Steps

### 1. Setup

Run `{SCRIPT}` from repo root and parse JSON for:
- `STORY_DIR`: Path to story directory
- `SCENES_FILE`: Path to scenes.md

### 2. Load Language & Style Configuration (CRITICAL)

Read `/memory/principles.md` and extract:
- **Writing Language**: ALL prose must be in this language
- **Regional Variant**: For spelling, idioms, cultural references
- **Writing Style**: literary / commercial / genre:[X]
- **Voice settings**: POV, tense, narrative distance, prose style
- **Things to ALWAYS/NEVER do**

**ABORT if Writing Language not defined**.

### 3. Identify Target Chapter

From user input, determine which chapter to draft:
- By number: "chapter 3", "capítulo 5"
- By title: "The Awakening"
- Next in sequence: "next chapter"
- Specific scenes: "scenes S012-S015"

If not specified, suggest starting with the next undrafted chapter.

### 4. Load Chapter Context

**From outline files** (load appropriate structure):
- **If split structure exists**:
  - Read outline-chapters.md for chapter goal, emotional arc, POV, word target
  - Read outline-arcs.md for character arc context
- **Otherwise**: Read outline.md for chapter details

**From scenes files** (load appropriate structure):
- **If split structure exists**:
  - Read scenes-index.md for overview
  - Read appropriate scenes-chXX-XX.md file containing this chapter
- **Otherwise**: Read scenes.md for all scenes for this chapter
- Scene details: POV, type, goal, conflict, outcome, emotional beat
- Chapter checkpoint (what should be achieved)

**From characters/** (for POV character):
- Voice notes and speech patterns
- Current emotional state (based on prior chapters)
- Knowledge at this point in story

**From world/**:
- Setting details for chapter locations
- Sensory details to include

**From drafts/** (if prior chapters exist):
- Continuity reference
- Established elements to maintain

### 5. Pre-Writing Checklist

Before generating prose:
- [ ] Writing Language confirmed
- [ ] POV character voice loaded
- [ ] All scene summaries understood
- [ ] Emotional arc for chapter mapped
- [ ] Key sensory details for settings noted
- [ ] Continuity from prior chapters checked

### 6. Generate Chapter Prose

**CRITICAL**: ALL prose in the specified **Writing Language**.

**Structure**:
```markdown
# Chapter [N]: [Title]

[Opening scene prose]

[Scene transitions and subsequent scenes]

[Chapter-ending hook]

---
<!-- Chapter Metadata
Word Count: XXXX / [Target]
POV: [Character]
Scenes: [S001, S002, S003]
Status: First Draft
Generated: [DATE]
-->
```

**Prose Generation Rules**:

1. **Follow POV strictly**: 
   - First person: "I" narrator, limited to their perception
   - Third limited: Close to POV character's thoughts
   - Third omniscient: Can access multiple minds, wider view

2. **Maintain tense**:
   - Past: "She walked..." (most common)
   - Present: "She walks..." (immediate, urgent)

3. **Apply Writing Style**:
   - `literary`: Rich prose, subtext, thematic imagery, varied sentences
   - `commercial`: Clear, punchy, forward momentum, strong hooks
   - `genre:[X]`: Genre conventions (romance: emotional interiority; thriller: short sentences in action)

4. **Scene-by-scene execution**:
   - Honor scene goal, conflict, outcome from scenes.md
   - Hit the emotional beat
   - Transition smoothly between scenes
   - End scenes with micro-hooks (except chapter end = major hook)

5. **Character voice in dialogue**:
   - Each character sounds distinct
   - Use speech patterns from profiles
   - Dialogue advances plot OR reveals character (ideally both)

6. **Sensory grounding**:
   - Include appropriate sensory details from world/
   - Anchor scenes in physical space
   - Balance description with action

7. **Show don't tell** (mostly):
   - Convey emotion through action and detail
   - Use telling strategically for pacing
   - Internalize less in action scenes, more in reflection scenes

### 7. Chapter Quality Checks

After generation, verify:
- [ ] Word count within target range
- [ ] All scenes from scenes.md are included
- [ ] Chapter goal is achieved
- [ ] Emotional arc follows plan
- [ ] POV is consistent
- [ ] Tense is consistent
- [ ] Character voices are distinct
- [ ] Chapter ends with forward momentum

### 8. Write Output

Save to: `STORY_DIR/drafts/chapter-[N].md`

Update scenes: Mark chapter scenes as drafted [X] in the appropriate scenes file (scenes.md or scenes-chXX-XX.md)

### 9. Report

Output:
- Path to generated chapter
- Word count (actual vs. target)
- Scenes covered
- Any deviations from plan (with reasoning)
- Suggested next: `/fiction.refine` or next chapter

## Style Application Examples

**Literary style** (Spanish):
```
La luz del atardecer entraba sesgada por la ventana rota, dibujando 
geometrías de polvo y abandono sobre el suelo de madera. Elena se 
detuvo en el umbral, respirando el olor a tiempo detenido que emanaba 
de la casa de su abuela—papel amarillento, lavanda seca, secretos 
guardados demasiados años.
```

**Commercial style** (Spanish):
```
Elena empujó la puerta. El olor la golpeó primero: polvo, lavanda 
muerta, algo más. Algo que no debería estar ahí. Entró despacio, 
cada tabla crujiendo bajo sus pies. La casa de su abuela guardaba 
secretos. Y ella iba a encontrarlos.
```

**Genre: Thriller** (Spanish):
```
Treinta segundos. Eso era todo lo que tenía.

Elena cruzó el umbral. Oscuridad. Olor a encierro. Se movió por 
instinto, pegada a la pared, mientras sus ojos se adaptaban.

Veinte segundos.

La escalera. Tenía que llegar a la escalera.
```

## Context

{ARGS}

