#!/usr/bin/env bash
# Download the official Godot 4.7.2 (Linux x86_64) editor into this folder.
set -euo pipefail

VERSION="4.7.2-stable"
FILE="Godot_v4.7.2-stable_linux.x86_64.zip"
URL="https://github.com/godotengine/godot-builds/releases/download/${VERSION}/${FILE}"

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "Downloading Godot ${VERSION} (Linux x86_64)..."
curl -fL -o "$FILE" "$URL"
unzip -o "$FILE"
chmod +x Godot_v4.7.2-stable_linux.x86_64

echo "Done. Run: ./Godot_v4.7.2-stable_linux.x86_64"
