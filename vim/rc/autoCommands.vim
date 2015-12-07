if !has('autocmd') | finish | endif

augroup myfiletypes
    autocmd!
    autocmd BufNewFile,BufRead *.ajs,*.es6,*.es      setlocal filetype=javascript
    autocmd BufNewFile,BufRead *.as                  setlocal filetype=actionscript
    autocmd BufNewFile,BufRead *.asm                 setlocal filetype=nasm
    autocmd BufNewFile,BufRead *.kml                 setlocal filetype=xml
    autocmd BufNewFile,BufRead *.m                   setlocal filetype=objc
    autocmd BufNewFile,BufRead *.md,*.markdown       setlocal filetype=markdown
    autocmd BufNewFile,BufRead *.rs                  setlocal filetype=rust
    autocmd BufNewFile,BufRead *.samsa               setlocal filetype=jproperties
    autocmd BufNewFile,BufRead *.scala               setlocal filetype=scala
    autocmd BufNewFile,BufRead *.ts                  setlocal filetype=typescript
    autocmd BufNewFile,BufRead *.txt                 setlocal filetype=text
    autocmd BufNewFile,BufRead *.xdot                setlocal filetype=dot
    autocmd BufNewFile,BufRead .babelrc              setlocal filetype=json
    autocmd BufNewFile,BufRead .bowerrc              setlocal filetype=json
    autocmd BufNewFile,BufRead .eslintrc             setlocal filetype=json
    autocmd BufNewFile,BufRead .jscsrc               setlocal filetype=json
    autocmd BufNewFile,BufRead .jshintrc             setlocal filetype=json
    autocmd BufNewFile,BufRead .tmux*.conf*,*.tmux   setlocal filetype=tmux
augroup END

" close sentence with comma or semi-colon
augroup my_auto_commands
    autocmd!
    " prevent indentation in jade, coffeescript
    autocmd FileType coffee,jade setlocal noautoindent
    autocmd FileType html setlocal matchpairs+=<:>

    " autocomplete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=syntaxcomplete#Complete

    autocmd FileType css,html,jsx,json nnoremap <silent> <buffer> <leader>js :<c-u>call Beautify()<cr>
    autocmd FileType javascript nnoremap <silent> <buffer> <leader>js :<c-u>call JsBeautify()<cr>
    autocmd FileType css,html,jsx,json vnoremap <silent> <buffer> <leader>js :call BeautifyRange()<cr>
    autocmd FileType javascript vnoremap <silent> <buffer> <leader>js :call RangeJsBeautify()<cr>

    "pretty format json using python
    autocmd FileType json nnoremap <buffer> <leader>pf :%!python -m json.tool<cr>

    " Turn on spell check for certain filetypes automatically
    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
    autocmd FileType gitcommit setlocal spell spelllang=en_us

    autocmd WinLeave * setlocal nocursorline
    autocmd WinEnter * setlocal cursorline
augroup END
