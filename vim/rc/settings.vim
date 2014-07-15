function! s:create_dir(dir)
    let make_dir=expand(a:dir)
    if isdirectory(make_dir)
        return
    endif
    call mkdir(make_dir, 'p')
endfunction

function! s:SetGuiFont(font)
    if has('gui_running')
        exec "set gfn=" . a:font
    endif
endfunction

" match settings per computers I use
if g:config.env.windows
    call s:SetGuiFont('consolas:h11')
    simalt ~x "maximize window
    language message en
    set shellslash
elseif g:config.env.unix
    call s:SetGuiFont('Ubuntu\ Mono\ 12')
    language message C
elseif g:config.env.mac
    call s:SetGuiFont('Monaco:h13')
    language message C
    set antialias
endif

if has('viminfo')
    " set viminfo file location
    " need to make sure directory exists as well
    set viminfo+=n~/.cache/.viminfo
endif

if has('gui_running')
    set lines=400
    set columns=200
endif

if has('wildmenu')
    set wildmenu                       " Turn on the WiLd menu
    if exists('&wildignorecase')
        set wildignorecase             " ignore case in wildmenu
    endif
    set wildmode=longest,list,full     " like zsh
    set wildignore+=*.o,*.~,*.pyc
    set wildignore+=.git/*
    set wildignore+=.idea/*
    set wildignore+=bower_components/*
    set wildignore+=build/*
    set wildignore+=builds/*
    set wildignore+=node_modules/*
    set wildignore+=tmp/*
endif

if exists('&fileignorecase')
    set fileignorecase
endif

set fileformat=unix                             " Default fileformat
set fileformats=unix,dos,mac                    " Automatic recognition of a new line cord.
set viewoptions=folds,options,cursor,slash,unix
set autoread
set autowriteall                                " auto write when losing focus
set cryptmethod=blowfish
set scrolloff=3                                 " Set 7 lines to the cursor - when moving vertically using j/k
set noequalalways
set shortmess=aTI
set showbreak=>\
set suffixesadd+=.js                            " list of suffixes to add when using gf
set suffixesadd+=.json                          " list of suffixes to add when using gf
set ruler                                       " Always show current position
set cmdheight=1                                 " Height of the command bar
set showcmd                                     " show partial commands
set showmode                                    " show which mode i'm on
set nrformats-=octal                            " no octal numbers
set hidden                                      " A buffer becomes hidden when it is abandoned
set showfulltag
set backspace=eol,start,indent                  " configure backspace the expected way
set whichwrap+=<,>,~,h,l,[,],b,s                " which special chars wrap to next line
set ignorecase                                  " ignore case when searching
set smartcase                                   " be smart about searching
set infercase                                   " ignore case in autocomplete
set hlsearch                                    " highlight search
set incsearch                                   " increment search
set synmaxcol=400
set lazyredraw                                  " Don't redraw while executing macros (good performance config)
set notimeout
set t_Co=256                                    " 256bit terminal
set ttimeout
set ttimeoutlen=10
set ttyfast                                     " fast terminal redraw
set magic                                       " For regular expressions turn magic on
set showmatch                                   " Show matching brackets when text indicator is over them
set cpoptions-=m
set matchtime=3
set noerrorbells                                " No annoying sound on error
set novisualbell                                " no annoying flashes
set t_vb=                                       " disable visual bell
set tm=500
set number                                      " show line number
set relativenumber                              " line numbers are relative
set cursorline                                  " highlight where cursor is
set nowrap                                      " turn word wrapping on long lines off
set wrapscan                                    " Searches wrap around the end of file
set cpoptions+=$                                " when changing - mark block end with $
set virtualedit=block
set listchars=tab:>-,trail:~,nbsp:.,extends:>   " highlight problematic chars
set list                                        " show problematic chars
set report=10                                   " min number of lines changed to report change
set history=700                                 " Sets how many lines of history VIM has to remember
set nomodeline                                  " security issue
set splitright                                  " Always splits targetting right
set splitbelow                                  " Always split targetting below
set nostartofline                               " Don't reset cursor to start of line when moving around.
set helplang=en
set keywordprg=:help
set isfname-==                                " filenames do not contain =

if has('mouse')
    set mouse=a                               " enable mouse
    set mousemodel=extend
    set mousehide                             " hide mouse cursor while typing
    set nomousefocus                          " don't focus window when mouse pointer is moved
endif

if has('multi_byte')
    set encoding=utf-8                            " Set utf8 as standard encoding and en_US as the standard language
    scriptencoding utf-8
endif

if has('title')
    set title                                     " show filename in windows title
    set titlelen=95
endif

set expandtab                                 " Use spaces instead of tabs
set smarttab                                  " A tab in front of line insert blanks accord to shiftwidth
set nojoinspaces                              " don't add multiple spaces on line joins
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround                                " < and > round to nearest multiple of tabstop
set linebreak                                 " Linebreak on 500 characters
set textwidth=500                             " max width of text inserted
set noautoindent
set smartindent
set laststatus=2                              " Always show the status line

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup      " no backups of files
set nowritebackup
set noswapfile    " no swap files
set backupdir-=.

if has('folding')
    set foldmethod=indent " fold based on indent
    set foldnestmax=7     " deepest fold is 3 levels
    set foldlevelstart=0
    set nofoldenable      " dont fold by default
endif

if has('persistent_undo')
    call s:create_dir(g:config.undoDir)
    set undofile
    let &undodir=fnameescape(expand(g:config.undoDir))
endif

" TODO think about this. regex doesn't work
if executable('ag')
    " set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepprg=ag\ --line-numbers\ --skip-vcs-ignores\ --column\ --smart-case\ --follow\ --nocolor\ --nogroup
    set grepformat=%f:%l:%c:%m
endif

if has('spell')
    call s:create_dir(g:config.spellDir)
    set nospell
    let &spellfile=fnameescape(expand(g:config.spellFile))
    set spelllang=en_us
endif

set background=dark
" set color scheme and font
if has('syntax')
    filetype plugin indent on
    syntax enable
endif

function! s:setDefaultColor()
    color desert
endfunction

if exists('g:config.colorscheme')
    try
        exec 'colorscheme ' . g:config.colorscheme
    catch
        call s:setDefaultColor()
    endtry
else
    call s:setDefaultColor()
endif
