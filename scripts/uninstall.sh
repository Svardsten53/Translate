#!/bin/bash
#
# BirdNET-Pi i18n Uninstall Script
# Removes the i18n system and restores original files
#
# Usage: ./uninstall.sh
#
# https://github.com/RonnyCHL/Translate
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

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

echo -e "${YELLOW}BirdNET-Pi i18n Uninstall${NC}"
echo "========================="
echo ""
echo "BirdNET-Pi location: $BIRDNET_HOME"
echo ""

read -p "Are you sure you want to uninstall the i18n system? (y/N) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Uninstall cancelled."
    exit 0
fi

echo ""
echo "Removing i18n script tags from PHP files..."

INDEX_FILE="$BIRDNET_HOME/homepage/index.php"
VIEWS_FILE="$BIRDNET_HOME/homepage/views.php"

# Remove script tags
for file in "$INDEX_FILE" "$VIEWS_FILE"; do
    if [ -f "$file" ]; then
        # Remove i18n.js and config.js script tags
        sed -i '/<script src="\/i18n\/i18n.js" defer><\/script>/d' "$file"
        sed -i '/<script src="\/i18n\/config.js"><\/script>/d' "$file"
        echo "  Cleaned $(basename "$file")"
    fi
done

# Optionally restore from backup
for file in "$INDEX_FILE" "$VIEWS_FILE"; do
    backup_file="${file}.i18n-backup"
    if [ -f "$backup_file" ]; then
        read -p "Restore $(basename "$file") from backup? (y/N) " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            cp "$backup_file" "$file"
            echo "  Restored $(basename "$file") from backup"
        fi
    fi
done

# Remove i18n directory
I18N_DIR="$BIRDNET_HOME/i18n"
if [ -d "$I18N_DIR" ]; then
    read -p "Remove i18n directory ($I18N_DIR)? (y/N) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$I18N_DIR"
        echo "  Removed i18n directory"
    fi
fi

# Clean up backup files
read -p "Remove backup files? (y/N) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -f "$INDEX_FILE.i18n-backup" "$VIEWS_FILE.i18n-backup"
    echo "  Removed backup files"
fi

echo ""
echo -e "${GREEN}Uninstall complete!${NC}"
echo ""
echo "Refresh your browser to see the original English interface."
echo ""
