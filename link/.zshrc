DOTFILES="$HOME/.dotfiles"
CACHE_DIR="$HOME/.cache"
SOURCE_DIR="$DOTFILES/source"

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

#source exported vars
if [[ -f "$SOURCE_DIR/.exports" ]]; then
    source "$SOURCE_DIR/.exports"
fi

###############
#  oh-my-zsh  #
###############
# set oh my zsh plugins
plugins=(zsh-syntax-highlighting git-extras)

# OS specific settings
if [[ "$(uname)" =~ ^Darwin ]]; then
    plugins+=brew
fi

if [[ -n "$TMUX" ]]; then
    plugins+=tmux
fi

if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
    source "$ZSH/oh-my-zsh.sh"
fi

if [[ -f "$SOURCE_DIR/.aliases" ]]; then
    source "$SOURCE_DIR/.aliases"
fi

if [[ -f "$SOURCE_DIR/.completions" ]]; then
    source "$SOURCE_DIR/.completions"
fi

if [[ -f "$HOME/.extra" ]]; then
    source "$HOME/.extra"
fi
