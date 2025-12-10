# Story Navigation Guide: [STORY TITLE]

**Purpose**: This file helps AI agents locate specific information quickly and serves as a single source of truth index for the entire story project.

**Created**: [DATE]
**Last Updated**: [DATE]

---

## Quick Reference: Information Location Map

This table shows where each type of information lives in your story project. **Each piece of information should exist in only ONE place** (single source of truth), with other files referencing it via links.

| Information Type | Primary Location | Section/Path | Notes |
|-----------------|------------------|--------------|-------|
| **Story Metadata** |
| Writing language & style | `/memory/principles.md` | Language & Style section | Core configuration |
| Story premise & logline | `premise.md` | Overview section | Single source |
| Genre & target audience | `premise.md` | Genre section | |
| Theme & thematic questions | `premise.md` | Theme section | |
| **Character Information** |
| Character profiles | `characters/[name].md` | Full file | One file per character |
| Character wounds & lies | `characters/[name].md` | Psychology section | |
| Character relationships | `characters/[name].md` | Relationships section | Cross-reference other characters |
| Character arcs | `characters/[name].md` | Character Arc section | |
| Dialogue voice & patterns | `characters/[name].md` | Dialogue & Voice section | |
| **World-Building** |
| World overview | `world/world-bible.md` | Overview section | Primary world doc |
| Geography & locations | `world/world-bible.md` | Geography section | |
| Historical timeline | `world/world-bible.md` | History → Timeline | **Reference this in events** |
| Historical events (details) | `world/events/[event-name].md` | Full file | One file per major event |
| Magic/tech system rules | `world/world-bible.md` | Magic/Technology System | Hard & soft rules |
| Specific spells/abilities | `world/magic/[spell-name].md` | Full file | One file per spell/ability |
| Organizations & factions | `world/world-bible.md` | Organizations section | |
| Cultures & societies | `world/world-bible.md` | Society & Culture section | |
| Creatures & species | `world/world-bible.md` | Creatures & Beings section | |
| **Story Structure** |
| Overall plot structure | `outline/index.md` or `outline.md` | Full file | Story beats & acts |
| Chapter breakdown | `outline/chapters.md` or `outline.md` | Chapters section | Chapter goals |
| Character arcs by act | `outline/arcs.md` or `outline.md` | Arcs section | Track character journeys |
| Act structure | `outline/acts.md` or `outline.md` | Acts section | 3-act or custom |
| **Scene Planning** |
| Scene index & overview | `scenes/index.md` or `scenes.md` | Full file | Scene tracking master |
| Detailed scene breakdowns | `scenes/ch[XX-XX].md` or `scenes.md` | By chapter group | Scene details |
| Scene type distribution | `scenes/index.md` | Pacing Analysis section | |
| **Prose & Drafts** |
| Drafted prose index | `drafts/prose-index.md` | Full file | Maps scenes to prose files |
| Individual scene prose | `drafts/scenes/c[NNN]/c[NNN]s[MMM].md` | Full file | One file per scene, organized by chapter |
| Chapter assemblies | `drafts/chapters/chapter-[XX].md` | Full file | Assembled from scenes |
| Prose references used | `drafts/prose-index.md` | References column | What sources informed each scene |
| **Research & References** |
| Research notes | `research/[topic].md` | Full file | External research |
| Reference materials | `research/references.md` | Full file | Links & sources |

---

## File Organization Principles

### Single Source of Truth

Each piece of information exists in **exactly one place**:

- ✅ **Good**: Timeline in `world/world-bible.md` → History → Timeline section
- ❌ **Bad**: Timeline repeated in multiple files

When information needs to be used elsewhere, **reference it** using markdown links:

```markdown
<!-- In scenes/ch01-05.md -->
The revolution began in [1847](../../world/world-bible.md#historical-timeline) when...

<!-- In characters/protagonist.md -->
She witnessed [the massacre](../../world/events/plaza-massacre.md) at age twelve...
```

