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
[[ ! -d "$CACHE_DIR" ]] && mkdir -p "$CACHE_DIR"

#source exported vars
if [[ -f "$DOTFILES/source/.exports" ]]; then
    source "$DOTFILES/source/.exports"
fi

###############
#  oh-my-zsh  #
###############
# set oh my zsh plugins
plugins=(git zsh-syntax-highlighting git-extras)

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

if [[ -f "$DOTFILES/source/.aliases" ]]; then
    source "$DOTFILES/source/.aliases"
fi

if [[ -f "$DOTFILES/source/.completions" ]]; then
    source "$DOTFILES/source/.completions"
fi

# find files to automatically source. Do not alert about empty matches
files=("$HOME"/local/*.local(-.N))
for file in $files; do
    source "$file"
done

unset files file
