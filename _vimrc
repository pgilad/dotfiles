"@author Gilad Peleg

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif
"So 2014...
set nocompatible

let b:is_windows = has('win32') || has('win64')
let b:is_cygwin = has('win32unix')
let b:is_macvim = has('gui_macvim')
let b:is_unix = has('unix')

""""""""""""""
"  Mappings  "
""""""""""""""
let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","
let g:maplocalleader = ","

function! s:create_dir(dir)
    let make_dir=expand(a:dir)
    if !isdirectory(make_dir)
        call mkdir(make_dir, 'p')
    endif
endfunction

function! s:source_path(path)
    let f = fnameescape(expand(a:path))
    if filereadable(f)
        execute 'source ' . f
    else
        echom "Cannot find file to source " . f
    endif
endfunction

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions=Mc  " console choicse
    " set guioptions+=a " visual select auto-copy to clipboard
endif

call s:source_path("~/.dotfiles/bundles.vim")

set lines=999
set columns=999

if hostname() ==? "GILAD"
    set gfn=consolas:h11
    let b:home_dir = 'c:\repositories\Appstrio\managment_app'
elseif hostname() ==? "GILAD-PC"
    set gfn=consolas:h9
    let b:home_dir = 'd:\development\repositories'
else
    set gfn=consolas:h9
    let b:home_dir = "~"
endif
if isdirectory(b:home_dir)
    exec 'cd ' . b:home_dir
endif

" maximize window if windows
if b:is_windows
    simalt ~x
endif

"set color scheme and font
if has('syntax')
    syntax on
    filetype plugin indent on
endif

set background=dark
" let b:color = "jellybeans"
" let b:color = "distinguished"
" let b:color = "wombat256mod"
" let b:color = "badwolf"
" let b:color = "hybrid"
" let b:color = "molokai"
" let b:color = "vividchalk"
let b:color = "Tomorrow-Night"

try
    exec "color " . b:color
catch
    color desert
endtry


set scrolloff=3                                 " Set 7 lines to the cursor - when moving vertically using j/k
set winfixwidth                                 " NERD width after toggles

