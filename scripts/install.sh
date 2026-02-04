#!/bin/bash
#
# BirdNET-Pi i18n Installation Script
# Installs the JavaScript-based translation system
#
# Usage: ./install.sh [language]
# Example: ./install.sh nl
#
# https://github.com/RonnyCHL/Translate
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Default values
DEFAULT_LANG="${1:-nl}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
I18N_SOURCE_DIR="$(dirname "$SCRIPT_DIR")/i18n"

# Find BirdNET-Pi installation
find_birdnet_home() {
    # Check common locations
    if [ -d "$HOME/BirdNET-Pi" ]; then
        echo "$HOME/BirdNET-Pi"
    elif [ -d "/home/pi/BirdNET-Pi" ]; then
        echo "/home/pi/BirdNET-Pi"
    else
        # Search for it
        local found=$(find /home -maxdepth 2 -type d -name "BirdNET-Pi" 2>/dev/null | head -1)
        if [ -n "$found" ]; then
            echo "$found"
        else
            echo ""
        fi
    fi
}

BIRDNET_HOME=$(find_birdnet_home)

if [ -z "$BIRDNET_HOME" ]; then
    echo -e "${RED}Error: BirdNET-Pi installation not found!${NC}"
    echo "Please specify the path manually:"
    echo "  BIRDNET_HOME=/path/to/BirdNET-Pi ./install.sh"
    exit 1
fi

echo -e "${GREEN}BirdNET-Pi i18n Installation${NC}"
echo "=============================="
echo ""
echo "BirdNET-Pi location: $BIRDNET_HOME"
echo "Default language: $DEFAULT_LANG"
echo ""

# Check if source i18n directory exists
if [ ! -d "$I18N_SOURCE_DIR" ]; then
    echo -e "${RED}Error: i18n source directory not found at $I18N_SOURCE_DIR${NC}"
    exit 1
fi

# Create target directory
I18N_TARGET_DIR="$BIRDNET_HOME/i18n"
echo "Creating i18n directory..."
mkdir -p "$I18N_TARGET_DIR/langs"

# Copy i18n files
echo "Copying i18n files..."
cp "$I18N_SOURCE_DIR/i18n.js" "$I18N_TARGET_DIR/"
cp "$I18N_SOURCE_DIR/langs/"*.json "$I18N_TARGET_DIR/langs/" 2>/dev/null || true

# Check if language file exists
if [ ! -f "$I18N_TARGET_DIR/langs/${DEFAULT_LANG}.json" ]; then
    echo -e "${YELLOW}Warning: Language file '${DEFAULT_LANG}.json' not found. Using 'nl' as default.${NC}"
    DEFAULT_LANG="nl"
fi

# Script tag to inject
SCRIPT_TAG='<script src="/i18n/i18n.js" defer></script>'

# Function to add script tag to a PHP file
add_script_tag() {
    local file="$1"
    local backup_file="${file}.i18n-backup"

    if [ ! -f "$file" ]; then
        echo -e "${YELLOW}Warning: File not found: $file${NC}"
        return 1
    fi

    # Check if already installed
    if grep -q "i18n.js" "$file"; then
        echo "  Already installed in $(basename "$file")"
        return 0
    fi

    # Create backup
    if [ ! -f "$backup_file" ]; then
        cp "$file" "$backup_file"
    fi

    # Add script tag before </head> or after <body>
    if grep -q "</head>" "$file"; then
        sed -i "s|</head>|${SCRIPT_TAG}\n</head>|" "$file"
        echo "  Added to $(basename "$file") (before </head>)"
    elif grep -q "<body>" "$file"; then
        sed -i "s|<body>|<body>\n${SCRIPT_TAG}|" "$file"
        echo "  Added to $(basename "$file") (after <body>)"
    else
        echo -e "${YELLOW}  Warning: Could not find injection point in $(basename "$file")${NC}"
        return 1
    fi

    return 0
}

# Add script tags to PHP files
echo ""
echo "Adding script tags to BirdNET-Pi files..."

INDEX_FILE="$BIRDNET_HOME/homepage/index.php"
VIEWS_FILE="$BIRDNET_HOME/homepage/views.php"

add_script_tag "$INDEX_FILE"
add_script_tag "$VIEWS_FILE"

# Copy config.js (user can customize flag, language, etc.)
echo ""
echo "Setting up configuration..."

if [ -f "$I18N_SOURCE_DIR/config.js" ]; then
    # Only copy if not already exists (preserve user customizations)
    if [ ! -f "$I18N_TARGET_DIR/config.js" ]; then
        cp "$I18N_SOURCE_DIR/config.js" "$I18N_TARGET_DIR/"
        # Update default language in config
        sed -i "s/defaultLang: 'nl'/defaultLang: '${DEFAULT_LANG}'/" "$I18N_TARGET_DIR/config.js"
        echo "  Created config.js with default language: $DEFAULT_LANG"
    else
        echo "  Config.js already exists (preserving user settings)"
    fi
fi

# Add config.js script tag BEFORE i18n.js (so config is loaded first)
CONFIG_SCRIPT_TAG='<script src="/i18n/config.js"></script>'

for file in "$INDEX_FILE" "$VIEWS_FILE"; do
    if [ -f "$file" ] && ! grep -q "config.js" "$file"; then
        if grep -q "i18n.js" "$file"; then
            # Add config.js BEFORE i18n.js
            sed -i "s|<script src=\"/i18n/i18n.js\"|${CONFIG_SCRIPT_TAG}\n<script src=\"/i18n/i18n.js\"|" "$file"
            echo "  Added config.js to $(basename "$file")"
        fi
    fi
done

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo "Available languages:"
for lang_file in "$I18N_TARGET_DIR/langs/"*.json; do
    if [ -f "$lang_file" ]; then
        lang=$(basename "$lang_file" .json)
        echo "  - $lang"
    fi
done
echo ""
echo "To change language:"
echo "  - Add ?lang=xx to the URL (e.g., http://your-birdnet/?lang=nl)"
echo "  - Or run: localStorage.setItem('birdnet_i18n_lang', 'xx') in browser console"
echo ""
echo "To uninstall, run: ./uninstall.sh"
echo ""
