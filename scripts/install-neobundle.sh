#!/usr/bin/env bash

set -euo pipefail

NEOBUNDLE_PATH="$HOME/.local/share/vimfiles/bundle/neobundle.vim"
# Check if folder already exists and don't do anything if it does.
if [[ -d "$NEOBUNDLE_PATH" ]]; then
    echo "NeoBundle already installed."
    exit 0
fi

echo "Cloning NeoBundle"
mkdir -p "$NEOBUNDLE_PATH"
git clone --quiet https://github.com/Shougo/neobundle.vim.git "$NEOBUNDLE_PATH"
exit 0
