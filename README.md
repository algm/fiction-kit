<div align="center">
    <h1>✍️ Fiction Kit</h1>
    <h3><em>Your AI-Powered Creative Writing Companion</em></h3>
</div>

<p align="center">
    <strong>A comprehensive toolkit for AI-assisted fiction writing. Define your story's foundations, develop characters and worlds, outline your plot, and draft prose—all with structured workflows that maintain consistency and creative control.</strong>
</p>

---

## Table of Contents

- [🤔 What is Fiction Kit?](#-what-is-fiction-kit)
- [⚡ Get Started](#-get-started)
- [🤖 Supported AI Agents](#-supported-ai-agents)
- [🔧 Fiction CLI Reference](#-fiction-cli-reference)
- [📚 Writing Workflow](#-writing-workflow)
- [🌍 Language & Style Support](#-language--style-support)
- [📋 Available Commands](#-available-commands)
- [🔧 Prerequisites](#-prerequisites)
- [📖 Detailed Process](#-detailed-process)
- [👥 Credits](#-credits)
- [📄 License](#-license)

## 🤔 What is Fiction Kit?

Fiction Kit applies **structured development methodology** to creative writing. Instead of vibe-writing every scene from scratch, Fiction Kit helps you:

- **Define story foundations** with clear premise, theme, and conflict
- **Develop rich characters** with wounds, lies, and arcs
- **Build consistent worlds** with rules and history
- **Plan structured outlines** using proven methodologies (Snowflake, Beat Sheet, Discovery)
- **Break down stories into scenes** for focused drafting sessions
- **Draft prose** that maintains voice and style consistency
- **Review for consistency** across all story elements

**Key Features:**
- 🌍 **Multi-language support** - Write in any language (Spanish, English, French, etc.)
- 🎨 **Writing style selection** - Literary, commercial, or genre-specific conventions
- 📝 **Multiple methodologies** - Snowflake, Beat Sheet, Discovery Writing, or custom
- 🤖 **AI agent agnostic** - Works with Claude, Gemini, Copilot, Cursor, and more

## ⚡ Get Started

### 1. Install Fiction CLI

Choose your preferred installation method:

#### Option 1: Persistent Installation (Recommended)

```bash
uv tool install fiction-cli --from git+https://github.com/your-repo/fiction-kit.git
```

Then use the tool directly:

```bash
fiction init <PROJECT_NAME>
fiction check
```

#### Option 2: One-time Usage

```bash
uvx --from git+https://github.com/your-repo/fiction-kit.git fiction init <PROJECT_NAME>
```

### 2. Initialize your writing project

```bash
fiction init my-novel --ai claude --language es --style literary --method snowflake
```

**Options:**
- `--language`: Writing language (`en`, `es`, `fr`, `de`, `it`, `pt`, `ja`, `zh`, or `custom`)
- `--style`: Writing approach (`literary`, `commercial`, `genre:fantasy`, `genre:thriller`, etc.)
- `--method`: Story development methodology (`snowflake`, `beat-sheet`, `discovery`, `custom`)

### 3. Establish writing principles

Launch your AI assistant and use the `/fiction.principles` command:

```
/fiction.principles I want to write in third-person past tense with a literary style. Focus on deep character interiority and rich prose.
```

### 4. Create your story premise

```
/fiction.premise A detective in 1920s Barcelona investigates a series of murders connected to the anarchist movement, only to discover her own family is involved.
```

### 5. Develop your story

Follow the workflow:

```
/fiction.develop      # Clarify ambiguous elements
/fiction.character    # Create detailed character profiles
/fiction.world        # Build your setting and world
/fiction.outline      # Create story structure and beats
/fiction.scenes       # Break down into scene list
/fiction.draft        # Write prose from scenes
```

## 🤖 Supported AI Agents

| Agent | Support | Notes |
|-------|---------|-------|
| [Claude Code](https://www.anthropic.com/claude-code) | ✅ | |
| [GitHub Copilot](https://code.visualstudio.com/) | ✅ | |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | ✅ | |
| [Cursor](https://cursor.sh/) | ✅ | |
| [Qwen Code](https://github.com/QwenLM/qwen-code) | ✅ | |
| [opencode](https://opencode.ai/) | ✅ | |
| [Windsurf](https://windsurf.com/) | ✅ | |
| [Kilo Code](https://github.com/Kilo-Org/kilocode) | ✅ | |
| [Auggie CLI](https://docs.augmentcode.com/cli/overview) | ✅ | |
| [CodeBuddy CLI](https://www.codebuddy.ai/cli) | ✅ | |
| [Roo Code](https://roocode.com/) | ✅ | |
| [Codex CLI](https://github.com/openai/codex) | ✅ | |
| [Amp](https://ampcode.com/) | ✅ | |
| [SHAI (OVHcloud)](https://github.com/ovh/shai) | ✅ | |

## 🔧 Fiction CLI Reference

### Commands

| Command | Description |
|---------|-------------|
| `init` | Initialize a new Fiction Kit project |
| `check` | Check for installed tools |

### `fiction init` Options

| Option | Description |
|--------|-------------|
| `<project-name>` | Name for your project directory |
| `--ai` | AI assistant: `claude`, `gemini`, `copilot`, `cursor-agent`, etc. |
| `--language` | Writing language: `en`, `es`, `fr`, `de`, `it`, `pt`, `ja`, `zh`, `custom` |
| `--style` | Writing style: `literary`, `commercial`, `genre:[subgenre]` |
| `--method` | Methodology: `snowflake`, `beat-sheet`, `discovery`, `custom` |
| `--script` | Script variant: `sh` (bash/zsh) or `ps` (PowerShell) |
| `--no-git` | Skip git repository initialization |
| `--here` | Initialize in current directory |
| `--force` | Force overwrite in current directory |

### Examples

```bash
# Create a Spanish literary fiction project
fiction init mi-novela --ai claude --language es --style literary

# Create an English fantasy novel project
fiction init dragon-saga --ai cursor-agent --language en --style genre:fantasy --method beat-sheet

# Initialize in current directory
fiction init . --ai copilot --language fr

# With PowerShell scripts (Windows)
fiction init my-thriller --ai gemini --script ps --style genre:thriller
```

## 📚 Writing Workflow

Fiction Kit follows a structured workflow from concept to draft:

```
SETUP ──────────────────────────────────────────────────────────────────>
  /fiction.principles    Define voice, style, and writing rules
  /fiction.premise       Create story concept (logline, theme, conflict)

DEVELOPMENT ────────────────────────────────────────────────────────────>
  /fiction.world         Build settings, locations, rules, history
  /fiction.character     Develop character profiles and arcs
  /fiction.develop       Clarify ambiguous elements
  /fiction.chat          Brainstorm or roleplay as characters

PLANNING ───────────────────────────────────────────────────────────────>
  /fiction.outline       Create story structure (acts, beats)
  /fiction.scenes        Break down into scene list
  /fiction.research      Gather authentic details

WRITING ────────────────────────────────────────────────────────────────>
  /fiction.chapter       Generate a single focused chapter (best for quality)
  /fiction.draft         Batch-process all chapters sequentially (full draft)
  /fiction.dialogue      Craft conversations

REFINEMENT ─────────────────────────────────────────────────────────────>
  /fiction.refine        Iterate and improve existing text
  /fiction.review        Analyze for consistency
  /fiction.checklist     Quality validation

OUTPUT ─────────────────────────────────────────────────────────────────>
  /fiction.synopsis      Generate marketing copy (logline, blurb, query)
```

## 🌍 Language & Style Support

Fiction Kit adapts to your **writing language**, **style**, and **methodology** to provide tailored guidance at every stage.

### Supported Writing Languages

Write in any language with appropriate cultural and regional variants:
- 🇺🇸 **English** (US, UK, Australian, Canadian)
- 🇪🇸 **Spanish** (Español - Spain, Latin American)
- 🇫🇷 **French** (Français - France, Québécois, African)
- 🇩🇪 **German** (Deutsch - Germany, Austrian, Swiss)
- 🇮🇹 **Italian** (Italiano)
- 🇧🇷 **Portuguese** (Português - Brazilian, European)
- 🇯🇵 **Japanese** (日本語)
- 🇨🇳 **Chinese** (中文 - Simplified, Traditional)
- 🌐 **Custom** - Any other language

### Writing Styles

Choose the style that matches your creative goals. Fiction Kit will adapt **prompts, structure recommendations, and prose guidance** to your chosen style:

#### **Literary Fiction** (`literary`)
**Best Practices Applied:**
- Emphasis on **thematic depth** and **character psychology**
- **Prose quality** over plot mechanics
- **Subtle, nuanced conflict** (often internal)
- **Symbolic and metaphorical** language
- Non-linear or **experimental structures** when appropriate
- **Ambiguous or open-ended** resolutions
- Focus on **intellectual and emotional** engagement

**What Changes:**
- Premise focuses on thematic questions vs. high-concept hooks
- Outline allows for episodic or non-linear structures
- Character development prioritizes psychological complexity
- Prose guidance emphasizes evocative language and subtext

#### **Commercial Fiction** (`commercial`)
**Best Practices Applied:**
- **Clear, engaging** storytelling with **broad appeal**
- **Strong plot** and **fast pacing**
- **Active protagonists** with **clear goals**
- **Satisfying payoffs** for all setup
- **Page-turning** chapter endings
- **Genre expectations** delivered

**What Changes:**
- Premise requires high-concept, marketable loglines
- Outline follows proven three-act or Save the Cat structure
- Character development ensures relatable, sympathetic protagonists
- Prose guidance emphasizes clarity and accessibility

#### **Genre-Specific** (`genre:[subgenre]`)

**Fantasy** (`genre:fantasy`)
- **Magic systems** with clear rules and costs
- **Rich world-building** (geography, cultures, history)
- **Hero's journey** or chosen one structures
- **Epic or personal stakes**
- Integration of wonder and discovery

**Thriller** (`genre:thriller`)
- **Constant tension** and **escalating danger**
- **Ticking clock** pressure throughout
- **Fast pacing** with short chapters
- **Smart protagonists** vs. worthy opponents
- **Twists and turns** at key beats

**Other Genres:** Science Fiction, Romance, Mystery, Horror (similar targeted guidance)

### Story Development Methodologies

Choose how you want to plan your story. Fiction Kit provides **methodology-specific guidance** for outlining and development:

#### **Snowflake Method** (`snowflake`)
**Best Practices Applied:**
- Start with **one-sentence summary**, expand progressively
- **Step-by-step** character development (motivation → goal → conflict → epiphany)
- **Detailed scene list** with goal-conflict-disaster structure
- **Iterative refinement** at each layer
- Strong focus on **causality** ("because X, therefore Y")

**What Changes:**
- Premise development starts minimal, expands in layers
- Outline built from paragraph → page → four pages → scene list
- Character profiles developed in stages (summary → full depth)

#### **Beat Sheet Method** (`beat-sheet`)
**Best Practices Applied:**
- **15-beat structure** (Save the Cat / 3-Act)
- **Precise timing** (beats hit at specific percentages)
- **Midpoint** as crucial turning point
- **All Is Lost** moment at 75%
- **Character arc** mapped to structural beats
- **B Story** carries theme

**What Changes:**
- Premise focuses on high-concept logline
- Outline hits all 15 beats at correct percentages
- Strong emphasis on Midpoint and All Is Lost moments
- Scene planning aligns with beat structure

#### **Discovery Writing** (`discovery`)
**Best Practices Applied:**
- **Minimal upfront planning** - trust creative instincts
- **Character-driven** discovery
- **"North Star" approach** - one guiding element
- **Reverse outlining** after draft
- **Iterative drafting** with extensive revision
- Embrace **organic story evolution**

**What Changes:**
- Premise allows for evolving concepts
- Outline created **after first draft** (reverse outline)
- Character arcs discovered through writing
- Emphasis on revision as where structure emerges

### How It Works

When you initialize a project with `fiction init`, your language, style, and methodology choices are saved to `.fiction/config.json`. 

**Every Fiction Kit command automatically:**

1. **Loads your configuration** from `principles.md` and `premise.md`
2. **Reads style-specific best practices** from `.fiction/templates/guidance/styles/`
3. **Reads methodology-specific guidance** from `.fiction/templates/guidance/methodologies/`
4. **Reads genre-specific conventions** from `.fiction/templates/guidance/genres/` (for genre styles)
5. **Applies this guidance** to prompt generation and AI instructions

**Example:**
- If you chose `--style literary --method snowflake`, the `/fiction.premise` command will emphasize thematic questions over hooks, and the `/fiction.outline` command will guide you through Snowflake's step-by-step expansion process.
- If you chose `--style genre:thriller --method beat-sheet`, the `/fiction.outline` command will ensure you hit thriller-specific beats (ticking clock, constant tension) at the precise Save the Cat percentages.

This ensures that **every AI interaction** respects your creative vision and follows industry best practices for your chosen approach.

### Supported Languages

Fiction Kit supports writing in any language. During initialization, select your writing language:

- `en` - English (with regional variants: US, UK, Australian)
- `es` - Spanish (with variants: Spain, Latin American)
- `fr` - French (with variants: France, Canadian)
- `de` - German
- `it` - Italian
- `pt` - Portuguese (with variants: Brazil, Portugal)
- `ja` - Japanese
- `zh` - Chinese
- `custom` - Any other language

**All generated content will be in your chosen language**, including:
- Premise, outline, and scene documents
- Character and world descriptions
- Draft prose and dialogue
- Synopsis and marketing materials

### Writing Styles

| Style | Description |
|-------|-------------|
| `literary` | Focus on prose quality, symbolism, thematic depth, experimental techniques |
| `commercial` | Accessible, plot-driven, strong pacing, broad appeal |
| `genre:fantasy` | Fantasy conventions: world-building, magic systems, epic scope |
| `genre:scifi` | Science fiction: technology, social questions, speculative elements |
| `genre:romance` | Romance conventions: relationship focus, emotional beats |
| `genre:thriller` | Thriller pacing: tension, stakes, page-turner structure |
| `genre:mystery` | Mystery conventions: clues, red herrings, revelation |
| `genre:horror` | Horror elements: dread, atmosphere, fear |

### Writing Methodologies

| Methodology | Description |
|-------------|-------------|
| `snowflake` | Expand from sentence → paragraph → page → full outline |
| `beat-sheet` | Save the Cat / 3-Act / Hero's Journey structure |
| `discovery` | Write first, outline retroactively (pantsing) |
| `custom` | User-defined workflow |

## 📋 Available Commands

### File Structure Options

**For long stories**, Fiction Kit supports splitting outline and scenes into multiple files for easier management:

**Outline Files:**
- **Single file** (default for < 20 chapters): `outline.md` contains everything
- **Split structure** (recommended for 20+ chapters): Files organized in `outline/` directory:
  - `outline/index.md` - Summary, structure config, beats overview
  - `outline/acts.md` - Detailed act breakdowns with key scenes
  - `outline/chapters.md` - Complete chapter plan with summaries
  - `outline/arcs.md` - Character arcs and subplot tracking

**Scene Files:**
- **Single file** (default for < 30 scenes): `scenes.md` contains all scenes
- **Split structure** (recommended for 30+ scenes or 20+ chapters): Files organized in `scenes/` directory:
  - `scenes/index.md` - Overview, tracking, pacing analysis
  - `scenes/ch01-05.md` - Scenes for chapters 1-5 (typically Act I)
  - `scenes/ch06-12.md` - Scenes for chapters 6-12 (typically Act II-A)
  - `scenes/ch13-18.md` - Scenes for chapters 13-18 (typically Act II-B)
  - `scenes/ch19-24.md` - Scenes for chapters 19-24 (typically Act III)

**Usage:**
```
/fiction.outline --split     # Create split outline structure
/fiction.scenes --split      # Create split scenes structure
```

The AI agent will automatically detect which structure exists and read from the appropriate files. All commands (draft, review, chapter, etc.) work seamlessly with both structures.

### Core Workflow Commands

| Command | Description |
|---------|-------------|
| `/fiction.principles` | Create writing voice, style guide, narrative rules |
| `/fiction.premise` | Define story concept, logline, theme, genre |
| `/fiction.develop` | Clarify ambiguities, deepen story details |
| `/fiction.outline` | Create story structure, acts, chapters, beats |
| `/fiction.scenes` | Generate scene breakdown per chapter |
| `/fiction.draft` | Batch-process all scenes/chapters into a complete draft |
| `/fiction.review` | Analyze for consistency, plot holes, arc issues |
| `/fiction.checklist` | Quality validation checklists |

### New Creative Commands

| Command | Description |
|---------|-------------|
| `/fiction.world` | Worldbuilding: settings, locations, rules, history |
| `/fiction.character` | Character profiles, backstories, motivations |
| `/fiction.chat` | Interactive brainstorming or roleplay as characters |
| `/fiction.chapter` | Generate a single focused chapter with quality checks |
| `/fiction.refine` | Iterate content: fix consistency, strengthen plot |
| `/fiction.synopsis` | Generate synopsis/blurb for pitching |
| `/fiction.dialogue` | Generate or improve dialogue for scenes |
| `/fiction.research` | Research historical/technical details |

## 🔗 Cross-Reference System & Information Architecture

Fiction Kit implements a **Single Source of Truth** architecture to prevent contradictions and maintain consistency across long-form fiction projects.

### The Problem

Traditional writing approaches often lead to:
- Information duplicated across multiple files (character ages in 5 different places)
- Contradictions when updating (changed magic system rules in one place, forgot to update scenes)
- Lost details (which file had the historical timeline again?)
- Difficult revisions (need to search every file to find all mentions of a character)

### The Solution: Single Source of Truth

**Each piece of information exists in exactly ONE authoritative location.** Other files reference it via markdown links.

### How It Works

**Navigation Guide** (`navigation-guide.md`):
- Master index showing where every type of information lives
- Eliminates "where should this go?" questions
- First place AI agents check when looking for information

**Cross-Reference Patterns**:
```markdown
<!-- In character file: Link to world events -->
She witnessed [the Plaza Massacre](../world/events/plaza-massacre.md) at age 12.

<!-- In scene planning: Link to characters and world -->
- **References**: [Maria](../characters/maria.md), [Plaza](../world/world-bible.md#key-locations)

<!-- In world timeline: Link to detailed event files -->
| 1935 | [Plaza Massacre](events/plaza-massacre.md) | Government crackdown |
```

**Directory Structure**:
```
story-project/
├── navigation-guide.md          # Master information index
├── characters/                  # Character files (single source)
│   ├── protagonist.md
│   └── antagonist.md
├── world/
│   ├── world-bible.md          # Main world document (single source)
│   ├── events/                 # Detailed historical events
│   │   └── plaza-massacre.md
│   └── magic/                  # Detailed spell/ability files
│       └── fire-binding.md
├── scenes/
│   ├── index.md                # Scene planning index
│   └── ch01-05.md              # Scene metadata (NOT prose)
└── drafts/
    ├── prose-index.md          # Maps scenes to prose files
    └── scenes/                 # Individual scene prose
        ├── s001-opening.md
        └── s002-next.md
```

### Scene-by-Scene Drafting

Fiction Kit writes prose **one scene at a time** in separate files:

**Why?**
- ✅ Manageable file sizes (no 100k+ word files)
- ✅ Focused writing sessions (draft one scene, check it off)
- ✅ Easy revision (revise individual scenes)
- ✅ Clear progress tracking (visual checklist)
- ✅ Reference clarity (each scene lists sources consulted)

**Workflow:**
1. **Scene planning** lives in `scenes/ch01-05.md` with metadata and **References** field
2. Run `/fiction.draft` to write prose
3. Each scene creates `drafts/scenes/s001-name.md` with clean narrative
4. `drafts/prose-index.md` tracks progress and references
5. No links in prose itself - just clean narrative text

**Example:**

Scene planning (`scenes/ch01-05.md`):
```markdown
- [ ] S001 [Maria] **Opening** - Apartment, Morning
  - **Goal**: Establish routine before disruption
  - **Conflict**: Internal restlessness vs. comfortable life
  - **Outcome**: Yes-but (peaceful morning interrupted by message)
  - **Summary**: Maria's morning routine in her Barcelona apartment...
  - **References**: [Maria](../characters/maria.md), [Apartment](../world/world-bible.md#key-locations)
```

Prose file (`drafts/scenes/s001-opening.md`):
```markdown
# Scene 001: Opening

**Chapter**: 1
**POV**: Maria Santos
**References Consulted**: Maria's character file, Barcelona apartment location

---

[Clean narrative prose here - no markdown links]
Maria woke to sunlight streaming through...
```

Prose index (`drafts/prose-index.md`):
```markdown
| Scene | Prose File | Status | References |
|-------|------------|--------|------------|
| S001 | scenes/s001-opening.md | ✅ Final | [Maria](../characters/maria.md), [Apartment](../world/world-bible.md#locations) |
```

### Cross-Reference Validation

`/fiction.review` automatically:
- ✅ Checks all markdown links are valid (no broken references)
- ✅ Verifies information isn't duplicated
- ✅ Ensures timeline events match across files
- ✅ Validates magic/tech usage follows established rules
- ✅ Confirms character details are consistent

**See:** [fiction-methodology.md](fiction-methodology.md#the-single-source-of-truth-principle) for complete documentation.

## 🔧 Prerequisites

- **Linux/macOS/Windows**
- [Supported AI agent](#-supported-ai-agents)
- [uv](https://docs.astral.sh/uv/) for package management
- [Python 3.11+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads) (optional, but recommended)

## 📖 Detailed Process

<details>
<summary>Click to expand the detailed step-by-step walkthrough</summary>

### Step 1: Initialize Your Project

```bash
fiction init my-novel --ai claude --language es --style literary --method snowflake
```

This creates:
```
my-novel/
├── .fiction/
│   ├── memory/
│   │   └── principles.md        # Writing voice and rules
│   ├── scripts/                 # Automation scripts
│   └── templates/               # Document templates
├── stories/                     # Your story directories
└── CLAUDE.md                    # Agent context file
```

### Step 2: Establish Writing Principles

```
/fiction.principles I write in Spanish, third-person limited POV, past tense. 
My style is literary with focus on interiority and atmosphere. 
I avoid adverbs and prefer active voice.
```

### Step 3: Create Your Premise

```
/fiction.premise Una detective en la Barcelona de 1920 investiga una serie 
de asesinatos conectados con el movimiento anarquista. Cuando descubre 
que su propia familia está involucrada, debe elegir entre la justicia 
y la lealtad.
```

### Step 4: Develop Characters and World

```
/fiction.character Elena Vidal - the protagonist detective, haunted by 
her father's mysterious death, struggles with the lie that justice always 
prevails.

/fiction.world Barcelona 1920s - the tension between old aristocracy 
and revolutionary workers, the gothic quarter's narrow streets, the 
anarchist movement's idealism and violence.
```

### Step 5: Create Your Outline

```
/fiction.outline Use the beat-sheet methodology with a noir tone. 
The story should span three weeks in Barcelona.
```

### Step 6: Break Down Into Scenes

```
/fiction.scenes
```

### Step 7: Draft Your Story

```
/fiction.draft Chapter 1

# Or draft scene by scene
/fiction.chapter 1
```

### Step 8: Review and Refine

```
/fiction.review Check character consistency and timeline

/fiction.refine Strengthen the dialogue in chapter 3
```

### Step 9: Generate Synopsis

```
/fiction.synopsis Generate query letter and back cover blurb
```

</details>

## Directory Structure

After creating a story, your project will look like:

```
my-novel/
├── .fiction/
│   ├── memory/
│   │   └── principles.md
│   ├── scripts/
│   └── templates/
├── stories/
│   └── 001-barcelona-noir/
│       ├── premise.md           # Story concept
│       ├── outline.md           # Structure and beats (single file)
│       │   OR (for split structure):
│       ├── outline/             # Outline directory
│       │   ├── index.md         # Summary and overview
│       │   ├── acts.md          # Detailed act breakdowns
│       │   ├── chapters.md      # Chapter plan
│       │   └── arcs.md          # Character arcs and subplots
│       ├── scenes.md            # Scene breakdown (single file)
│       │   OR (for split structure):
│       ├── scenes/              # Scenes directory
│       │   ├── index.md         # Overview and tracking
│       │   ├── ch01-05.md       # Act I scenes
│       │   ├── ch06-12.md       # Act II-A scenes
│       │   ├── ch13-18.md       # Act II-B scenes
│       │   └── ch19-24.md       # Act III scenes
│       ├── synopsis.md          # Marketing materials
│       ├── characters/          # Character profiles
│       │   ├── elena-vidal.md
│       │   └── antagonist.md
│       ├── world/               # World-building
│       │   ├── world-bible.md
│       │   └── barcelona-1920.md
│       ├── research/            # Research notes
│       ├── drafts/              # Chapter drafts
│       │   ├── chapter-01.md
│       │   └── chapter-02.md
│       └── checklists/          # Quality checklists
└── CLAUDE.md
```

## Environment Variables

| Variable | Description |
|----------|-------------|
| `FICTION_STORY` | Override story detection for non-Git repositories. Set to the story directory name (e.g., `001-barcelona-noir`) |

## 👥 Credits

Fiction Kit is adapted from [GitHub Spec Kit](https://github.com/github/spec-kit), applying spec-driven development principles to creative writing.

Inspired by [StoryCraftr](https://storycraftr.app/) for additional creative writing workflows.

## 📄 License

This project is licensed under the terms of the MIT open source license. Please refer to the [LICENSE](./LICENSE) file for the full terms.
