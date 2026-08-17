#!/usr/bin/env bash
set -euo pipefail

# Checks the syntax definition XML before installation.

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"
FILE="$ROOT/syntax/whatsapp.xml"

if command -v xmllint >/dev/null 2>&1; then
    xmllint --noout "$FILE"
    printf 'OK: %s is well-formed XML (xmllint).\n' "$FILE"
else
    python3 - "$FILE" <<'PY'
import sys
import xml.etree.ElementTree as ET

path = sys.argv[1]
ET.parse(path)
print(f"OK: {path} is well-formed XML (Python ElementTree).")
PY
fi
