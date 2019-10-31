"@author Gilad Peleg
"@license MIT 2014
"@website https://github.com/pgilad/dotfiles

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif
" Note: Vim is old
set nocompatible

if &shell =~# 'fish$'
    set shell=sh
endif

if has('python3') && !has('patch-8.1.201')
  " Hack for https://github.com/vim/vim/issues/3117#issuecomment-402622616
  silent! python3 1
endif

let g:config =  {
            \ 'bundlesPath': '~/.local/share/vimfiles/bundle/',
            \ 'spellDir' : '~/.local/share/vimfiles/spell/',
            \ 'spellFile' : '~/.local/share/vimfiles/spell/en.utf-8.add',
            \ 'undoDir' : '~/.cache/vim/undo/',
            \ 'env' : {
            \   'windows': has('wind16') || has('win32') || has('win64'),
            \   'cygwin': has('win32unix'),
            \   'mac': has('mac'),
            \   'unix': has('unix') && !has('gui_macvim')
            \ }
            \}

" map leader keys
let g:mapleader = ","
let g:maplocalleader = ","

let s:neobundle_git_path='!git clone --quiet %s://github.com/Shougo/neobundle.vim.git'

if has('vim_starting')
    " add NeoBundle to rtp
    execute 'set rtp ^='. fnameescape(g:config.bundlesPath . 'neobundle.vim/')
    " install NeoBundle if doesn't exist and we have git. TODO - create curl alternative
    if !isdirectory(expand(g:config.bundlesPath . 'neobundle.vim')) && executable('git')
        execute printf(s:neobundle_git_path,
                    \ (exists('$http_proxy') ? 'https' : 'git'))
                    \ g:config.bundlesPath . 'neobundle.vim'
    endif
endif

call neobundle#begin(expand(g:config.bundlesPath))

" Let NeoBundle handle bundles
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \  'windows' : 'make -f make_mingw32.mak',
            \  'cygwin' : 'make -f make_cygwin.mak',
            \  'mac' : 'make -f make_mac.mak',
            \  'unix' : 'make -f make_unix.mak',
            \  },
            \ }
NeoBundle 'L9'
NeoBundle 'editorconfig/editorconfig-vim'

if has('lua') && v:version >= 703
    NeoBundle 'Shougo/neocomplete'
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    " Set auto completion length.
    let g:neocomplete#auto_completion_start_length = 2
    " Set manual completion length.
    let g:neocomplete#manual_completion_start_length = 0
    " Set minimum keyword length.
    let g:neocomplete#min_keyword_length = 3
    let g:neocomplete#enable_auto_delimiter = 1
    let g:neocomplete#max_list = 30
endif

NeoBundle 'kien/ctrlp.vim'

let ctrlp_ignore = ['public', 'build', 'dist', 'node_modules', '.idea', '.git']
let g:ctrlp_custom_ignore = join(ctrlp_ignore, '\|')

let g:ctrlp_by_filename = 0
let g:ctrlp_clear_cache_on_exit = 1 " speed up by not removing clearing cache every time
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_lazy_update = 0
let g:ctrlp_max_depth = 50
let g:ctrlp_max_files = 5000
let g:ctrlp_max_height = 20         " maximum height of match window
let g:ctrlp_max_history = 50
let g:ctrlp_mruf_max = 50           " number of recently opened files
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 'et'    " jump to a file if it's open already
let g:ctrlp_working_path_mode = 'ra'
nnoremap <c-p> :CtrlP<cr>

if executable('git')
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
    let g:ctrlp_use_caching = 0
endif

NeoBundle 'evanmiller/nginx-vim-syntax'
NeoBundleLazy 'Glench/Vim-Jinja2-Syntax', {
\   'on_ft': ['jinja2', 'j2', 'jinja']
\ }

NeoBundleLazy 'scrooloose/nerdtree', {
            \  'on_path' : '.*',
            \  'on_cmd': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind',
            \  'NERDTreeClose', 'NERDTreeCWD', 'NERDTreeFromBookmark', 'NERDTreeMirror']
            \ }

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=0
let NERDTreeWinSize=30
let NERDTreeDirArrows=1
let NERDChristmasTree=1
let NERDTreeAutoDeleteBuffer=1 "auto delete buffers on NERDTree delete
let NERDTreeIgnore=['\~$', '^\.\.$', '\.swp$', '\.hg$', '\.svn$', '\.bzr', '\.git$']
let NERDSpaceDelims=1
let NERDCreateDefaultMappings = 1
let NERDMenuMode=0
let NERDTreeBookmarksFile=expand('~/vimfiles/vim-bookmarks.txt')

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'nathanaelkane/vim-indent-guides'

