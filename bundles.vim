"set file type detection off
filetype on
filetype off
set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc('$HOME/vimfiles/bundle/')

"My Bundles
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'FuzzyFinder'
"Awesome plugin for file/path/buffer search with ctrl-p
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
"Add indent guides
Bundle 'nathanaelkane/vim-indent-guides'
" Show marks on side to quick jump
"Bundle 'vim-scripts/ShowMarks'
""""""""""""""""
"  filestypes  "
""""""""""""""""
"javascript support
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'groenewege/vim-less'
Bundle 'elzr/vim-json'
Bundle 'moll/vim-node'
Bundle 'skammer/vim-css-color'
"Git support
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish.git'
Bundle 'tpope/vim-repeat'
"incorporate buffer drawer
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'sjl/gundo.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'godlygeek/tabular'
Bundle 'terryma/vim-multiple-cursors'
"vim jade support
Bundle 'digitaltoad/vim-jade'
Bundle 'itspriddle/vim-jquery.git'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jtratner/vim-flavored-markdown.git'
"Add vim airline
Bundle 'bling/vim-airline'
Bundle 'AndrewRadev/switch.vim'
" Snippets
Bundle 'SirVer/ultisnips'
"manipulate function arguments using , as text object
Bundle 'PeterRincker/vim-argumentative'
"auto add closing tag
Bundle 'Raimondi/delimitMate'

""""""""""""""""""
"  lint & style  "
""""""""""""""""""
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
"syntax linting
Bundle 'scrooloose/syntastic'
"Comma and semi-colon
Bundle 'lfilho/cosco.vim'
""""""""""""""""""
"  colorschemes  "
""""""""""""""""""
Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'tomasr/molokai'
" Bundle 'tpope/vim-vividchalk'
