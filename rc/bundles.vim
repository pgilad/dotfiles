let s:neobundle_git_path='!git clone %s://github.com/Shougo/neobundle.vim.git'

if has('vim_starting')
    "install neobundle if it isn't installed. requires git.
    if !isdirectory(expand(g:config.bundlesPath . 'neobundle.vim')) && executable('git')
        execute printf(s:neobundle_git_path,
                    \ (exists('$http_proxy') ? 'https' : 'git'))
                    \ g:bundle_path . 'neobundle.vim'
    endif
endif

" add neobundle to rtp
execute 'set rtp ^='. fnameescape(g:config.bundlesPath . 'neobundle.vim/')
call neobundle#rc(expand(g:config.bundlesPath))

"My Bundles
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'pgilad/neobundle-packages'
NeoBundle 'L9'

NeoBundle 'editorconfig/editorconfig-vim'

call neobundle_packages#parse_bundle('ctrlp')
let g:ctrlp_custom_ignore = 'build\|dist\|node_modules\|.idea\|.git\|workspace\|bower_components\'
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_max_height = 20         " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'    " jump to a file if it's open already
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=2000
let g:ctrlp_clear_cache_on_exit=0   " speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250          " number of recently opened files
let g:ctrlp_show_hidden = 1
nnoremap <c-p> :CtrlP<cr>

NeoBundleLazy 'Shougo/unite.vim', {
            \ 'commands' : [{ 'name' : 'Unite',
            \                 'complete' : 'customlist,unite#complete_source'},
            \                 'UniteWithCursorWord', 'UniteWithInput']
            \ }
NeoBundle 'osyo-manga/unite-filetype', {
            \ 'lazy': 1,
            \'depends': ['Shougu/unite.vim'],
            \ 'autoload': {
            \ 'unite_sources': ['filetype']
            \   }
            \ }
NeoBundle 'Shougo/unite-outline', {
            \ 'lazy': 1,
            \ 'depends': ['Shougu/unite.vim'],
            \ 'autoload': {
            \ 'unite_sources': ['outline']
            \   }
            \ }
NeoBundle 'Shougo/unite-mru', {
            \ 'lazy': 0,
            \'depends': ['Shougu/unite.vim']
            \ }
NeoBundle 'ujihisa/unite-colorscheme', {
            \ 'lazy': 1,
            \'depends': ['Shougu/unite.vim'],
            \ 'autoload': {
            \ 'unite_sources': ['colorscheme']
            \   }
            \ }
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_save_clipboard = 1
let g:unite_update_time = 200
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

"map bindings... use [Space] but release it for plugins
nmap <space> [unite]
xmap <space> [unite]
nnoremap [unite] <nop>
xnoremap [unite] <nop>

nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=buffers buffer<CR>
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files -start-insert file<CR>
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mappings -start-insert mapping<CR>
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -start-insert outline<CR>
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=files -start-insert file_rec<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=mru -start-insert file_mru<CR>
nnoremap <silent> [unite]t :<C-u>Unite -buffer-name=filetypes -start-insert filetype<CR>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yank history/yank<CR>
" search word in current buffer
nnoremap <silent><expr> [unite]*  ":<C-u>UniteWithCursorWord -buffer-name=search%".bufnr('%')." line:all:wrap<CR>"

NeoBundle 'scrooloose/nerdtree', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'commands': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind',
            \               'NERDTreeClose', 'NERDTreeCWD', 'NERDTreeFromBookmark', 'NERDTreeMirror']
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

NeoBundle 'nathanaelkane/vim-indent-guides', {
            \ 'lazy': 0
            \ }
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'qf']

NeoBundle 'Shougo/junkfile.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'commands': 'JunkfileOpen',
            \   'unite_sources': ['junkfile', 'junkfile/new']
            \  }
            \ }
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
NeoBundle 'hail2u/vim-css3-syntax', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes':['css', 'less']
            \  }
            \ }
NeoBundle 'cakebaker/scss-syntax.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes':['sass', 'scss']
            \  }
            \ }
