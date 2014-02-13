""""""""""""
"  switch  "
""""""""""""
let g:switch_custom_definitions =
            \ [
            \   ['/', '\\']
            \ ]

""""""""""""""""""""""
" Configure delimitMate
""""""""""""""""""""""
let delimitMate_expand_cr=1

""""""""""""""""""""""
" set nerdtree options
""""""""""""""""""""""
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=0
let NERDTreeWinSize=30
let NERDTreeIgnore=['\~$', '\.swp$', '\.hg', '\.svn', '\.bzr', '\.git']

""""""""""""""""
"  Tabularize  "
""""""""""""""""
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

"""""""""""""""
"  NerdSpace  "
"""""""""""""""
" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

""""""""""""""""
"  Yank Stack  "
""""""""""""""""
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
imap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
imap <leader>P <Plug>yankstack_substitute_newer_paste

"""""""""""""""
"  ShowMarks  "
"""""""""""""""
"let g:showmarks_enable = 1
"let g:showmarks_textlower = "\t"
"let g:showmarks_textupper = "\t"
"let g:showmarks_textother = "\t"
"let g:showmarks_ignoretype = "hqm" "help quickfix and non modifiable

"""""""""""""""
"  UltiSnips  "
"""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"""""""""""""""""""
"  Indent Guides  "
"""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""
"  beautify  "
""""""""""""""
"let g:config_Beautifier.js.indent_style = 'space'
"let g:config_Beautifier.js.indent_space = 4
"let g:config_Beautifier.js.keep_function_indentation=1
"let g:config_Beautifier.js.keep_array_indentation=1
"let g:config_Beautifier.js.brace_style = 'collapse'
"let g:config_Beautifier.js.space_before_conditional =1

"""""""""""""""""
"  buffergator  "
"""""""""""""""""
let g:buffergator_display_regime = "bufname" " display only buffer name by default
let g:buffergator_viewport_split_policy = "B" "since nerdtree opens on left
let g:buffergator_sort_regime = "mru" "who cares about buffer number. sort by most recently used

"""""""""""""""
"  syntastic  "
"""""""""""""""
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['javascript', 'json'],
            \ 'passive_filetypes': [] }

"""""""""""""
"  airline  "
"""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='¦'

""""""""""""""""""""""
" ctrl-p custom ignore paths
""""""""""""""""""""""
let g:ctrlp_custom_ignore = 'node_modules\|.idea\|.git\|workspace\|bower_components\'
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_max_height = 40 " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et' " jump to a file if it's open already
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=20000
let g:ctrlp_clear_cache_on_exit=0 " speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250 " number of recently opened files
let g:ctrlp_show_hidden = 1

""""""""""""""""""""""""""
"  Used javascript libs  "
""""""""""""""""""""""""""
let g:used_javascript_libs = 'underscore,angularjs,jquery,jasmine'