let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'qf', 'vimshell', 'markdown']
let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 5
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 0

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

NeoBundleLazy 'dag/vim-fish', { 'on_ft': ['fish'] }
NeoBundleLazy 'cespare/vim-toml', { 'on_ft': ['toml'] }
NeoBundleLazy 'StanAngeloff/php.vim', { 'on_ft': ['php'] }
NeoBundleLazy 'Shougo/junkfile.vim', {
            \  'on_cmd': 'JunkfileOpen',
            \ }
NeoBundleLazy 'kchmck/vim-coffee-script', { 'on_ft' : ['coffee'] }
NeoBundleLazy 'ap/vim-css-color', { 'on_ft':['css','scss','sass','less','styl'] }
NeoBundleLazy 'hail2u/vim-css3-syntax', { 'on_ft':['css', 'less'] }
NeoBundleLazy 'ingydotnet/yaml-vim', { 'on_ft': ['yml', 'yaml'] }

NeoBundleLazy 'cakebaker/scss-syntax.vim', { 'on_ft': ['sass', 'scss'] }
NeoBundleLazy 'wavded/vim-stylus', { 'on_ft': ['stylus'] }
NeoBundleLazy 'groenewege/vim-less', { 'on_ft': ['less', 'css'] }
NeoBundleLazy 'csscomb/vim-csscomb', { 'on_ft': ['css', 'less', 'sass'] }
NeoBundleLazy 'othree/html5.vim', { 'on_ft': ['html'] }
NeoBundleLazy 'hokaccha/vim-html5validator', { 'on_ft' : ['html'] }
NeoBundleLazy 'digitaltoad/vim-pug', { 'on_ft': ['jade', 'pug'] }
NeoBundleLazy 'gregsexton/MatchTag', { 'on_ft': ['html','xml'] }
NeoBundleLazy 'othree/xml.vim', { 'on_ft': ['xml'] }
NeoBundleLazy 'samuelsimoes/vim-jsx-utils', { 'on_ft': ['javascript'] }
NeoBundleLazy 'othree/yajs.vim', { 'on_ft': ['javascript'] }
NeoBundleLazy 'pangloss/vim-javascript', { 'on_ft': ['javascript'] }
NeoBundleLazy 'fatih/vim-go', { 'on_ft': ['go'] }

NeoBundleLazy 'mxw/vim-jsx', { 'on_ft': ['javascript'] }
let g:jsx_ext_required = 0

NeoBundle 'moll/vim-node'
NeoBundle 'bfontaine/Brewfile.vim'

NeoBundleLazy 'itspriddle/vim-jquery.git', {'on_ft': ['javascript']}
NeoBundleLazy 'heavenshell/vim-jsdoc', {'on_ft': ['javascript']}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {
            \   'on_ft': ['javascript','coffee']
            \ }
let g:used_javascript_libs = 'underscore,angularjs,jquery,backbone,react'

NeoBundle 'vim-scripts/logstash.vim'

NeoBundleLazy 'beautify-web/js-beautify', {
            \   'on_ft' : ['html', 'css', 'js']
            \ }
nnoremap <leader>fj :!js-beautify % -r -X<cr>

NeoBundleLazy 'maksimr/vim-jsbeautify', {
            \ 'on_ft':['javascript', 'json', 'html', 'js', 'jsx', 'css'],
            \ 'depends': ['beautify-web/js-beautify', 'editorconfig-vim']
            \ }
NeoBundleLazy 'wting/rust.vim', {
            \ 'on_ft': ['rust']
            \ }
NeoBundleLazy 'elzr/vim-json', {'on_ft': ['json']}
NeoBundle 'evidens/vim-twig'
NeoBundleLazy 'leafgarland/typescript-vim', {
            \   'on_ft': ['typescript']
            \ }
NeoBundleLazy 'tpope/vim-markdown', {'on_ft':['markdown']}
NeoBundleLazy 'waylan/vim-markdown-extra-preview', {'on_ft':['markdown']}
NeoBundleLazy 'jtratner/vim-flavored-markdown.git', {'on_ft':['markdown']}
NeoBundleLazy 'kannokanno/previm', {
            \ 'depends' : ['open-browser.vim'],
            \ 'on_ft' : ['markdown']
            \ }
NeoBundle 'tpope/vim-unimpaired'

