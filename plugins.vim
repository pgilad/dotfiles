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
let NERDTreeWinSize=30
let NERDTreeIgnore=['\~$', '\.swp$', '\.hg', '\.svn', '\.bzr']

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
let g:airline_left_sep  = '›' " Slightly fancier than '>'
let g:airline_right_sep = '‹' " Slightly fancier than '<'

""""""""""""""""""""""
" ctrl-p custom ignore paths
""""""""""""""""""""""
let g:ctrlp_custom_ignore = 'node_modules\|.idea\|.git\|workspace\|bower_components\'
" set ctrp options
let g:ctrlp_show_hidden = 1

""""""""""""""""""""""""""
"  Used javascript libs  "
""""""""""""""""""""""""""
let g:used_javascript_libs = 'underscore,angularjs,jquery'
