# Prose Index: [STORY TITLE]

**Purpose**: Track all written prose, mapping scenes to their prose files and the references consulted during writing.

**Created**: [DATE]
**Last Updated**: [DATE]

---

## Overview

This index maintains the relationship between:
- **Scene planning** (in `scenes/` directory)
- **Prose files** (in `drafts/scenes/` directory)  
- **Reference materials** consulted during writing

**Key Principle**: Prose is written **scene by scene** in separate files, making it easier to write long-form fiction without overwhelming file sizes.

---

## Prose File Organization

### Directory Structure

```
drafts/
├── prose-index.md              # This file - tracking index
├── scenes/                     # Individual scene prose files organized by chapter
│   ├── c001/                   # Chapter 1 directory
│   │   ├── c001s001.md        # Chapter 1, Scene 1
│   │   └── c001s002.md        # Chapter 1, Scene 2
│   ├── c002/                   # Chapter 2 directory
│   │   ├── c002s001.md        # Chapter 2, Scene 1
│   │   └── c002s002.md        # Chapter 2, Scene 2
│   └── ...
└── chapters/                   # Optional: assembled chapters
    ├── chapter-01.md           # Assembled from scenes in c001/
    ├── chapter-02.md           # Assembled from scenes in c002/
    └── ...
```

**Note**: Scene-to-chapter mapping is defined in your scene planning files (`scenes/ch01-05.md`, etc.). Each chapter section in the scene planning file shows which scenes belong to that chapter. This index reflects that structure.

### File Naming Convention

Scene prose files follow this pattern:
- Directory: `c[NNN]/` where NNN is zero-padded chapter number (001, 002, etc.)
- File: `c[NNN]s[MMM].md` where:
  - `NNN` is zero-padded chapter number (001, 002, etc.)
  - `MMM` is zero-padded scene number within the chapter (001, 002, etc.)
- Examples: `c001s001.md`, `c002s001.md`, `c025s002.md`

---

## Scene-to-Prose Mapping

