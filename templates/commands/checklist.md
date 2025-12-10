---
description: Generate a custom quality checklist for the story based on user requirements.
scripts:
  sh: scripts/bash/check-prerequisites.sh --json
  ps: scripts/powershell/check-prerequisites.ps1 -Json
---

## Checklist Purpose: Quality Validation for Fiction

**CRITICAL CONCEPT**: Checklists validate the quality, clarity, and completeness of story elements - they ensure your premise, outline, characters, and scenes are well-developed before drafting.

**NOT for prose evaluation**:
- ❌ NOT "Does the dialogue sound natural?"
- ❌ NOT "Is the writing evocative?"
- ❌ NOT "Check if the chapter is engaging"

**FOR story foundation validation**:
- ✅ "Is the protagonist's flaw clearly defined and shown in action?"
- ✅ "Are the stakes escalated at the midpoint?"
- ✅ "Is the magic system's cost specified?"
- ✅ "Does each scene have a clear purpose (plot/character/theme)?"
- ✅ "Are character motivations consistent across all scenes?"

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Execution Steps

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for STORY_DIR and AVAILABLE_DOCS.
   - All file paths must be absolute.
   - For single quotes in args, use escape syntax.

2. **Load Language & Style Configuration** (CRITICAL):
   - Read `/memory/principles.md` for **Writing Language**
   - All checklist items and descriptions MUST be in the Writing Language
   - Apply Writing Style context to checklist focus

3. **Clarify Intent**: Derive up to THREE contextual questions:
   - What aspect of the story needs validation? (character, plot, world, structure, all)
   - What stage is the story at? (premise, outline, scenes, drafting)
   - What quality concerns are top priority?
   
   Skip questions if already clear from `$ARGUMENTS`.

4. **Load Story Context**: Read from STORY_DIR:
   - premise.md: Core concept, characters, conflict
   - **Outline files** (load appropriate structure):
     - If split structure exists: Read outline/index.md, outline/acts.md, outline/chapters.md, outline/arcs.md
     - Otherwise: Read outline.md (if exists)
   - **Scenes files** (load appropriate structure):
     - If split structure exists: Read scenes/index.md and scenes/chXX-XX.md files
     - Otherwise: Read scenes.md (if exists)
   - characters/ (if exists): Character profiles
   - world/ (if exists): World-building docs

5. **Generate Checklist** in the **Writing Language**:
   - Create `STORY_DIR/checklists/` directory if needed
   - Generate filename based on focus: `character.md`, `plot.md`, `world.md`, `structure.md`, `general.md`
   - Number items sequentially: CHK001, CHK002, etc.

   **Category Structure** - Group by story element:

   **Premise Quality**:
   - Is the logline clear and compelling?
   - Are stakes defined (personal AND external)?
   - Is theme articulated without being preachy?

   **Character Foundation**:
   - Does protagonist have clear want, need, and flaw?
   - Is antagonist's motivation compelling and specific?
   - Are key relationships defined with dynamics?
   - Is each character's voice distinct?

   **Plot Structure**:
   - Is inciting incident clear and compelling?
   - Does midpoint create meaningful shift?
   - Is "All Is Lost" moment truly devastating?
   - Does climax use protagonist's growth?
   - Are all plot threads resolved or intentionally left open?

   **Scene Quality**:
   - Does each scene have clear purpose?
   - Is POV consistent within scenes?
   - Does each scene have conflict?
   - Do scene endings create forward momentum?

   **World Consistency**:
   - Are world rules clearly defined?
   - Are rules consistently applied?
   - Is setting integrated with plot needs?

   **Arc Tracking**:
   - Is protagonist's internal arc tracked through all acts?
   - Do supporting characters have appropriate arcs?
   - Does theme deepen through the story?

   **Genre Conventions**:
   - Are expected genre beats present?
   - Are subversions intentional and effective?

   **Language & Style Compliance**:
   - Is all content in the specified Writing Language?
   - Does tone match the defined Writing Style?
   - Are principles.md rules followed?

6. **Write Checklist** using template structure:
   ```markdown
   # [Focus] Checklist: [Story Title]
   
   **Purpose**: [What this checklist validates]
   **Writing Language**: [Language]
   **Created**: [DATE]
   **Story**: [Link to premise.md]
   
   ## [Category 1]
   
   - [ ] CHK001 [Checklist item in Writing Language]
   - [ ] CHK002 [Checklist item]
   
   ## [Category 2]
   
   - [ ] CHK003 [Checklist item]
   ```

7. **Report**:
   - Output path to created checklist
   - Item count by category
   - Writing Language used
   - Remind user this is for validation, not prose critique

## Example Checklists by Focus

### Character Checklist (`character.md`)

```markdown
- [ ] CHK001 Is protagonist's WANT clearly stated? [Premise §Characters]
- [ ] CHK002 Is protagonist's NEED different from want? [Character Arc]
- [ ] CHK003 Is protagonist's FLAW shown in action, not just stated? [Scene Evidence]
- [ ] CHK004 Does antagonist have compelling, specific motivation? [Premise §Antagonist]
- [ ] CHK005 Is the protagonist-antagonist relationship defined? [Conflict]
- [ ] CHK006 Are character voices distinct in dialogue patterns? [Characters/]
- [ ] CHK007 Is each POV character's interiority accessible? [Scenes]
```

### Plot Checklist (`plot.md`)

```markdown
- [ ] CHK001 Is inciting incident clear and story-changing? [Outline Act I]
- [ ] CHK002 Does protagonist have clear goal from Act I? [Premise]
- [ ] CHK003 Does midpoint raise stakes or shift direction? [Outline Midpoint]
- [ ] CHK004 Is "All Is Lost" moment the true lowest point? [Outline Act II-B]
- [ ] CHK005 Does climax require protagonist's growth to succeed? [Outline Act III]
- [ ] CHK006 Are all introduced plot threads resolved? [Thread Tracking]
- [ ] CHK007 Is causality clear between major events? [Scene Flow]
```

### World Checklist (`world.md`)

```markdown
- [ ] CHK001 Are magic/technology rules clearly defined? [World/]
- [ ] CHK002 Are costs/limitations for special abilities specified? [World Rules]
- [ ] CHK003 Are rules consistently applied across scenes? [Consistency]
- [ ] CHK004 Is setting integrated with character and plot needs? [Setting]
- [ ] CHK005 Are cultural elements consistent? [World Culture]
- [ ] CHK006 Is history relevant to current conflict established? [World History]
```

### Structure Checklist (`structure.md`)

```markdown
- [ ] CHK001 Does structure match chosen methodology? [Outline]
- [ ] CHK002 Are all required beats present? [Beat Sheet]
- [ ] CHK003 Is pacing appropriate for genre? [Chapter Distribution]
- [ ] CHK004 Is POV distribution intentional and effective? [POV Tracking]
- [ ] CHK005 Does each chapter end with forward momentum? [Scene Hooks]
- [ ] CHK006 Is theme present without heavy-handedness? [Theme Tracking]
```

## Language & Style Note

**ALL checklist items MUST be written in the story's Writing Language** as defined in `/memory/principles.md`.

If the story is in Spanish, checklist items are in Spanish:
```markdown
- [ ] CHK001 ¿El protagonista tiene un DESEO claramente definido?
- [ ] CHK002 ¿La NECESIDAD del protagonista difiere de su deseo?
```

## Context

{ARGS}
