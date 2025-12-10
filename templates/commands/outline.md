---
description: Execute the story planning workflow to generate structure, beats, and chapter plan from the premise.
handoffs: 
  - label: Create Scene Breakdown
    agent: fiction.scenes
    prompt: Break the outline into scenes
    send: true
  - label: Create Quality Checklist
    agent: fiction.checklist
    prompt: Create a checklist for story quality...
scripts:
  sh: scripts/bash/setup-outline.sh --json
  ps: scripts/powershell/setup-outline.ps1 -Json
agent_scripts:
  sh: scripts/bash/update-agent-context.sh __AGENT__
  ps: scripts/powershell/update-agent-context.ps1 -AgentType __AGENT__
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

**Single Source of Truth Principle**: Outline files are the single source for plot structure. Scenes, characters, and world files will reference outline elements via cross-references.

**See**: [navigation-guide.md](../navigation-guide.md) for the complete information location map.

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for:
   - `STORY_DIR`: Path to the story directory
   - `PREMISE_FILE`: Path to premise.md (use `PREMISE` field from JSON)
   - `OUTLINE`: Path to outline.md (template already copied, or `OUTLINE_INDEX` if split structure)
   - For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot'.
   
   **Navigation Setup**:
   - Ensure `STORY_DIR/navigation-guide.md` exists (create from template if needed)
   - Use navigation-guide.md to locate authoritative information sources
   
   **Determine outline structure**:
   - **Single-file**: Use outline.md for shorter stories (default, recommended for < 20 chapters)
   - **Split structure**: Use multiple outline files in `outline/` directory for longer stories (recommended for 20+ chapters):
     - `outline/index.md` - Summary, structure config, beats overview
     - `outline/acts.md` - Detailed act breakdowns with key scenes
     - `outline/chapters.md` - Complete chapter plan with summaries
     - `outline/arcs.md` - Character arcs and subplot tracking
   
   If user specifies preference with "--split" or "--single" in arguments, honor that.
   Otherwise, suggest split structure for stories with 20+ chapters.

2. **Load Context** (CRITICAL - Language & Style):
   - Read PREMISE_FILE and extract:
     - **Language & Style Configuration** section (MUST be present)
     - Story concept, characters, conflict, theme
   - Read `/memory/principles.md` for:
     - **Writing Language**: All outline content must be in this language
     - **Writing Style**: Affects structure and description approach
     - **Methodology**: Determines outline structure
     - Voice and narrative rules
   
   **ABORT** if Writing Language is not defined. Instruct user to run `/fiction.principles` first.
   
   - **Load Methodology-Specific Guidance**:
     - If Methodology is `snowflake`, read `.fiction/templates/guidance/methodologies/snowflake.md` for Snowflake Method best practices
     - If Methodology is `beat-sheet`, read `.fiction/templates/guidance/methodologies/beat-sheet.md` for Beat Sheet/Save the Cat guidance
     - If Methodology is `discovery`, read `.fiction/templates/guidance/methodologies/discovery.md` for Discovery Writing approach
     - **Apply this methodology** to outline structure decisions below
   
   - **Load Style-Specific Guidance** (affects outline approach):
     - If Writing Style is `literary`, read `.fiction/templates/guidance/styles/literary.md` for literary structure preferences
     - If Writing Style is `commercial`, read `.fiction/templates/guidance/styles/commercial.md` for commercial pacing requirements
     - If Writing Style is `genre:fantasy`, read `.fiction/templates/guidance/genres/fantasy.md` for fantasy plot structure
     - If Writing Style is `genre:thriller`, read `.fiction/templates/guidance/genres/thriller.md` for thriller pacing and beats
     - If Writing Style is `genre:scifi`, `genre:romance`, `genre:mystery`, or `genre:horror`, apply similar genre conventions
     - **Apply style guidance** to structure and pacing choices

3. **Select Structure Based on Methodology**:
   
   | Methodology | Recommended Structure | Focus |
   |-------------|----------------------|-------|
   | `snowflake` | Expandable outline | Start minimal, iterate to detail |
   | `beat-sheet` | Save the Cat / 3-Act | Hit all major beats precisely |
   | `discovery` | Flexible chapter list | Key moments only, room for exploration |
   | `custom` | User-defined | Follow user's structure preference |

