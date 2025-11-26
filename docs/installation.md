# Installation Guide

## Prerequisites

- **Linux/macOS** (or Windows; PowerShell scripts supported without WSL)
- AI assistant: [Claude Code](https://www.anthropic.com/claude-code), [GitHub Copilot](https://code.visualstudio.com/), [Cursor](https://cursor.sh/), [Gemini CLI](https://github.com/google-gemini/gemini-cli), or others
- [uv](https://docs.astral.sh/uv/) for package management
- [Python 3.11+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads) (optional but recommended)

## Installation

### Initialize a New Project

The easiest way to get started is to initialize a new project:

```bash
uvx --from git+https://github.com/github/fiction-kit.git fiction init <PROJECT_NAME>
```

Or initialize in the current directory:

```bash
uvx --from git+https://github.com/github/fiction-kit.git fiction init .
# or use the --here flag
uvx --from git+https://github.com/github/fiction-kit.git fiction init --here
```

### Specify AI Agent

You can proactively specify your AI agent during initialization:

```bash
fiction init <project_name> --ai claude
fiction init <project_name> --ai gemini
fiction init <project_name> --ai copilot
fiction init <project_name> --ai cursor-agent
```

### Specify Language and Style

Configure your writing language and style during initialization:

```bash
# Spanish literary fiction
fiction init mi-novela --ai claude --language es --style literary

# English fantasy novel
fiction init dragon-saga --ai cursor-agent --language en --style genre:fantasy

# French commercial thriller
fiction init le-mystere --ai copilot --language fr --style genre:thriller
```

### Specify Writing Methodology

Choose your preferred story development approach:

```bash
fiction init my-novel --method snowflake    # Expand from sentence to outline
fiction init my-novel --method beat-sheet   # Save the Cat / 3-Act structure
fiction init my-novel --method discovery    # Write first, outline later
fiction init my-novel --method custom       # User-defined workflow
```

### Specify Script Type (Shell vs PowerShell)

All automation scripts have both Bash (`.sh`) and PowerShell (`.ps1`) variants.

Auto behavior:

- Windows default: `ps`
- Other OS default: `sh`
- Interactive mode: you'll be prompted unless you pass `--script`

Force a specific script type:

```bash
fiction init <project_name> --script sh
fiction init <project_name> --script ps
```

### Ignore Agent Tools Check

If you prefer to get the templates without checking for the right tools:

```bash
fiction init <project_name> --ai claude --ignore-agent-tools
```

## Verification

After initialization, you should see the following commands available in your AI agent:

- `/fiction.principles` - Define writing voice and rules
- `/fiction.premise` - Create story premise
- `/fiction.outline` - Generate story structure
- `/fiction.scenes` - Break down into scenes
- `/fiction.draft` - Write prose

The `.fiction/scripts` directory will contain both `.sh` and `.ps1` scripts.

## Project Structure

After initialization, your project will look like:

```
my-novel/
├── .fiction/
│   ├── memory/
│   │   └── principles.md        # Writing voice and rules
│   ├── scripts/                 # Automation scripts
│   └── templates/               # Document templates
├── stories/                     # Your story directories
│   └── 001-my-story/
│       ├── premise.md           # Story concept
│       ├── outline.md           # Structure and beats
│       ├── scenes.md            # Scene breakdown
│       ├── characters/          # Character profiles
│       ├── world/               # World-building
│       ├── research/            # Research notes
│       └── drafts/              # Chapter drafts
└── CLAUDE.md                    # Agent context file
```

## Troubleshooting

### Git Credential Manager on Linux

If you're having issues with Git authentication on Linux, you can install Git Credential Manager:

```bash
#!/usr/bin/env bash
set -e
echo "Downloading Git Credential Manager v2.6.1..."
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb
echo "Installing Git Credential Manager..."
sudo dpkg -i gcm-linux_amd64.2.6.1.deb
echo "Configuring Git to use GCM..."
git config --global credential.helper manager
echo "Cleaning up..."
rm gcm-linux_amd64.2.6.1.deb
```

### Common Issues

**"fiction: command not found"**
- Ensure uv is installed and in your PATH
- Try using the full `uvx --from` command instead

**AI agent commands not appearing**
- Check that the `.fiction/templates/commands/` directory was created
- Restart your AI agent or reload the project
