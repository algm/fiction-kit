---
description: Create or update the writing principles document that defines voice, style, and narrative rules for your story.
handoffs: 
  - label: Create Story Premise
    agent: fiction.premise
    prompt: Create the premise for my story. I want to write...
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

You are creating or updating the writing principles at `/memory/principles.md`. This document establishes the voice, style, rules, and creative guidelines that will govern all writing in this project.

Follow this execution flow:

1. Load the existing principles file at `/memory/principles.md` if it exists.
   - Identify any placeholder tokens of the form `[ALL_CAPS_IDENTIFIER]`.
   - If the file doesn't exist, create it with the base structure.

2. Gather/derive values for the principles based on:
   - User input (conversation) - writing style preferences, genre conventions, voice guidelines
   - Story context from premise.md if it exists
   - Genre conventions for the specified genre
   - Any existing writing samples or references provided

3. The principles document should include:

   ## Writing Language & Style *(MANDATORY - must be set first)*
   - **Writing Language**: [Language code and name, e.g., "en - English", "es - Spanish", "fr - French"]
   - **Regional Variant**: [e.g., "British English", "Latin American Spanish", "Québécois French"]
   - **Writing Style**: [literary / commercial / genre:[subgenre]]
     - `literary`: Focus on prose quality, symbolism, thematic depth, experimental techniques
     - `commercial`: Accessible, plot-driven, strong pacing, broad appeal
     - `genre:[subgenre]`: Follow genre conventions (fantasy, scifi, romance, thriller, mystery, horror)
   - **Methodology**: [snowflake / beat-sheet / discovery / custom]
     - `snowflake`: Expand from sentence → paragraph → page → full outline
     - `beat-sheet`: Save the Cat / 3-Act / Hero's Journey structure
     - `discovery`: Write first, outline retroactively (pantsing)
     - `custom`: User-defined workflow
   
   ## Voice & Narrative Style
   - **POV**: [First person / Third limited / Third omniscient / Multiple POV]
   - **Tense**: [Past / Present]
   - **Narrative Distance**: [Close / Medium / Distant]
   - **Prose Style**: [Sparse/Hemingway / Lush/Literary / Commercial/Accessible / Purple/Ornate]
   
   ## Language-Specific Guidelines
   - **Vocabulary Level**: [Simple / Moderate / Literary / Period-specific]
   - **Sentence Structure**: [Short, punchy / Varied / Complex, flowing]
   - **Dialogue Style**: [Realistic/naturalistic / Stylized / Minimal / Snappy]
   - **Profanity/Content**: [None / Mild / Moderate / Unrestricted]
   - **Idioms & Expressions**: [Use local idioms / Use universal expressions / Mix]
   - **Formality Level**: [Formal / Neutral / Informal / Varies by character]
   
   ## Genre Conventions
   - **Genre**: [Primary genre and subgenres]
   - **Tropes to Embrace**: [Genre elements to use]
   - **Tropes to Avoid/Subvert**: [Clichés to skip or twist]
   - **Reader Expectations**: [What the audience expects]
   
   ## Pacing & Structure
   - **Scene Length**: [Short/punchy / Medium / Long/immersive]
   - **Chapter Length**: [Target word count]
   - **Tension Pattern**: [How to build and release tension]
   - **White Space**: [Use of scene breaks, chapter breaks]
   
   ## Character Voice Rules
   - **Protagonist Voice**: [Specific voice guidelines]
   - **Dialogue Differentiation**: [How characters sound distinct]
   - **Internal Monologue**: [How to handle thoughts]
   
   ## World-Building in Prose
   - **Exposition Style**: [Integrated / Explained / Minimal]
   - **Sensory Details**: [Which senses to emphasize]
   - **Setting Description**: [Brief / Moderate / Detailed]
   
   ## Things to ALWAYS Do
   - [Rule 1]
   - [Rule 2]
   
   ## Things to NEVER Do
   - [Rule 1]
   - [Rule 2]
   
   ## Reference Works
   - [Books whose style to emulate]
   - [Specific passages as examples]
   
   ## Version Control
   - **Version**: [X.Y.Z]
   - **Created**: [DATE]
   - **Last Updated**: [DATE]

4. Validation before final output:
   - No remaining unexplained bracket tokens.
   - Rules are clear and actionable.
   - Genre conventions match the stated genre.
   - Voice guidelines are specific enough to follow.

5. Write the completed principles back to `/memory/principles.md`.

6. Output a summary to the user with:
   - The established voice and style.
   - Key rules summarized.
   - Suggested next step (usually `/fiction.premise`).

Formatting & Style Requirements:
- Use Markdown headings as shown.
- Keep rules declarative and specific.
- Avoid vague language - be precise.
- Include examples where helpful.

If the user supplies partial updates (e.g., only changing tense), preserve other existing rules.

If critical info missing, insert `TODO(<FIELD_NAME>): explanation` and note it for follow-up.

