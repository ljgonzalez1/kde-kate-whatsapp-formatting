#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/org.kde.syntax-highlighting/syntax"
TARGET_FILE="$TARGET_DIR/whatsapp.xml"

if [[ -e "$TARGET_FILE" ]]; then
    rm -- "$TARGET_FILE"
    printf 'Removed:\n%s\n\n' "$TARGET_FILE"
    printf 'Please restart KDE Kate.\n'

else
    printf 'Nothing to remove. File does not exist:\n%s\n\n' "$TARGET_FILE"
fi
