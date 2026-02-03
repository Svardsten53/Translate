#!/bin/bash
#
# BirdNET-Pi i18n Update Script
# Re-applies the i18n script tags after a BirdNET-Pi update
#
# Usage: ./update.sh
#
# https://github.com/RonnyCHL/Translate
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Find BirdNET-Pi installation
find_birdnet_home() {
    if [ -d "$HOME/BirdNET-Pi" ]; then
        echo "$HOME/BirdNET-Pi"
    elif [ -d "/home/pi/BirdNET-Pi" ]; then
        echo "/home/pi/BirdNET-Pi"
    else
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
    exit 1
fi

I18N_DIR="$BIRDNET_HOME/i18n"

echo -e "${GREEN}BirdNET-Pi i18n Update${NC}"
echo "======================"
echo ""

# Check if i18n directory exists
if [ ! -d "$I18N_DIR" ]; then
    echo -e "${RED}Error: i18n directory not found at $I18N_DIR${NC}"
    echo "Please run install.sh first."
    exit 1
fi

# Check if i18n.js exists
if [ ! -f "$I18N_DIR/i18n.js" ]; then
    echo -e "${RED}Error: i18n.js not found!${NC}"
    echo "Please run install.sh first."
    exit 1
fi

echo "BirdNET-Pi location: $BIRDNET_HOME"
echo ""

# Script tags to check/add
SCRIPT_TAG='<script src="/i18n/i18n.js" defer></script>'
CONFIG_SCRIPT_TAG='<script src="/i18n/config.js"></script>'

# Function to restore script tag
restore_script_tag() {
    local file="$1"
    local tag="$2"
    local tag_name="$3"
    local changes=0

    if [ ! -f "$file" ]; then
        echo -e "${YELLOW}Warning: File not found: $file${NC}"
        return 1
    fi

    # Check if already present
    if grep -q "$tag_name" "$file"; then
        echo "  $tag_name already present in $(basename "$file")"
        return 0
    fi

    # Add script tag
    if grep -q "</head>" "$file"; then
        sed -i "s|</head>|${tag}\n</head>|" "$file"
        echo -e "  ${GREEN}Restored $tag_name in $(basename "$file")${NC}"
        return 0
    elif grep -q "<body>" "$file"; then
        sed -i "s|<body>|<body>\n${tag}|" "$file"
        echo -e "  ${GREEN}Restored $tag_name in $(basename "$file")${NC}"
        return 0
    else
        echo -e "${YELLOW}  Warning: Could not find injection point in $(basename "$file")${NC}"
        return 1
    fi
}

INDEX_FILE="$BIRDNET_HOME/homepage/index.php"
VIEWS_FILE="$BIRDNET_HOME/homepage/views.php"

echo "Checking and restoring script tags..."
echo ""

# Restore config.js FIRST (must load before i18n.js)
if [ -f "$I18N_DIR/config.js" ]; then
    restore_script_tag "$INDEX_FILE" "$CONFIG_SCRIPT_TAG" "config.js"
    restore_script_tag "$VIEWS_FILE" "$CONFIG_SCRIPT_TAG" "config.js"
fi

# Then restore i18n.js
restore_script_tag "$INDEX_FILE" "$SCRIPT_TAG" "i18n.js"
restore_script_tag "$VIEWS_FILE" "$SCRIPT_TAG" "i18n.js"

echo ""
echo -e "${GREEN}Update complete!${NC}"
echo ""
echo "Your translations should now be working again."
echo "Refresh your browser to see the changes."
echo ""