| Scene ID | Scene Name | Prose File | Status | Word Count | References Used | Last Updated |
|----------|------------|------------|--------|------------|-----------------|--------------|
| S001 | Opening Scene | `scenes/c001/c001s001.md` | ✅ Final | 1,247 | [protagonist](../characters/protagonist.md), [tavern](../world/world-bible.md#key-locations) | [DATE] |
| S002 | Morning After | `scenes/c001/c001s002.md` | 📝 Draft | 892 | [protagonist](../characters/protagonist.md), [love-interest](../characters/love-interest.md) | [DATE] |
| S003 | Discovery | `scenes/c002/c002s001.md` | 🚧 In Progress | 456 | [magic-system](../world/world-bible.md#magic-system), [forbidden-spell](../world/magic/forbidden-spell.md) | [DATE] |
| S004 | [Scene Name] | — | ⏸️ Not Started | 0 | — | — |
| S005 | [Scene Name] | — | ⏸️ Not Started | 0 | — | — |

**Status Legend**:
- ⏸️ **Not Started**: Scene planning exists but no prose written
- 🚧 **In Progress**: Prose file created, writing in progress
- 📝 **Draft**: First draft complete, needs revision
- ✏️ **Revised**: Revised at least once
- ✅ **Final**: Considered complete for this draft pass

---

## Chapter Assembly Tracking

Track which scenes have been assembled into chapter files:

| Chapter | Title | Scenes Included | Chapter File | Status | Total Words |
|---------|-------|-----------------|--------------|--------|-------------|
| 1 | [Chapter Title] | c001s001, c001s002, c001s003 | `chapters/chapter-01.md` | ✅ Assembled | 3,456 |
| 2 | [Chapter Title] | c002s001, c002s002, c002s003, c002s004 | `chapters/chapter-02.md` | 🚧 In Progress | 2,100 |
| 3 | [Chapter Title] | c003s001, c003s002, c003s003 | — | ⏸️ Not Started | 0 |

**Note**: Chapter assembly is **optional**. Some writers prefer to keep prose in individual scene files and only assemble at the end.

---

## Reference Tracking Details

### Purpose of Reference Tracking

The "References Used" column tracks **which source materials were consulted** when writing each scene. This ensures:

1. **Consistency**: Later revisions know what sources to check
2. **Validation**: `/fiction.review` can verify all referenced elements exist
3. **Context**: Easy to find what world-building or character details informed the scene

### How to Record References

Use relative markdown links to source files:

```markdown
<!-- Format -->
[reference-name](../path/to/file.md#section)

<!-- Examples -->
[protagonist](../characters/maria.md)
[tavern](../world/world-bible.md#key-locations)
[revolution](../world/events/1847-revolution.md)
[fire-spell](../world/magic/flame-binding.md)
[timeline](../world/world-bible.md#historical-timeline)
```

### Common Reference Types

| Reference Type | Link Pattern | Example |
|----------------|-------------|---------|
| Character | `../characters/[name].md` | `[Maria](../characters/maria.md)` |
| Location | `../world/world-bible.md#key-locations` | `[Plaza](../world/world-bible.md#key-locations)` |
| Historical Event | `../world/events/[event].md` | `[Revolution](../world/events/revolution.md)` |
| Timeline | `../world/world-bible.md#historical-timeline` | `[Timeline 1847](../world/world-bible.md#historical-timeline)` |
| Magic/Tech Rule | `../world/world-bible.md#magic-system` | `[Magic Rules](../world/world-bible.md#magic-system)` |
| Specific Spell | `../world/magic/[spell].md` | `[Fire Binding](../world/magic/fire-binding.md)` |
| Organization | `../world/world-bible.md#organizations` | `[The Guild](../world/world-bible.md#organizations)` |
| Research | `../research/[topic].md` | `[Barcelona 1920s](../research/barcelona-1920s.md)` |

---

## Writing Workflow

### For /fiction.draft Command

When writing prose for a scene:

1. **Locate scene details**: Find scene metadata in `scenes/ch[XX-XX].md`
2. **Create prose file**: `drafts/scenes/c[NNN]/c[NNN]s[MMM].md` (e.g., `c001s001.md`)
3. **Consult references**:
   - Character voices from `characters/` directory
   - World details from `world/world-bible.md`
   - Specific elements from `world/events/` or `world/magic/`
   - Research from `research/` directory
4. **Write prose**: Write the actual scene prose in the prose file
5. **Update this index**:
   - Add row to Scene-to-Prose Mapping table
   - Set status to 🚧 In Progress or 📝 Draft
   - List all references consulted
   - Update word count
   - Set Last Updated date

### Scene Prose File Format

Each scene prose file should contain:

```markdown
# Scene [###]: [Scene Name]

**Chapter**: [X]
**POV**: [Character Name]
**Location**: [Location Name]
**Scene Goal**: [From scene planning]
**Drafted**: [DATE]

---

[The actual prose goes here. This is pure narrative - no cross-reference links in the prose itself.]

---

## Scene Metadata

- **Word Count**: [X words]
- **Status**: [Draft/Revised/Final]
- **Notes**: [Any notes about this scene for revision]
```

### Prose Writing Rules

**IN THE PROSE FILE** (`drafts/scenes/s###-name.md`):
- ✅ Write pure narrative prose
- ✅ Follow principles.md style guidelines
- ❌ **NO cross-reference links** in the prose itself
- ❌ **NO inline citations** in the prose

**IN THIS INDEX** (`drafts/prose-index.md`):
- ✅ Track which references were consulted
- ✅ Link to source files
- ✅ Record what informed the scene

**Separation is key**: The prose should be clean narrative. The index tracks the connections.

---

## Progress Tracking

### Overall Statistics

- **Total Scenes Planned**: [X] (from `scenes/index.md`)
- **Scenes with Prose Written**: [Y]
- **Completion Percentage**: [Y/X * 100]%
- **Total Words Written**: [Z]
- **Average Words per Scene**: [Z/Y]

### By Chapter

| Chapter | Planned Scenes | Drafted Scenes | % Complete | Total Words |
|---------|----------------|----------------|------------|-------------|
| 1 | 3 | 3 | 100% | 3,456 |
| 2 | 4 | 2 | 50% | 2,100 |
| 3 | 3 | 0 | 0% | 0 |
| **Total** | **10** | **5** | **50%** | **5,556** |

### By Status

| Status | Count | Percentage |
|--------|-------|------------|
| ⏸️ Not Started | 5 | 50% |
| 🚧 In Progress | 1 | 10% |
| 📝 Draft | 3 | 30% |
| ✏️ Revised | 1 | 10% |
| ✅ Final | 0 | 0% |

---

## Revision Tracking

Track revision passes across the manuscript:

### Revision Pass 1: [Name/Focus]

**Started**: [DATE]
**Focus**: [What you're revising - e.g., "Character voice consistency"]

| Scene ID | Original Status | Revised | New Status | Notes |
|----------|----------------|---------|------------|-------|
| S001 | 📝 Draft | ✅ | ✏️ Revised | Strengthened protagonist voice |
| S002 | 📝 Draft | ✅ | ✏️ Revised | Added sensory details |

### Revision Pass 2: [Name/Focus]

**Started**: [DATE]
**Focus**: [What you're revising]

| Scene ID | Original Status | Revised | New Status | Notes |
|----------|----------------|---------|------------|-------|
| — | — | — | — | — |

---

## Reference Validation

Use this section during `/fiction.review`:

### Broken References Check

List any scenes with broken reference links:

- [ ] S### - [Issue description]
- [ ] S### - [Issue description]

### Missing References

Scenes that should reference world elements but don't:

- [ ] S### - Should reference [element] from [file]

### Consistency Issues

Scenes that contradict referenced materials:

- [ ] S### - Contradiction with [reference file]

---

## Notes & Observations

### Writing Patterns

- [Note any patterns you notice - e.g., "Dialogue scenes are easier to write"]
- [Track which scenes took longest]
- [Note which references are most frequently used]

### Common References

Most frequently consulted references:
1. [Reference name and file]
2. [Reference name and file]
3. [Reference name and file]

### Gaps Identified

During drafting, you may identify missing world-building or character details:

- [ ] Need to define [element] in [file]
- [ ] Need to clarify [detail] in [file]

---

## Integration with Other Files

### Relationship to scenes/ Directory

- `scenes/` directory contains **scene planning metadata** (goals, conflicts, summaries)
- `drafts/scenes/` directory contains **actual prose**
- This index connects the two

### Relationship to outline/ Directory

- `outline/` directory contains **story structure** (acts, beats, chapter goals)
- This index tracks whether that structure has been written into prose

### Relationship to world/ and characters/ Directories

- `world/` and `characters/` directories contain **reference material**
- This index tracks which references were used for each scene
- `/fiction.review` can validate consistency between prose and references

---

## Next Steps

After completing prose drafting:

1. ✅ Mark all scenes as 📝 Draft or better
2. Use `/fiction.review` to check consistency against references
3. Begin revision passes, updating status for each scene
4. Optional: Assemble scenes into chapters in `chapters/` directory
5. Track revision passes in the Revision Tracking section above

---

## Maintenance

### When Adding a Scene

1. Add row to Scene-to-Prose Mapping table
2. Set status to ⏸️ Not Started
3. Update Overall Statistics

### When Writing a Scene

1. Create prose file in `drafts/scenes/`
2. Update status to 🚧 In Progress or 📝 Draft
3. List all references consulted
4. Update word count
5. Set Last Updated date
6. Update progress statistics

### When Revising a Scene

1. Update status (📝 → ✏️ or ✏️ → ✅)
2. Update word count if changed
3. Update Last Updated date
4. Add entry to Revision Tracking section

### When Deleting/Merging Scenes

1. Update Scene-to-Prose Mapping table
2. Archive or delete prose file
3. Update progress statistics
4. Note change in Notes section
