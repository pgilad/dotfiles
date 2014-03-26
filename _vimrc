"@author Gilad Peleg
"@license MIT 2014
"@website https://github.com/pgilad

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif
" Note: Vim is old
set nocompatible

let b:config =  {
            \ 'baseDir': '~/.dotfiles/',
            \ 'loadFiles': {},
            \ 'env' : {
            \   'windows': has('win32') || has('win64'),
            \   'cygwin': has('win32unix'),
            \   'mac': has('gui_macvim'),
            \   'unix': has('unix')
            \ }
            \}


let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","
let g:maplocalleader = ","

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions=Mc  " console choicse
    " set guioptions+=a " visual select auto-copy to clipboard
endif

function! s:source_path(path)
    let f = fnameescape(expand(a:path))
    if filereadable(f)
        execute 'source ' . f
    else
        echom "Cannot find file to source " . f
    endif
endfunction

" Add the following files to load list (omit the .vim extension)
" Files are loaded in order
for fileToLoad in ['bundles', 'settings', 'mappings', 'autoCommands']
    let b:s = b:config.baseDir . fileToLoad . '.vim'
    call s:source_path(b:s)
endfor

set secure
