#!/bin/bash
# vsc-cleanup.sh - Remove non-essential files from a Linux VS Code install
# (license texts and unused locales) to free up disk space.

VSCODE_DIR="/usr/share/code"
total_bytes=0

# Terminal colors
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

# Convert bytes to MiB with two decimals (1 MiB = 1048576 bytes)
to_mib() { awk -v b="$1" 'BEGIN { printf "%.2f", b / 1048576 }'; }

# Remove a file or directory, print its size, and add it to the running total
remove() {
    local target="$1" size
    if [ ! -e "$target" ]; then
        echo -e "${RED}Not found: $target${NC}"
        return
    fi
    size=$(du -sb "$target" | cut -f1)   # du works for files and directories
    echo "Removing: $target ($(to_mib "$size") MiB)"
    sudo rm -rf "$target"
    total_bytes=$((total_bytes + size))
}

echo -e "${YELLOW}Starting VS Code cleanup...${NC}"

# 1. License / third-party notice files and directory
for target in \
    "$VSCODE_DIR/resources/app/ThirdPartyNotices.txt" \
    "$VSCODE_DIR/LICENSES.chromium.html" \
    "$VSCODE_DIR/resources/app/LICENSE.rtf" \
    "$VSCODE_DIR/resources/app/licenses"; do
    remove "$target"
done

# 2. Every locale file except English (extglob enables the !(...) pattern;
#    nullglob makes the loop do nothing if the folder is missing or empty)
shopt -s extglob nullglob
for target in "$VSCODE_DIR"/locales/!(en-GB.pak|en-US.pak); do
    remove "$target"
done

echo -e "${GREEN}Cleanup complete! Total space saved: $(to_mib "$total_bytes") MiB${NC}"