4. **Execute Outline Workflow**:
   
   **Phase 1: Structure Selection**
   - Based on methodology, select appropriate beat sheet
   - Adapt to genre conventions (thriller pacing ≠ literary pacing)
   - Apply Writing Style to structural choices
   
   **Phase 2: Beat Planning**
   - Fill beat sheet with story-specific events
   - Ensure each beat advances plot AND character arc
   - Mark any beats that need development as `[NEEDS DEVELOPMENT]`
   
   **Phase 3: Chapter Planning**
   - Distribute beats across chapters
   - Assign POV per chapter (if multiple POV)
   - Set word count targets
   - Note chapter-level emotional arcs
   
   **Phase 4: Arc Tracking**
   - Map protagonist's internal journey across acts
   - Track key relationships through the story
   - Note thematic touchpoints
   - **Create cross-references**: Link to character files (`characters/[name].md`) for detailed arc information
   - **Link to world events**: If arcs reference historical events, link to `world/events/[event].md` or `world/world-bible.md#timeline`
   
   **Phase 5: Subplot Integration**
   - Identify B-plots that support theme
   - Place subplot beats to complement main plot
   - Ensure subplots resolve or advance
   - **Create cross-references**: Link to character files for subplot characters, world files for subplot settings

5. **Apply Writing Language**:
   - ALL chapter summaries in the specified language
   - ALL beat descriptions in the specified language
   - ALL character arc notes in the specified language
   - Use genre-appropriate terminology for the language/culture

6. **Validation Gate** (Principles Check):
   - [ ] Language & Style section is complete
   - [ ] Structure serves the story's emotional journey
   - [ ] Each act has clear goals and turning points
   - [ ] Protagonist's arc is tracked through all acts
   - [ ] Midpoint creates meaningful shift
   - [ ] All Is Lost moment is truly devastating
   - [ ] Climax uses protagonist's growth
   - [ ] Theme is woven throughout
   - [ ] Subplots support main story

7. **Update Agent Context**:
   - Run `{AGENT_SCRIPT}`
   - Add story-specific context for future commands

8. **Write Output**:
   
   **For single-file structure**:
   - Save completed outline to `STORY_DIR/outline.md` (use `OUTLINE` field from JSON)
   - Ensure Language & Style section is at the top
   
   **For split structure**:
   - Create STORY_DIR/outline/ directory if needed
   - Save to STORY_DIR/outline/index.md (summary and overview)
   - Save to STORY_DIR/outline/acts.md (detailed act breakdowns)
   - Save to STORY_DIR/outline/chapters.md (chapter plan)
   - Save to STORY_DIR/outline/arcs.md (character arcs and subplots)
   - Ensure each file has Language & Style section
   - Ensure files reference each other appropriately
   - **Create cross-references**: Link to `premise.md` for theme, `characters/[name].md` for character arcs, `world/events/[event].md` for historical context

### Inserting or moving chapters

**When inserting a new chapter in the outline**:
1. **Add to outline structure**: 
   - For single-file: Add chapter entry in `outline.md` in the correct position
   - For split structure: Add chapter entry in `outline/chapters.md` and update `outline/acts.md` if it affects act structure
2. **Update chapter numbers**: If inserting in the middle, renumber all subsequent chapters in the outline files
3. **Update act structure**: If the new chapter changes act boundaries, update `outline/acts.md` (if split structure) or act sections in `outline.md`
4. **Update character arcs**: Add chapter reference to `outline/arcs.md` (if split structure) or arc sections in `outline.md` if the chapter affects character development
5. **Update statistics**: Adjust chapter count and word count estimates in `outline/index.md` (if split structure) or summary section in `outline.md`
6. **Update scenes planning**: If `scenes.md` or `scenes/` directory exists, add corresponding chapter section and scenes
7. **If prose exists**: If chapters have been drafted, you'll need to:
   - Renumber chapter directories: `c005/` → `c006/`, `c006/` → `c007/`, etc.
   - Rename all scene files: `c005s001.md` → `c006s001.md`, etc.
   - Update **Chapter** field in all moved scene file headers
   - Update `drafts/prose-index.md` with new paths

