#!/usr/bin/env bash

set -euo pipefail

git submodule --quiet update --init --recursive
chown -R "$(whoami)" ~/.gnupg
find ~/.gnupg -type f -exec chmod 600 {} \;
find ~/.gnupg -type d -exec chmod 700 {} \;
chmod 700 ~/.ssh
chmod 644 ~/.ssh/config
chmod 644 ~/.ssh/config.d/*

if command -v pipx; then
    pipx install pipenv
    pipx install poetry --pip-args="--pre"
fi

if command -v vim; then
    vim -c NeoBundleInstall -c q
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.config/iterm2"
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
fi
