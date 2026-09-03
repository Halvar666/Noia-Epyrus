#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/src"
DIST="$ROOT/dist"
WORK="$ROOT/.build"
NAME="Noia_Epyrus_1.0.0rc2"
SOURCE_DATE_EPOCH="${SOURCE_DATE_EPOCH:-1788134400}"

rm -rf "$WORK"
mkdir -p "$WORK/stage" "$DIST"
cp -a "$SRC"/. "$WORK/stage/"

# Release/legal documentation is also carried inside the XPI.
cp "$ROOT/LICENSE" "$WORK/stage/LICENSE"
cp "$ROOT/CREDITS.md" "$WORK/stage/CREDITS.md"
cp "$ROOT/MODIFICATIONS.md" "$WORK/stage/MODIFICATIONS.md"
cp "$ROOT/SOURCE.txt" "$WORK/stage/SOURCE.txt"

# Normalize archive timestamps for reproducible release packaging.
python3 - "$WORK/stage" "$SOURCE_DATE_EPOCH" <<'PY'
from pathlib import Path
import os, sys
root=Path(sys.argv[1])
epoch=int(sys.argv[2])
for p in [root, *root.rglob('*')]:
    try:
        os.utime(p, (epoch, epoch), follow_symlinks=False)
    except (NotImplementedError, FileNotFoundError):
        pass
PY

rm -f "$DIST/$NAME.xpi" "$DIST/$NAME.sha256"
(
  cd "$WORK/stage"
  LC_ALL=C find . -type f -print | sort | zip -X -9 -q "$DIST/$NAME.xpi" -@
)
(cd "$DIST" && sha256sum "$NAME.xpi" > "$NAME.sha256")
printf 'Built %s\n' "$DIST/$NAME.xpi"