### Cross-Reference Patterns

#### Linking to Timeline Events

```markdown
<!-- In any file referencing historical events -->
During [the Great Schism](../../world/world-bible.md#historical-events) of 1523...
```

#### Linking to Magic System

```markdown
<!-- In scenes or character files -->
She cast [Lumina's Shield](../../world/magic/luminas-shield.md), which...

<!-- In world-bible.md when listing spells -->
- [Lumina's Shield](magic/luminas-shield.md): Defensive spell that...
```

#### Linking to Characters

```markdown
<!-- In scenes or other character files -->
[Marcus](../../characters/marcus.md) entered the room, his usual [sardonic wit](../../characters/marcus.md#dialogue--voice) on display...
```

#### Linking to Locations

```markdown
<!-- In scenes -->
The scene takes place in [The Rusty Anchor](../../world/world-bible.md#key-locations) tavern...
```

### Directory Structure

```
story-project/
├── premise.md                          # Story foundation
├── /memory/
│   └── principles.md                  # Writing principles & style
├── characters/
│   ├── protagonist.md                 # One file per character
│   └── antagonist.md
├── world/
│   ├── world-bible.md                 # Main world document
│   ├── events/                        # Detailed event files
│   │   ├── great-war.md
│   │   └── plaza-massacre.md
│   └── magic/                         # Detailed spell/ability files
│       ├── luminas-shield.md
│       └── fire-binding.md
├── outline/
│   ├── index.md                       # Outline overview
│   ├── acts.md                        # Act structure
│   ├── chapters.md                    # Chapter breakdown
│   └── arcs.md                        # Character arcs
├── scenes/
│   ├── index.md                       # Scene index & tracking
│   ├── ch01-05.md                     # Scene details by chapter group
│   ├── ch06-12.md
│   └── ...
├── drafts/
│   ├── prose-index.md                 # Index mapping scenes to prose
│   ├── scenes/                        # Individual scene prose organized by chapter
│   │   ├── c001/                      # Chapter 1 directory
│   │   │   ├── c001s001.md
│   │   │   └── c001s002.md
│   │   ├── c002/                      # Chapter 2 directory
│   │   │   ├── c002s001.md
│   │   │   └── ...
│   │   └── ...
│   └── chapters/                      # Assembled chapters
│       ├── chapter-01.md
│       └── ...
└── research/
    ├── references.md                  # External sources
    └── [topic].md                     # Research notes
```

---

## Agent Navigation Instructions

### For /fiction.character

**When creating or updating character files:**

1. Store character information in `characters/[character-name].md`
2. Link to timeline events in their backstory: `[event](../world/world-bible.md#historical-events)`
3. Link to other characters in relationships: `[other-char](other-character.md)`
4. Link to locations in background: `[location](../world/world-bible.md#key-locations)`

**Single source of truth**: Character profiles live in `characters/` directory only.

### For /fiction.world

**When creating or updating world files:**

1. Main world information goes in `world/world-bible.md`
2. **For detailed events**: Create separate files in `world/events/[event-name].md`, then link from timeline
3. **For detailed magic/abilities**: Create separate files in `world/magic/[spell-name].md`, then link from magic system section
4. Link to characters who use magic: `[character](../characters/character-name.md)`
5. Link to events in history section: `[event](events/event-name.md)`

**Single source of truth**: World-building lives in `world/` directory only.

### For /fiction.scenes

**When creating or updating scene breakdowns:**

1. Scene metadata goes in `scenes/ch[XX-XX].md` files
2. Link to character files for POV: `[character](../characters/character-name.md)`
3. Link to locations: `[location](../world/world-bible.md#key-locations)`
4. Link to world rules if relevant: `[magic-rule](../world/world-bible.md#magic-system)`
5. **Do NOT write prose here** - only scene planning metadata

**Single source of truth**: Scene planning lives in `scenes/` directory only.