NeoBundle 'wavded/vim-stylus', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes': ['stylus']
            \  }
            \ }
NeoBundle 'groenewege/vim-less', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes':['less', 'css']
            \  }
            \ }
NeoBundle 'csscomb/vim-csscomb', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes': ['css', 'less', 'sass']
            \  }
            \ }
NeoBundle 'othree/html5.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes':['html']
            \  }
            \ }
NeoBundle 'digitaltoad/vim-jade', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes':['jade']
            \  }
            \ }
NeoBundle 'gregsexton/MatchTag', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes':['html','xml']
            \  }
            \ }
NeoBundle 'othree/xml.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes':['xml']
            \  }
            \ }

NeoBundle 'jelera/vim-javascript-syntax', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes':['javascript']
            \  }
            \ }
NeoBundle 'pangloss/vim-javascript', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes':['javascript']
            \  }
            \ }
NeoBundle 'maksimr/vim-jsbeautify', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes':['javascript', 'json', 'html']
            \  }
            \ }
NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
NeoBundleLazy 'elzr/vim-json', {'autoload':{'filetypes':['json']}}
NeoBundleLazy 'mmalecki/vim-node.js', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'moll/vim-node', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'itspriddle/vim-jquery.git', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'heavenshell/vim-jsdoc', {'autoload':{'filetypes':['javascript']}}

NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee']}}
let g:used_javascript_libs = 'underscore,angularjs,jquery,jasmine'

NeoBundleLazy 'tpope/vim-markdown', {'autoload':{'filetypes':['markdown']}}
NeoBundleLazy 'jtratner/vim-flavored-markdown.git', {'autoload':{'filetypes':['markdown']}}
NeoBundleLazy 'waylan/vim-markdown-extra-preview', {'autoload':{'filetypes':['markdown']}}

"Git support
NeoBundle 'tpope/vim-fugitive', {
            \ 'lazy': 0
            \ }
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gp :Git push<cr>

NeoBundle 'gregsexton/gitv', {
            \ 'lazy': 1,
            \ 'depends': ['tpope/vim-fugitive'],
            \  'autoload' : {
            \   'commands': ['Gitv']
            \  }
            \ }

" NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-surround'
" NeoBundle 'tpope/vim-abolish.git'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'thinca/vim-visualstar'

NeoBundle 'gcmt/wildfire.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'mappings' : '<Plug>(wildfire-'
            \  }
            \ }
"* marks the file type
let g:wildfire_objects = {
            \ '*' : ["i'", 'i"', "a'", 'a"', "i)", "i]", "i}", "ip"],
            \ 'html': ["it", "at"]
            \}
nmap <ENTER> <Plug>(wildfire-fuel)
nmap <BS> <Plug>(wildfire-water)
" NeoBundle 'jeetsukumaran/vim-buffergator'
" let g:buffergator_display_regime = 'bufname'  " display only buffer name by default
" let g:buffergator_viewport_split_policy = 'B' " since nerdtree opens on left
" let g:buffergator_sort_regime = 'mru'         " who cares about buffer number. sort by most recently used

NeoBundle 'sjl/gundo.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \   'commands': ['GundoShow', 'GundoToggle', 'GundoHide', 'GundoRenderGraph']
            \  }
            \ }

NeoBundle 'kien/rainbow_parentheses.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'commands': ['RainbowParenthesesToggle', 'RainbowParenthesesLoadRound',
            \               'RainbowParenthesesLoadSquare', 'RainbowParenthesesLoadBraces',
            \               'RainbowParenthesesLoadChevrons']
            \  }
            \ }
"easy motion -current bound to <leader><leader> by default
" NeoBundle 'Lokaltog/vim-easymotion'

" NeoBundle 'thinca/vim-fontzoom', {'gui' : 1}
NeoBundleLazy 'tyru/open-browser.vim', {
            \   'commands' : ['OpenBrowserSearch', 'OpenBrowser'],
            \   'functions' : 'openbrowser#open',
            \   'mappings': '<Plug>(openbrowser-'
            \ }

