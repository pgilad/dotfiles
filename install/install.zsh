#!/usr/bin/env zsh

# dotfiles dir
dotfiles="$HOME/.dotfiles"
# vim bundles directory
vim_bundles="$HOME/vimfiles/bundle"
# dir to link files to
link_dir="$dotfiles/link"
export CACHE_DIR="$HOME/.cache"
[[ ! -d "$CACHE_DIR" ]] && mkdir -p "$CACHE_DIR"

# detect OS
OS="$(uname -s)"

function iHeader()     { echo -e "\033[1m$@\033[0m";  }
function iStep()       { echo -e "  \033[1;33m➜\033[0m $@"; }
function iFinishStep() { echo -e "  \033[1;32m✔\033[0m $@"; }
function iGood()       { echo -e "    \033[1;32m✔\033[0m $@"; }
function iBad()        { echo -e "    \033[1;31m✖\033[0m $@"; }

if [[ ! "$SHELL" =~ zsh ]]; then
    iBad "Please run this script using Zsh shell"
    exit 1
fi

iHeader "Starting bootstrap install made by https://github.com/pgilad"

iHeader "Running vim setup"
# make vim bundles dir
if [[ ! -d "$vim_bundles" ]]; then
    iStep "Creating vim bundles directory at $vim_bundles"
    mkdir -p "$vim_bundles"
fi
iFinishStep "Vim Installation Complete"

iHeader "Creating symlinks"
for filename in "$link_dir/"*(D); do
    baseFile="$(basename "$filename")"
    iStep "Handling file: $baseFile"
    if [[ ! -e ~/"$baseFile" ]]; then
        ln -sf "$filename" ~/"$baseFile" && iGood "Symlink created: ~/$baseFile"
    else
        iBad "Symlink skipped, file exists: ~/$baseFile"
    fi
done
iFinishStep "Symlinking complete"

# OSX-only stuff.
if [[ "$OS" =~ ^Darwin ]]; then
    iHeader "Running OSX setup"
    # Install Homebrew.
    if [[ ! -x "$(command -v brew)" ]]; then
        iStep "Installing Homebrew"
        # install homebrew
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    fi
    brew update
    brew upgrade --all
    brew tap Homebrew/bundle
    scriptPath=$(dirname "$0")
    brew bundle --file="$scriptPath/Brewfile"
    iFinishStep "OSX installation complete"
fi

echo -e "\n"
iFinishStep "Installation complete!"
unset iHeader iStep iGood iBad iFinishStep
