"set file type detection off
filetype on
filetype off
let g:bundle_path = "~/vimfiles/bundle/"
"add neobundle to rtp
let &runtimepath .= "," . escape(g:bundle_path . 'neobundle.vim/', '\,')
call neobundle#rc(expand(g:bundle_path))

"My Bundles
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'pgilad/neobundle-packages'
NeoBundle 'L9'
" Takes too long in boot process. Not used currently
" NeoBundle 'FuzzyFinder'

"awesome plugin for file/path/buffer search with ctrl-p
let g:ctrlp_custom_ignore = 'build\|dist\|node_modules\|.idea\|.git\|workspace\|bower_components\'
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_max_height = 20 " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et' " jump to a file if it's open already
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=2000
let g:ctrlp_clear_cache_on_exit=0 " speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250 " number of recently opened files
let g:ctrlp_show_hidden = 1
nnoremap <c-p> :CtrlP<cr>
NeoBundlePackage g:bundle_path, 'ctrlp'

""""""""""""""
"  Nerdtree  "
""""""""""""""
NeoBundle 'scrooloose/nerdtree', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'commands': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeCWD']
            \  }
            \ }
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=0
let NERDTreeWinSize=30
let NERDTreeDirArrows=1
let NERDChristmasTree=1
let NERDTreeAutoDeleteBuffer=1 "auto delete buffers on nerdtree delete
let NERDTreeIgnore=['\~$', '^\.\.$', '\.swp$', '\.hg$', '\.svn$', '\.bzr', '\.git$']

NeoBundle 'scrooloose/nerdcommenter', {
            \ 'lazy': 0
            \ }
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
NeoBundle 'kchmck/vim-coffee-script', {
            \  'lazy' : 1,
            \  'autoload' : {
            \    'filetypes' : ['coffee']
            \  }
            \}
NeoBundle 'ap/vim-css-color', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes':['css','scss','sass','less','styl']
            \  }
            \ }
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css', 'less', 'scss','sass']}}
NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less', 'css']}}
NeoBundle 'csscomb/vim-csscomb', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes': ['css', 'less', 'sass']
            \  }
            \ }

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
NeoBundle 'gregsexton/gitv', {
            \ 'lazy': 1,
            \ 'depends': ['tpope/vim-fugitive'],
            \  'autoload' : {
            \	'commands': ['Gitv']
            \  }
            \ }

" NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish.git'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'thinca/vim-visualstar'

NeoBundle 'gcmt/wildfire.vim'
" This selects the next closest text object.
let g:wildfire_fuel_map = "<ENTER>"
" " This selects the previous closest text object.
let g:wildfire_water_map = "<BS>"
" use '*' to mean 'all other filetypes'
" in this example, html and xml share the same text objects
let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]
            \ }

"""""""""""""""""
"  buffergator  "
"""""""""""""""""
NeoBundle 'jeetsukumaran/vim-buffergator'
let g:buffergator_display_regime = 'bufname'  " display only buffer name by default
let g:buffergator_viewport_split_policy = 'B' " since nerdtree opens on left
let g:buffergator_sort_regime = 'mru'         " who cares about buffer number. sort by most recently used

NeoBundle 'sjl/gundo.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \   'commands': ['GundoShow', 'GundoToggle', 'GundoHide', 'GundoRenderGraph']
            \  }
            \ }

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
let g:yankstack_map_keys = 0
NeoBundle 'maxbrunsfeld/vim-yankstack', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'mappings': '<plug>yankstack_substitute_'
            \  }
            \ }

nmap <leader>p <Plug>yankstack_substitute_older_paste
imap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
imap <leader>P <Plug>yankstack_substitute_newer_paste

""""""""""""""""
"  Tabularize  "
""""""""""""""""
NeoBundle 'godlygeek/tabular', {
            \ 'lazy': 1,
            \  'autoload' : {
            \   'commands': ['Tabularize']
            \  }
            \ }
