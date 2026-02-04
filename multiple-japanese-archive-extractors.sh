#!/usr/bin/env bash

# Dependencies: unar
#
# This script extracts all .zip, .7z, and .rar files in the current directory
# Adding a top-level directory if missing in the archive.

set -euo pipefail

shopt -s nullglob
archives=(*.zip *.7z *.rar)

if [ ${#archives[@]} -eq 0 ]; then
    echo "No archives found"
    exit 0
fi

for archive in "${archives[@]}"; do
    echo "Extracting: $archive"
    unar -e shift-jis "$archive"
    echo ""
done

echo "Extraction complete!"