**When moving a chapter to a different position**:
1. **Move chapter entry**: Move the chapter entry in `outline.md` or `outline/chapters.md` to the new position
2. **Renumber chapters**: Renumber all affected chapters to maintain sequential order
3. **Update act structure**: If the move crosses act boundaries, update act assignments in `outline/acts.md` (if split structure) or act sections
4. **Update character arcs**: Adjust chapter references in `outline/arcs.md` (if split structure) to reflect new order
5. **Update scenes planning**: Move chapter section in `scenes.md` or `scenes/chXX-XX.md` to match new position
6. **If prose exists**: 
   - Renumber chapter directories and scene files to match new chapter numbers
   - Update **Chapter** field in all affected scene file headers
   - Update `drafts/prose-index.md` with new paths and chapter numbers
   - Run `make chapters` and `make book` to rebuild outputs

**When removing a chapter**:
1. **Remove from outline**: Delete chapter entry from `outline.md` or `outline/chapters.md`
2. **Renumber subsequent chapters**: Decrease chapter numbers for all chapters after the removed one
3. **Update act structure**: Adjust act boundaries if needed in `outline/acts.md` (if split structure)
4. **Update character arcs**: Remove chapter references from `outline/arcs.md` (if split structure)
5. **Update scenes planning**: Remove chapter section from `scenes.md` or `scenes/chXX-XX.md`
6. **If prose exists**:
   - Delete chapter directory `drafts/scenes/c[NNN]/` and all scene files within
   - Renumber subsequent chapter directories and scene files
   - Update `drafts/prose-index.md` to remove deleted scenes and update paths for renumbered chapters
   - Run `make chapters` and `make book` to rebuild outputs

**After any insert/move/remove operation**:
1. **Verify consistency**: 
   - Check that chapter numbers are sequential with no gaps
   - Ensure act assignments are correct
   - Verify character arc references match chapter numbers
   - Check that scenes planning files reflect the same chapter structure
2. **Update statistics**: Recalculate chapter count, word count estimates, and pacing percentages
3. **Rebuild outputs**: If prose exists, run `make chapters` and `make book` to rebuild assembled outputs
4. **Update prose-index**: Verify all paths in `drafts/prose-index.md` are correct (if prose exists)

9. **Report**:
   - Output path(s) to created outline file(s)
   - Note whether using single-file or split structure
   - Summary: structure type, chapter count, estimated word count
   - List any `[NEEDS DEVELOPMENT]` items
   - Suggest next command: `/fiction.scenes`

## Structure Templates by Methodology

### Beat Sheet (beat-sheet methodology)

| Beat | Target % | Purpose |
|------|----------|---------|
| Opening Image | 0-1% | "Before" snapshot |
| Theme Stated | 5% | Theme hinted |
| Setup | 1-10% | Ordinary world |
| Catalyst | 10-12% | Inciting incident |
| Debate | 12-25% | Protagonist resists |
| Break into II | 25% | Commitment |
| B Story | 25-30% | Relationship/theme carrier |
| Fun & Games | 25-50% | Promise of premise |
| Midpoint | 50% | False victory/defeat, stakes raised |
| Bad Guys Close In | 50-75% | Complications increase |
| All Is Lost | 75% | Lowest point |
| Dark Night | 75-80% | Processing loss |
| Break into III | 80% | New insight |
| Finale | 80-95% | Final confrontation |
| Final Image | 99-100% | "After" snapshot |

### Snowflake (snowflake methodology)

Start with:
1. One-sentence summary
2. One-paragraph summary (expand to 5 sentences)
3. Character summaries (one page each)
4. Expand each paragraph sentence to a paragraph
5. Chapter-level synopsis

### Discovery (discovery methodology)

Define only:
- Opening scene/situation
- 3-5 key moments you want to hit
- Ending (or direction toward ending)
- Leave space for organic discovery

## Language & Style Application

**Writing Style affects outline approach**:

- `literary`: Focus on thematic development, symbolic structure, character interiority
- `commercial`: Focus on hooks, pacing, clear escalation, satisfying payoffs
- `genre:[X]`: Include genre-specific beats (romance: meet-cute, black moment; thriller: ticking clock)

**Regional Variant affects**:
- Cultural references in descriptions
- Idiomatic language in chapter titles
- Setting-appropriate terminology

## Key Rules

- Use absolute paths
- ALL content in the specified Writing Language
- ERROR if Writing Language not defined
- ERROR if premise.md missing critical elements
- Adapt structure to genre and methodology
