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
- **Single file** (default for < 15 chapters): `outline.md` contains everything
- **Split structure** (recommended for 15+ chapters):
  - `outline-index.md` - Summary, structure config, beats overview
  - `outline-acts.md` - Detailed act breakdowns with key scenes
  - `outline-chapters.md` - Complete chapter plan with summaries
  - `outline-arcs.md` - Character arcs and subplot tracking

**Scene Files:**
- **Single file** (default for < 20 scenes): `scenes.md` contains all scenes
- **Split structure** (recommended for 20+ scenes):
  - `scenes-index.md` - Overview, tracking, pacing analysis
  - `scenes-ch01-05.md` - Scenes for chapters 1-5 (typically Act I)
  - `scenes-ch06-12.md` - Scenes for chapters 6-12 (typically Act II-A)
  - `scenes-ch13-18.md` - Scenes for chapters 13-18 (typically Act II-B)
  - `scenes-ch19-24.md` - Scenes for chapters 19-24 (typically Act III)

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
│       ├── outline-index.md     # Summary and overview
│       ├── outline-acts.md      # Detailed act breakdowns
│       ├── outline-chapters.md  # Chapter plan
│       ├── outline-arcs.md      # Character arcs and subplots
│       ├── scenes.md            # Scene breakdown (single file)
│       │   OR (for split structure):
│       ├── scenes-index.md      # Overview and tracking
│       ├── scenes-ch01-05.md    # Act I scenes
│       ├── scenes-ch06-12.md    # Act II-A scenes
│       ├── scenes-ch13-18.md    # Act II-B scenes
│       ├── scenes-ch19-24.md    # Act III scenes
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
