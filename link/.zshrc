DOTFILES="$HOME/.dotfiles"
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$DOTFILES/zsh/custom"
ZSH_THEME="vonder"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
CACHE_DIR="$HOME/.cache"
HISTFILE="$CACHE_DIR/.zsh_history"

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
[[ ! -d "$CACHE_DIR" ]] && mkdir "$CACHE_DIR"

###############
#  oh-my-zsh  #
###############
# set oh my zsh plugins
plugins=(git zsh-syntax-highlighting git-extras)
# OS specific settings
[[ "$(uname)" =~ ^Darwin ]] &&  plugins+=brew
# Source oh my zsh
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

##################
#  source files  #
##################
# find files that automatically source. Do not alert about empty matches
files=("$DOTFILES"/source/*(-.N) "$HOME"/local/*.local(-.N))
for file in $files; do
    source "$file"
done
unset files file
