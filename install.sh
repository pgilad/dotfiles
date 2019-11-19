#!/usr/bin/env bash

set -euo pipefail

CONFIG="install.conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTBOT_BIN_FULL_PATH="${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}"

# Null this in order to have verbose install
QUIET_INSTALL="--quiet"

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule --quiet sync --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

"$DOTBOT_BIN_FULL_PATH" $QUIET_INSTALL --base-directory "${BASEDIR}" --config-file "${CONFIG}" "${@}"