### For /fiction.draft

**When writing prose:**

1. Create individual scene files in `drafts/scenes/c[NNN]/c[NNN]s[MMM].md` (e.g., `c001s001.md`)
2. Update `drafts/prose-index.md` with:
   - Scene ID
   - Prose file path
   - References used (characters, world elements, events)
   - Word count
   - Status (draft/revised/final)
3. **In prose files**: Write the actual prose WITHOUT cross-reference links
4. **In prose-index.md**: Track which reference materials were consulted

**Single source of truth**: Prose lives in `drafts/` directory only.

### For /fiction.outline

**When creating or updating outlines:**

1. Outline structure goes in `outline/` directory
2. Link to character arcs: `[character arc](../characters/character-name.md#character-arc)`
3. Link to world events that drive plot: `[event](../world/events/event-name.md)`
4. Link to theme from premise: `[theme](../premise.md#theme)`

**Single source of truth**: Plot structure lives in `outline/` directory only.

### For /fiction.review

**When reviewing for consistency:**

1. Check all cross-references are valid (no broken links)
2. Verify no information duplication across files
3. Ensure timeline events referenced match `world/world-bible.md#historical-timeline`
4. Validate character references point to actual character files
5. Confirm magic/abilities used in scenes match `world/world-bible.md#magic-system` or detailed files

**Review navigation**: Use this file to know where to find authoritative information.

---

## Common Navigation Queries

### "Where do I find information about [character]?"

→ `characters/[character-name].md`

### "Where is the timeline of historical events?"

→ `world/world-bible.md` → History section → Timeline table
→ Detailed events in `world/events/[event-name].md`

### "Where are the magic system rules?"

→ `world/world-bible.md` → Magic/Technology System section
→ Detailed spells in `world/magic/[spell-name].md`

### "Where is the scene breakdown for Chapter 5?"

→ `scenes/index.md` to find which file covers Chapter 5
→ Then `scenes/ch[XX-XX].md` for the actual scene details

### "Where is the prose for Scene 15?"

→ `drafts/prose-index.md` to find the prose file path
→ Then `drafts/scenes/c[NNN]/c[NNN]s[MMM].md` for the actual prose (format: c001s001.md, c002s001.md, etc.)

### "What references were used for Scene 15?"

→ `drafts/prose-index.md` → References column for Scene 15

### "Where are the writing style guidelines?"

→ `/memory/principles.md` → Writing Language & Style section

### "Where is the story premise?"

→ `premise.md` → Overview section

---

## Maintenance Notes

### When Adding New Information

1. **Determine the single source of truth location** using the table above
2. **Create the file/section** in that location
3. **Reference it** from other files using markdown links (never duplicate)
4. **Update this navigation guide** if adding a new information type

### When Updating Information

1. **Find the single source** using this navigation guide
2. **Update in that location only**
3. All references will automatically point to updated information

### When Reorganizing

1. **Move the file/section** to new location
2. **Update all references** to point to new location
3. **Update this navigation guide** with new paths

---

## Validation Checklist

Use this checklist during `/fiction.review`:

- [ ] No information is duplicated across multiple files
- [ ] All cross-references use valid markdown links
- [ ] Timeline events in scenes match `world/world-bible.md#historical-timeline`
- [ ] Character references point to existing files in `characters/`
- [ ] Magic/tech references point to `world/world-bible.md` or `world/magic/`
- [ ] Location references point to `world/world-bible.md#key-locations`
- [ ] Prose files are indexed in `drafts/prose-index.md`
- [ ] Each scene in `scenes/` has corresponding prose tracking in `drafts/prose-index.md`
- [ ] No broken links (all `[text](path)` links resolve)

---

## Notes

This navigation guide should be the **first file an AI agent consults** when looking for information. It eliminates ambiguity and ensures consistency across the entire story project.

**Update this file** whenever you add new information types or reorganize the project structure.
