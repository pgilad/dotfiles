set --local POETRY_DIR "pypoetry"

set -gx POETRY_CONFIG_DIR "$XDG_CONFIG_HOME/$POETRY_DIR"
set -gx POETRY_DATA_DIR "$XDG_DATA_HOME/$POETRY_DIR"
set -gx POETRY_CACHE_DIR "$XDG_CACHE_HOME/$POETRY_DIR"

# Global tools (IntelliJ, VSCode, etc..) will need to look here to see global virtualenvs
set -gx POETRY_VIRTUALENVS_PATH "$POETRY_CACHE_DIR/virtualenvs"
