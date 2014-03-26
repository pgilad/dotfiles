function! s:create_dir(dir)
    let make_dir=expand(a:dir)
    if !isdirectory(make_dir)
        call mkdir(make_dir, 'p')
    endif
endfunction

" match settings per computers I use
if hostname() ==? "GILAD"
    set gfn=consolas:h11
    let b:home_dir = 'c:\repositories'
elseif b:config.env.unix
    let b:home_dir = "~/repos"
    set gfn=Ubuntu\ Mono\ 12
else
    set gfn=consolas:h9
    let b:home_dir = "~"
endif

if isdirectory(b:home_dir)
    exec 'cd ' . b:home_dir
endif

set lines=999
set columns=999

" maximize window if windows
if b:config.env.windows
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
let b:color = "badwolf"
" let b:color = "hybrid"
" let b:color = "molokai"
" let b:color = "vividchalk"
" let b:color = "Tomorrow-Night"

try
    exec "color " . b:color
catch
    echom 'Could not load color scheme ' . b:color
    color desert
endtry

if has("wildmenu")
    set wildmenu                                    " Turn on the WiLd menu
    set wildignorecase
    set wildmode=longest,list,full
    set wildignore+=*.o,*~,*.pyc
    set wildignore+=.git/*
    set wildignore+=.idea/*
    set wildignore+=bower_components/*
    set wildignore+=build/*
    set wildignore+=builds/*
    set wildignore+=node_modules/*
    set wildignore+=tmp/*
endif

if b:config.env.windows
    set shellslash
endif
set fileformat=unix                           " Default fileformat
set fileformats=unix,dos,mac                  " Automatic recognition of a new line cord.
set viewoptions=folds,options,cursor,slash,unix

set scrolloff=3                                 " Set 7 lines to the cursor - when moving vertically using j/k
set winfixwidth                                 " NERD width after toggles
set shortmess=aTI
set showbreak=>\
set suffixesadd+=.js                            " list of suffixes to add when using gf
set ruler                                       " Always show current position
set cmdheight=1                                 " Height of the command bar
set showcmd                                     " show partial commands
set showmode                                    " show which mode i'm on
set nrformats-=octal                            " no octal numbers
set hidden                                      " A buffer becomes hidden when it is abandoned
set showfulltag
set backspace=eol,start,indent                  " configure backspace the expected way
set whichwrap+=<,>,h,l,[,],b,s,~
set ignorecase                                  " ignore case when searching
set smartcase                                   " be smart about searching
set infercase                                   " ignore case in autocomplete
set nohlsearch                                  " highlight search
set incsearch                                   " increment search
set lazyredraw                                  " Don't redraw while executing macros (good performance config)
set matchtime=3
set synmaxcol=400
set notimeout
set ttimeout
set ttimeoutlen=10
set magic                                     " For regular expressions turn magic on
set showmatch                                 " Show matching brackets when text indicator is over them
set matchpairs+=<:>
set noerrorbells                              " No annoying sound on errors
set novisualbell                              " no annoying flashes"
set t_vb=                                     " disable visual bell
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
set autowrite                                 " auto write when losing focus

set encoding=utf-8                            " Set utf8 as standard encoding and en_US as the standard language
scriptencoding utf-8
set title                                     " show filename in windows title
set nostartofline                             " Don't reset cursor to start of line when moving around.

" share clipboard with os
if has('unnamedplus')
    set clipboard=unnamedplus " gui gvim unix/mac
else
    set clipboard=unnamed     " windows
endif

" Disable GetLatestVimPlugin.vim
if !&verbose
    let g:loaded_getscriptPlugin = 1
endif

" Disable netrw.vim
let g:loaded_netrwPlugin = 1
let g:loaded_matchparen = 0

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
    set undodir=~/.cache/undo/
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
set textwidth=500 " max width of text inserted
set noautoindent
set smartindent
set laststatus=2  " Always show the status line

if has('spell')
    call s:create_dir("~/vimfiles/spell/")
    set spelllang=en_us
    set spellfile=~/vimfiles/spell/en.utf-8.add
    set nospell
endif
