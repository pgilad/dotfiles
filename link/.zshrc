# Disable sound
setopt NO_BEEP
# glob for dotfiles as well (hidden)
setopt GLOB_DOTS

[[ -f "$HOME/.exports" ]] && source "$HOME/.exports"
[[ ! -d "$CACHE_DIR" ]] && mkdir -p "$CACHE_DIR"

plugins=(zsh-syntax-highlighting git-extras git vagrant)
if [[ "$(uname)" =~ ^Darwin ]]; then
    source $(brew --prefix nvm)/nvm.sh
    plugins+=brew
fi
if [[ -x "$(command -v tmux)" ]]; then
    plugins+=tmux
fi
if [[ -x "$(command -v tmuxinator)" ]]; then
    plugins+=tmuxinator
fi
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.completions" ]] && source "$HOME/.completions"
[[ -f "$HOME/.extra" ]] && source "$HOME/.extra"

[[ -x "$(command -v rbenv)" ]] && eval "$(rbenv init - --no-rehash)"