NeoBundle 'tpope/vim-fugitive', {
            \ 'augroup' : 'fugitive'
            \ }

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gp :Git push<cr>

NeoBundleLazy 'vim-ruby/vim-ruby', {
            \ 'on_map' : '<Plug>',
            \ 'on_ft' : 'ruby'
            \ }

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'unblevable/quick-scope'

let g:gitgutter_eager = 0
let g:gitgutter_enabled = 1
let g:gitgutter_escape_grep = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 0

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'thinca/vim-visualstar'

NeoBundleLazy 'tyru/open-browser.vim', {
            \   'on_cmd' : ['OpenBrowserSearch', 'OpenBrowser'],
            \   'on_func' : 'openbrowser#open',
            \   'on_map': '<Plug>(openbrowser-'
            \ }

NeoBundleLazy 'AndrewRadev/inline_edit.vim', {
            \   'on_cmd': ['InlineEdit']
            \ }

nnoremap <leader>ie :InlineEdit<cr>
xnoremap <leader>ie :InlineEdit<cr>
inoremap <leader>ie <esc>:InlineEdit<cr>a

NeoBundleLazy 'AndrewRadev/linediff.vim', {
            \   'on_cmd': ['Linediff', 'LinediffReset']
            \ }

vnoremap <leader>ld :Linediff<cr>
nnoremap <leader>ld :Linediff<cr>
nnoremap <leader>lr :LinediffReset<cr>

NeoBundle 'w0rp/ale'

let g:ale_linters = {'python': ['mypy', 'flake8']}
let g:ale_fixers = {'python': [ 'black', 'isort']}
let g:ale_python_auto_pipenv = 1

NeoBundle 'plytophogy/vim-virtualenv'
NeoBundle 'PieterjanMontens/vim-pipenv'
let g:pipenv_auto_activate = 0

NeoBundle 'bling/vim-airline'

let g:airline_detect_modified=1
let g:airline_inactive_collapse=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='¦'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#branch#enabled = 1

NeoBundleLazy 'AndrewRadev/switch.vim', {
            \   'on_cmd': ['Switch']
            \ }

let g:switch_mapping = ""
let g:switch_custom_definitions =
            \ [
            \   ['/', '\\'],
            \   {
            \       '\v(\w+)\.(\w+)' : '\1[''\2'']',
            \       '\v(\w+)\[[''"](\w+)[''"]\]' : '\1.\2'
            \   }
            \ ]

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'fuadsaud/vim-react-snippets'
NeoBundle 'pgilad/vim-react-proptypes-snippets'

"set to where my /mysnippets directory exists
set runtimepath+=~/.dotfiles/vim/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.dotfiles/vim/mysnippets"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']

""""""""""""""""""""""""""
"  Text Objects Plugins  "
""""""""""""""""""""""""""
NeoBundle 'kana/vim-textobj-user'
" al aL
NeoBundle 'kana/vim-textobj-line', { 'depends': 'kana/vim-textobj-user' }
" ai, ii, aI, iI
NeoBundle 'kana/vim-textobj-indent', { 'depends': 'kana/vim-textobj-user' }
" ae, ie
NeoBundle 'kana/vim-textobj-entire', { 'depends': 'kana/vim-textobj-user' }
" a, i,
NeoBundle 'PeterRincker/vim-argumentative'

NeoBundle 'junegunn/vim-pseudocl'
NeoBundle 'junegunn/vim-oblique', {
            \ 'depends' : 'junegunn/vim-pseudocl',
            \ }
NeoBundleLazy 'gorkunov/smartgf.vim', {
            \ 'on_map': '<Plug>(smartgf-search',
            \ 'disabled': !executable('ag')
            \ }

let g:smartgf_create_default_mappings = 0
let g:smartgf_enable_gems_search = 0
let g:smartgf_auto_refresh_ctags = 0
let g:smartgf_max_entries_per_page = 9
let g:smartgf_divider_width = 5
let g:smartgf_extensions = ['.js', '.coffee', '.json']

nmap gs <Plug>(smartgf-search)
vmap gs <Plug>(smartgf-search)
nmap gS <Plug>(smartgf-search-unfiltered)
vmap gS <Plug>(smartgf-search-unfiltered)

NeoBundle 'nanotech/jellybeans.vim'
let g:config.colorscheme = "jellybeans"

call neobundle#end()

if !has('vim_starting')
    " Installation check.
    NeoBundleCheck
endif

