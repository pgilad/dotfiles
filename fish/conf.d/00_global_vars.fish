# ============================================================================
# Fish Shell Global Environment Variables Configuration
# ============================================================================
# Author: Gilad Peleg
# Last Updated: June 2025
# Description: Global environment variables for Fish shell, organized by
#              category and following XDG Base Directory specification
# ============================================================================

# ============================================================================
# XDG Base Directory Specification
# ============================================================================
# Standard directories for configuration, data, cache, and runtime files
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME "$HOME/.cache"
set -q XDG_RUNTIME_DIR; or set -gx XDG_RUNTIME_DIR "/tmp/runtime-$USER"

# Custom directory for storing application history files
set -gx APPLICATIONS_HISTORY_PATH "$XDG_DATA_HOME/history"

# ============================================================================
# Global System Settings
# ============================================================================
# Default editors and shell configuration
set -gx EDITOR vim
set -gx VISUAL vim
set -gx SHELL /opt/homebrew/bin/fish

# Locale settings for proper character encoding
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# Default pager with syntax highlighting
set -gx PAGER bat

# TTY setting for GPG operations
set -gx GPG_TTY (tty)

# Color configuration for grep output
set -gx GREP_COLOR "1;37;45"

# ============================================================================
# System Paths and Libraries
# ============================================================================
# Fast access to Homebrew prefix without calling slow `brew --prefix`
set -gx BREW_PREFIX /opt/homebrew/opt

# OpenSSL configuration for secure connections
set -gx OPENSSL_PATH "$BREW_PREFIX/openssl@3"
set -gx LIBRARY_PATH "$OPENSSL_PATH/lib/"

# ============================================================================
# Security and Authentication
# ============================================================================
# SSH configuration
set -gx SSH_KEY_PATH "$HOME/.ssh"
set -gx SSH_AUTH_SOCK "$HOME/.1password/agent.sock"

# Password manager configuration
set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME/password-store"

# Security settings
set -gx NOCLOBBER 1

# GPG configuration for better XDG compliance
set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"

# ============================================================================
# Package Managers and Tools
# ============================================================================
# Homebrew configuration
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_CASK_OPTS --no-quarantine

# pipx configuration
set -gx PIPX_BIN_DIR "$HOME/.local/bin"

# mise configuration
set -gx MISE_CONFIG_FILE "$XDG_CONFIG_HOME/mise/config.toml"

# mise configuration (manual control preferred)
set -gx MISE_FISH_AUTO_ACTIVATE 0

# ============================================================================
# Programming Languages and Runtimes
# ============================================================================

# --- Python ---
set -gx PYTHONIOENCODING utf-8
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx PYTHONUNBUFFERED 1
set -gx PIP_REQUIRE_VIRTUALENV true
set -gx PIP_DEFAULT_TIMEOUT 30
set -gx PIP_CACHE_DIR "$XDG_CACHE_HOME/pip"
set -gx POETRY_VIRTUALENVS_PATH "$HOME/.virtualenvs"
set -gx IPYTHONDIR "$XDG_CONFIG_HOME/jupyter"
set -gx JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME/jupyter"

# --- Go ---
set -gx GOPATH "$XDG_DATA_HOME/go"
set -gx GOBIN "$GOPATH/bin"
set -gx GO111MODULE on
set -gx GOPROXY https://proxy.golang.org,direct

# --- Rust ---
set -gx CARGOBIN "$HOME/.cargo/bin"

# --- Ruby ---
set -gx GEM_HOME "$XDG_DATA_HOME/gem"
set -gx GEM_SPEC_CACHE "$XDG_CACHE_HOME/gem"
set -gx BUNDLE_USER_CACHE "$XDG_CACHE_HOME/bundle"
set -gx BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME/bundle"
set -gx BUNDLE_USER_PLUGIN "$XDG_DATA_HOME/bundle"
set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=$OPENSSL_PATH --with-readline-dir=$BREW_PREFIX/readline --with-libyaml-dir=$BREW_PREFIX/libyaml"

# --- Node.js and JavaScript ---
set -gx NVM_DIR "$XDG_DATA_HOME/nvm"
set -gx NODE_REPL_HISTORY "$APPLICATIONS_HISTORY_PATH/node_repl_history"
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/.npmrc"
set -gx NPM_CONFIG_CACHE "$XDG_CACHE_HOME/npm"
set -gx BUN_INSTALL "$XDG_DATA_HOME/bun"
set -gx DENO_DIR "$XDG_DATA_HOME/deno"
set -gx DENO_INSTALL_ROOT "$XDG_DATA_HOME/deno/bin"
set -gx PNPM_HOME "$XDG_DATA_HOME/pnpm"
set -gx BABEL_CACHE_PATH "$XDG_CACHE_HOME/babel/babel.json"
set -gx GATSBY_CONCURRENT_DOWNLOAD 25

