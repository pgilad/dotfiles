#!/bin/bash

# link dotfiles
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/_vimrc ~/_vimrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

# make bundle dir
if [[ ! -d ~/vimfiles/bundle ]]; then
    mkdir -p ~/vimfiles/bundle
fi
