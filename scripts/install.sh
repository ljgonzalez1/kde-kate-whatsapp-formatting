#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

SOURCE_FILE="$ROOT/syntax/whatsapp.xml"
TARGET_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/org.kde.syntax-highlighting/syntax"
TARGET_FILE="$TARGET_DIR/whatsapp.xml"

if [[ ! -f "$SOURCE_FILE" ]]; then
    printf 'Error: syntax definition not found: %s\n' "$SOURCE_FILE" >&2
    exit 1
fi

mkdir -p "$TARGET_DIR"
install -m 0644 "$SOURCE_FILE" "$TARGET_FILE"

printf 'Installed WhatsApp syntax highlighting to:\n%s\n\n' "$TARGET_FILE"
printf 'Please restart KDE Kate.\n'