# --- Java and JVM Languages ---
# set -q JAVA_HOME; or set -gx JAVA_HOME "/Users/giladpeleg/.asdf/installs/java/adoptopenjdk-11.0.11+9"
set -q GRADLE_USER_HOME; or set -gx GRADLE_USER_HOME "$XDG_DATA_HOME/gradle"
set -gx LEIN_JVM_OPTS "-XX:+TieredCompilation -XX:TieredStopAtLevel=2"

# --- Haskell ---
set -gx STACK_ROOT "$XDG_DATA_HOME/stack"

# ============================================================================
# DevOps and Cloud Tools
# ============================================================================
# AWS configuration
set -gx AWS_PAGER ""

# Docker configuration
set -gx DOCKER_BUILDKIT 1
set -gx COMPOSE_DOCKER_CLI_BUILD 1
# set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"

# Terraform configuration
set -gx TF_CLI_CONFIG_FILE "$XDG_CONFIG_HOME/terraform/.terraformrc"
set -gx TF_DATA_DIR "$XDG_DATA_HOME/terraform"

# Kubernetes configuration
set -gx KUBECONFIG "$XDG_CONFIG_HOME/kubernetes/config"
set -gx KUBECONFIGDIR "$XDG_CONFIG_HOME/kubernetes"

# ============================================================================
# CLI Tools and Utilities
# ============================================================================
# Shell and prompt configuration
set -gx STARSHIP_CONFIG "$XDG_CONFIG_HOME/starship/starship.toml"
set -gx HISTSIZE 10000
set -gx SAVEHIST 10000

# HTTP tools
set -gx HTTPIE_CONFIG_DIR "$XDG_CONFIG_HOME/httpie"

# Text processing and pagers
set -gx LESSHISTFILE "$APPLICATIONS_HISTORY_PATH/less_history"
set -gx LESSKEY "$XDG_CONFIG_HOME/less/keys"

# Database CLI tools
set -gx REDISCLI_HISTFILE "$APPLICATIONS_HISTORY_PATH/redis_history"
set -gx SQLITE_HISTORY "$APPLICATIONS_HISTORY_PATH/sqlite_history"

# AI and Development Tools
set -gx CLAUDE_CODE_USE_BEDROCK 1

# Modern Python tools
set -gx UV_CACHE_DIR "$XDG_CACHE_HOME/uv"
set -gx RUFF_CACHE_DIR "$XDG_CACHE_HOME/ruff"

# ============================================================================
# Optional/Commented Configurations
# ============================================================================
# macOS SDK path (uncomment if needed for native compilation)
# set -gx SDKROOT (xcrun --show-sdk-path)

# Python build configuration for pyenv (uncomment if needed)
# set -gx PYTHON_CONFIGURE_OPTS "--with-tcltk-includes='-I$BREW_PREFIX/tcl-tk/include' --with-tcltk-libs='-L$BREW_PREFIX/tcl-tk/lib -ltcl8.6 -ltk8.6'"
# set -gx DYLD_FALLBACK_LIBRARY_PATH "$OPENSSL_PATH/lib"

# Homebrew build workaround (uncomment if encountering build issues)
# for pkg in openssl curl readline gettext ncurses icu4c sqlite zlib mysql-client tcl-tk libxml2
# set -gx CFLAGS "-I/usr/local/opt/$pkg/include" $CFLAGS
# set -gx CPPFLAGS "-I/usr/local/opt/$pkg/include" $CPPFLAGS
# set -gx LD_RUN_PATH "/usr/local/opt/$pkg/lib" $LD_RUN_PATH
# set -gx LDFLAGS "-L/usr/local/opt/$pkg/lib" $LDFLAGS
# set -gx PKG_CONFIG_PATH "/usr/local/opt/$pkg/lib/pkgconfig" $PKG_CONFIG_PATH
# end

# ============================================================================
# PATH Configuration
# ============================================================================
# Add binary directories to PATH in priority order
fish_add_path --path \
    /usr/local/sbin \
    /opt/homebrew/sbin \
    $PIPX_BIN_DIR \
    $OPENSSL_PATH/bin \
    $GEM_HOME/bin \
    $BREW_PREFIX/tcl-tk/bin \
    $BREW_PREFIX/curl/bin \
    $GOBIN \
    $CARGOBIN \
    $XDG_DATA_HOME/npm-global-modules/bin \
    $BUN_INSTALL/bin \
    $DENO_INSTALL_ROOT \
    $PNPM_HOME
