# <img src="img/dotfiles.png" width="321" height="62" alt="dotfiles">
> Full glory!

## Overview
My config files, mainly Vim & Zsh aimed at working in Windows (7/8) and Ubuntu & OSX.

## Key Features
- Uses [NeoBundle](https://github.com/Shougo/neobundle.vim) as package manager.
- Uses [Unite](https://github.com/Shougo/unite.vim) as an all-around explorer.
- Geared towards portability.
- Equipped to handle web development (HTML/CSS/Js/Frameworks/etc...)
- NERDTree/CtrlP for browsing (but soon enough will use Unite for that too)

## Goals

- As Object-Oriented as possible
- As lazy-loaded as possible (due to 75+ Vim packages)
- Shell install scripts for windows and Linux
- OS agnostic
- Highly commented

## Installation

- Git clone this repository into your ~/.dotfiles
```sh
git clone https://github.com/pgilad/dotfiles.git ~/.dotfiles
```

- Change your shell to `zsh` (`chsh -s /bin/zsh`)

### Windows

- run `install/install.cmd`. If it fails - you will need Administrator permission for it.

### Ubuntu

- run `install/install.sh`

### OSX

- run `install/install.sh`
- optionally setup `brew bundle ~./dotfiles/install/Brewfile`
- optionally setup `brew bundle ~/.dotfiles/install/Caskfile`

## Adding Local Files

Any file you add with pattern `filename.local` (hidden files included) to `~/local/` will be auto-sourced with shell login.

For example, if you have your own custom `.aliases` file you want auto-sourced, put it in `~/local/.aliases.local`

## Vim

- Main file is `_vimrc`.
- Bundles files (bundled using `NeoBundle`) is `bundles.vim`.
- Update bundles using `NeoBundleUpdate`.
- Custom snippets are in the directory `mysnippets` and are auto-loaded according to filetype.
I aim my vimrc to be as OO as possible. Have you ever seen a *_vimrc* like this:

```vim
"@author Gilad Peleg
"@license MIT 2014
"@website https://github.com/pgilad/dotfiles

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif
" Note: Vim is old
set nocompatible

let g:config =  {
            \ 'baseDir': '~/.dotfiles/rc/',
            \ 'loadFiles': {},
            \ 'bundlesPath': '~/vimfiles/bundle/',
            \ 'env' : {
            \   'windows': has('win32') || has('win64'),
            \   'cygwin': has('win32unix'),
            \   'mac': has('gui_macvim'),
            \   'unix': has('unix')
            \ }
            \}

" map leader keys
let g:mapleader = ","
let g:maplocalleader = ","

" Following files are loaded from g:config.baseDir with vim extension
" How to quickly load the files:
" Mapping     |  File
" ---------------------------
" <leader>eg  |  Gui
" <leader>eb  |  Bundles
" <leader>es  |  Settings
" <leader>em  |  Mappings
" <leader>ea  |  autoCommands
for fileToLoad in ['gui', 'bundles', 'settings', 'mappings', 'autoCommands']
    " set filename
    let b:filePath = g:config.baseDir . fileToLoad . '.vim'
    " set file object in config
    let g:config.loadFiles[fileToLoad] = b:filePath
    " source script
    silent execute 'source ' . fnameescape(expand(b:filePath))
endfor

set secure
```

## Zsh

- Uses Oh-My-Zsh alongside customization and completion

## Thanks (in no particular order)

- [Shougo's dotfiles](https://github.com/Shougo/shougo-s-github)
- [Cowboy's dotfiles](https://github.com/cowboy/dotfiles)
- [Mathias's dotfiles](https://github.com/mathiasbynens/dotfiles)
