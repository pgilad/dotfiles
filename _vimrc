"@author Gilad Peleg

"So 2014...
set nocompatible

"""""""""""""""""""""""""""
"  Vundle Initialization  "
"""""""""""""""""""""""""""
let b:bundles_file=expand("~/.dotfiles/bundles.vim") "buffer local var
if filereadable(b:bundles_file)
    exec "source " . b:bundles_file
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Current working directories and fonts according to location
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if hostname() ==? "GILAD"
    set lines=55
    set columns=200
    set gfn=consolas:h11
    "Set working dir
    if isdirectory('c:\repositories\Appstrio\managment_app')
        cd c:\repositories\chromeBuilder
    endif
elseif hostname() ==? "GILAD-PC"
    set lines=55
    set columns=180
    set gfn=consolas:h9
    "Set working dir
    if isdirectory('d:\development\repositories')
        cd d:\development\repositories
    endif
endif

""""""""
"  UI  "
""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=3

" Turn on the WiLd menu
set wildmenu
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc

set viewoptions=folds,options,cursor
" required so far for vundle to work. wish it was otherwise
set noshellslash

" list of suffixes to add when using gf
set suffixesadd+=.js

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

"show partial commands
set showcmd
set showmode

" I don't work with octal numbers so make vim treat padded numbers as decimals as well
set nrformats=

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
set smartcase
set infercase " ignore case in autocomplete

" global regex is on by default
"set gdefault "This confused me a bit. need to work on it

set hlsearch "highlight search"
set incsearch "increment search

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"show line number
set number relativenumber
set cursorline

" turn word wrap off
set nowrap

" fast terminal redraw
set ttyfast

"when changing - mark block end with $
set cpoptions+=$
set virtualedit=onemore

"highlight problematic chars
set listchars=tab:>-,trail:~,nbsp:.,extends:>
set list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

set nomodeline

" Always splits to the right and below
set splitright
set splitbelow

" 256bit terminal
set t_Co=256

" Enable filetype plugins
filetype plugin indent on

set mouse=a "enable mouse
set mousehide "hide mouse cursor while typing

" Set to auto read when a file is changed from the outside
set autoread

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
scriptencoding utf-8

" show filename in windows title
set title

" Don't reset cursor to start of line when moving around.
set nostartofline

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
    set clipboard=unnamedplus
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
if exists('+undofile')
    set undofile
    set undodir=~/vimfiles/.cache/undo/
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab smarttab

" 1 tab == 4 spaces
set shiftwidth=4 tabstop=4 softtabstop=4
" < and > round to nearest multiple of tabstop
set shiftround

" Linebreak on 500 characters
set linebreak
set tw=500

set autoindent smartindent

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

""""""""""""""""""""""""""""""
" => Spelling
""""""""""""""""""""""""""""""

" Configure the spelling language and file.
set spelllang=en_us
set spellfile=~/vimfiles/spell/en.utf-8.add
set nospell

"""""""""""""""""""""""""""""""
"======= Start mappings =======
"""""""""""""""""""""""""""""""
let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","
let g:maplocalleader = ","

" <F3>: Gundo
nnoremap <F3> :<C-u>GundoToggle<CR>

"Set mapping key definitions
nnoremap <leader><tab> :NERDTreeToggle<CR>

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
nnoremap <silent> <leader>ch :nohlsearch<CR>
nnoremap <silent> <leader>ls :set list!<CR>
nnoremap <silent> <F12>c :silent !start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" %<CR>

"<leader>w: Close current buffer
nnoremap <leader>wc :bdelete<cr>

"<leader>p: Copy the full path of the current file to the clipboard
nnoremap <silent> <leader>cp :let @+=expand("%:p")<cr>:echo "Copied current file
            \ path '".expand("%:p")."' to clipboard"<cr>

" <leader>n: NERDTreeFind find current file in the tree
nnoremap <silent> <leader>n :NERDTreeFind<cr> :wincmd p<cr>

" quickly edit or source $MYVIMRC
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

"<leader>cd: Switch to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Switch commands.
nnoremap <silent> <leader>sw :Switch<CR>

let g:switch_custom_definitions =
            \ [
            \   ['/', '\\']
            \ ]

" Ctrl-[hl]: Move left/right by word
cnoremap <c-h> <s-left>
cnoremap <c-l> <s-right>

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//c<left><left><left>

nnoremap <f5> :RainbowParenthesesToggle<cr>

""""""""""""""""""""""
" Configure delimitMate
""""""""""""""""""""""
let delimitMate_expand_cr=1

""""""""""""""""""""""
" set nerdtree options
""""""""""""""""""""""
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.hg', '\.svn', '\.bzr']

"""""""""""""""
"  NerdSpace  "
"""""""""""""""
" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

""""""""""""""""
"  Yank Stack  "
""""""""""""""""
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
imap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
imap <leader>P <Plug>yankstack_substitute_newer_paste

"""""""""""""""
"  ShowMarks  "
"""""""""""""""
"let g:showmarks_enable = 1
"let g:showmarks_textlower = "\t"
"let g:showmarks_textupper = "\t"
"let g:showmarks_textother = "\t"
"let g:showmarks_ignoretype = "hqm" "help quickfix and non modifiable

"""""""""""""""
"  UltiSnips  "
"""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"""""""""""""""""""
"  Indent Guides  "
"""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""
"  beautify  "
""""""""""""""
"let g:config_Beautifier.js.indent_style = 'space'
"let g:config_Beautifier.js.indent_space = 4
"let g:config_Beautifier.js.keep_function_indentation=1
"let g:config_Beautifier.js.keep_array_indentation=1
"let g:config_Beautifier.js.brace_style = 'collapse'
"let g:config_Beautifier.js.space_before_conditional =1

""""""""""""""""""""""
" ctrl-p custom ignore paths
""""""""""""""""""""""
let g:ctrlp_custom_ignore = 'node_modules\|.idea\|.git\|workspace\|bower_components\'
" set ctrp options
let g:ctrlp_show_hidden = 1

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

" auto trim whitespace in these files
augroup my_auto_commands
    autocmd!
    " saving on lost focus
    autocmd FocusLost * :silent! wall
    autocmd FileType javascript,html,json,jade,vim,markdown autocmd FileWritePre,FileAppendPre,FilterWritePre,BufWritePre <buffer> call TrimWhiteSpace()

    " close sentence with comma or semi-colon
    autocmd FileType javascript,css,json nnoremap <buffer> <silent> <leader>; :call cosco#commaOrSemiColon()<cr>
    autocmd FileType javascript,css,json inoremap <buffer> <silent> <leader>; <ESC>:call cosco#commaOrSemiColon()<cr>a

    " beautify
    autocmd FileType javascript,json nnoremap <buffer> <leader>js :call JsBeautify()<cr>
    autocmd FileType html nnoremap <buffer> <leader>js :call HtmlBeautify()<cr>
    autocmd FileType css,less nnoremap <buffer> <leader>js :call CSSBeautify()<cr>

    " set filestypes
    autocmd BufRead,BufNewFile *.ajs setlocal filetype=javascript
    autocmd BufRead,BufNewFile *.jshintrc setlocal filetype=json

    " reload vimrc when saved
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
