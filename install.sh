#!/usr/bin/env bash

set -euo pipefail

CONFIG="install.conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTBOT_BIN_FULL_PATH="${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}"

DOTBOT_FLAGS=()

# Running in Github actions
if [[ "${GITHUB_ACTIONS:-}" != "true" ]]; then
    DOTBOT_FLAGS+=("--quiet")
fi

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule --quiet sync --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

"$DOTBOT_BIN_FULL_PATH" "${DOTBOT_FLAGS[@]}" --base-directory "${BASEDIR}" --config-file "${CONFIG}" "${@}"
