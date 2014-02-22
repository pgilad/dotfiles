"set file type detection off
filetype on
filetype off
set runtimepath+=~/vimfiles/bundle/neobundle.vim/
call neobundle#rc(expand('~/vimfiles/bundle/'))

"My Bundles
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'

""""""""""""""""""""""
" ctrl-p custom ignore paths
""""""""""""""""""""""
"Awesome plugin for file/path/buffer search with ctrl-p
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'build\|node_modules\|.idea\|.git\|workspace\|bower_components\'
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_max_height = 20 " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et' " jump to a file if it's open already
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=20000
let g:ctrlp_clear_cache_on_exit=0 " speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250 " number of recently opened files
let g:ctrlp_show_hidden = 1

""""""""""""""
"  Nerdtree  "
""""""""""""""
NeoBundleLazy 'scrooloose/nerdtree', {'autoload':{'commands':['NERDTreeToggle','NERDTreeFind']}}
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=0
let NERDTreeWinSize=30
let NERDTreeIgnore=['\~$', '^\.\.$', '\.swp$', '\.hg$', '\.svn$', '\.bzr', '\.git$']

NeoBundle 'scrooloose/nerdcommenter'
" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

"""""""""""""""""""
"  Indent Guides  "
"""""""""""""""""""
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

"""""""""""""""
"  ShowMarks  "
"""""""""""""""
"NeoBundle 'vim-scripts/ShowMarks'
"let g:showmarks_enable = 1
"let g:showmarks_textlower = "\t"
"let g:showmarks_textupper = "\t"
"let g:showmarks_textother = "\t"
"let g:showmarks_ignoretype = "hqm" "help quickfix and non modifiable

"javascript support
""""""""""""""""""""""""
"  File Types Plugins  "
""""""""""""""""""""""""
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}

NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less', 'css']}}
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css', 'less', 'scss','sass']}}
NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
NeoBundleLazy 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}

NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript', 'json', 'html']}}
NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
NeoBundleLazy 'elzr/vim-json', {'autoload':{'filetypes':['json']}}
NeoBundleLazy 'mmalecki/vim-node.js', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'moll/vim-node', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'itspriddle/vim-jquery.git', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'heavenshell/vim-jsdoc', {'autoload':{'filetypes':['javascript']}}

NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee','ls','typescript']}}
let g:used_javascript_libs = 'underscore,angularjs,jquery,jasmine'

NeoBundleLazy 'tpope/vim-markdown', {'autoload':{'filetypes':['markdown']}}
NeoBundleLazy 'jtratner/vim-flavored-markdown.git', {'autoload':{'filetypes':['markdown']}}
NeoBundleLazy 'waylan/vim-markdown-extra-preview', {'autoload':{'filetypes':['markdown']}}

""""""""""""
"  others  "
""""""""""""
"Git support
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish.git'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'thinca/vim-visualstar'
"""""""""""""""""
"  buffergator  "
"""""""""""""""""
NeoBundle 'jeetsukumaran/vim-buffergator'
let g:buffergator_display_regime = "bufname" " display only buffer name by default
let g:buffergator_viewport_split_policy = "B" "since nerdtree opens on left
let g:buffergator_sort_regime = "mru" "who cares about buffer number. sort by most recently used

NeoBundle 'sjl/gundo.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'editorconfig/editorconfig-vim'

" NeoBundle 'thinca/vim-fontzoom', {'gui' : 1}
NeoBundleLazy 'tyru/open-browser.vim', {
        \   'commands' : ['OpenBrowserSearch', 'OpenBrowser'],
        \   'functions' : 'openbrowser#open',
        \   'mappings': '<Plug>(openbrowser-'
        \ }

""""""""""""""""
"  Yank Stack  "
""""""""""""""""
NeoBundle 'maxbrunsfeld/vim-yankstack'
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
imap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
imap <leader>P <Plug>yankstack_substitute_newer_paste

""""""""""""""""
"  Tabularize  "
""""""""""""""""
NeoBundleLazy 'godlygeek/tabular', {'autoload':{'commands':'Tabularize'}}
nnoremap <Leader>a& :Tabularize /&<CR>
vnoremap <Leader>a& :Tabularize /&<CR>
nnoremap <Leader>a" :Tabularize /"<CR>
vnoremap <Leader>a" :Tabularize /"<CR>
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:<CR>
vnoremap <Leader>a: :Tabularize /:<CR>
nnoremap <Leader>a:: :Tabularize /:\zs<CR>
vnoremap <Leader>a:: :Tabularize /:\zs<CR>
nnoremap <Leader>a, :Tabularize /,<CR>
vnoremap <Leader>a, :Tabularize /,<CR>
nnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>
vnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>

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

NeoBundleLazy 'EasyGrep', {'autoload':{'commands':'GrepOptions'}}
let g:EasyGrepRecursive=1
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepCommand=1
nnoremap <leader>vo :GrepOptions<cr>

"""""""""""""
"  airline  "
"""""""""""""
NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='¦'

""""""""""""
"  switch - switches between stuff
""""""""""""
NeoBundleLazy 'AndrewRadev/switch.vim'
let g:switch_custom_definitions =
            \ [
            \   ['/', '\\']
            \ ]

"""""""""""""""
"  UltiSnips  "
"""""""""""""""
NeoBundle 'SirVer/ultisnips'
set runtimepath+=~/.dotfiles/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir=expand('~/.dotfiles/snippets/')
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'snippets']

""""""""""""""""""
"  Text Objects  "
""""""""""""""""""
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-line' " al, il
NeoBundle 'kana/vim-textobj-indent' " ai, ii, aI, iI
NeoBundle 'kana/vim-textobj-entire' " ae, ie
NeoBundle 'PeterRincker/vim-argumentative' " a, i,
"auto add closing tag
"""""""""""""""""
"  delimitMate  "
"""""""""""""""""
NeoBundle 'Raimondi/delimitMate'
let delimitMate_expand_cr=1

""""""""""""""""""
"  lint & style  "
""""""""""""""""""
NeoBundle 'einars/js-beautify'
NeoBundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['javascript', 'json'],
            \ 'passive_filetypes': [] }

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

NeoBundleCheck
