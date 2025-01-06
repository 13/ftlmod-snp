.ONESHELL:

# Variables
ZIP_FILE = ScrapNoPursuit.zip
FTL_FILE = ScrapNoPursuit.ftl
OUT_DIR = out
SRC_DIR = src
MODS_DIR = $(HOME)/.opt/ftlmod/mods

# Default target
all: build

# Check if `zip` is installed
check_zip:
	@command -v zip >/dev/null 2>&1 || { echo "Error: zip is not installed." >&2; exit 1; }

# Build the project
build: clean check_zip
	@echo "Building ScrapNoPursuit..."
	@mkdir -p $(OUT_DIR)

	# Create ScrapNoPursuit.ftl in the src directory
	@cd $(SRC_DIR) && zip -r $(FTL_FILE) *

	# Move the .ftl file to the out directory
	@cd ..
	@mv -v $(SRC_DIR)/$(FTL_FILE) $(OUT_DIR)/$(FTL_FILE)

	# Create the final ScrapNoPursuit.zip
	@cd $(OUT_DIR) && zip -r $(ZIP_FILE) $(FTL_FILE)
	@cd ..

# Install the build
install: build
	@echo "Installing ScrapNoPursuit..."
	@cp -v $(OUT_DIR)/$(FTL_FILE) $(MODS_DIR)/

# Clean up
clean:
	@echo "Cleaning up..."
	@rm -f $(SRC_DIR)/$(FTL_FILE) $(OUT_DIR)/$(FTL_FILE)
	@rm -f $(SRC_DIR)/$(ZIP_FILE) $(OUT_DIR)/$(ZIP_FILE)

