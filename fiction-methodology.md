# Fiction Writing Methodology

## The Creative Writing Companion

Fiction Kit applies **structured development methodology** to creative writing. Instead of vibe-writing every scene from scratch, Fiction Kit helps you establish strong foundations, maintain consistency, and draft with confidence.

## The Core Philosophy

Traditional creative writing often follows an unstructured approach: you sit down, write what feels right, and hope it all comes together. This works for some writers, but many struggle with:

- **Inconsistent characters** whose motivations shift randomly
- **Plot holes** that emerge only after thousands of words are written
- **Lost momentum** when the middle of the story becomes unclear
- **Forgotten details** about world-building, timeline, or character relationships

Fiction Kit addresses these challenges by applying structured thinking to creative writing—not to constrain creativity, but to support it.

## The Fiction Kit Workflow

### Phase 1: Setup (Foundation)

Before writing a single line of prose, Fiction Kit establishes the creative foundation:

**Writing Principles (`/fiction.principles`)**

Define your voice, style, and narrative rules:
- Point of view (first-person, third-limited, omniscient)
- Tense (past, present)
- Prose style (sparse, lush, commercial, literary)
- Language (Spanish, English, French, etc.)
- Things to always do, things to never do

**Story Premise (`/fiction.premise`)**

Create the story's core concept:
- Logline and elevator pitch
- Genre and subgenre
- Central theme and thematic questions
- Target audience
- Core conflict and stakes
- Style & tone definition
- Language selection

### Phase 2: Development (Building Blocks)

With the foundation set, develop the building blocks of your story:

**World Building (`/fiction.world`)**

Create a consistent setting:
- Geography and environment
- History and timeline
- Society and culture
- Magic systems or technology
- Rules of the world

**Character Development (`/fiction.character`)**

Build complete characters:
- Wounds, lies they believe, truths they need
- Want vs. need (external vs. internal goals)
- Character arcs across the story
- Voice and mannerisms
- Relationships with other characters

**Clarification (`/fiction.develop`)**

Identify and resolve ambiguities:
- What's unclear in the premise?
- What character motivations need deepening?
- What world rules need defining?

### Phase 3: Planning (Structure)

Structure your story before drafting:

**Story Outline (`/fiction.outline`)**

