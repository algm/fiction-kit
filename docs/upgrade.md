# Upgrade Guide

> You have Fiction Kit installed and want to upgrade to the latest version to get new features, bug fixes, or updated slash commands. This guide covers both upgrading the CLI tool and updating your project files.

---

## Quick Reference

| What to Upgrade | Command | When to Use |
|----------------|---------|-------------|
| **CLI Tool Only** | `uv tool install fiction-cli --force --from git+https://github.com/github/fiction-kit.git` | Get latest CLI features without touching project files |
| **Project Files** | `fiction init --here --force --ai <your-agent>` | Update slash commands, templates, and scripts in your project |
| **Both** | Run CLI upgrade, then project update | Recommended for major version updates |

---

## Part 1: Upgrade the CLI Tool

The CLI tool (`fiction`) is separate from your project files. Upgrade it to get the latest features and bug fixes.

### If you installed with `uv tool install`

```bash
uv tool install fiction-cli --force --from git+https://github.com/github/fiction-kit.git
```

### If you use one-shot `uvx` commands

No upgrade needed—`uvx` always fetches the latest version. Just run your commands as normal:

```bash
uvx --from git+https://github.com/github/fiction-kit.git fiction init --here --ai copilot
```

### Verify the upgrade

```bash
fiction check
```

This shows installed tools and confirms the CLI is working.

---

## Part 2: Updating Project Files

When Fiction Kit releases new features (like new slash commands or updated templates), you need to refresh your project's Fiction Kit files.

### What gets updated?

Running `fiction init --here --force` will update:

- ✅ **Slash command files** (`.claude/commands/`, `.github/prompts/`, etc.)
- ✅ **Script files** (`.fiction/scripts/`)
- ✅ **Template files** (`.fiction/templates/`)
- ✅ **Shared memory files** (`.fiction/memory/`) - **⚠️ See warnings below**

### What stays safe?

These files are **never touched** by the upgrade—the template packages don't even contain them:

- ✅ **Your stories** (`stories/001-my-novel/premise.md`, etc.) - **CONFIRMED SAFE**
- ✅ **Your outlines and scenes** (`stories/001-my-novel/outline.md`, `scenes.md`, etc.) - **CONFIRMED SAFE**
- ✅ **Your character and world files** - **CONFIRMED SAFE**
- ✅ **Your draft chapters** - **CONFIRMED SAFE**
- ✅ **Your git history** - **CONFIRMED SAFE**

The `stories/` directory is completely excluded from template packages and will never be modified during upgrades.

### Update command

Run this inside your project directory:

```bash
fiction init --here --force --ai <your-agent>
```

