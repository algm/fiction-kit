---
description: Iterate and improve existing prose - fix consistency issues, strengthen plot, deepen character, enhance style.
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

Improve existing draft content through targeted refinement. This is the editing/revision phase where first draft prose is elevated to polished prose.

**Single Source of Truth Principle**: When checking consistency, reference authoritative information from navigation-guide.md locations. Use cross-references to verify details.

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

## Refinement Types

| Type | Focus | When to Use |
|------|-------|-------------|
| **consistency** | Fix continuity errors, character voice breaks | After `/fiction.review` flags issues |
| **plot** | Strengthen causality, add foreshadowing, fix pacing | When plot feels weak |
| **character** | Deepen motivation, fix voice, add interiority | When characters feel flat |
| **style** | Improve prose quality, vary sentences, enhance imagery | For polish pass |
| **dialogue** | Sharpen exchanges, add subtext, differentiate voices | When dialogue is flat |
| **pacing** | Adjust scene length, add/remove beats, fix rhythm | When flow is off |
| **full** | Complete revision addressing all areas | Final polish |

## Execution Steps

### 1. Setup

Run `{SCRIPT}` from repo root and parse JSON for:
- `STORY_DIR`: Path to story directory

### 2. Load Language & Style Configuration (CRITICAL)

Read `/memory/principles.md` and extract:
- **Writing Language**: Refinements must maintain this language
- **Writing Style**: Target style for improvements
- **Voice settings**: POV, tense, prose style preferences
- **Things to ALWAYS/NEVER do**: Hard rules to enforce

### 3. Identify Content to Refine

From user input, determine scope:
- Specific chapter: "refine chapter 3"
- Specific scenes: "refine S012-S015"  
- Specific passage: "refine the opening scene"
- Specific issue: "fix dialogue in chapter 5"
- By type: "do a style pass on chapter 2"

### 4. Load Context

**Navigation Setup**:
- Consult `STORY_DIR/navigation-guide.md` to locate authoritative information sources

**Draft content**: Read the specified chapter/scene from `drafts/`

**Story context** (for consistency):
- Prior/subsequent chapters for continuity
- **Character profiles**: Load from `characters/[name].md` (single source of truth for character information)
- **Outline**: Load from `outline.md` or `outline/` directory (single source for plot structure)
- **Scenes**: Load from `scenes.md` or `scenes/` directory (single source for scene planning)
- **World elements**: Load from `world/world-bible.md` or `world/events/` or `world/magic/` (single source for world information)
- **Prose tracking**: Check `drafts/prose-index.md` for reference tracking

### 5. Analyze Current State

Before refining, assess:
- What's working well (preserve this)
- What needs improvement (focus here)
- Severity of issues (prioritize)

### 6. Apply Refinement by Type

#### Consistency Refinement
- **Verify against single sources**: Check character behavior against `characters/[name].md`, timeline against `world/world-bible.md#timeline`, world rules against `world/world-bible.md#magic-system`
- Fix timeline errors (reference `world/world-bible.md#historical-timeline` or `world/events/[event].md`)
- Correct character knowledge issues (reference `characters/[name].md` for character background)
- Align character behavior with profile (reference `characters/[name].md` for personality and traits)
- Fix setting/world rule violations (reference `world/world-bible.md` for authoritative world rules)
- Standardize terminology
- **Verify cross-references**: Ensure all markdown links in prose-index.md and scene References are valid

#### Plot Refinement
- Add missing foreshadowing
- Strengthen cause-and-effect chains
- Add tension where pacing drags
- Cut unnecessary scenes/beats
- Ensure payoffs match setups

#### Character Refinement
- Deepen POV character interiority
- Add behavioral details showing personality
- Strengthen motivation visibility
- Add telling reactions to events
- Ensure arc progression is visible

#### Style Refinement
- Vary sentence length and structure
- Strengthen opening/closing lines
- Replace weak verbs with strong ones
- Add sensory details
- Cut unnecessary adverbs/adjectives
- Improve metaphors and imagery

#### Dialogue Refinement
- Add subtext (what's unsaid)
- Differentiate character voices
- Cut excessive dialogue tags
- Add meaningful beats between lines
- Ensure dialogue advances story

#### Pacing Refinement
- Cut slow sections
- Expand rushed moments
- Add breathing room after intense scenes
- Improve scene transitions
- Adjust paragraph/sentence length for rhythm

### 7. Maintain Language & Style

**CRITICAL**: All refinements must:
- Stay in the **Writing Language**
- Follow **Writing Style** conventions
- Preserve established voice
- Not introduce new inconsistencies

### 8. Apply Changes

**Non-destructive approach**:
- Keep original draft as `chapter-[N]-v1.md`
- Save refined version as `chapter-[N].md` (or increment version)
- Or: Apply inline changes with clear markers

**Change tracking** (optional):
```markdown
<!-- REFINEMENT NOTE: [Description of change and reasoning] -->
```

### 9. Validation

After refinement:
- [ ] Language consistency maintained
- [ ] Style consistency maintained  
- [ ] No new continuity errors introduced
- [ ] Character voices preserved
- [ ] Intended changes applied
- [ ] Nothing broke that was working

### 10. Report

Output:
- Path to refined content
- Summary of changes made
- Word count change (if significant)
- Issues addressed
- Remaining concerns (if any)
- Suggested next: another `/fiction.refine` pass or `/fiction.review`

## Refinement Passes (Recommended Order)

For a complete revision, apply passes in this order:

1. **Consistency pass**: Fix errors first (can't polish broken content)
2. **Plot pass**: Ensure story works at structural level
3. **Character pass**: Ensure people feel real
4. **Pacing pass**: Ensure flow is right
5. **Dialogue pass**: Sharpen conversations
6. **Style pass**: Final polish

Each pass should be focused. Don't try to fix everything at once.

## Example Refinement (Style Pass)

**Before** (Spanish):
```
María entró en la habitación. Estaba oscuro. Tenía miedo. Vio una 
sombra en la esquina. Era grande. Se movió hacia ella.
```

**After** (Style refinement):
```
María empujó la puerta con el hombro, el metal frío quemándole la 
piel. La oscuridad la tragó. Su respiración resonaba demasiado 
fuerte en el silencio. En la esquina—un movimiento. Una masa 
más negra que la negrura circundante. Se desplegó hacia ella.
```

**Changes applied**:
- Varied sentence structure
- Added sensory detail (cold metal)
- Made darkness active (swallowed)
- Added interiority (breathing too loud)
- Strengthened imagery (darker than darkness)
- Made threat more ominous (unfolded)

## Context

{ARGS}