set guioptions=Mc
" set guioptions+=a " visual select auto-copy to clipboard

if has('syntax')
    syntax off
    filetype plugin indent off
endif

augroup my_filetypes
    autocmd!
    autocmd BufNewFile,BufRead *.ajs,*.es6,*.es      setlocal filetype=javascript
    autocmd BufNewFile,BufRead *.as                  setlocal filetype=actionscript
    autocmd BufNewFile,BufRead *.asm                 setlocal filetype=nasm
    autocmd BufNewFile,BufRead *.kml                 setlocal filetype=xml
    autocmd BufNewFile,BufRead *.m                   setlocal filetype=objc
    autocmd BufNewFile,BufRead *.md,*.markdown       setlocal filetype=markdown
    autocmd BufNewFile,BufRead *.rs                  setlocal filetype=rust
    autocmd BufNewFile,BufRead *.samsa               setlocal filetype=jproperties
    autocmd BufNewFile,BufRead *.scala               setlocal filetype=scala
    autocmd BufNewFile,BufRead *.ts                  setlocal filetype=typescript
    autocmd BufNewFile,BufRead *.txt                 setlocal filetype=text
    autocmd BufNewFile,BufRead *.xdot                setlocal filetype=dot
    autocmd BufNewFile,BufRead *.jade                setlocal filetype=pug
    autocmd BufNewFile,BufRead .babelrc,.bowerrc,.eslintrc,.jscsrc,.jshintrc,.nycrc setlocal filetype=json
    autocmd BufNewFile,BufRead .tmux*.conf*,*.tmux   setlocal filetype=tmux
augroup END

augroup my_auto_commands
    autocmd!
    " prevent indentation in jade, coffeescript
    autocmd FileType coffee,jade setlocal noautoindent
    autocmd FileType html setlocal matchpairs+=<:>

    " autocomplete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=syntaxcomplete#Complete

    autocmd FileType css,html,jsx,json nnoremap <silent> <buffer> <leader>js :<c-u>call Beautify()<cr>
    autocmd FileType javascript nnoremap <silent> <buffer> <leader>js :<c-u>call JsBeautify()<cr>
    autocmd FileType css,html,jsx,json vnoremap <silent> <buffer> <leader>js :call BeautifyRange()<cr>
    autocmd FileType javascript vnoremap <silent> <buffer> <leader>js :call RangeJsBeautify()<cr>

    "pretty format json using python
    autocmd FileType json nnoremap <buffer> <leader>pf :%!python -m json.tool<cr>

    " Turn on spell check for certain filetypes automatically
    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
    autocmd FileType gitcommit setlocal spell spelllang=en_us

    autocmd WinLeave * setlocal nocursorline
    autocmd WinEnter * setlocal cursorline
augroup END

function! s:create_dir(dir)
    let make_dir=fnamemodify(a:dir, ':h')
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
    set wildmenu                       " Turn on the Wild menu
    if exists('&wildignorecase')
        set wildignorecase             " ignore case in wildmenu
    endif
    set wildmode=longest,list,full     " like Zsh
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
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

let &more=0
set fileformat=unix                             " Default fileformat
set fileformats=unix,dos,mac                    " Automatic recognition of a new line cord.
set viewoptions=folds,options,cursor,slash,unix
set autoread                                    " auto read all on losing focus
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
set showmode                                    " show which mode I'm on
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

if has('diff')
    set diffopt+=iwhite
endif

set report=0
set cpoptions-=m
set showmatch                                   " Show matching brackets when text indicator is over them
set matchtime=3
set noerrorbells                                " No annoying sound on error
set novisualbell                                " no annoying flashes
set t_vb=                                       " disable visual bell
set tm=500
set number                                      " show line number
set norelativenumber                            " line numbers are relative
set nocursorline                                " don't highlight where cursor is
set nowrap                                      " turn word wrapping on long lines off
set wrapscan                                    " Searches wrap around the end of file
set cpoptions+=$                                " when changing - mark block end with $
set virtualedit=block
set listchars=tab:>-,trail:~,nbsp:.,extends:>   " highlight problematic chars
set list                                        " show problematic chars
set report=10                                   " min number of lines changed to report change
set history=700                                 " Sets how many lines of history VIM has to remember

" https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md#patches
if has('patch-8.1.1366')
    set modelines=5
    set nomodelineexpr
    set modeline
else
    set nomodeline
endif

