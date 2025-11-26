---
description: Perform a non-destructive consistency and quality analysis across story artifacts (premise.md, outline.md, scenes.md, characters/, world/).
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --require-scenes --include-scenes
  ps: scripts/powershell/check-prerequisites.ps1 -Json -RequireScenes -IncludeScenes
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Goal

Identify inconsistencies, plot holes, character issues, timeline problems, and underspecified elements across story artifacts before or during drafting. This command helps ensure story coherence and quality.

## Operating Constraints

**STRICTLY READ-ONLY**: Do **not** modify any files. Output a structured analysis report. Offer remediation suggestions that user must explicitly approve.

**Principles Authority**: The writing principles (`/memory/principles.md`) define the voice, style, and rules. Principle conflicts are flagged as issues requiring adjustment.

## Execution Steps

### 1. Initialize Analysis Context

Run `{SCRIPT}` once from repo root and parse JSON for STORY_DIR and AVAILABLE_DOCS. Derive absolute paths:

- PREMISE = STORY_DIR/premise.md
- OUTLINE = STORY_DIR/outline.md
- SCENES = STORY_DIR/scenes.md
- CHARACTERS = STORY_DIR/characters/
- WORLD = STORY_DIR/world/
- DRAFTS = STORY_DIR/drafts/

**CRITICAL**: Also load `/memory/principles.md` to verify:
- **Writing Language**: Is all content in the correct language?
- **Writing Style**: Does tone match the defined style?
- **Methodology**: Is structure consistent with methodology?

Abort with error if required files are missing.

### 2. Load Artifacts (Progressive Disclosure)

**From principles.md:**
- Writing Language & Style settings
- Voice & Narrative Style rules
- Things to ALWAYS/NEVER do

**From premise.md:**
- Language & Style Configuration
- Logline and core concept
- Character overview (want, need, flaw)
- Central conflict and stakes
- Theme and setting

**From outline.md:**
- Structure and beat sheet
- Chapter plan with POV assignments
- Character arcs across acts
- Subplot tracking

**From scenes.md:**
- Scene list with POV, goals, conflicts
- Chapter organization
- Emotional beats

**From characters/ (if exists):**
- Character profiles
- Relationships
- Arcs and voice notes

**From world/ (if exists):**
- Setting details
- Rules (magic, technology)
- History and lore

**From drafts/ (if exists):**
- Written chapters for prose analysis

### 3. Build Semantic Models

Create internal representations for analysis:

- **Character consistency map**: Track character traits, voice, decisions across all docs
- **Timeline tracker**: Sequence of events with temporal markers
- **Location tracker**: Where characters are, when
- **Relationship web**: How relationships evolve
- **Theme touchpoint inventory**: Where theme is explored
- **Rule consistency**: World rules and their application

### 4. Detection Passes

Focus on high-signal findings. Limit to 50 findings; aggregate overflow.

#### A. Character Consistency

- Character behaves contrary to established traits without justification
- Character voice inconsistent between documents
- Character knowledge inconsistent (knows things they shouldn't)
- Missing character motivation for key decisions
- Arc promises in outline not reflected in scenes

#### B. Plot Coherence

- Plot holes: actions without setup, or setup without payoff
- Causality breaks: events that don't logically follow
- Missing transitions: jumps without explanation
- Dangling threads: introduced elements never resolved
- Contradictory events across documents

#### C. Timeline & Continuity

- Temporal impossibilities (events in wrong order)
- Character age/timeline inconsistencies
- Season/weather continuity errors
- Day/night logic issues
- Travel time inconsistencies

#### D. World Consistency

- Rule violations (magic system, technology)
- Setting contradictions
- Cultural/historical anachronisms
- Geography inconsistencies

#### E. Language & Style Compliance

- Content not in specified Writing Language
- Tone inconsistent with Writing Style
- Voice violations per principles.md
- Terminology drift

#### F. Structural Analysis

- Pacing issues (too fast, too slow)
- Missing beats per chosen methodology
- Imbalanced POV distribution
- Theme underrepresentation or heavy-handedness
- Arc completion gaps

#### G. Scene Quality

- Scenes without clear purpose (plot, character, or theme)
- Missing conflict or stakes
- Unclear POV
- Redundant scenes

### 5. Severity Assignment

- **CRITICAL**: Plot holes that break story logic, major character inconsistencies, missing resolution for central conflict
- **HIGH**: Timeline breaks, character knowledge issues, missing key beats, language compliance issues
- **MEDIUM**: Minor continuity errors, pacing concerns, style inconsistencies
- **LOW**: Polish items, terminology standardization, minor redundancies

### 6. Produce Analysis Report

Output Markdown report (no file writes):

## Story Analysis Report

**Story**: [Title]
**Writing Language**: [Language] | **Style**: [Style] | **Methodology**: [Method]

### Critical Issues

| ID | Category | Location(s) | Issue | Impact | Recommendation |
|----|----------|-------------|-------|--------|----------------|

### High Priority Issues

| ID | Category | Location(s) | Issue | Recommendation |
|----|----------|-------------|-------|----------------|

### Medium/Low Priority Issues

[Summary table]

### Character Consistency Matrix

| Character | Trait Consistency | Voice Consistency | Arc Tracking | Issues |
|-----------|-------------------|-------------------|--------------|--------|

### Plot Thread Tracking

| Thread | Introduced | Developed | Resolved | Status |
|--------|------------|-----------|----------|--------|

### Language & Style Compliance

- Writing Language compliance: X%
- Style consistency: [Assessment]
- Principles violations: [Count]

### Metrics

- Total scenes analyzed
- Character appearances tracked
- Timeline events mapped
- Issues by category
- Coverage completeness

### 7. Next Actions

Based on findings:

- CRITICAL issues: Must resolve before drafting/continuing
- HIGH issues: Strongly recommended fixes
- MEDIUM/LOW: Improvement suggestions

Suggest specific commands:
- `/fiction.develop` for character/world gaps
- `/fiction.refine` for prose issues
- Manual edits for specific fixes

### 8. Offer Remediation

Ask: "Would you like me to suggest specific edits for the top N issues?" (Do NOT apply automatically.)

## Analysis Focus Options

User can request specific focus areas:

- `character`: Deep character consistency analysis
- `plot`: Plot hole and causality focus
- `timeline`: Temporal consistency focus
- `world`: World-building consistency
- `style`: Language and style compliance
- `structure`: Beat and pacing analysis
- `full`: Complete analysis (default)

## Context

{ARGS}