if has("wildmenu")
    set wildmenu                                    " Turn on the WiLd menu
    set wildignorecase
    set wildmode=longest,list,full
    set wildignore+=*.o,*~,*.pyc
    set wildignore+=**/node_modules/**
    set wildignore+=build/
    set wildignore+=.idea/**
    set wildignore+=.git/**
    set wildignore+=*/bower_components/**
endif

set viewoptions=folds,options,cursor,slash,unix
set shellslash
set shortmess=aTI
set showbreak=>\
set suffixesadd+=.js                          " list of suffixes to add when using gf
set ruler                                     " Always show current position
set cmdheight=1                               " Height of the command bar
set showcmd                                   " show partial commands
set showmode                                  " show which mode i'm on
set nrformats-=octal                          " no octal numbers
set hidden                                    " A buffer becomes hidden when it is abandoned
set showfulltag
set backspace=eol,start,indent                " configure backspace the expected way
set whichwrap+=<,>,h,l,[,],b,s,~
set ignorecase                                " ignore case when searching
set smartcase                                 " be smart about searching
set infercase                                 " ignore case in autocomplete
set nohlsearch                                " highlight search
set incsearch                                 " increment search
set lazyredraw                                " Don't redraw while executing macros (good performance config)
set matchtime=3
set synmaxcol=400
set notimeout
set ttimeout
set ttimeoutlen=10
set magic                                     " For regular expressions turn magic on
set showmatch                                 " Show matching brackets when text indicator is over them
set matchpairs+=<:>
set noerrorbells                              " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500

set number                                    " show line number
set relativenumber                            " line numbers are relative
set cursorline                                " highlight where cursor is
set nowrap                                    " turn word wrap off
set wrapscan
set ttyfast                                   " fast terminal redraw
set cpoptions+=$                              " when changing - mark block end with $
set virtualedit=block
set listchars=tab:>-,trail:~,nbsp:.,extends:> " highlight problematic chars
set list                                      " show problematic chars

set history=700                               " Sets how many lines of history VIM has to remember
set nomodeline                                " security issue
set splitright                                " Always splits to the right
set splitbelow                                " and below
set t_Co=256                                  " 256bit terminal
if has('mouse')
    set mouse=a                               " enable mouse
    set mousehide                             " hide mouse cursor while typing
endif
set autowrite
set encoding=utf-8                            " Set utf8 as standard encoding and en_US as the standard language
scriptencoding utf-8
set title                                     " show filename in windows title
set nostartofline                             " Don't reset cursor to start of line when moving around.

set fileformat=unix                           " Default fileformat
set fileformats=unix,dos,mac                  " Automatic recognition of a new line cord.

" share clipboard with os
if has('unnamedplus')
    set clipboard=unnamedplus "linux/mac"
else
    set clipboard=unnamed
endif

" Disable GetLatestVimPlugin.vim
if !&verbose
    let g:loaded_getscriptPlugin = 1
endif

" Disable netrw.vim
let g:loaded_netrwPlugin = 1
let g:loaded_matchparen = 0

"""""""""""
"  folds  "
"""""""""""
if has('folding')
    set foldmethod=indent " fold based on indent
    set foldnestmax=7     " deepest fold is 3 levels
    set foldlevelstart=0
    set nofoldenable        " dont fold by default
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup      " no backups of files
set nowritebackup
set noswapfile    " no swap files
set backupdir-=.

if has('persistent_undo')
    call s:create_dir("~/.cache/undo/")
    set undofile
    set undodir=~/vimfiles/.cache/undo/
endif

" TODO think about this. regex doesn't work
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

set expandtab     " Use spaces instead of tabs
set smarttab
set nojoinspaces  " don't add multiple spaces on line joins
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround    " < and > round to nearest multiple of tabstop
set linebreak     " Linebreak on 500 characters
set tw=500
set autoindent
set smartindent
set laststatus=2  " Always show the status line

if has('spell')
    call s:create_dir("~/vimfiles/spell/")
    set spelllang=en_us
    set spellfile=~/vimfiles/spell/en.utf-8.add
    set nospell
endif

""""""""""""""""""""""
"  F-# keys mapping  "
""""""""""""""""""""""
" See undo tree
nnoremap <F3> :GundoToggle<cr>
" set spell check
nnoremap <F4> :setlocal spell!<cr>
" set rainbow parent
nnoremap <F5> :RainbowParenthesesToggle<cr>
" toggle paste
map <F6> :set invpaste<CR>:set paste?<CR>
" open in chrome
nnoremap <silent> <F12>c :silent !start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" %:p<cr>

""""""""""""""""""""""""""""
"  Regular keys unbinding  "
""""""""""""""""""""""""""""
" switch between 0 and ^
noremap 0 ^
noremap ^ 0

" easy way to normal mode
inoremap jj <ESC>
" better line navigation
nnoremap j gj
nnoremap k gk

" change cursor position in insert mode
inoremap <c-h> <left>
inoremap <c-l> <right>

"expand window split by 25 columns
nnoremap <c-w><c-l> 25<c-w>>
"retract window split by 25 columns
nnoremap <c-w><c-h> 25<c-w><

" who ever uses ; for something?
" also don't map back since it breaks plugins according to steve losh
nnoremap ; :

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"<leader>cd: Switch to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

" copy editorconfig from .dotfiles to current path
nnoremap <leader>de :exec '!copy ' . expand('~/.dotfiles/.editorconfig') . ' ' . expand('%:p:h/')<cr>
""""""""""""""""""""""""""
"  Command-line mapping  "
""""""""""""""""""""""""""
" Ctrl-[hl]: Move left/right by word
cnoremap <c-h> <left>
cnoremap <c-j> <s-left>
cnoremap <c-k> <s-right>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-p> <up>
cnoremap <c-n> <down>

"""""""""""""""""""""""""
"  Leader keys mapping  "
"""""""""""""""""""""""""
"""""""""""""""
"  <leader>r  "
"""""""""""""""
nnoremap <silent> <leader>rt i=strftime('%c')<cr>

" show list
nnoremap <silent> <leader>ls :set list!<CR>

"<leader>w: Close current buffer
nnoremap <leader>wc :bdelete<cr>

"<leader>p: Copy the full path of the current file to the clipboard
nnoremap <silent> <leader>cp :let @+=expand("%:p")<cr>:echo "Copied current file
            \ path '".expand("%:p")."' to clipboard"<cr>

"""""""""""""""
"  <leader>n  "
"""""""""""""""
" Open current dir
nnoremap <leader>nc :NERDTreeCWD<cr>
" open nerd tree window
nnoremap <leader>n<tab> :NERDTreeToggle<cr>
" find current file in nerdtree
nnoremap <leader>nf :NERDTreeFind<cr>
"""""""""""""""
"  <leader>e  "
"""""""""""""""
" quickly edit $MYVIMRC
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
" quickly edit bundles
nnoremap <silent> <leader>eb :edit ~/.dotfiles/bundles.vim<cr>
" quickly source myvimrc
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
" edit current filetype custom snippets
nnoremap <silent> <leader>es :UltiSnipsEdit<cr>
nnoremap <silent> <leader>eu :NeoBundleUpdate<cr>
nnoremap <silent> <leader>el :NeoBundleUpdatesLog<cr>

nnoremap <leader>ex :execute getline(".")<cr>
vnoremap <leader>ex :<c-u>execute getreg("*")<cr>
"clear all double+ empty lines
nnoremap <leader>ec :g/^\n$/d<cr>

"""""""""""""""
"  <leader>s  "
"""""""""""""""
" Switch commands.
nnoremap <silent> <leader>sw :Switch<CR>

"""""""""""""""
"  <leader>o  "
"""""""""""""""
" simply open search in browser
nmap <leader>oo <Plug>(openbrowser-open)
nmap <leader>os <Plug>(openbrowser-smart-search)
vmap <leader>os <Plug>(openbrowser-smart-search)

"open explorer in path of current buffer
nnoremap <leader>oe :silent! !start explorer %:p:h:gs?\/?\\?<cr>

"""""""""""""""
"  <leader>m  "
"""""""""""""""
"markdown preview
nnoremap <leader>mp :Me<cr>
" break chaining on .then
nnoremap <leader>m<cr> /\%<c-r>=line('.')<cr>l\.then:nohlsearch<cr>i	l
" add require('gulp-.. on current word
nnoremap <leader>mg mjyiwgg0/requireovar * = require('gulp-*')A;`j:nohlsearch<cr>
" add require(''); .. on current word
nnoremap <leader>mr mjyiwgg0/requireovar * = require('*')A;`j:nohlsearch<cr>

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

if has('autocmd')
    " close sentence with comma or semi-colon
    augroup my_auto_commands
        autocmd!
        autocmd FileType javascript,css,json nnoremap <buffer> <silent> <leader>; :call cosco#commaOrSemiColon()<cr>
        autocmd FileType javascript,css,json inoremap <buffer> <silent> <leader>; <ESC>:call cosco#commaOrSemiColon()<cr>a
        autocmd!
        " saving on lost focus
        autocmd FocusLost * :silent! wall
        autocmd FileType javascript,html,json,jade,vim autocmd FileWritePre,FileAppendPre,FilterWritePre,BufWritePre <buffer> call TrimWhiteSpace()

        " autocomplete
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        " beautify
        autocmd FileType javascript,json nnoremap <buffer> <leader>js :call JsBeautify()<cr>
        autocmd FileType javascript,json vnoremap <buffer> <leader>js :call RangeJsBeautify()<cr>
        autocmd FileType html nnoremap <buffer> <leader>js :call HtmlBeautify()<cr>
        autocmd FileType html vnoremap <buffer> <leader>js :call RangeHtmlBeautify()<cr>
        autocmd FileType css nnoremap <buffer> <leader>js :call CSSBeautify()<cr>
        autocmd FileType css vnoremap <buffer> <leader>js :call RangeCSSBeautify()<cr>

        "pretty format json using python
        autocmd FileType json nnoremap <buffer> <leader>fj :%!python -m json.tool<cr>

        " set filestypes
        autocmd BufRead,BufNewFile *.ajs setlocal filetype=javascript
        autocmd BufRead,BufNewFile *.jshintrc,*.bowerrc setlocal filetype=json

        " reload vimrc when saved
        autocmd BufWritePost $MYVIMRC source $MYVIMRC

        autocmd WinLeave * setlocal nocursorline
        autocmd WinEnter * setlocal cursorline
        autocmd WinEnter * checktime
        " Disable paste.
        autocmd InsertLeave *
                    \ if &paste | set nopaste mouse=a | echo 'nopaste' | endif |
                \ if &l:diff | diffupdate | endif
        "
        "             " Update diff.
        autocmd InsertLeave * if &l:diff | diffupdate | endif
    augroup END
endif

set secure
