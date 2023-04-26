vim9script

if &compatible
    set nocompatible
endif

if &shell =~# 'fish$'
    set shell=sh
endif

g:vim_config = {
        spellDir: '~/.local/share/vimfiles/spell/',
        spellFile: '~/.local/share/vimfiles/spell/en.utf-8.add',
        undoDir: '~/.cache/vim/undo/',
        env: {
            windows: has('wind16') || has('win32') || has('win64'),
            mac: has('mac'),
            unix: has('unix') && !has('gui_macvim')
        }
}

# map leader keys
g:mapleader = ","
g:maplocalleader = ","

var dein_toml = '~/.dotfiles/vim/dein.toml'
var dein_toml_lazy = '~/.dotfiles/vim/deinlazy.toml'

g:dein#auto_recache = 0
g:dein#install_progress_type = 'title'
g:dein#enable_notification = 1
g:dein#install_log_filename = '~/.cache/vim/dein.log'
g:dein#install_progress_type = 'tabline'

var vim_cache_dir = expand('~/.cache')
if !isdirectory(vim_cache_dir)
    mkdir(vim_cache_dir, 'p')
endif

if &runtimepath !~# '/dein.vim'
    var dein_dir = fnamemodify('dein.vim', ':p')
    if !isdirectory(dein_dir)
        dein_dir = vim_cache_dir .. '/dein/repos/github.com/Shougo/dein.vim'
        if !isdirectory(dein_dir)
            execute '!git clone https://github.com/Shougo/dein.vim' dein_dir
        endif
    endif
endif

var dein_base = '~/.cache/dein/'
var dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' .. dein_src

if dein#load_state(dein_base)
    dein#begin(dein_base, [ expand('<sfile>'), dein_toml, dein_toml_lazy ])

    dein#add(dein_src)
    dein#load_toml(dein_toml, {'lazy': 0})
    dein#load_toml(dein_toml_lazy, {'lazy': 1})

    dein#end()
    dein#save_state()
endif

if !has('vim_starting') && dein#check_install()
    # Installation check.
    # dein#install()
endif

# Disable AutoComplPop.
g:acp_enableAtStartup = 0

# g:deoplete#enable_at_startup = 1

# deoplete#custom#option('smart_case', v:true)
# deoplete#custom#option('min_pattern_length', 3)
# deoplete#custom#option('max_candidates', 30)

var ctrlp_ignore = ['public', 'build', 'dist', 'node_modules', '.idea', '.git']
g:ctrlp_custom_ignore = join(ctrlp_ignore, '\|')

g:ctrlp_by_filename = 0
g:ctrlp_clear_cache_on_exit = 1 # speed up by not removing clearing cache every time
g:ctrlp_cmd = 'CtrlP'
g:ctrlp_follow_symlinks = 1
g:ctrlp_lazy_update = 0
g:ctrlp_max_depth = 50
g:ctrlp_max_files = 5000
g:ctrlp_max_height = 20         # maximum height of match window
g:ctrlp_max_history = 50
g:ctrlp_mruf_max = 50           # number of recently opened files
g:ctrlp_open_new_file = 'r'
g:ctrlp_root_markers = ['.git']
g:ctrlp_show_hidden = 1
g:ctrlp_switch_buffer = 'et'    # jump to a file if it's open already
g:ctrlp_working_path_mode = 'ra'
nnoremap <c-p> :CtrlP<cr>

if executable('git')
    g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
    g:ctrlp_use_caching = 0
endif

g:NERDTreeShowBookmarks = 1
g:NERDTreeShowHidden = 1
g:NERDTreeQuitOnOpen = 0
g:NERDTreeShowLineNumbers = 0
g:NERDTreeWinSize = 30
g:NERDTreeDirArrows = 1
g:NERDChristmasTree = 1
g:NERDTreeAutoDeleteBuffer = 1 # auto delete buffers on NERDTree delete
g:NERDTreeIgnore = ['\~$', '^\.\.$', '\.swp$', '\.hg$', '\.svn$', '\.bzr', '\.git$']
g:NERDSpaceDelims = 1
g:NERDCreateDefaultMappings = 1
g:NERDMenuMode = 0
g:NERDTreeBookmarksFile = expand('~/vimfiles/vim-bookmarks.txt')

