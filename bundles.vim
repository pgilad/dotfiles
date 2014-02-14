"set file type detection off
filetype on
filetype off
" Switch from Vundle -> NeoBundle
" set runtimepath+=~/vimfiles/bundle/vundle/
" call vundle#rc('$HOME/vimfiles/bundle/')
set runtimepath+=~/vimfiles/bundle/neobundle.vim/
call neobundle#rc(expand('~/vimfiles/bundle/'))

"My Bundles
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
"Awesome plugin for file/path/buffer search with ctrl-p
NeoBundle 'kien/ctrlp.vim'
NeoBundleLazy 'scrooloose/nerdtree', {'autoload':{'commands':['NERDTreeToggle','NERDTreeFind']}}
NeoBundle 'scrooloose/nerdcommenter'
"Add indent guides
NeoBundle 'nathanaelkane/vim-indent-guides'
" Show marks on side to quick jump
"NeoBundle 'vim-scripts/ShowMarks'
"javascript support
""""""""""""""""""""""""
"  File Types Plugins  "
""""""""""""""""""""""""
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}

NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less']}}
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
NeoBundleLazy 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}
NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
NeoBundle 'elzr/vim-json'
" NeoBundleLazy 'mmalecki/vim-node.js', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'moll/vim-node'
NeoBundle 'itspriddle/vim-jquery.git'
NeoBundle 'heavenshell/vim-jsdoc'
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee','ls','typescript']}}
NeoBundleLazy 'tpope/vim-markdown', {'autoload':{'filetypes':['markdown']}}
NeoBundle 'jtratner/vim-flavored-markdown.git'
NeoBundle 'waylan/vim-markdown-extra-preview'

""""""""""""
"  others  "
""""""""""""
"Git support
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish.git'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'thinca/vim-visualstar'
"incorporate buffer drawer
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundleLazy 'godlygeek/tabular', {'autoload':{'commands':'Tabularize'}}
" NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'terryma/vim-multiple-cursors'

"""""""""""""""
"  Searching  "
"""""""""""""""
if executable('ag')
    NeoBundle 'ervandew/ag'    "good for regex escaping
    " NeoBundle 'rking/ag.vim' "great for quickfix mappings
    let g:ackprg = "ag --nogroup --column --smart-case --follow"
endif

NeoBundleLazy 'EasyGrep', {'autoload':{'commands':'GrepOptions'}} "{{{
let g:EasyGrepRecursive=1
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepCommand=1
nnoremap <leader>vo :GrepOptions<cr>

"vim jade support
"Add vim airline
NeoBundle 'bling/vim-airline'
NeoBundle 'AndrewRadev/switch.vim'
" Snippets
NeoBundle 'SirVer/ultisnips'

""""""""""""""""""
"  Text Objects  "
""""""""""""""""""
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-line' " al, il
NeoBundle 'kana/vim-textobj-indent' " ai, ii, aI, iI
NeoBundle 'kana/vim-textobj-entire' " ae, ie
NeoBundle 'PeterRincker/vim-argumentative' " a, i,
"auto add closing tag
NeoBundle 'Raimondi/delimitMate'

""""""""""""""""""
"  lint & style  "
""""""""""""""""""
NeoBundle 'einars/js-beautify'
"syntax linting
NeoBundle 'scrooloose/syntastic'
"Comma and semi-colon
NeoBundle 'lfilho/cosco.vim'
""""""""""""""""""
"  colorschemes  "
""""""""""""""""""
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Lokaltog/vim-distinguished'
NeoBundle 'vim-scripts/wombat256.vim'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'sjl/badwolf'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-vividchalk'
"
NeoBundleCheck
