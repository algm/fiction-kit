# [PROJECT NAME] Fiction Writing Guidelines

Auto-generated from story outline. Last updated: [DATE]

## Essential Reading - CONSULT THESE FIRST

Before working on ANY fiction writing task, you MUST read these foundational documents in order:

1. **`/memory/principles.md`** - MANDATORY before generating ANY prose
   - Defines writing language, style, voice, and narrative rules
   - Contains "Things to ALWAYS do" and "Things to NEVER do"
   - ALL prose generation MUST follow these principles
   - ABORT if Writing Language is not defined

2. **`navigation-guide.md`** - Your map to find ANY information
   - Shows where each type of information lives (single source of truth)
   - Provides cross-reference patterns for linking between files
   - First place to look when you need to locate story information

3. **`fiction-methodology.md`** (in repository root) - Workflow and philosophy
   - Explains the Fiction Kit structured writing methodology
   - Details the workflow phases: Setup → Development → Planning → Writing → Refinement
   - Describes single source of truth principle and cross-reference system
   - Understanding this prevents common workflow mistakes

## Critical Writing Rules

### Single Source of Truth Principle

**Each piece of story information exists in exactly ONE authoritative location.** Other files reference it via markdown links.

- **Character information** → `characters/[name].md` (single source of truth)
- **World-building** → `world/` directory (single source of truth)
- **Scene planning** → `scenes.md` or `scenes/` directory (single source of truth)
- **Plot structure** → `outline.md` or `outline/` directory (single source of truth)
- **Story foundation** → `premise.md` (single source of truth)
- **Writing principles** → `/memory/principles.md` (single source of truth)

**See**: `navigation-guide.md` in the story directory for the complete information location map.

### How to Find Information

**ALWAYS consult `navigation-guide.md` as your FIRST step** when you need to locate:
- Character details → Check navigation guide → Go to specific character file
- World rules → Check navigation guide → Go to world-bible.md
- Timeline events → Check navigation guide → Go to world/world-bible.md#timeline or world/events/
- Scene breakdown → Check navigation guide → Go to scenes/ directory
- Writing style rules → Check navigation guide → Go to /memory/principles.md

**Never guess where information lives. Always check navigation-guide.md first.**

### Critical Restriction: Do Not Develop Outline or Chapter Structure

**IMPORTANT**: Most commands MUST NOT develop, modify, or create:
- Outline structure (acts, beats, chapter plans)
- Chapter breakdowns or chapter summaries
- Scene planning or scene breakdowns
- Plot structure or story beats

**Only the following commands are authorized to develop outline and chapter information:**
- `/fiction.outline` - For creating and modifying story outlines
- `/fiction.scenes` - For creating and modifying scene breakdowns

**If outline or chapter development is needed**, direct the user to use the appropriate command (`/fiction.outline` or `/fiction.scenes`) instead.

### Fiction Kit Workflow Phases

Understanding the workflow prevents mistakes. See `fiction-methodology.md` for full details.

**Phase 1: Setup (Foundation)**
- `/fiction.principles` - Define voice, style, language, narrative rules
- `/fiction.premise` - Create story concept, theme, conflict

**Phase 2: Development (Building Blocks)**
- `/fiction.world` - Build consistent world, geography, history, magic/tech systems
- `/fiction.character` - Create complete characters with wounds, arcs, relationships
- `/fiction.develop` - Resolve ambiguities in premise, characters, world

**Phase 3: Planning (Structure)**
- `/fiction.outline` - Create story skeleton (acts, beats, chapter goals)
- `/fiction.scenes` - Break chapters into scenes with goals, POV, conflicts

**Phase 4: Writing (Drafting)**
- `/fiction.draft` - Write prose scene-by-scene in separate files
- Scene prose goes in `drafts/scenes/c###s###.md` (e.g., c001s001.md)
- Prose-index.md tracks progress and references

**Phase 5: Refinement (Quality)**
- `/fiction.review` - Check for plot holes, consistency, pacing
- `/fiction.refine` - Improve existing content

**Phase 6: Output (Publishing)**
- `/fiction.synopsis` - Generate marketing materials