nnoremap <leader>a& :Tabularize /&<cr>
vnoremap <leader>a& :Tabularize /&<cr>
nnoremap <leader>a" :Tabularize /"<cr>
vnoremap <leader>a" :Tabularize /"<cr>
nnoremap <leader>a= :Tabularize /=<cr>
vnoremap <leader>a= :Tabularize /=<cr>
nnoremap <leader>a: :Tabularize /:<cr>
vnoremap <leader>a: :Tabularize /:<cr>
nnoremap <leader>a:: :Tabularize /:\zs<cr>
vnoremap <leader>a:: :Tabularize /:\zs<cr>
nnoremap <leader>a, :Tabularize /,<cr>
vnoremap <leader>a, :Tabularize /,<cr>
nnoremap <leader>a<Bar> :Tabularize /<Bar><cr>
vnoremap <leader>a<Bar> :Tabularize /<Bar><cr>

" NeoBundle 'Shougo/neocomplcache.vim', {
            " \ 'lazy': 1,
            " \  'autoload' : {
            " \	'insert': 1
            " \  }
            " \ }
NeoBundle 'terryma/vim-multiple-cursors'

"""""""""""""""
"  Searching  "
"""""""""""""""
if executable('ag')
    NeoBundle 'ervandew/ag'    "good for regex escaping
    " NeoBundle 'rking/ag.vim' "great for quickfix mappings
    let g:ackprg = "ag --nogroup --column --smart-case --follow"
endif

NeoBundle 'AndrewRadev/inline_edit.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'commands': ['InlineEdit']
            \  }
            \ }
nnoremap <leader>ie :InlineEdit<cr>
xnoremap <leader>ie :InlineEdit<cr>
inoremap <leader>ie <esc>:InlineEdit<cr>a

NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'AndrewRadev/linediff.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'commands': ['Linediff', 'LinediffReset']
            \  }
            \ }
vnoremap <leader>ld :Linediff<cr>
nnoremap <leader>ld :Linediff<cr>
nnoremap <leader>lr :LinediffReset<cr>

NeoBundle 'EasyGrep', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'commands': ['GrepOptions']
            \  }
            \ }
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
NeoBundle 'AndrewRadev/switch.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'commands': ['Switch']
            \  }
            \ }
let g:switch_custom_definitions =
            \ [
            \   ['/', '\\']
            \ ]

"""""""""""""""
"  UltiSnips  "
"""""""""""""""
NeoBundle 'SirVer/ultisnips', {
            \ 'lazy': 0
            \ }
NeoBundle 'honza/vim-snippets', {
            \ 'lazy': 0
            \ }

set runtimepath+=~/.dotfiles/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir=expand('~/.dotfiles/mysnippets/')
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']

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
NeoBundle 'Raimondi/delimitMate', {
            \  'lazy' : 1,
            \  'autoload' : {
            \    'insert' : 1
            \  }
            \}

let delimitMate_expand_cr=1

""""""""""""""""""
"  lint & style  "
""""""""""""""""""
NeoBundle 'einars/js-beautify', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes' : ['html', 'js', 'css']
            \  }
            \ }
NeoBundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['javascript', 'json', 'less', 'css', 'jade', 'html'],
            \ 'passive_filetypes': [] }
let g:syntastic_enable_balloons = 0

"Comma and semi-colon
NeoBundle 'lfilho/cosco.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes': ['json', 'javascript']
            \  }
            \ }
" close sentence with comma or semi-colon
augroup appendComma
    autocmd!
    autocmd FileType javascript,css,json nnoremap <buffer> <silent> <leader>; :call cosco#commaOrSemiColon()<cr>
    autocmd FileType javascript,css,json inoremap <buffer> <silent> <leader>; <ESC>:call cosco#commaOrSemiColon()<cr>a
augroup END

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

"check for uninstalled packages
NeoBundleCheck
