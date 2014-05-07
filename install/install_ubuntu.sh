#!/bin/bash

# Linux test
if [[ "$(uname)" != Linux ]]; then
    return 1
fi

# dotfiles dir
dotfiles=~/.dotfiles

# specify the sudoers filename
sudoers_file=sudoers-dotfiles
# sudoers file location
sudoers_src=$dotfiles/config/ubuntu/$sudoers_file
# sudoers dest
sudoers_dest=/etc/sudoers.d/$sudoers_file
# vim bundles directory
vim_bundles=~/vimfiles/bundle/
# dir to link files to
link_dir=$dotfiles/link

# copy sudoers to sudoers.d
if [[ ! -e "$sudoers_dest" || "$sudoers_dest" -ot "$sudoers_src" ]]; then
    visudo -cf "$sudoers_src" >/dev/null && {
    sudo cp "$sudoers_src" "$sudoers_dest" &&
        sudo chmod 0440 "$sudoers_dest"
} >/dev/null 2>&1 &&
    echo "File $sudoers_dest updated." || echo "Error updating $sudoers_dest file."
fi

# create symlinks
for filename in $link_dir/{.,_}[^.]*; do
    echo "Creating symlink for $filename"
    ln -sf $filename ~/
done

# make bundle dir
if [[ ! -d "$vim_bundles" ]]; then
    echo "Creating vim bundles directory at $vim_bundles"
    mkdir -p "$vim_bundles"
fi
