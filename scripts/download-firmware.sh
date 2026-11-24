#!/usr/bin/env bash
# Download the left/right .uf2 files from the latest successful build on main.
# Usage: scripts/download-firmware.sh [output-dir]   (default: ~/Downloads/zmk)
set -euo pipefail

REPO="skrlssn/zmk-config"
OUT="${1:-$HOME/Downloads/zmk}"

run_id=$(gh run list -R "$REPO" --branch main --workflow build.yml --status success \
  --limit 1 --json databaseId -q '.[0].databaseId')

if [[ -z "$run_id" ]]; then
  echo "No successful build found on main." >&2
  exit 1
fi

rm -rf "$OUT"
gh run download "$run_id" -R "$REPO" -n firmware -D "$OUT"

echo "Downloaded run $run_id to $OUT:"
ls -1 "$OUT"
open "$OUT"
