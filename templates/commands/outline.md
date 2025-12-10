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

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for:
   - `STORY_DIR`: Path to the story directory
   - `PREMISE_FILE`: Path to premise.md
   - `OUTLINE_FILE`: Path to outline.md (template already copied)
   - For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot'.
   
   **Determine outline structure**:
   - **Single-file**: Use outline.md for shorter stories (default, recommended for < 20 chapters)
   - **Split structure**: Use multiple outline files for longer stories (recommended for 20+ chapters):
     - `outline-index.md` - Summary, structure config, beats overview
     - `outline-acts.md` - Detailed act breakdowns with key scenes
     - `outline-chapters.md` - Complete chapter plan with summaries
     - `outline-arcs.md` - Character arcs and subplot tracking
   
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
   
   **Phase 5: Subplot Integration**
   - Identify B-plots that support theme
   - Place subplot beats to complement main plot
   - Ensure subplots resolve or advance

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
   - Save completed outline to OUTLINE_FILE (outline.md)
   - Ensure Language & Style section is at the top
   
   **For split structure**:
   - Save to STORY_DIR/outline-index.md (summary and overview)
   - Save to STORY_DIR/outline-acts.md (detailed act breakdowns)
   - Save to STORY_DIR/outline-chapters.md (chapter plan)
   - Save to STORY_DIR/outline-arcs.md (character arcs and subplots)
   - Ensure each file has Language & Style section
   - Ensure files reference each other appropriately

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