g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'qf', 'vimshell', 'markdown']
g:indent_guides_auto_colors = 0
g:indent_guides_color_change_percent = 5
g:indent_guides_enable_on_vim_startup = 1
g:indent_guides_start_level = 1
g:indent_guides_guide_size = 0

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

g:jsx_ext_required = 0

g:used_javascript_libs = 'underscore,angularjs,jquery,backbone,react'

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gp :Git push<cr>

g:gitgutter_eager = 0
g:gitgutter_enabled = 1
g:gitgutter_escape_grep = 1
g:gitgutter_map_keys = 0
g:gitgutter_realtime = 0

vnoremap <leader>ld :Linediff<cr>
nnoremap <leader>ld :Linediff<cr>
nnoremap <leader>lr :LinediffReset<cr>

g:ale_linters = {'python': ['mypy', 'flake8', 'pydocstyle']}
g:ale_fixers = {'python': [ 'black', 'isort']}
g:ale_python_auto_pipenv = 1

g:pipenv_auto_activate = 0

g:airline_detect_modified = 1
g:airline_inactive_collapse = 1
g:airline_detect_paste = 1
g:airline#extensions#tabline#enabled  =  1
g:airline#extensions#tabline#left_sep = ' '
g:airline#extensions#tabline#left_alt_sep = '¦'
g:airline#extensions#tmuxline#enabled = 0
g:airline#extensions#branch#enabled = 1

