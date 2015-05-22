#!/usr/bin/env bash

# dotfiles dir
dotfiles="$HOME/.dotfiles"
# vim bundles directory
vim_bundles="$HOME/vimfiles/bundle"
# dir to link files to
link_dir="$dotfiles/link"
cache_dir="$HOME/.cache"
oh_my_zsh_dir="$HOME/.oh-my-zsh"
# detect OS
OS="$(uname -s)"

function iHeader()     { echo -e "\033[1m$@\033[0m";  }
function iStep()       { echo -e "  \033[1;33m➜\033[0m $@"; }
function iFinishStep() { echo -e "  \033[1;32m✔\033[0m $@"; }
function iGood()       { echo -e "    \033[1;32m✔\033[0m $@"; }
function iBad()        { echo -e "    \033[1;31m✖\033[0m $@"; }

iHeader "Starting bootstrap install made by https://github.com/pgilad"

iStep "Creating Cache dir - $cache_dir"
if [[ ! -d "$cache_dir" ]]; then
    mkdir -p "$cache_dir"
    iGood "$cache_dir created"
else
    iBad "$cache_dir already exists"
fi

iStep "Checking that $oh_my_zsh_dir exists"
if [[ ! -d "$oh_my_zsh_dir" ]]; then
    echo "Should .oh-my-zsh be installed to $oh_my_zsh_dir ?"
    select result in Yes No; do
        if [[ "$result" == "Yes" ]]; then
            git clone https://github.com/robbyrussell/oh-my-zsh.git "$oh_my_zsh_dir"
            iGood "$oh_my_zsh_dir created"
        fi
        break
    done
else
    iBad "$oh_my_zsh_dir already exists"
fi

# Ubuntu-only stuff
if [[ "$OS" =~ ^Linux ]]; then
    iHeader "Running Linux Setup"
    # specify the sudoers filename
    sudoers_file=sudoers-dotfiles
    # sudoers file location
    sudoers_src=$dotfiles/install/ubuntu/$sudoers_file
    # sudoers dest
    sudoers_dest=/etc/sudoers.d/$sudoers_file
    # copy sudoers to sudoers.d
    if [[ ! -e "$sudoers_dest" || "$sudoers_dest" -ot "$sudoers_src" ]]; then
        iStep "Setting up sudo account for easier installing"
        visudo -cf "$sudoers_src" >/dev/null &&
            sudo cp "$sudoers_src" "$sudoers_dest" &&
            sudo chmod 0440 "$sudoers_dest" &&
            echo "File $sudoers_dest updated." ||
            echo "Error updating $sudoers_dest file."
    fi
    iFinishStep "Linux installation complete"
fi

iHeader "Running vim setup"
# make vim bundles dir
if [[ ! -d "$vim_bundles" ]]; then
    iStep "Creating vim bundles directory at $vim_bundles"
    mkdir -p "$vim_bundles"
fi
iFinishStep "Vim Installation Complete"

iHeader "Creating symlinks"
for filename in "$link_dir/"*; do
    baseFile="$(basename "$filename")"
    iStep "Handling file: $baseFile"
    if [[ ! -e ~/"$baseFile" ]]; then
        ln -sf "$filename" ~/"$baseFile" && iGood "Symlink created: ~/$baseFile"
    else
        iBad "Symlink skipped, file exists: ~/$baseFile"
    fi
done
iFinishStep "Symlinking complete"

if [[ ! "$SHELL" =~ zsh ]]; then
    if [[ ! -x "$(command -v zsh)" ]]; then
        iHeader "Changing shell to Zsh. Welcome to the future..."
        sudo chsh -s /bin/zsh
        iGood "done changing shell"
    else
        iBad "Zsh not found in your system."
    fi
fi

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
