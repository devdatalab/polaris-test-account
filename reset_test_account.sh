#!/bin/bash

# reset_test_account.sh
# Wipes the test account home directory and restores minimal base configs
# for replicating data pipelines without standard team configurations.
# Run this script as the test account user from within the cloned config repo.

set -euo pipefail

# ---------- configuration ----------
TEST_USER="f004qzy"
CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ---------- confirm user ----------
CURRENT_USER=$(whoami)
if [ "$CURRENT_USER" != "$TEST_USER" ]; then
    echo "ERROR: This script must be run as $TEST_USER (current user: $CURRENT_USER)"
    exit 1
fi

# ---------- safety prompt ----------
echo "This will WIPE everything in $HOME and restore base configs."
read -rp "Are you sure? (yes/no): " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
    echo "Aborted."
    exit 0
fi

# ---------- wipe home directory ----------
echo "Wiping $HOME ..."

# resolve $HOME to its real path to avoid symlink mismatches with pwd
HOME_REAL="$(realpath "$HOME")"
CONFIG_RELPATH="${CONFIG_DIR#"$HOME_REAL"/}"
CONFIG_TOPLEVEL="${CONFIG_RELPATH%%/*}"

echo "  HOME_REAL=$HOME_REAL"
echo "  CONFIG_DIR=$CONFIG_DIR"
echo "  CONFIG_TOPLEVEL=$HOME_REAL/$CONFIG_TOPLEVEL"

# delete everything in home except the config repo's top-level ancestor,
# and public_html (preserved with empty pdf/ and png/ dirs)
for item in "$HOME_REAL"/* "$HOME_REAL"/.*; do
    name="$(basename "$item")"

    # skip . and ..
    [ "$name" = "." ] || [ "$name" = ".." ] && continue

    # skip config repo and public_html
    [ "$name" = "$CONFIG_TOPLEVEL" ] && echo "  keeping $item (config repo)" && continue
    [ "$name" = "public_html" ] && echo "  keeping $item (public_html)" && continue

    echo "  removing $item"
    rm -rf "$item"
done

# wipe public_html contents but keep pdf/ and png/ as empty directories
if [ -d "$HOME/public_html" ]; then
    echo "Cleaning public_html ..."
    find "$HOME/public_html" -mindepth 1 -maxdepth 1 \
        -not -name "pdf" \
        -not -name "png" \
        -print -exec rm -rf {} +
    # ensure pdf and png dirs exist and are empty
    mkdir -p "$HOME/public_html/pdf" "$HOME/public_html/png"
    find "$HOME/public_html/pdf" -mindepth 1 -print -exec rm -rf {} +
    find "$HOME/public_html/png" -mindepth 1 -print -exec rm -rf {} +
fi

# ---------- copy config files ----------
echo "Copying config files..."

# shell configs
cp "$CONFIG_DIR/.bashrc"          "$HOME/.bashrc"
cp "$CONFIG_DIR/.bash_profile"    "$HOME/.bash_profile"

# emacs
cp -r "$CONFIG_DIR/.emacs.d"      "$HOME/.emacs.d"

# ado/, texmf/, utils/, iec/
cp -r "$CONFIG_DIR/ado"           "$HOME/ado"
cp -r "$CONFIG_DIR/texmf"         "$HOME/texmf"
cp -r "$CONFIG_DIR/utils"         "$HOME/utils"
cp -r "$CONFIG_DIR/iec"           "$HOME/iec"

# ---------- remove the config repo clone ----------
echo "Removing config repo clone at $HOME_REAL/$CONFIG_TOPLEVEL ..."
cd "$HOME"
rm -rf "$HOME_REAL/$CONFIG_TOPLEVEL" 2>/dev/null
# retry after brief delay if network filesystem hasn't caught up
if [ -d "$HOME_REAL/$CONFIG_TOPLEVEL" ]; then
    sleep 2
    rm -rf "$HOME_REAL/$CONFIG_TOPLEVEL" 2>/dev/null || true
fi

echo "Done. Test account $TEST_USER has been reset."