**Key Workflow Rule**: Each phase builds on previous phases. Don't skip foundations.

### Writing Language & Style (MANDATORY)

**CRITICAL**: Before generating ANY prose, you MUST:
1. Read `/memory/principles.md` IN FULL
2. Extract these MANDATORY settings:
   - **Writing Language**: ALL prose must be in this language (e.g., "en - English", "es - Spanish")
   - **Regional Variant**: For spelling, idioms, cultural references
   - **Writing Style**: literary / commercial / genre:[X]
   - **Voice settings**: POV, tense, narrative distance, prose style
   - **Things to ALWAYS do**: Follow these rules in every scene
   - **Things to NEVER do**: Avoid these patterns completely

3. **ABORT prose generation if**:
   - Writing Language is not defined in principles.md
   - You haven't read the principles file
   - Any MANDATORY setting is missing or marked as TODO

**This is non-negotiable.** Prose without consulting principles.md will be inconsistent and may be in the wrong language.

### Cross-Reference System

When referencing information from other files:
- Use markdown links: `[link text](path/to/file.md)`
- Link to authoritative sources (single source of truth)
- Never duplicate information - reference it via links instead
- Verify all cross-references are valid (no broken links)

**In prose files**: Write clean narrative WITHOUT cross-reference links in the prose itself.

**Examples from navigation-guide.md**:
```markdown
<!-- In scenes/ch01-05.md (scene planning) -->
- **POV Character**: [Maria](../characters/maria.md)
- **Location**: [Plaza Mayor](../world/world-bible.md#key-locations)
- **References**: [Plaza Massacre event](../world/events/plaza-massacre.md)

<!-- In characters/maria.md -->
She witnessed [the Plaza Massacre](../world/events/plaza-massacre.md) at age 12.

<!-- In drafts/scenes/c001s001.md (prose file) -->
<!-- NO LINKS IN PROSE - Keep prose clean -->
Maria ran through the Plaza Mayor as she remembered the massacre.
```

### Template Files and Their Purpose

Fiction Kit uses structured templates for consistency. Key templates are in `.fiction/templates/`:

- **agent-file-template.md** - This file you're reading, guidelines for AI agents
- **navigation-guide.md** - Information location map (deployed to story directory)
- **principles.md** - Writing style and rules template (deployed to /memory/)
- **premise-template.md** - Story foundation structure
- **character-template.md** - Character profile structure (wounds, arcs, voice)
- **world-template.md** - World-building structure (geography, history, magic)
- **outline-template.md** - Plot structure templates
- **scenes-template.md** - Scene breakdown structure
- **prose-index-template.md** - Prose tracking and references

Each template guides AI agents to create complete, consistent content.

## Quick Reference - Key Files Locations

When working on fiction writing tasks, you'll frequently need these files:

**Foundation & Rules:**
- `/memory/principles.md` - Writing style, language, voice rules (READ FIRST for any prose)
- `premise.md` - Story concept, theme, genre, logline
- `navigation-guide.md` - Map showing where all information lives

**Story Content:**
- `characters/` - Character profiles (wounds, arcs, relationships)
- `world/` - World-building (geography, history, magic/tech, timeline)
- `outline/` - Plot structure (acts, beats, chapter plans)
- `scenes/` - Scene breakdowns (goals, conflicts, POV)
- `drafts/prose-index.md` - Prose tracking and progress
- `drafts/scenes/` - Actual prose files by scene

**When in doubt:** Check `navigation-guide.md` to find the authoritative location.

## Active Technologies

[EXTRACTED FROM ALL PLAN.MD FILES]

## Project Structure

```text
[ACTUAL STRUCTURE FROM PLANS]
```

## Commands

[ONLY COMMANDS FOR ACTIVE TECHNOLOGIES]

## Code Style

[LANGUAGE-SPECIFIC, ONLY FOR LANGUAGES IN USE]

## Recent Changes

[LAST 3 FEATURES AND WHAT THEY ADDED]

<!-- MANUAL ADDITIONS START -->
<!-- MANUAL ADDITIONS END -->
