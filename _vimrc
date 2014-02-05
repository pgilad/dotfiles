"@author Gilad Peleg

"So 2014...
set nocompatible

"""""""""""""""""""""""""""
"  Vundle Initialization  "
"""""""""""""""""""""""""""
let b:bundles_file=expand("~/.dotfiles/bundles.vim") "buffer local var
if filereadable(b:bundles_file)
    silent exec "source " . b:bundles_file
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Current working directories and fonts according to location
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if hostname() ==? "GILAD"
    set lines=999
    set columns=999
    simalt ~x "full screen
    set gfn=consolas:h11
    "Set working dir
    if isdirectory('c:\repositories\Appstrio\managment_app')
        cd c:\repositories\chromeBuilder
    endif
elseif hostname() ==? "GILAD-PC"
    set lines=999
    set columns=999
    set gfn=consolas:h9
    "Set working dir
    if isdirectory('d:\development\repositories')
        cd d:\development\repositories
    endif
else
    simalt ~x
    set gfn=consolas:h9
endif

""""""""
"  UI  "
""""""""
set scrolloff=3 " Set 7 lines to the cursor - when moving vertically using j/k

set wildmenu " Turn on the WiLd menu
set wildmode=longest,list,full
set wildignore+=*.o,*~,*.pyc
set wildignore+=**/node_modules/**
set wildignore+=.idea/**
set wildignore+=.git/**
set wildignore+=**/bower_components/**

set viewoptions=folds,options,cursor,slash
set shortmess+=filmnrxoOtT
set noshellslash " required so far for vundle to work. wish it was otherwise

set suffixesadd+=.js " list of suffixes to add when using gf

set ruler "Always show current position

set cmdheight=1 " Height of the command bar

set showcmd "show partial commands
set showmode "show which mode i'm on

" I don't work with octal numbers so make vim treat padded numbers as decimals as well
set nrformats=

set hidden " A buffer becomes hidden when it is abandoned

set backspace=eol,start,indent "configure backspace the expected way
set whichwrap+=<,>,h,l

set ignorecase "ignore case when searching
set smartcase "be smart about searching
set infercase "ignore case in autocomplete

" global regex is on by default
"set gdefault "This confused me a bit. need to work on it

set hlsearch "highlight search"
set incsearch "increment search

set lazyredraw " Don't redraw while executing macros (good performance config)

set magic " For regular expressions turn magic on

set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets

set noerrorbells " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500

set number "show line number
set relativenumber "line numbers are relative
set cursorline "highlight where cursor is

set nowrap " turn word wrap off
set ttyfast " fast terminal redraw

set cpoptions+=$ "when changing - mark block end with $
set virtualedit=onemore

set listchars=tab:>-,trail:~,nbsp:.,extends:> "highlight problematic chars
set list "show problematic chars

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700 " Sets how many lines of history VIM has to remember

set nomodeline "security issue

set splitright " Always splits to the right
set splitbelow " and below

set t_Co=256 " 256bit terminal

filetype plugin on
filetype indent on " Enable filetype plugins

set mouse=a "enable mouse
set mousehide "hide mouse cursor while typing

set autoread " Set to auto read when a file is changed from the outside

set encoding=utf-8 " Set utf8 as standard encoding and en_US as the standard language
scriptencoding utf-8

set title " show filename in windows title

set nostartofline " Don't reset cursor to start of line when moving around.

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has('unnamedplus')
    set clipboard=unnamedplus "linux/mac"
else
    set clipboard=unnamed
endif

"""""""""""
"  folds  "
"""""""""""
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts and gui options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set color scheme and font
syntax on
set background=dark
colorscheme jellybeans

" Set extra options when running in GUI mode
if has("gui_running")
    set go-=m "remove menu
    set go-=T "remove toolbar
    set go-=r "remove right scrollbar
    set go-=L "remove left scrollbar
    set go-=b "remove bottom scrollbar
endif

" good for setting NERDTree width after toggles
set winfixwidth

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" persistant undo file
if has('persistent_undo')
    set undofile
    let b:undo_dir=expand("~/vimfiles/.cache/undo/")
    if !isdirectory(b:undo_dir)
       silent exec '!mkdir ' . b:undo_dir
    endif
    set undodir=~/vimfiles/.cache/undo/
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab " Use spaces instead of tabs
set smarttab

" default params
set shiftwidth=4 tabstop=4 softtabstop=4
set shiftround " < and > round to nearest multiple of tabstop

set linebreak " Linebreak on 500 characters
set tw=500

set autoindent
set smartindent

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
set laststatus=2 " Always show the status line

""""""""""""""""""""""""""""""
" => Spelling
""""""""""""""""""""""""""""""
set spelllang=en_us
let b:spell_dir=expand("~/vimfiles/spell/") " Spell file
" if spell dir doesn't exist- create it
if !isdirectory(b:spell_dir)
    silent exec '!mkdir ' . b:spell_dir
endif

set spellfile=~/vimfiles/spell/en.utf-8.add
set nospell

""""""""""""""
"  Mappings  "
""""""""""""""
let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","
let g:maplocalleader = ","

" See undo tree
nnoremap <F3> :GundoToggle<cr>
" set spell check
nnoremap <F4> :setlocal spell!<cr>
" set rainbow parent
nnoremap <F5> :RainbowParenthesesToggle<cr>
" open in chrome
nnoremap <silent> <F12>c :silent !start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" %<cr>

nnoremap <leader><tab> :NERDTreeToggle<cr>

" switch between 0 and ^
noremap 0 ^
noremap ^ 0

" easy way to normal mode
inoremap jj <ESC>
" better line navigation
nnoremap j gj
nnoremap k gk

" who ever uses ; for something?
" also don't map back since it breaks plugins according to steve losh
nnoremap ; :

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"Clears the search highlight
nnoremap <silent> <space> :nohlsearch<CR>
nnoremap <silent> <leader>ls :set list!<CR>

"<leader>w: Close current buffer
nnoremap <leader>wc :bdelete<cr>

"<leader>p: Copy the full path of the current file to the clipboard
nnoremap <silent> <leader>cp :let @+=expand("%:p")<cr>:echo "Copied current file
            \ path '".expand("%:p")."' to clipboard"<cr>

" <leader>n: NERDTreeFind find current file in the tree
nnoremap <silent> <leader>n :NERDTreeFind<cr> :wincmd p<cr>
"Open current dir
nnoremap <silent> <leader>nc :NERDTreeCWD<cr>

" quickly edit $MYVIMRC
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
" quickly edit bundles
nnoremap <silent> <leader>eb :edit ~/.dotfiles/bundles.vim<cr>
" quickly edit plugins
nnoremap <silent> <leader>ep :edit ~/.dotfiles/plugins.vim<cr>
" quickly source myvimrc
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

"<leader>cd: Switch to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Switch commands.
nnoremap <silent> <leader>sw :Switch<CR>

" Ctrl-[hl]: Move left/right by word
cnoremap <c-h> <s-left>
cnoremap <c-l> <s-right>

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

"""""""""""""""""""""""""""
"  Plugins Confi          "
"""""""""""""""""""""""""""
let b:plugins_config=expand("~/.dotfiles/plugins.vim") "buffer local var
if filereadable(b:plugins_config)
    silent exec "source " . b:plugins_config
endif

""""""""""""""""""""""
"  custom functions  "
""""""""""""""""""""""
" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

function! VisualModeBeautify(vStart, vEnd)
    echom "running JsBeautify(" . a:vStart . ", " . a:vEnd . ")"
    call JsBeautify(a:vStart, a:vEnd)
endfunction

""""""""""""""""""""""""
"  Autogroup commands  "
""""""""""""""""""""""""
augroup my_auto_commands
    autocmd!
    " saving on lost focus
    autocmd FocusLost * :silent! wall
    autocmd FileType javascript,html,json,jade,vim,markdown autocmd FileWritePre,FileAppendPre,FilterWritePre,BufWritePre <buffer> call TrimWhiteSpace()

    " close sentence with comma or semi-colon
    autocmd FileType javascript,css,json nnoremap <buffer> <silent> <leader>; :call cosco#commaOrSemiColon()<cr>
    autocmd FileType javascript,css,json inoremap <buffer> <silent> <leader>; <ESC>:call cosco#commaOrSemiColon()<cr>a

    " autocomplete
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " beautify
    autocmd FileType javascript,json nnoremap <buffer> <leader>js :call JsBeautify()<cr>
    autocmd FileType javascript,json vnoremap <buffer> <silent> <leader>js :<c-u>call VisualModeBeautify(line("'<"),line("'>"))<cr>

    autocmd FileType html nnoremap <buffer> <leader>js :call HtmlBeautify()<cr>
    autocmd FileType css,less nnoremap <buffer> <leader>js :call CSSBeautify()<cr>

    " set filestypes
    autocmd BufRead,BufNewFile *.ajs setlocal filetype=javascript
    autocmd BufRead,BufNewFile *.jshintrc,*.bowerrc setlocal filetype=json

    " reload vimrc when saved
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
