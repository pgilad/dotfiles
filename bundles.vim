"set file type detection off
filetype on
filetype off
" Switch from Vundle -> NeoBundle
" set runtimepath+=~/vimfiles/bundle/vundle/
" call vundle#rc('$HOME/vimfiles/bundle/')
set runtimepath+=~/vimfiles/bundle/neobundle.vim/

call neobundle#rc(expand('~/vimfiles/bundle/'))

"My Bundles
"NeoBundle 'gmarik/vundle'
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
"Awesome plugin for file/path/buffer search with ctrl-p
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
"Add indent guides
NeoBundle 'nathanaelkane/vim-indent-guides'
" Show marks on side to quick jump
"NeoBundle 'vim-scripts/ShowMarks'
"javascript support
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'groenewege/vim-less'
NeoBundle 'elzr/vim-json'
NeoBundle 'moll/vim-node'
NeoBundle 'skammer/vim-css-color'
"Git support
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish.git'
NeoBundle 'tpope/vim-repeat'
"incorporate buffer drawer
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'godlygeek/tabular'
" NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'terryma/vim-multiple-cursors'
"vim jade support
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'itspriddle/vim-jquery.git'
NeoBundle 'heavenshell/vim-jsdoc'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'jtratner/vim-flavored-markdown.git'
"Add vim airline
NeoBundle 'bling/vim-airline'
NeoBundle 'AndrewRadev/switch.vim'
" Snippets
NeoBundle 'SirVer/ultisnips'
"manipulate function arguments using , as text object
NeoBundle 'PeterRincker/vim-argumentative'
"auto add closing tag
NeoBundle 'Raimondi/delimitMate'

""""""""""""""""""
"  lint & style  "
""""""""""""""""""
NeoBundle 'maksimr/vim-jsbeautify'
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
NeoBundle 'tomasr/molokai'
" NeoBundle 'tpope/vim-vividchalk'
"
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
