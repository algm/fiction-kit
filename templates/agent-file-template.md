# [PROJECT NAME] Fiction Writing Guidelines

Auto-generated from story outline. Last updated: [DATE]

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

### Writing Language & Style (MANDATORY)

**ALWAYS** read `/memory/principles.md` before generating any prose. Extract:
- **Writing Language**: ALL prose must be in this language
- **Regional Variant**: For spelling, idioms, cultural references
- **Writing Style**: literary / commercial / genre:[X]
- **Voice settings**: POV, tense, narrative distance, prose style
- **Things to ALWAYS/NEVER do**

**ABORT if Writing Language not defined** in principles.md.

### Cross-Reference System

When referencing information from other files:
- Use markdown links: `[link text](path/to/file.md)`
- Link to authoritative sources (single source of truth)
- Never duplicate information - reference it via links instead
- Verify all cross-references are valid (no broken links)

**In prose files**: Write clean narrative WITHOUT cross-reference links in the prose itself.

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
