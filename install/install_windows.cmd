@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

REM  default app dir
@set APP_DIR=%HOME%\.dotfiles
@set BUNDLE_DIR=%HOME%\.vim\bundle

REM  create symlinks
call mklink "%HOME%\_vimrc" "%APP_DIR%\_vimrc"
call mklink "%HOME%\.gitconfig" "%APP_DIR%\.gitconfig"
call mklink "%HOME%\.zshrc" "%APP_DIR%\.zshrc"

REM  create vim bundle dir
IF NOT EXIST "%BUNDLE_DIR%" (
    call mkdir "%BUNDLE_DIR%"
)

pause
