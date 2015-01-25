DOTFILES="$HOME/.dotfiles"
CACHE_DIR="$HOME/.cache"

HISTFILE="$CACHE_DIR/.zsh_history"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$DOTFILES/zsh/custom"
ZSH_THEME="vonder"

################
#  ZSH config  #
################
# Disable sound
setopt NO_BEEP
# glob for dotfiles as well (hidden)
setopt GLOB_DOTS

###############
#  Pre setup  #
###############
# create cache dir if it doesn't exist
if [[ ! -d "$CACHE_DIR" ]]; then
    mkdir -p "$CACHE_DIR"
fi

[[ -f "$HOME/.exports" ]] && source "$HOME/.exports"

# set oh my zsh plugins
plugins=(zsh-syntax-highlighting git-extras git vagrant)

# OS specific settings
if [[ "$(uname)" =~ ^Darwin ]]; then
    plugins+=brew
fi

if [[ -n "$TMUX" ]]; then
    plugins+=tmux
fi

# source oh my zsh
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.completions" ]] && source "$HOME/.completions"
[[ -f "$HOME/.extra" ]] && source "$HOME/.extra"


if [[ -x "$(command -v rbenv)" ]]; then
    eval "$(rbenv init -)";
fi
