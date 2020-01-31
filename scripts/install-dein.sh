#!/usr/bin/env bash

set -euo pipefail

DEIN_PATH="$HOME/.local/share/dein"
# Check if folder already exists and don't do anything if it does.
if [[ -d "$DEIN_PATH" ]]; then
    echo "Dein already installed."
    exit 0
fi

echo "Cloning Dein"
mkdir -p "$DEIN_PATH"
DEIN_PLUGIN_PATH="$DEIN_PATH/repos/github.com/Shougo/dein.vim"
git clone --quiet https://github.com/Shougo/dein.vim "$DEIN_PLUGIN_PATH"
exit 0
