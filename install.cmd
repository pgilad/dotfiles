@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set APP_DIR=%HOME%\.dotfiles

call mklink "%HOME%\_vimrc" "%APP_DIR%\_vimrc"
call mklink "%HOME%\.gitconfig" "%APP_DIR%\.gitconfig"

IF NOT EXIST "%APP_DIR%\vimfiles\bundle" (
	call mkdir "%APP_DIR%\.vim\bundle"
)

IF NOT EXIST "%HOME%\vimfiles\bundle\neobundle.vim" (
	call git clone https://github.com/Shougo/neobundle.vim "%HOME%\vimfiles\bundle\neobundle.vim"
)
