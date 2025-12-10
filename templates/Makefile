# Makefile to consolidate scenes into chapters and build the full book
#
# Expected structure:
# drafts/
# ├── prose-index.md
# ├── scenes/
# │   ├── c001/
# │   │   ├── c001s001.md
# │   │   └── c001s002.md
# │   ├── c002/
# │   │   ├── c002s001.md
# │   │   └── c002s002.md
# │   └── ...
# ├── chapters/
# │   ├── chapter-01.md
# │   ├── chapter-02.md
# │   └── ...
# └── book.md
#
# Naming format:
# - Directories: c[NNN] (e.g., c001, c002, c025)
# - Files: c[NNN]s[MMM].md (e.g., c001s001.md, c002s001.md)
# where NNN is the chapter number (001, 002, etc.)
# and MMM is the scene number within that chapter (001, 002, etc.)

# Directories
SCENES_DIR := drafts/scenes
CHAPTERS_DIR := drafts/chapters
BOOK_FILE := drafts/book.md

# Find all chapter directories (format c[NNN])
CHAPTER_DIRS := $(shell find $(SCENES_DIR) -mindepth 1 -maxdepth 1 -type d -name 'c[0-9]*' | sort)

# Generate chapter filenames from directories
CHAPTER_FILES := $(patsubst $(SCENES_DIR)/%,$(CHAPTERS_DIR)/chapter-%.md,$(CHAPTER_DIRS))
CHAPTER_FILES := $(subst /,_,$(CHAPTER_FILES))

.PHONY: all chapters book clean help

# Default target: chapters + full book
all: chapters book

# Create chapters dir if missing
$(CHAPTERS_DIR):
	@mkdir -p $(CHAPTERS_DIR)

# Build each chapter from its directory
# Extract chapter number from dir (c001 -> 001, c002 -> 002, etc.)
$(CHAPTERS_DIR)/chapter-%.md: $(CHAPTERS_DIR)
	@echo "Consolidating chapter from $(SCENES_DIR)/$*..."
	@CHAPTER_NUM=$$(echo "$*" | sed 's/^c0*//'); \
	echo "# Chapter $$CHAPTER_NUM" > "$@"; \
	echo "" >> "$@"; \
	# Find scene files in format c[NNN]s[MMM].md sorted by scene number \
	SCENE_FILES=$$(find "$(SCENES_DIR)/$*" -name "c*s*.md" -type f | sort -t's' -k2,2n); \
	if [ -z "$$SCENE_FILES" ]; then \
		echo "⚠️  No scene files found in $(SCENES_DIR)/$*" >> "$@"; \
	else \
		for scene in $$SCENE_FILES; do \
			echo "  - Processing $$(basename $$scene)..." >&2; \
			# Extract only the Prose section from the scene file \
			awk '/^## Prose/,/^---$$|^## [^P]|^$$/ {if ($$0 !~ /^## Prose/ && $$0 !~ /^---$$/ && $$0 !~ /^## [^P]/) print}' "$$scene" >> "$@"; \
			echo "" >> "$@"; \
		done; \
	fi; \
	echo "---" >> "$@"; \
	echo "<!-- Chapter Metadata" >> "$@"; \
	echo "Chapter: $$CHAPTER_NUM" >> "$@"; \
	echo "Scenes: $$(echo $$SCENE_FILES | xargs -n1 basename | tr '\n' ',' | sed 's/,$$//')" >> "$@"; \
	echo "Generated: $$(date +%Y-%m-%d)" >> "$@"; \
	echo "-->" >> "$@"

# Build all chapters
chapters: $(CHAPTERS_DIR) $(CHAPTER_FILES)
	@echo "✅ Chapters consolidated in $(CHAPTERS_DIR)/"

# Build full book from all chapters
book: chapters
	@echo "Building full book..."
	@echo "# [BOOK TITLE]" > $(BOOK_FILE)
	@echo "" >> $(BOOK_FILE)
	@echo "**Generated**: $$(date +%Y-%m-%d)" >> $(BOOK_FILE)
	@echo "" >> $(BOOK_FILE)
	@echo "---" >> $(BOOK_FILE)
	@echo "" >> $(BOOK_FILE)
	@for chapter in $(shell find $(CHAPTERS_DIR) -name "chapter-*.md" -type f | sort); do \
		echo "  - Appending $$(basename $$chapter)..." >&2; \
		cat "$$chapter" >> $(BOOK_FILE); \
		echo "" >> $(BOOK_FILE); \
		echo "---" >> $(BOOK_FILE); \
		echo "" >> $(BOOK_FILE); \
	done
	@echo "✅ Full book generated at $(BOOK_FILE)"

# Clean generated artifacts
clean:
	@echo "Cleaning generated files..."
	@rm -rf $(CHAPTERS_DIR)
	@rm -f $(BOOK_FILE)
	@echo "✅ Clean complete"

# Help
help:
	@echo "Makefile to consolidate scenes into chapters and the full book"
	@echo ""
	@echo "Usage:"
	@echo "  make          - Generate chapters and full book"
	@echo "  make chapters - Generate consolidated chapters only"
	@echo "  make book     - Generate full book (requires chapters)"
	@echo "  make clean    - Remove generated files"
	@echo "  make help     - Show this help"
	@echo ""
	@echo "Expected structure:"
	@echo "  drafts/scenes/c[NNN]/c[NNN]s[MMM].md"
	@echo "  → drafts/chapters/chapter-[NN].md"
	@echo "  → drafts/book.md"
	@echo ""
	@echo "Naming:"
	@echo "  - Directories: c001, c002, c025, etc."
	@echo "  - Files: c001s001.md, c002s001.md, c025s002.md, etc."