g:lightline = {
    active: {
        left: [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
    },
    component_function: {
        gitbranch: 'FugitiveHead'
    }
}

# set to where my /mysnippets directory exists

set runtimepath+=~/.dotfiles/vim/
g:UltiSnipsExpandTrigger = "<tab>"
g:UltiSnipsListSnippets = "<c-tab>"
g:UltiSnipsJumpForwardTrigger = "<c-j>"
g:UltiSnipsJumpBackwardTrigger = "<c-k>"
g:UltiSnipsSnippetsDir = "~/.dotfiles/vim/mysnippets"
g:UltiSnipsSnippetDirectories = ['UltiSnips', 'mysnippets']

#"""""""""""""""""""""""""
#  Text Objects Plugins  "
#"""""""""""""""""""""""""
g:smartgf_create_default_mappings = 0
g:smartgf_enable_gems_search = 0
g:smartgf_auto_refresh_ctags = 0
g:smartgf_max_entries_per_page = 9
g:smartgf_divider_width = 5
g:smartgf_extensions = ['.js', '.coffee', '.json']

nmap gs <Plug>(smartgf-search)
vmap gs <Plug>(smartgf-search)
nmap gS <Plug>(smartgf-search-unfiltered)
vmap gS <Plug>(smartgf-search-unfiltered)

set guioptions=Mc

syntax off
filetype plugin indent off

augroup my_filetypes
    autocmd!
    autocmd BufNewFile,BufRead *.asm                 setlocal filetype=nasm
    autocmd BufNewFile,BufRead *.kml                 setlocal filetype=xml
    autocmd BufNewFile,BufRead *.m                   setlocal filetype=objc
    autocmd BufNewFile,BufRead *.md,*.markdown       setlocal filetype=markdown
    autocmd BufNewFile,BufRead *.samsa               setlocal filetype=jproperties
    autocmd BufNewFile,BufRead *.scala               setlocal filetype=scala
    autocmd BufNewFile,BufRead *.txt                 setlocal filetype=text
    autocmd BufNewFile,BufRead *.xdot                setlocal filetype=dot
    autocmd BufNewFile,BufRead *.jade                setlocal filetype=pug
    autocmd BufNewFile,BufRead riemann.config        setlocal filetype=clojure
    autocmd BufNewFile,BufRead .babelrc,.bowerrc,.eslintrc,.jscsrc,.jshintrc,.nycrc setlocal filetype=json
    autocmd BufNewFile,BufRead .tmux*.conf*,*.tmux   setlocal filetype=tmux
augroup END

augroup my_auto_commands
    autocmd!
    # prevent indentation in jade, coffeescript
    autocmd FileType coffee,jade setlocal noautoindent
    autocmd FileType html setlocal matchpairs+=<:>

    # autocomplete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType sshconfig setlocal omnifunc=syntaxcomplete#Complete

    # pretty format json using python
    autocmd FileType json nnoremap <buffer> <leader>pf :%!python -m json.tool<cr>

    # Turn on spell check for certain filetypes automatically
    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
    autocmd FileType gitcommit setlocal spell spelllang=en_us

    autocmd WinLeave * setlocal nocursorline
    autocmd WinEnter * setlocal cursorline
augroup END

def CreateDir(dir: string)
    var make_dir = fnamemodify(dir, ':h')
    if isdirectory(make_dir)
        return
    endif
    mkdir(make_dir, 'p')
enddef

def SetGuiFont(font: string)
    if has('gui_running')
        exec "set gfn=" .. font
    endif
enddef

# match settings per computers I use
if g:vim_config.env.windows
    SetGuiFont('consolas:h11')
    simalt ~x "maximize window
    language message en
    set shellslash
elseif g:vim_config.env.unix
    SetGuiFont('Ubuntu\ Mono\ 12')
    language message C
elseif g:vim_config.env.mac
    SetGuiFont('Monaco:h13')
    language message C
    set antialias
endif

if has('viminfo')
    # set viminfo file location
    # need to make sure directory exists as well
    set viminfo+=n~/.cache/.viminfo
endif

if has('gui_running')
    set lines=400
    set columns=200
endif

if has('wildmenu')
    set wildmenu                       # Turn on the Wild menu
    if exists('&wildignorecase')
        set wildignorecase             # ignore case in wildmenu
    endif
    set wildmode=longest,list,full     # like Zsh
    set wildignore+=*.o,*.~,*.pyc
    set wildignore+=.git/**
    set wildignore+=.idea/**
    set wildignore+=.vscode/**
    set wildignore+=bower_components/**
    set wildignore+=build/**
    set wildignore+=builds/**
    set wildignore+=node_modules/**
    set wildignore+=tmp/**
endif

if exists('&fileignorecase')
    set fileignorecase
endif

if &term =~ '256color'
    # disable Background Color Erase (BCE) so that color schemes
    # render properly when inside 256-color tmux and GNU screen.
    # see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

set more  # Alternatively - set nomore
set fileformat=unix                             # Default fileformat
set fileformats=unix,dos,mac                    # Automatic recognition of a new line cord.
set viewoptions=folds,options,cursor,slash,unix
set autoread                                    # auto read all on losing focus
set autowriteall                                # auto write when losing focus
set cryptmethod=blowfish
set scrolloff=3                                 # Set 7 lines to the cursor - when moving vertically using j/k
set noequalalways
set shortmess=aTI
set showbreak=>\
set suffixesadd+=.js                            # list of suffixes to add when using gf
set suffixesadd+=.json                          # list of suffixes to add when using gf
set ruler                                       # Always show current position
set cmdheight=1                                 # Height of the command bar
set showcmd                                     # show partial commands
set showmode                                    # show which mode I'm on
set nrformats-=octal                            # no octal numbers
set hidden                                      # A buffer becomes hidden when it is abandoned
set showfulltag
set backspace=eol,start,indent                  # configure backspace the expected way
set whichwrap+=<,>,~,h,l,[,],b,s                # which special chars wrap to next line
set ignorecase                                  # ignore case when searching
set smartcase                                   # be smart about searching
set infercase                                   # ignore case in autocomplete
set hlsearch                                    # highlight search
set incsearch                                   # increment search
set synmaxcol=400
set lazyredraw                                  # Don't redraw while executing macros (good performance config)
set notimeout
set t_Co=256                                    # 256bit terminal
set ttimeout
set ttimeoutlen=10
set ttyfast                                     # fast terminal redraw
set magic                                       # For regular expressions turn magic on

if has('diff')
    set diffopt+=iwhite
endif

set report=0
set cpoptions-=m
set showmatch                                   # Show matching brackets when text indicator is over them
set matchtime=3
set noerrorbells                                # No annoying sound on error
set novisualbell                                # no annoying flashes
set t_vb=                                       # disable visual bell
set tm=500
set number                                      # show line number
set norelativenumber                            # line numbers are relative
set nocursorline                                # don't highlight where cursor is
set nowrap                                      # turn word wrapping on long lines off
set wrapscan                                    # Searches wrap around the end of file
set cpoptions+=$                                # when changing - mark block end with $
set virtualedit=block
set listchars=tab:>-,trail:~,nbsp:.,extends:>   # highlight problematic chars
set list                                        # show problematic chars
set report=10                                   # min number of lines changed to report change
set history=700                                 # Sets how many lines of history VIM has to remember

# https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md#patches
if has('patch-8.1.1366')
    set modelines=5
    set nomodelineexpr
    set modeline
else
    set nomodeline
endif

set splitright                                  # Always splits targeting right
set splitbelow                                  # Always split targeting below
set nostartofline                               # Don't reset cursor to start of line when moving around.
set helplang=en
set keywordprg=:help
set isfname-==                                # filenames do not contain =

if has('mouse')
    set mouse=a                               # enable mouse
    set mousemodel=extend
    set mousehide                             # hide mouse cursor while typing
    set nomousefocus                          # don't focus window when mouse pointer is moved
endif

if has('multi_byte')
    set encoding=utf-8                            # Set utf8 as standard encoding and en_US as the standard language
    scriptencoding utf-8
endif

if has('title')
    set title                                     # show filename in windows title
    set titlelen=95
endif

set expandtab                                 # Use spaces instead of tabs
set smarttab                                  # A tab in front of line insert blanks accord to shiftwidth
set nojoinspaces                              # don't add multiple spaces on line joins
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround                                # < and > round to nearest multiple of tabstop
set linebreak                                 # Line break on 500 characters
set textwidth=500                             # max width of text inserted
set noautoindent
set smartindent
set laststatus=2                              # Always show the status line

if has('clipboard')
    set clipboard=unnamed
    if has('unnamedplus')
        set clipboard+=unnamedplus
    endif
endif

# Disable GetLatestVimPlugin.vim
if !&verbose
    g:loaded_getscriptPlugin = 1
endif

# Disable netrw.vim
g:loaded_netrwPlugin = 1
g:loaded_matchparen = 0

set nobackup      # no backups of files
set nowritebackup
set noswapfile    # no swap files
set backupdir-=.

if has('folding')
    set foldmethod=indent # fold based on indent
    set foldnestmax=7     # deepest fold is 3 levels
    set foldlevelstart=0
    set nofoldenable      # don't fold by default
endif

if has('persistent_undo')
    var filePath = fnameescape(expand(g:vim_config.undoDir))
    CreateDir(filePath)
    set undofile
    set undodir=filePath
endif

# TODO think about this. regex doesn't work
if executable('ag')
    set grepprg=ag\ --line-numbers\ --skip-vcs-ignores\ --column\ --smart-case\ --follow\ --nocolor\ --nogroup
    set grepformat=%f:%l:%c:%m
endif

if has('spell')
    var filePath = fnameescape(expand(g:vim_config.spellDir))
    CreateDir(filePath)
    set spell
    &spellfile = fnameescape(expand(g:vim_config.spellFile))
    set spelllang=en_us
endif

set background=dark

filetype plugin indent on
syntax enable

#"""""""""""""""""""""
#  F-# keys mapping  "
#"""""""""""""""""""""
nnoremap <F1> <nop>
# toggle paste
nnoremap <F6> :<c-u>set invpaste<cr>:set paste?<cr>
#"""""""""""""""""""""""""""
#  Regular keys unbinding  "
#"""""""""""""""""""""""""""
# clear search highlights
nnoremap gc :<c-u>nohlsearch<cr>
# switch between 0 and ^
noremap 0 ^
noremap ^ 0

# easy way to normal mode
inoremap jj <esc>
# better line navigation
nnoremap j gj
nnoremap k gk

# quit everything
# commented since it sometimes lead to unwanted exits
nnoremap Q <nop>

# change cursor position in insert mode
inoremap <c-h> <left>
inoremap <c-l> <right>

#expand window split by 25 columns
nnoremap <c-w><c-l> 25<c-w>>
#retract window split by 25 columns
nnoremap <c-w><c-h> 25<c-w><

# who ever uses ; for something?
# also don't map back since it breaks plugins according to steve losh
nnoremap ; :

# Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

#<leader>cd: Switch to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

# Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

nnoremap <silent>\w :execute 'grep! ' . expand('<cword>')<cr>:copen<cr>

#"""""""""""""""""""""""""
#  Command-line mapping  "
#"""""""""""""""""""""""""
# Ctrl-[hl]: Move left/right by word
cnoremap <c-h> <left>
cnoremap <c-j> <s-left>
cnoremap <c-k> <s-right>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-p> <up>
cnoremap <c-n> <down>

#""""""""""""""""""""""""
#  Leader keys mapping  "
#""""""""""""""""""""""""
#""""""""""""""
#  <leader>r  "
#""""""""""""""
nnoremap <silent> <leader>ts i=strftime('%c')<cr>

# show list
nnoremap <silent> <leader>ls :set list!<cr>

#<leader>w: Close current buffer
nnoremap <leader>wc :bd<cr>

#<leader>p: Copy the full path of the current file to the clipboard
nnoremap <silent> <leader>cp :let @+=expand("%:p")<cr>:echo "Copied current file
            \ path '".expand("%:p")."' to clipboard"<cr>

nnoremap <silent> <leader>cu :let @+=expand("%:t:r")<cr>:echo "Copied current file
            \ name '".expand("%:t:r")."' to clipboard"<cr>
#""""""""""""""
#  <leader>n  "
#""""""""""""""
# Open current dir
nnoremap <leader>nc :NERDTreeCWD<cr>
# open nerd tree window
nnoremap <leader>n<tab> :NERDTreeToggle<cr>
# find current file in nerdtree
nnoremap <leader>nf :NERDTreeFind<cr>
#""""""""""""""
#  <leader>e  "
#""""""""""""""
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>eu :DeinUpdate<cr>
execute "nnoremap <silent> <leader>df :edit " .. dein_toml .. "<cr>"
execute "nnoremap <silent> <leader>dl :edit " .. dein_toml_lazy .. "<cr>"

# edit current filetype custom snippets
nnoremap <silent> <leader>us :UltiSnipsEdit<cr>

# execute current line as command
nnoremap <leader>ex :<c-u>execute getline(".")<cr>
vnoremap <leader>ex :<c-u>execute getreg("*")<cr>

#clear all double+ empty lines
nnoremap <leader>ec :g/^\n$/d<cr>

#""""""""""""""
#  <leader>s  "
#""""""""""""""
# Switch commands.
nnoremap <silent> <leader>sw :Switch<cr>
nmap <leader>so vii:sort i<cr>

set secure
