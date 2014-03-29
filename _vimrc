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

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions=Mic  " Don't src menu, use icon, console choices
    " set guioptions+=a " visual select auto-copy to clipboard
endif

" Add the following files to load list (omit the .vim extension)
" Files are loaded in order
" Shortcut for loading - <leader>e{v=vimrc,s=settings,m=mappings,a=autocommands}
for fileToLoad in ['bundles', 'settings', 'mappings', 'autoCommands']
    " set filename
    let b:filePath = g:config.baseDir . fileToLoad . '.vim'
    " set file object in config
    let g:config.loadFiles[fileToLoad] = b:filePath
    " source script
    silent execute 'source ' . fnameescape(expand(b:filePath))
endfor

set secure
