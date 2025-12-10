---
description: Identify underspecified areas in the story premise by asking targeted clarification questions about characters, world, and plot, encoding answers back into the appropriate documents.
handoffs: 
  - label: Create Story Outline
    agent: fiction.outline
    prompt: Create an outline for this story...
scripts:
   sh: scripts/bash/check-prerequisites.sh --json --paths-only
   ps: scripts/powershell/check-prerequisites.ps1 -Json -PathsOnly
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

Goal: Detect and reduce ambiguity or missing elements in the story premise, characters, and world-building, recording clarifications directly in the appropriate files.

Note: This development workflow is best run BEFORE `/fiction.outline`. If the user explicitly states they are doing exploratory writing (discovery/pantsing), you may proceed with less structure, but warn that revision may be needed later.

Execution steps:

1. Run `{SCRIPT}` from repo root **once**. Parse JSON for:
   - `STORY_DIR`
   - `PREMISE_FILE` (or `PREMISE` if using paths-only mode)
   - Construct paths from STORY_DIR: `STORY_DIR/outline.md` (or `STORY_DIR/outline/index.md` if split), `STORY_DIR/scenes.md` (or `STORY_DIR/scenes/index.md` if split)
   - If JSON parsing fails, abort and instruct user to re-run `/fiction.premise`.

2. Load the premise file and any existing character/world documents. 
   
   **FIRST**: Extract the **Language & Style Configuration** from premise.md or principles.md:
   - **Writing Language**: All questions and suggestions must be in this language
   - **Writing Style**: Affects the type of development questions asked
   - **Regional Variant**: For culturally appropriate suggestions
   
   Perform a structured story development scan using this taxonomy. For each category, mark status: Clear / Partial / Missing.

   **Character Development**:
   - Protagonist want vs. need clearly defined
   - Protagonist flaw and how it manifests
   - Antagonist motivation and methods
   - Key relationships and their dynamics
   - Character voices (how they speak, think)
   - Character backstory (wounds, ghosts, lies)
   
   **World & Setting**:
   - Physical environment (geography, climate)
   - Social structure (politics, class, culture)
   - Rules (magic system, technology, laws)
   - History (relevant past events)
   - Daily life (how ordinary people live)
   - Sensory details (sights, sounds, smells)
   
   **Plot & Conflict**:
   - Central conflict clearly defined
   - Stakes (personal and external)
   - Ticking clock or urgency
   - Obstacles and complications
   - Potential subplots
   
   **Theme & Meaning**:
   - Central theme articulated
   - How theme connects to character arc
   - Thematic questions to explore
   
   **Tone & Style**:
   - Genre conventions to honor/subvert
   - Emotional journey for reader
   - Level of darkness/lightness
   
   **Gaps & Ambiguities**:
   - Vague descriptions needing specificity
   - Contradictions to resolve
   - Missing elements for the genre

3. Generate a prioritized queue of development questions (maximum 5). Apply these constraints:
   - Maximum of 10 total questions across the whole session
   - Each question must be answerable with EITHER:
     - A short multiple-choice selection (2-5 options), OR
     - A brief creative answer (1-3 sentences)
   - Focus on questions whose answers will most impact the story's foundation
   - Prioritize: character motivation > conflict clarity > world rules > setting details
   - Skip questions already answered in existing documents

4. Sequential questioning loop (interactive):
   - Present EXACTLY ONE question at a time
   - For multiple-choice questions:
     - **Analyze options** and determine the **most compelling option** based on:
       - Genre conventions
       - Story coherence
       - Character consistency
       - Thematic resonance
     - Present your **recommended option** with reasoning
     - Render all options as a Markdown table
     - Allow custom creative answers
   
   - For creative questions:
     - Provide a **suggested answer** based on story context
     - Allow user to accept or provide their own
   
   - After the user answers:
     - Validate the answer makes sense for the story
     - Record it in working memory
     - Move to next question
   
   - Stop when:
     - Critical ambiguities are resolved
     - User signals completion
     - You reach 5 asked questions

5. Integration after EACH accepted answer:
   - Determine the best location for the clarification:
     - Character detail → characters/[name].md (create if needed)
     - World detail → world/[aspect].md (create if needed)  
     - Plot detail → premise.md
     - Style detail → /memory/principles.md
   - Update the appropriate file immediately
   - Add a `## Development Session [DATE]` section if logging to premise.md
   - Preserve existing content and formatting

6. Validation (after each write):
   - No contradictions with existing content
   - New details are specific and usable
   - Character/world files follow templates if they exist

7. Report completion:
   - Number of questions asked & answered
   - Files updated (list paths)
   - Summary of what was developed
   - Remaining gaps (if any, for future sessions)
   - Suggested next command (`/fiction.outline`, `/fiction.character`, `/fiction.world`)

Behavior rules:

- If no meaningful gaps found, respond: "Story foundation is solid. No critical development needed." and suggest proceeding.
- If premise file missing, instruct user to run `/fiction.premise` first.
- Never exceed 5 total questions.
- Respect user early termination signals.
- Create new character/world files rather than cramming everything into premise.md.

Context for development: {ARGS}

