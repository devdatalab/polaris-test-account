#!/bin/bash

# reset_test_account.sh
# Wipes the test account home directory and restores minimal base configs
# for replicating data pipelines without standard team configurations.
# Run this script as the test account user from within the cloned config repo.

set -euo pipefail

# ---------- configuration ----------
TEST_USER="f004qzy"
CONFIG_DIR="$(cd "$(dirname "$0")" && pwd)"

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

# find the top-level directory under $HOME that contains the config repo,
# so we can exclude it from the wipe (we still need to copy from it)
CONFIG_RELPATH="${CONFIG_DIR#"$HOME"/}"
CONFIG_TOPLEVEL="$HOME/${CONFIG_RELPATH%%/*}"

# delete everything in home except the config repo's top-level ancestor,
# public_html (preserved with empty PDF/ and PNG/ dirs), and iec/
find "$HOME" -mindepth 1 -maxdepth 1 \
    -not -path "$CONFIG_TOPLEVEL" \
    -not -name "public_html" \
    -exec rm -rf {} +

# wipe public_html contents but keep PDF/ and PNG/ as empty directories
if [ -d "$HOME/public_html" ]; then
    find "$HOME/public_html" -mindepth 1 -maxdepth 1 \
        -not -name "pdf" \
        -not -name "png" \
        -exec rm -rf {} +
    # ensure pdf and png dirs exist and are empty
    mkdir -p "$HOME/public_html/pdf" "$HOME/public_html/png"
    find "$HOME/public_html/pdf" -mindepth 1 -exec rm -rf {} +
    find "$HOME/public_html/png" -mindepth 1 -exec rm -rf {} +
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
echo "Removing config repo clone at $CONFIG_TOPLEVEL ..."
rm -rf "$CONFIG_TOPLEVEL"

echo "Done. Test account $TEST_USER has been reset."
