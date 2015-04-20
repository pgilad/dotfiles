""""""""""""""""""""""
"  F-# keys mapping  "
""""""""""""""""""""""
nnoremap <F1> <nop>
inoremap <F1> <nop>
" See undo tree
nnoremap <F3> :GundoToggle<cr>
" set spell check
nnoremap <F4> :setlocal spell!<cr>
" toggle paste
nnoremap <F6> :set invpaste<CR>:set paste?<CR>
" format from 2 spaces to 4 spaces
nnoremap <F7> :<C-U>set ts=2 sts=2 noexpandtab<cr>:retab!<cr>:set ts=4 sts=4 expandtab<cr>:retab<cr>
""""""""""""""""""""""""""""
"  Regular keys unbinding  "
""""""""""""""""""""""""""""
" clear search highlights
nnoremap gc :<c-u>nohlsearch<cr>
" switch between 0 and ^
noremap 0 ^
noremap ^ 0

" easy way to normal mode
inoremap jj <ESC>
" better line navigation
nnoremap j gj
nnoremap k gk

" quit everything
" commented since it sometimes lead to unwanted exits
" nnoremap Q :<c-u>qa<cr>
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
nnoremap <silent> <leader>ls :set list!<CR>

"<leader>w: Close current buffer
nnoremap <leader>wc :bdelete<cr>

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
" edit mappings
nnoremap <silent> <leader>em :exec 'edit ' . g:config.loadFiles.mappings<cr>
" edit bundles
nnoremap <silent> <leader>eb :exec 'edit ' . g:config.loadFiles.bundles<cr>
" edit settings
nnoremap <silent> <leader>es :exec 'edit ' . g:config.loadFiles.settings<cr>
" edit auto commands
nnoremap <silent> <leader>ea :exec 'edit ' . g:config.loadFiles.autoCommands<cr>
" source myvimrc
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

" edit current filetype custom snippets
nnoremap <silent> <leader>us :UltiSnipsEdit<cr>
" update bundles
nnoremap <silent> <leader>eu :NeoBundleUpdate<cr>
nnoremap <silent> <leader>el :NeoBundleUpdatesLog<cr>

" execute current line as command
nnoremap <leader>ex :execute getline(".")<cr>
vnoremap <leader>ex :<c-u>execute getreg("*")<cr>
"clear all double+ empty lines
nnoremap <leader>ec :g/^\n$/d<cr>

"""""""""""""""
"  <leader>s  "
"""""""""""""""
" Switch commands.
nnoremap <silent> <leader>sw :Switch<CR>
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
" add require('gulp-.. on current word
nnoremap <leader>mg mjyiwgg0/require ovar * = require('gulp-*')A;`j:nohlsearch<cr>
" add require(''); .. on current word
nnoremap <leader>mr mjyiwgg0/require ovar * = require('*')A;`j:nohlsearch<cr>

nnoremap <leader>hg ggO/* global App */<esc>

iabbrev mit@ MIT @[Gilad Peleg](http://giladpeleg.com)
