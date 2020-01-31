#!/usr/bin/env bash

set -euo pipefail

git submodule --quiet update --init --recursive
chown -R "$(whoami)" ~/.gnupg
find ~/.gnupg -type f -exec chmod 600 {} \;
find ~/.gnupg -type d -exec chmod 700 {} \;
chmod 700 ~/.ssh
chmod 644 ~/.ssh/config
chmod 644 ~/.ssh/config.d/*
