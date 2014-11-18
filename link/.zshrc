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
plugins=(zsh-syntax-highlighting git-extras aws)

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

# Load the shell dotfiles
# # * ~/.extra can be used for other settings you don’t want to commit.
for file in "$HOME"/.{aliases,completions,extra}; do
    [[ -r "$file" && -f "$file" ]] && source "$file";
done;
unset file;