Replace `<your-agent>` with your AI assistant. Refer to this list of [Supported AI Agents](../README.md#-supported-ai-agents)

**Example:**

```bash
fiction init --here --force --ai copilot
```

### Understanding the `--force` flag

Without `--force`, the CLI warns you and asks for confirmation:

```
Warning: Current directory is not empty (25 items)
Template files will be merged with existing content and may overwrite existing files
Proceed? [y/N]
```

With `--force`, it skips the confirmation and proceeds immediately.

**Important: Your `stories/` directory is always safe.** The `--force` flag only affects template files (commands, scripts, templates, memory). Your story premises, outlines, scenes, and drafts in `stories/` are never included in upgrade packages and cannot be overwritten.

---

## ⚠️ Important Warnings

### 1. Principles file will be overwritten

**Known issue:** `fiction init --here --force` currently overwrites `.fiction/memory/principles.md` with the default template, erasing any customizations you made.

**Workaround:**

```bash
# 1. Back up your principles before upgrading
cp .fiction/memory/principles.md .fiction/memory/principles-backup.md

# 2. Run the upgrade
fiction init --here --force --ai copilot

# 3. Restore your customized principles
mv .fiction/memory/principles-backup.md .fiction/memory/principles.md
```

Or use git to restore it:

```bash
# After upgrade, restore from git history
git restore .fiction/memory/principles.md
```

### 2. Custom template modifications

If you customized any templates in `.fiction/templates/`, the upgrade will overwrite them. Back them up first:

```bash
# Back up custom templates
cp -r .fiction/templates .fiction/templates-backup

# After upgrade, merge your changes back manually
```

### 3. Duplicate slash commands (IDE-based agents)

Some IDE-based agents (like Kilo Code, Windsurf) may show **duplicate slash commands** after upgrading—both old and new versions appear.

**Solution:** Manually delete the old command files from your agent's folder.

**Example for Kilo Code:**

```bash
# Navigate to the agent's commands folder
cd .kilocode/rules/

# List files and identify duplicates
ls -la

# Delete old versions (example filenames - yours may differ)
rm fiction.premise-old.md
rm fiction.outline-v1.md
```

Restart your IDE to refresh the command list.

---

## Common Scenarios

### Scenario 1: "I just want new slash commands"

```bash
# Upgrade CLI (if using persistent install)
uv tool install fiction-cli --force --from git+https://github.com/github/fiction-kit.git

# Update project files to get new commands
fiction init --here --force --ai copilot

# Restore your principles if customized
git restore .fiction/memory/principles.md
```

### Scenario 2: "I customized templates and principles"

```bash
# 1. Back up customizations
cp .fiction/memory/principles.md /tmp/principles-backup.md
cp -r .fiction/templates /tmp/templates-backup

# 2. Upgrade CLI
uv tool install fiction-cli --force --from git+https://github.com/github/fiction-kit.git

# 3. Update project
fiction init --here --force --ai copilot

# 4. Restore customizations
mv /tmp/principles-backup.md .fiction/memory/principles.md
# Manually merge template changes if needed
```

### Scenario 3: "I see duplicate slash commands in my IDE"

This happens with IDE-based agents (Kilo Code, Windsurf, Roo Code, etc.).

```bash
# Find the agent folder (example: .kilocode/rules/)
cd .kilocode/rules/

# List all files
ls -la

# Delete old command files
rm fiction.old-command-name.md

# Restart your IDE
```

### Scenario 4: "I'm working on a project without Git"

If you initialized your project with `--no-git`, you can still upgrade:

```bash
# Manually back up files you customized
cp .fiction/memory/principles.md /tmp/principles-backup.md

# Run upgrade
fiction init --here --force --ai copilot --no-git

# Restore customizations
mv /tmp/principles-backup.md .fiction/memory/principles.md
```

The `--no-git` flag skips git initialization but doesn't affect file updates.

---

## Using `--no-git` Flag

The `--no-git` flag tells Fiction Kit to **skip git repository initialization**. This is useful when:

- You manage version control differently (Mercurial, SVN, etc.)
- Your project is part of a larger monorepo with existing git setup
- You're experimenting and don't want version control yet

**During initial setup:**

```bash
fiction init my-novel --ai copilot --no-git
```

**During upgrade:**

```bash
fiction init --here --force --ai copilot --no-git
```

### What `--no-git` does NOT do

❌ Does NOT prevent file updates
❌ Does NOT skip slash command installation
❌ Does NOT affect template merging

It **only** skips running `git init` and creating the initial commit.

### Working without Git

If you use `--no-git`, you'll need to manage story directories manually:

**Set the `FICTION_STORY` environment variable** before using story commands:

```bash
# Bash/Zsh
export FICTION_STORY="001-my-novel"

# PowerShell
$env:FICTION_STORY = "001-my-novel"
```

This tells Fiction Kit which story directory to use when creating premises, outlines, and scenes.

**Why this matters:** Without git, Fiction Kit can't detect your current branch name to determine the active story. The environment variable provides that context manually.

---

## Troubleshooting

### "Slash commands not showing up after upgrade"

**Cause:** Agent didn't reload the command files.

**Fix:**

1. **Restart your IDE/editor** completely (not just reload window)
2. **For CLI-based agents**, verify files exist:
   ```bash
   ls -la .claude/commands/      # Claude Code
   ls -la .gemini/commands/       # Gemini
   ls -la .cursor/commands/       # Cursor
   ```
3. **Check agent-specific setup:**
   - Codex requires `CODEX_HOME` environment variable
   - Some agents need workspace restart or cache clearing

### "I lost my principles customizations"

**Fix:** Restore from git or backup:

```bash
# If you committed before upgrading
git restore .fiction/memory/principles.md

# If you backed up manually
cp /tmp/principles-backup.md .fiction/memory/principles.md
```

**Prevention:** Always commit or back up `principles.md` before upgrading.

### "Warning: Current directory is not empty"

**Full warning message:**
```
Warning: Current directory is not empty (25 items)
Template files will be merged with existing content and may overwrite existing files
Do you want to continue? [y/N]
```

**What this means:**

This warning appears when you run `fiction init --here` (or `fiction init .`) in a directory that already has files. It's telling you:

1. **The directory has existing content** - In the example, 25 files/folders
2. **Files will be merged** - New template files will be added alongside your existing files
3. **Some files may be overwritten** - If you already have Fiction Kit files (`.claude/`, `.fiction/`, etc.), they'll be replaced with the new versions

**What gets overwritten:**

Only Fiction Kit infrastructure files:
- Agent command files (`.claude/commands/`, `.github/prompts/`, etc.)
- Scripts in `.fiction/scripts/`
- Templates in `.fiction/templates/`
- Memory files in `.fiction/memory/` (including principles)

**What stays untouched:**

- Your `stories/` directory (premises, outlines, scenes, drafts)
- Your character and world files
- Your `.git/` directory and git history
- Any other files not part of Fiction Kit templates

**How to respond:**

- **Type `y` and press Enter** - Proceed with the merge (recommended if upgrading)
- **Type `n` and press Enter** - Cancel the operation
- **Use `--force` flag** - Skip this confirmation entirely:
  ```bash
  fiction init --here --force --ai copilot
  ```

**When you see this warning:**

- ✅ **Expected** when upgrading an existing Fiction Kit project
- ✅ **Expected** when adding Fiction Kit to an existing project
- ⚠️ **Unexpected** if you thought you were creating a new project in an empty directory

**Prevention tip:** Before upgrading, commit or back up your `.fiction/memory/principles.md` if you customized it.

### "CLI upgrade doesn't seem to work"

Verify the installation:

```bash
# Check installed tools
uv tool list

# Should show fiction-cli

# Verify path
which fiction

# Should point to the uv tool installation directory
```

If not found, reinstall:

```bash
uv tool uninstall fiction-cli
uv tool install fiction-cli --from git+https://github.com/github/fiction-kit.git
```

### "Do I need to run fiction every time I open my project?"

**Short answer:** No, you only run `fiction init` once per project (or when upgrading).

**Explanation:**

The `fiction` CLI tool is used for:
- **Initial setup:** `fiction init` to bootstrap Fiction Kit in your project
- **Upgrades:** `fiction init --here --force` to update templates and commands
- **Diagnostics:** `fiction check` to verify tool installation

Once you've run `fiction init`, the slash commands (like `/fiction.premise`, `/fiction.outline`, etc.) are **permanently installed** in your project's agent folder (`.claude/`, `.github/prompts/`, etc.). Your AI assistant reads these command files directly—no need to run `fiction` again.

**If your agent isn't recognizing slash commands:**

1. **Verify command files exist:**
   ```bash
   # For GitHub Copilot
   ls -la .github/prompts/

   # For Claude
   ls -la .claude/commands/
   ```

2. **Restart your IDE/editor completely** (not just reload window)

3. **Check you're in the correct directory** where you ran `fiction init`

4. **For some agents**, you may need to reload the workspace or clear cache

---

## Version Compatibility

Fiction Kit follows semantic versioning for major releases. The CLI and project files are designed to be compatible within the same major version.

**Best practice:** Keep both CLI and project files in sync by upgrading both together during major version changes.

---

## Next Steps

After upgrading:

- **Test new slash commands:** Run `/fiction.principles` or another command to verify everything works
- **Review release notes:** Check [GitHub Releases](https://github.com/github/fiction-kit/releases) for new features and breaking changes
- **Update workflows:** If new commands were added, update your writing workflows
- **Check documentation:** Visit [github.io/fiction-kit](https://github.github.io/fiction-kit/) for updated guides
