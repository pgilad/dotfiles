# dotfiles dir
dotfiles=~/.dotfiles

# TODO Clone into my dotfiles

# vim bundles directory
vim_bundles=~/vimfiles/bundle/
# dir to link files to
link_dir=$dotfiles/link
# detect os
OS="$(uname -s)"

# Ubuntu-only stuff
if [[ "$OS" =~ Linux ]]
    # specify the sudoers filename
    sudoers_file=sudoers-dotfiles
    # sudoers file location
    sudoers_src=$dotfiles/config/ubuntu/$sudoers_file
    # sudoers dest
    sudoers_dest=/etc/sudoers.d/$sudoers_file
    # copy sudoers to sudoers.d
    if [[ ! -e "$sudoers_dest" || "$sudoers_dest" -ot "$sudoers_src" ]]; then
        visudo -cf "$sudoers_src" >/dev/null && {
        sudo cp "$sudoers_src" "$sudoers_dest" &&
            sudo chmod 0440 "$sudoers_dest"
    } >/dev/null 2>&1 && echo "File $sudoers_dest updated." || echo "Error updating $sudoers_dest file."
fi
fi

# OSX-only stuff.
if [[ "$OS" =~ ^Darwin ]]
    # Install Homebrew.
    if [[ ! "$(type -p brew)" ]]; then
        # install homebrew
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    fi

    if [[ "$(type -p brew)" ]]; then
        brew doctor
        brew update

        packages=(
        maven
        python
        ruby
        nodejs
        mongo
        git
        git-extras
        hub
        tree
        sl
        id3tool
        lesspipe
        nmap
        htop-osx
        man2html
        )
    fi
fi

#TODO handle already created files

# create symlinks
for filename in $link_dir/{.,_}[^.]*; do
    echo "Creating symlink for $filename"
    ln -sf $filename ~/
done

# make vim bundles dir
if [[ ! -d "$vim_bundles" ]]; then
    echo "Creating vim bundles directory at $vim_bundles"
    mkdir -p "$vim_bundles"
fi
