---
description: Generate or improve dialogue for scenes, ensuring distinct character voices and subtext.
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

Create sharp, distinctive dialogue that reveals character, advances plot, and includes meaningful subtext. Can generate new dialogue or refine existing exchanges.

## Execution Steps

### 1. Setup

Run `{SCRIPT}` from repo root and parse JSON for:
- `STORY_DIR`: Path to story directory

### 2. Load Language & Style Configuration (CRITICAL)

Read `/memory/principles.md` and extract:
- **Writing Language**: Dialogue must be in this language
- **Regional Variant**: Affects idioms, slang, formality norms
- **Writing Style**: Affects dialogue approach
- **Dialogue style settings**: Realistic/stylized/minimal/snappy

### 3. Load Character Voices

For each character in the scene, read from `characters/`:
- Speaking style and patterns
- Vocabulary level
- Verbal tics and phrases
- What they avoid saying
- Formality level
- Accent/dialect markers

### 4. Identify Dialogue Task

Based on user input:
- **Generate new**: Create dialogue for a scene
- **Improve existing**: Refine flat dialogue
- **Differentiate voices**: Make characters sound distinct
- **Add subtext**: Layer meaning beneath words
- **Punch up**: Make dialogue more engaging

### 5. Scene Context

For new or improved dialogue, establish:
- Which characters are present?
- What's the scene goal?
- What's the conflict in this conversation?
- What does each character want?
- What are they hiding?
- What's the power dynamic?
- What's the emotional temperature?

### 6. Dialogue Generation Principles

**CRITICAL**: ALL dialogue in **Writing Language** with **Regional Variant**.

#### Voice Differentiation

Each character should have distinct:
- **Sentence length**: Short and clipped vs. flowing and elaborate
- **Vocabulary**: Simple vs. educated, formal vs. casual
- **Rhythm**: Hesitant vs. confident, fast vs. measured
- **Topics**: What they talk about, what they avoid
- **Attitude**: How they relate to others

#### Subtext Techniques

Dialogue should have layers:
- **Surface meaning**: What's literally said
- **Underlying meaning**: What's really meant
- **Hidden meaning**: What characters don't know they're revealing

Ways to add subtext:
- Characters talk around the real issue
- Answer questions with questions
- Non-sequiturs that reveal preoccupation
- Loaded words with personal significance
- Interruptions and topic changes

#### Beats and Business

Dialogue isn't just words:
- **Action beats**: What characters do while talking
- **Reaction beats**: Physical response to what's said
- **Environmental details**: Setting intrusions
- **Silence beats**: Meaningful pauses

### 7. Dialogue Quality Checks

For each exchange:
- [ ] Can you identify speaker without tags?
- [ ] Does each line advance plot OR reveal character?
- [ ] Is there subtext (meaning beneath surface)?
- [ ] Are beats included for rhythm?
- [ ] Is exposition hidden in conflict?
- [ ] Does dialogue match character profiles?
- [ ] Is regional language appropriate?

### 8. Common Dialogue Problems to Fix

| Problem | Solution |
|---------|----------|
| All characters sound the same | Review character profiles, add speech quirks |
| Too on-the-nose | Add subtext, make characters indirect |
| Exposition dump | Spread info, add conflict to delivery |
| Talking heads | Add beats, action, setting |
| Unrealistic | Read aloud, cut formal patterns |
| Too much | Cut, let silence speak |
| Too little | Add context, emotion, conflict |

### 9. Output Format

**For new dialogue**:
```markdown
## Scene: [Scene Name]
**Characters**: [List]
**Goal**: [What conversation must achieve]

---

[Dialogue with beats]

---

**Notes**:
- [Voice notes for each character]
- [Subtext layers]
```

**For dialogue improvement**:
```markdown
## Dialogue Refinement: [Scene]

### Original
[Original dialogue]

### Refined
[Improved dialogue]

### Changes Made
- [Change 1 and reasoning]
- [Change 2 and reasoning]
```

### 10. Report

Output:
- Generated or refined dialogue
- Character voice notes used
- Subtext layers explained
- Suggestions for further refinement

## Dialogue Style Examples

**Writing Style affects dialogue approach**:

**Literary** (Spanish):
```
—¿Crees que volverá? —María dejó que la pregunta flotara, pesada 
como el humo de su cigarrillo.

Tomás no contestó. Había aprendido que ciertas preguntas no 
buscaban respuestas, solo testigos.

—Siempre vuelven —dijo al fin—. Es lo que tienen los fantasmas.
```

**Commercial** (Spanish):
```
—¿Volverá?
—Los de su tipo siempre vuelven.
—¿Su tipo?
—Fantasmas. —Tomás apagó el cigarrillo—. Especialidad de la casa.
```

**Genre: Romance** (Spanish):
```
—No tenías que venir.
—Lo sé.
—Entonces ¿por qué...?

Él se encogió de hombros, pero sus ojos decían lo que sus labios 
no podían. Ella lo odiaba por eso. Lo odiaba por hacerla esperar 
palabras que nunca llegaban.

—Café —dijo él—. Necesitaba café.

Mentiroso, pensó ella. Y sonrió a pesar de todo.
```

## Context

{ARGS}

