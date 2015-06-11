#!/usr/bin/zsh bash
# Disable sound
setopt NO_BEEP
# glob for dotfiles as well (hidden)
setopt GLOB_DOTS

[[ -f "$HOME/.exports" ]] && source "$HOME/.exports"
if [[ ! -d "$CACHE_DIR" ]]; then
    mkdir -p "$CACHE_DIR"
fi
plugins=(zsh-syntax-highlighting git-extras git vagrant)
if [[ "$(uname)" =~ ^Darwin ]]; then
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

if [[ -x "$(command -v rbenv)" ]]; then
    eval "$(rbenv init - --no-rehash)";
fi