" let g:yankstack_map_keys = 0
" NeoBundle 'maxbrunsfeld/vim-yankstack', {
" \ 'lazy': 0
" \ }

" nmap <leader>p <Plug>yankstack_substitute_older_paste
" imap <leader>p <Plug>yankstack_substitute_older_paste
" nmap <leader>P <Plug>yankstack_substitute_newer_paste
" imap <leader>P <Plug>yankstack_substitute_newer_paste

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

NeoBundle 'Shougo/neocomplcache.vim', {
            \ 'lazy': 1,
            \   'autoload': {
            \       'insert': 1
            \   }
            \ }
NeoBundle 'terryma/vim-multiple-cursors'

NeoBundle 'AndrewRadev/inline_edit.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'commands': ['InlineEdit']
            \  }
            \ }
nnoremap <leader>ie :InlineEdit<cr>
xnoremap <leader>ie :InlineEdit<cr>
inoremap <leader>ie <esc>:InlineEdit<cr>a

"gS to split, gJ to join
NeoBundle 'AndrewRadev/splitjoin.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \   'commands': ['SplitjoinSplit', 'SplitjoinJoin']
            \  }
            \ }
nnoremap <leader>sj :SplitjoinJoin<cr>
nnoremap <leader>ss :SplitjoinSplit<cr>

NeoBundle 'AndrewRadev/linediff.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'commands': ['Linediff', 'LinediffReset']
            \  }
            \ }
vnoremap <leader>ld :Linediff<cr>
nnoremap <leader>ld :Linediff<cr>
nnoremap <leader>lr :LinediffReset<cr>

"""""""""""""
"  airline  "
"""""""""""""
NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='¦'

NeoBundle 'AndrewRadev/switch.vim', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'commands': ['Switch']
            \  }
            \ }
let g:switch_custom_definitions =
            \ [
            \   ['/', '\\'],
            \   {
            \       '\v(\w+)\.(\w+)' : '\1[''\2'']',
            \       '\v(\w+)\[[''"](\w+)[''"]\]' : '\1.\2'
            \   }
            \ ]

"""""""""""""""
"  UltiSnips  "
"""""""""""""""
NeoBundle 'honza/vim-snippets', {
            \ 'lazy': 0,
            \ 'autoload' : {
            \    'on_source': ['ultisnips']
            \  }
            \ }
NeoBundle 'SirVer/ultisnips', {
            \ 'depends': ['vim-snippets'],
            \ 'lazy': 0,
            \ 'autoload' : {
            \    'insert': 1
            \  }
            \ }
set runtimepath+=~/.dotfiles
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir='~/.dotfiles/mysnippets'
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']

NeoBundle 'kana/vim-textobj-user'          " required plugin
NeoBundle 'kana/vim-textobj-line'          " al, il
NeoBundle 'kana/vim-textobj-indent'        " ai, ii, aI, iI
NeoBundle 'kana/vim-textobj-entire'        " ae, ie
NeoBundle 'PeterRincker/vim-argumentative' " a, i,

NeoBundle 'Raimondi/delimitMate', {
            \  'lazy' : 1,
            \  'autoload' : {
            \    'insert' : 1
            \  }
            \}
let delimitMate_expand_cr=1
let delimitMate_expand_space=1

""""""""""""""""""
"  lint & style  "
""""""""""""""""""
NeoBundle 'einars/js-beautify', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes' : ['html', 'js', 'css']
            \  }
            \ }
NeoBundle 'scrooloose/syntastic', {
            \ 'lazy': 1,
            \  'autoload' : {
            \	'filetypes': ['javascript', 'json', 'less', 'css', 'jade', 'html']
            \  }
            \ }
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
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'Lokaltog/vim-distinguished'
" NeoBundle 'vim-scripts/wombat256.vim'
" NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'sjl/badwolf'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'tomasr/molokai'
" NeoBundle 'tpope/vim-vividchalk'