set splitright                                  " Always splits targeting right
set splitbelow                                  " Always split targeting below
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
set linebreak                                 " Line break on 500 characters
set textwidth=500                             " max width of text inserted
set noautoindent
set smartindent
set laststatus=2                              " Always show the status line

if has('clipboard')
    set clipboard=unnamed
    if has('unnamedplus')
        set clipboard+=unnamedplus
    endif
endif

" Disable GetLatestVimPlugin.vim
if !&verbose
    let g:loaded_getscriptPlugin = 1
endif

" Disable netrw.vim
let g:loaded_netrwPlugin = 1
let g:loaded_matchparen = 0

set nobackup      " no backups of files
set nowritebackup
set noswapfile    " no swap files
set backupdir-=.

if has('folding')
    set foldmethod=indent " fold based on indent
    set foldnestmax=7     " deepest fold is 3 levels
    set foldlevelstart=0
    set nofoldenable      " don't fold by default
endif

if has('persistent_undo')
    let filePath=fnameescape(expand(g:config.undoDir))
    call s:create_dir(filePath)
    set undofile
    let &undodir=filePath
endif

" TODO think about this. regex doesn't work
if executable('ag')
    set grepprg=ag\ --line-numbers\ --skip-vcs-ignores\ --column\ --smart-case\ --follow\ --nocolor\ --nogroup
    set grepformat=%f:%l:%c:%m
endif

if has('spell')
    let filePath=fnameescape(expand(g:config.spellDir))
    call s:create_dir(filePath)
    set spell
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

""""""""""""""""""""""
"  F-# keys mapping  "
""""""""""""""""""""""
nnoremap <F1> <nop>
" toggle paste
nnoremap <F6> :<c-u>set invpaste<cr>:set paste?<cr>
" format from 2 spaces to 4 spaces
nnoremap <F7> :<c-u>set ts=2 sts=2 noexpandtab<cr>:retab!<cr>:set ts=4 sts=4 expandtab<cr>:retab<cr>
""""""""""""""""""""""""""""
"  Regular keys unbinding  "
""""""""""""""""""""""""""""
" clear search highlights
nnoremap gc :<c-u>nohlsearch<cr>
" switch between 0 and ^
noremap 0 ^
noremap ^ 0

" easy way to normal mode
inoremap jj <esc>
" better line navigation
nnoremap j gj
nnoremap k gk

" quit everything
" commented since it sometimes lead to unwanted exits
nnoremap Q <nop>

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

nnoremap <silent>\w :execute 'grep! ' . expand('<cword>')<cr>:copen<cr>

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
nnoremap <silent> <leader>ts i=strftime('%c')<cr>

" show list
nnoremap <silent> <leader>ls :set list!<cr>

"<leader>w: Close current buffer
nnoremap <leader>wc :bd<cr>

"<leader>p: Copy the full path of the current file to the clipboard
nnoremap <silent> <leader>cp :let @+=expand("%:p")<cr>:echo "Copied current file
            \ path '".expand("%:p")."' to clipboard"<cr>

nnoremap <silent> <leader>cu :let @+=expand("%:t:r")<cr>:echo "Copied current file
            \ name '".expand("%:t:r")."' to clipboard"<cr>
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
" edit _vimrc
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
" source myvimrc
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

" edit current filetype custom snippets
nnoremap <silent> <leader>us :UltiSnipsEdit<cr>
" update bundles
nnoremap <silent> <leader>eu :NeoBundleUpdate<cr>
nnoremap <silent> <leader>el :NeoBundleUpdatesLog<cr>

" execute current line as command
nnoremap <leader>ex :<c-u>execute getline(".")<cr>
vnoremap <leader>ex :<c-u>execute getreg("*")<cr>
"clear all double+ empty lines
nnoremap <leader>ec :g/^\n$/d<cr>

"""""""""""""""
"  <leader>s  "
"""""""""""""""
" Switch commands.
nnoremap <silent> <leader>sw :Switch<cr>
nmap <leader>so vii:sort i<cr>
"""""""""""""""
"  <leader>o  "
"""""""""""""""
" simply open search in browser
nmap <leader>oo <Plug>(openbrowser-open)
nmap <leader>os <Plug>(openbrowser-smart-search)
vmap <leader>os <Plug>(openbrowser-smart-search)

"""""""""""""""
"  <leader>m  "
"""""""""""""""
"markdown preview
nnoremap <leader>mp :Me<cr>
" break chaining on .then
nnoremap <leader>m<cr> /\%<c-r>=line('.')<cr>l\.then:nohlsearch<cr>i l

set secure
