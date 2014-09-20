if !has('autocmd') | finish | endif

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

augroup myfiletypes
    autocmd!
    autocmd BufNewFile,BufRead *.ajs                    setlocal filetype=javascript
    autocmd BufNewFile,BufRead *.as                     setlocal filetype=actionscript
    autocmd BufNewFile,BufRead *.asm                    setlocal filetype=nasm
    autocmd BufNewFile,BufRead *.jshintrc,*.bowerrc     setlocal filetype=json
    autocmd BufNewFile,BufRead *.kml                    setlocal filetype=xml
    autocmd BufNewFile,BufRead *.m                      setlocal filetype=objc
    autocmd BufNewFile,BufRead *.md,*.markdown          setlocal filetype=markdown
    autocmd BufNewFile,BufRead *.samsa                  setlocal filetype=jproperties
    autocmd BufNewFile,BufRead *.scala                  setlocal filetype=scala
    autocmd BufNewFile,BufRead *.ts                     setlocal filetype=typescript
    autocmd BufNewFile,BufRead *.txt                    setlocal filetype=text
    autocmd BufNewFile,BufRead *.xdot                   setlocal filetype=dot
    autocmd BufNewFile,BufRead .tmux*.conf*,*.tmux      setlocal filetype=tmux
augroup END

" close sentence with comma or semi-colon
augroup my_auto_commands
    autocmd!
    " prevent indentation in jade
    autocmd FileType jade setlocal noautoindent
    autocmd FileType html setlocal matchpairs+=<:>

    " saving on lost focus
    " autocmd WinEnter,BufWinEnter,FocusGained * checktime
    " autocmd FileType javascript,html,json,jade,vim autocmd FileWritePre,FileAppendPre,FilterWritePre,BufWritePre <buffer> call TrimWhiteSpace()

    " autocomplete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=syntaxcomplete#Complete

    " beautify mappings local to filetypes
    autocmd FileType javascript,json nnoremap <buffer> <leader>js :call JsBeautify()<cr>
    autocmd FileType javascript,json vnoremap <buffer> <leader>js :call RangeJsBeautify()<cr>
    autocmd FileType html nnoremap <buffer> <leader>js :call HtmlBeautify()<cr>
    autocmd FileType html vnoremap <buffer> <leader>js :call RangeHtmlBeautify()<cr>
    autocmd FileType css nnoremap <buffer> <leader>js :call CSSBeautify()<cr>
    autocmd FileType css vnoremap <buffer> <leader>js :call RangeCSSBeautify()<cr>

    "pretty format json using python
    autocmd FileType json nnoremap <buffer> <leader>fj :%!python -m json.tool<cr>

    " Turn on spell check for certain filetypes automatically
    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
    autocmd FileType gitcommit setlocal spell spelllang=en_us

    autocmd WinLeave * setlocal nocursorline
    autocmd WinEnter * setlocal cursorline
augroup END