Create the story's skeleton:
- Choose a structure (3-Act, Hero's Journey, Beat Sheet)
- Define major beats and turning points
- Plan chapter goals and pacing
- Track character arcs through each act
- Note subplot threads

**Scene Breakdown (`/fiction.scenes`)**

Break chapters into actionable scenes:
- Scene-by-scene goals and conflicts
- POV character for each scene
- Emotional beats
- Location and time
- **Cross-references** to characters, world elements, and events

**New: Prose Tracking Index**

When scenes are created, Fiction Kit automatically sets up:
- `drafts/prose-index.md` - Master index linking scene planning to prose files
- `drafts/scenes/` directory - Individual prose files for each scene
- Reference tracking system - Records which sources informed each scene

This enables **scene-by-scene drafting** for manageable long-form writing.

### Phase 4: Writing (Drafting)

With structure in place, draft with confidence:

**Scene-by-Scene Drafting (`/fiction.draft`)**

Fiction Kit's new drafting workflow writes **one scene at a time** in separate files:

- Each scene gets its own prose file: `drafts/scenes/s001-opening.md`, `s002-next-scene.md`, etc.
- The prose-index.md tracks: Which scenes are drafted, where prose files are located, what references were consulted, word counts and status
- This approach keeps files manageable for long novels

**Why Scene-by-Scene?**
- **Manageable file sizes**: No overwhelming 100k+ word files
- **Focused writing sessions**: Draft one scene, mark it complete, move to next
- **Easy revision**: Revise individual scenes without scrolling through entire chapters
- **Clear progress tracking**: Visual checklist of drafted scenes
- **Reference clarity**: Each scene file lists exactly which sources informed it

**Drafting Workflow:**
1. Scene planning exists in `scenes/ch01-05.md` with metadata (goals, conflicts, references)
2. Run `/fiction.draft` to write prose for scenes
3. Each scene creates `drafts/scenes/s###-name.md` with clean narrative prose
4. `drafts/prose-index.md` is updated automatically with progress and references
5. Mark scenes complete in scenes planning files

**Cross-Reference System:**
- Scene planning links to characters: `[Maria](../characters/maria.md)`
- Scene planning links to world: `[Plaza](../world/world-bible.md#key-locations)`
- Prose files list references consulted (but prose itself has NO links - clean narrative)
- Prose-index tracks which sources informed each scene

### Phase 5: Refinement (Quality)

Ensure consistency and quality:

**Story Review (`/fiction.review`)**

Analyze for issues:
- Plot hole detection
- Character consistency checks
- Timeline verification
- World-building contradictions
- Pacing analysis
- **NEW: Cross-reference validation** - verifies all links between files are valid
- **NEW: Single source of truth check** - ensures no information duplication

**Iterative Refinement (`/fiction.refine`)**

Improve existing content:
- Strengthen weak scenes
- Enhance character voices
- Add sensory details
- Improve pacing

---

## The Single Source of Truth Principle

Fiction Kit implements a rigorous information architecture to prevent contradictions and maintain consistency:

### Core Concept

**Each piece of information exists in exactly ONE authoritative location.**

Other files that need that information **reference it via markdown links** rather than duplicating it.

### Why This Matters

For long-form fiction (novels, series), tracking information across hundreds of pages is challenging:
- Did you change the protagonist's age? Check one file, not five.
- Did you update the magic system rules? They live in one place.
- When did that historical event happen? Check the timeline, not scattered notes.

### How It Works

**Information Location Map** (`navigation-guide.md`):
- Lists every type of information (characters, world, timeline, etc.)
- Shows which file contains the authoritative version
- Provides cross-reference patterns for linking

**Example:**
```markdown
<!-- Character backstory in characters/maria.md -->
She witnessed [the Plaza Massacre](../world/events/plaza-massacre.md) at age 12.

<!-- World timeline in world/world-bible.md -->
| 1935 | [Plaza Massacre](events/plaza-massacre.md) | Government crackdown |

<!-- Detailed event in world/events/plaza-massacre.md -->
# Event: Plaza Massacre
[Full details here - SINGLE SOURCE OF TRUTH]

<!-- Scene planning in scenes/ch01-05.md -->
- **References**: [Maria](../characters/maria.md), [Plaza Massacre](../world/events/plaza-massacre.md)
```

All files reference the same authoritative event details. Change it once, all references point to the updated version.

### Cross-Reference Categories

**Characters** (`characters/[name].md`):
- Link to: world locations, historical events, other characters, magic/tech they use
- Referenced from: scenes, other characters, prose-index

**World-Building** (`world/world-bible.md`):
- Main document for: geography, timeline, magic system, organizations
- Detailed files: `world/events/[event].md`, `world/magic/[spell].md`
- Referenced from: characters, scenes, prose-index

**Scene Planning** (`scenes/ch##-##.md`):
- References: characters, locations, events, magic/tech
- Contains: scene metadata (NOT prose)
- Links forward to: prose files in drafts/scenes/

**Prose** (`drafts/scenes/s###-name.md`):
- Contains: clean narrative prose (NO inline links)
- Metadata section: lists references consulted
- Tracked in: `drafts/prose-index.md`

**Prose Index** (`drafts/prose-index.md`):
- Maps: scene planning → prose files
- Tracks: which references were consulted for each scene
- Shows: progress, word counts, revision status

### No Links in Prose

**Important Rule**: The actual narrative prose should be clean - no markdown links.

❌ **Wrong** (prose with links):
```markdown
Maria ran through [the Plaza Mayor](../world/world-bible.md#plaza-mayor) 
as she remembered [the massacre](../world/events/plaza-massacre.md).
```

✅ **Correct** (clean prose):
```markdown
Maria ran through the Plaza Mayor as she remembered the massacre.
```

Links live in:
- Scene planning (References field)
- Prose file metadata (References Consulted section)  
- Prose-index.md (References column)

This separation keeps the narrative readable while maintaining connection to source materials.

---
- Deepen character motivations
- Fix consistency issues

**Quality Checklists (`/fiction.checklist`)**

Validate story elements:
- Character arc completion
- Plot thread resolution
- Theme integration
- Pacing balance

### Phase 6: Output (Publishing)

Prepare for readers:

**Synopsis Generation (`/fiction.synopsis`)**

Create marketing materials:
- Tweet-length pitch
- Back cover blurb
- Query letter synopsis
- Full plot summary

## Supported Methodologies

Fiction Kit supports multiple writing approaches:

### Snowflake Method

Expand from simple to complex:
1. Write a one-sentence summary
2. Expand to a paragraph
3. Expand to a page
4. Expand to a full outline
5. Draft from the outline

### Beat Sheet / Save the Cat

Follow structural beats:
- Opening Image (1%)
- Theme Stated (5%)
- Setup (1-10%)
- Catalyst (10%)
- Debate (10-25%)
- Break into Two (25%)
- B Story (30%)
- Fun and Games (30-55%)
- Midpoint (55%)
- Bad Guys Close In (55-75%)
- All Is Lost (75%)
- Dark Night of the Soul (75-80%)
- Break into Three (80%)
- Finale (80-99%)
- Final Image (99-100%)

### Discovery Writing

Write first, outline later:
1. Draft exploratory scenes
2. Identify patterns and themes
3. Create retroactive outline
4. Fill gaps and fix inconsistencies

### Custom Methodology

Define your own workflow:
1. Establish which commands to use
2. Define your document structure
3. Create custom templates
4. Follow your unique process

## Language and Style Support

### Multi-Language Writing

Fiction Kit supports writing in any language:
- All generated content matches your chosen language
- Character profiles, world-building, and drafts in your language
- Synopsis and marketing materials in your target market's language

### Writing Styles

Adapt to different markets and genres:
- **Literary**: Focus on prose quality, symbolism, experimental techniques
- **Commercial**: Accessible, plot-driven, pacing-focused
- **Genre-specific**: Fantasy conventions, romance beats, thriller pacing

## The Power of Structured Creativity

Structure doesn't constrain creativity—it enables it. When you know your character's wound and lie, you can write authentic dialogue. When you know your world's rules, you can create surprising but logical plot developments. When you know your theme, you can weave meaning throughout.

Fiction Kit transforms the creative process from chaos to clarity while preserving the magic of storytelling.

## Templates as Creative Prompts

The templates in Fiction Kit serve as sophisticated prompts that guide the AI toward higher-quality creative content:

### Preventing Common Problems

**Character templates** force consideration of:
- The wound that shaped the character
- The lie they believe about themselves
- The truth they need to learn
- Their arc from beginning to end

**World templates** ensure:
- Consistent rules and limitations
- Integrated history and culture
- Sensory details for immersion
- Rules that affect the plot

**Outline templates** enforce:
- Clear act structure
- Tracked character arcs
- Subplot integration
- Pacing considerations

### Structured Thinking Through Checklists

Quality gates ensure completeness:
- Character motivations are consistent
- Plot threads are resolved
- World rules are applied correctly
- Theme is integrated without preachiness

## Beyond Tools: A Creative Partnership

Fiction Kit isn't about replacing the writer's creativity—it's about amplifying it. The AI becomes a collaborative partner that:

- Remembers every detail you've established
- Maintains consistency across thousands of words
- Offers suggestions within your established voice
- Catches contradictions before they become problems

The writer remains the creative visionary. Fiction Kit simply ensures that vision is executed with consistency and quality.

## Getting Started

1. **Initialize your project**: `fiction init my-novel --ai claude --language en --style literary`
2. **Establish principles**: `/fiction.principles` to define your voice
3. **Create your premise**: `/fiction.premise` to establish the story concept
4. **Build your world**: `/fiction.world` and `/fiction.character`
5. **Plan your structure**: `/fiction.outline` and `/fiction.scenes`
6. **Write your story**: `/fiction.draft` and `/fiction.chapter`
7. **Refine and publish**: `/fiction.review` and `/fiction.synopsis`

Welcome to structured creative writing. Welcome to Fiction Kit.
