---
description: Create or refine the story premise document that captures the core concept, characters, conflict, and theme.
handoffs: 
  - label: Develop Story Elements
    agent: fiction.develop
    prompt: Help me clarify and develop story elements...
  - label: Create Story Outline
    agent: fiction.outline
    prompt: Create an outline for this story...
scripts:
  sh: scripts/bash/create-new-story.sh --json
  ps: scripts/powershell/create-new-story.ps1 -Json
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

Goal: Create a comprehensive story premise document that captures all foundational elements needed to develop a compelling narrative.

**Single Source of Truth Principle**: The premise.md file is the single source for story foundation. Other files (characters, world, outline) will reference it via cross-references.

**See**: [navigation-guide.md](../navigation-guide.md) for the complete information location map.

### Execution Steps

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for:
   - `STORY_DIR`: Path to the story directory
   - `BRANCH_NAME`: Branch name for the story
   - `PREMISE_FILE`: Path to premise.md
   - For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot'.
   
   **Navigation Setup**:
   - Create `STORY_DIR/navigation-guide.md` from `.fiction/templates/navigation-guide.md` if it doesn't exist
   - This file will serve as the master index for all story information

2. **Load Writing Configuration** (CRITICAL):
   - Read `/memory/principles.md` and extract:
     - **Writing Language**: The language ALL content must be written in
     - **Regional Variant**: For culturally appropriate references
     - **Writing Style**: literary / commercial / genre:[X]
     - **Methodology**: snowflake / beat-sheet / discovery / custom
   - If principles.md doesn't exist, prompt user to run `/fiction.principles` first OR ask for language/style preferences now.
   
   - **Load Style-Specific Guidance**:
     - If Writing Style is `literary`, read `.fiction/templates/guidance/styles/literary.md` for literary fiction best practices
     - If Writing Style is `commercial`, read `.fiction/templates/guidance/styles/commercial.md` for commercial fiction best practices
     - If Writing Style is `genre:fantasy`, read `.fiction/templates/guidance/genres/fantasy.md` for fantasy-specific guidance
     - If Writing Style is `genre:thriller`, read `.fiction/templates/guidance/genres/thriller.md` for thriller-specific guidance
     - If Writing Style is `genre:scifi`, `genre:romance`, `genre:mystery`, or `genre:horror`, apply similar genre conventions
     - **Apply this guidance** to all premise development decisions below

3. **Gather Story Information**:
   Based on user input, derive or ask for:
   
   **Core Concept** (REQUIRED):
   - What is the central "what if" question or hook?
   - What genre and subgenre?
   - What tone? (dark, hopeful, humorous, etc.)
   
   **Protagonist** (REQUIRED):
   - Who is the main character?
   - What do they WANT (external goal)?
   - What do they NEED (internal growth)?
   - What is their main flaw?
   
   **Conflict** (REQUIRED):
   - What is the central conflict?
   - Who or what is the antagonist/opposition?
   - What are the stakes (personal and external)?
   
   **Theme** (REQUIRED):
   - What underlying idea does this story explore?
   - What truth about life/humanity does it reveal?
   
   **Setting** (REQUIRED):
   - When and where does the story take place?
   - What makes this world unique or interesting?

4. **Generate Premise Document**:
   - Use `.fiction/templates/premise-template.md` as structure
   - Fill the **Language & Style Configuration** section FIRST
   - Write ALL content in the specified **Writing Language**
   - Apply **Writing Style** conventions to descriptions
   - Mark unclear elements as `[NEEDS DEVELOPMENT]`

5. **Validation**:
   - All mandatory sections have content
   - Language & Style Configuration is complete
   - Logline is compelling and clear (1-2 sentences)
   - Stakes are defined
   - Character has want, need, and flaw
   - No conflicting information

6. **Write Output**:
   - Save to PREMISE_FILE
   - Create STORY_DIR if needed

7. **Report**:
   - Output path to created premise.md
   - Summarize key story elements
   - List any `[NEEDS DEVELOPMENT]` items
   - Suggest next command:
     - `/fiction.develop` if many unclear elements
     - `/fiction.outline` if premise is solid
     - `/fiction.character` or `/fiction.world` for depth

## Language & Style Enforcement

**CRITICAL**: All content in premise.md MUST be written in the **Writing Language** specified in principles.md.

This includes:
- Logline and pitch
- Character descriptions
- Setting descriptions
- Theme articulation
- All narrative text

The **Writing Style** should influence:
- `literary`: Evocative, thematic language in descriptions
- `commercial`: Clear, punchy, hook-driven descriptions
- `genre:[X]`: Genre-appropriate terminology and tropes

## Premise Quality Checklist

Before saving, verify:
- [ ] Writing Language is specified and all content is in that language
- [ ] Writing Style is defined
- [ ] Logline captures protagonist + conflict + stakes in 1-2 sentences
- [ ] Genre and subgenre are clear
- [ ] Protagonist has clear want, need, and flaw
- [ ] Antagonist/opposition is identified with clear motivation
- [ ] Stakes are personal AND external
- [ ] Theme is articulated (not preachy)
- [ ] Setting supports the story's needs

## Context

{ARGS}
