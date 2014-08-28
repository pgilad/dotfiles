#!/usr/bin/env zsh
# dotfiles dir
dotfiles="$HOME/.dotfiles"
# vim bundles directory
vim_bundles="$HOME/vimfiles/bundle"
# dir to link files to
link_dir=$dotfiles/link
# detect OS
OS="$(uname -s)"

function iHeader()     { echo "\033[1m$@\033[0m";  }
function iStep()       { echo "  \033[1;33m➜\033[0m $@"; }
function iFinishStep() { echo "  \033[1;32m✔\033[0m $@"; }
function iGood()       { echo "    \033[1;32m✔\033[0m $@"; }
function iBad()        { echo "    \033[1;31m✖\033[0m $@"; }

iHeader "Starting bootstrap install @Gilad"

iStep "Creating $HOME/.cache/ dir"
if [[ ! -d "$HOME/.cache" ]]; then
    mkdir -p "$HOME/.cache"
    iGood "$HOME/.cache/ dir created"
else
    iBad "$HOME/.cache/ dir already exists."
fi

iStep "Checking that $HOME/.oh-my-zsh/ exists"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Should .oh-my-zsh be installed to $HOME/.oh-my-zsh ?"
    select result in Yes No; do
        if [[ "$result" == "Yes" ]]; then
            git clone git@github.com:robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
        fi
        break
    done
else
    iBad "$HOME/.oh-my-zsh/ direcotry exists."
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

# OSX-only stuff.
if [[ "$OS" =~ ^Darwin ]]; then
    iHeader "Running OSX setup"
    # Install Homebrew.
    if [[ ! -x "$(command -v brew)" ]]; then
        iStep "Installing Homebrew"
        # install homebrew
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    fi
    iFinishStep "OSX installation complete"
fi

# create symlinks
iHeader "Creating symlinks"
for filename in $link_dir/{.,_}[!.]*(:t); do
    iStep "Handling file: $filename"
    if [[ ! -e ~/"$filename" ]]; then
        ln -sf "$link_dir/$filename" ~/ &&
            iGood "Symlink created: ~/$filename" ||
            iBad "Problem with symlinking ~/$filename"
    else
        iBad "Symlink skipped, file exists: ~/$filename"
    fi
done
iFinishStep "Symlinking complete"

# make vim bundles dir
iHeader "Handling vim install"
if [[ ! -d "$vim_bundles" ]]; then
    iStep "Creating vim bundles directory at $vim_bundles"
    mkdir -p "$vim_bundles"
fi
iFinishStep "Vim installation complete"
echo "\n"
iFinishStep "Installation complete!"
unset iHeader iStep iGood iBad
