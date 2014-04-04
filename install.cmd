@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set APP_DIR=%HOME%\.dotfiles

REM  create symlinks
call mklink "%HOME%\_vimrc" "%APP_DIR%\_vimrc"
call mklink "%HOME%\.gitconfig" "%APP_DIR%\.gitconfig"
call mklink "%HOME%\.zshrc" "%APP_DIR%\.zshrc"

REM  create vim bundle dir
IF NOT EXIST "%APP_DIR%\vimfiles\bundle" (
    call mkdir "%APP_DIR%\.vim\bundle"
)

pause
