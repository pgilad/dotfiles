if !has('autocmd') | finish | endif

augroup myfiletypes
    autocmd!
    autocmd BufNewFile,BufRead *.ajs,*.es6,*.es      setfiletype=javascript
    " autocmd BufNewFile,BufRead *.twig              setfiletype=html
    autocmd BufNewFile,BufRead *.as                  setfiletype=actionscript
    autocmd BufNewFile,BufRead *.asm                 setfiletype=nasm
    autocmd BufNewFile,BufRead .jshintrc,.bowerrc    setfiletype=json
    autocmd BufNewFile,BufRead .jscsrc               setfiletype=json
    autocmd BufNewFile,BufRead *.kml                 setfiletype=xml
    autocmd BufNewFile,BufRead *.m                   setfiletype=objc
    autocmd BufNewFile,BufRead *.md,*.markdown       setfiletype=markdown
    autocmd BufNewFile,BufRead *.rs                  setfiletype=rust
    autocmd BufNewFile,BufRead *.samsa               setfiletype=jproperties
    autocmd BufNewFile,BufRead *.scala               setfiletype=scala
    autocmd BufNewFile,BufRead *.ts                  setfiletype=typescript
    autocmd BufNewFile,BufRead *.txt                 setfiletype=text
    autocmd BufNewFile,BufRead *.xdot                setfiletype=dot
    autocmd BufNewFile,BufRead .tmux*.conf*,*.tmux   setfiletype=tmux
augroup END

" close sentence with comma or semi-colon
augroup my_auto_commands
    autocmd!
    " prevent indentation in jade, coffeescript
    " autocmd FileType coffee,jade setlocal noautoindent
    autocmd FileType html setlocal matchpairs+=<:>

    " the following line makes vim ignore camelCase and CamelCase words so they
    " are not highlighted as spelling mistakes
    autocmd Syntax * syn match CamelCase "\(\<\|_\)\%(\u\l*\)\{2,}\(\>\|_\)\|\<\%(\l\l*\)\%(\u\l*\)\{1,}\>" transparent containedin=.*Comment.*,.*String.*,VimwikiLink contains=@NoSpell contained

    " saving on lost focus
    " autocmd WinEnter,BufWinEnter,FocusGained * checktime

    " autocomplete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=syntaxcomplete#Complete

    autocmd FileType css,html,javascript,jsx,json nnoremap <silent> <buffer> <leader>js :<c-u>call Beautify()<cr>
    autocmd FileType css,html,javascript,jsx,json vnoremap <silent> <buffer> <leader>js :call BeautifyRange()<cr>

    "pretty format json using python
    autocmd FileType json nnoremap <buffer> <leader>fj :%!python -m json.tool<cr>

    " Turn on spell check for certain filetypes automatically
    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
    autocmd FileType gitcommit setlocal spell spelllang=en_us

    autocmd WinLeave * setlocal nocursorline
    autocmd WinEnter * setlocal cursorline
augroup END
