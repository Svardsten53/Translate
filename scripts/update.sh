#!/bin/bash
#
# BirdNET-Pi i18n Update Script
# Re-applies the i18n script tags after a BirdNET-Pi update
#
# Usage: ./update.sh
#
# https://github.com/Svardsten53/Translate
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
I18N_SOURCE_DIR="$(dirname "$SCRIPT_DIR")/i18n"

# Find BirdNET-Pi installation
find_birdnet_home() {
    local locations=(
        "$HOME/BirdNET-Pi"
        "/home/pi/BirdNET-Pi"
        "/BirdNET-Pi"
        "/opt/BirdNET-Pi"
    )

    for loc in "${locations[@]}"; do
        if [ -d "$loc/homepage" ]; then
            echo "$loc"
            return
        fi
    done

    local found=$(find /home /opt / -maxdepth 3 -type d -name "BirdNET-Pi" 2>/dev/null | head -1)
    if [ -n "$found" ] && [ -d "$found/homepage" ]; then
        echo "$found"
    else
        echo ""
    fi
}

# Find web root
find_webroot() {
    local birdnet_home="$1"

    if [ -f /etc/caddy/Caddyfile ]; then
        local caddy_root=$(grep -E "^\s*root\s+" /etc/caddy/Caddyfile 2>/dev/null | head -1 | awk '{print $NF}')
        if [ -n "$caddy_root" ] && [ -d "$caddy_root" ]; then
            echo "$caddy_root"
            return
        fi
    fi

    if [ -d /etc/nginx ]; then
        local nginx_root=$(grep -rh "root\s" /etc/nginx/sites-enabled/ 2>/dev/null | grep -v "#" | head -1 | awk '{print $2}' | tr -d ';')
        if [ -n "$nginx_root" ] && [ -d "$nginx_root" ]; then
            echo "$nginx_root"
            return
        fi
    fi

    if [ -d /etc/apache2 ]; then
        local apache_root=$(grep -rh "DocumentRoot" /etc/apache2/sites-enabled/ 2>/dev/null | head -1 | awk '{print $2}')
        if [ -n "$apache_root" ] && [ -d "$apache_root" ]; then
            echo "$apache_root"
            return
        fi
    fi

    # Check if homepage/i18n exists (previous install location)
    if [ -d "$birdnet_home/homepage/i18n" ]; then
        echo "$birdnet_home/homepage"
        return
    fi

    echo ""
}

# Find where i18n is currently installed
find_i18n_dir() {
    local birdnet_home="$1"
    local webroot="$2"

    # Check webroot first
    if [ -n "$webroot" ] && [ -f "$webroot/i18n/i18n.js" ]; then
        echo "$webroot/i18n"
        return
    fi

    # Check homepage
    if [ -f "$birdnet_home/homepage/i18n/i18n.js" ]; then
        echo "$birdnet_home/homepage/i18n"
        return
    fi

    # Check BirdNET-Pi root
    if [ -f "$birdnet_home/i18n/i18n.js" ]; then
        echo "$birdnet_home/i18n"
        return
    fi

    echo ""
}

BIRDNET_HOME=$(find_birdnet_home)

if [ -z "$BIRDNET_HOME" ]; then
    echo -e "${RED}Error: BirdNET-Pi installation not found!${NC}"
    exit 1
fi

WEBROOT=$(find_webroot "$BIRDNET_HOME")
I18N_DIR=$(find_i18n_dir "$BIRDNET_HOME" "$WEBROOT")

echo -e "${GREEN}BirdNET-Pi i18n Update${NC}"
echo "======================"
echo ""
echo "BirdNET-Pi location: $BIRDNET_HOME"
echo "Web root: ${WEBROOT:-not detected}"
echo "i18n location: ${I18N_DIR:-not found}"
echo ""

# If i18n not found, run full install
if [ -z "$I18N_DIR" ] || [ ! -f "$I18N_DIR/i18n.js" ]; then
    echo -e "${YELLOW}i18n not found. Running full installation...${NC}"
    echo ""
    "$SCRIPT_DIR/install.sh"
    exit 0
fi

# Update i18n.js from source (in case there are updates)
if [ -f "$I18N_SOURCE_DIR/i18n.js" ]; then
    echo "Updating i18n.js..."
    sudo cp "$I18N_SOURCE_DIR/i18n.js" "$I18N_DIR/"

    # Also update language files
    if [ -d "$I18N_SOURCE_DIR/langs" ]; then
        echo "Updating language files..."
        sudo cp "$I18N_SOURCE_DIR/langs/"*.json "$I18N_DIR/langs/" 2>/dev/null || true
    fi
fi

# Script tags to check/add
SCRIPT_TAG='<script src="/i18n/i18n.js" defer></script>'
CONFIG_SCRIPT_TAG='<script src="/i18n/config.js"></script>'

# Function to restore script tag
restore_script_tag() {
    local file="$1"
    local tag="$2"
    local tag_name="$3"

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

echo ""
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
