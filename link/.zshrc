DOTFILES="$HOME/.dotfiles"
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$DOTFILES/zsh/custom"
ZSH_THEME="vonder"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
CACHE_DIR="$HOME/.cache"
HISTFILE="$CACHE_DIR/.zsh_history"

# set the correct term with TMUX
if [[ -n "$TMUX" ]]; then
    export TERM=screen-256color
else
    export TERM=xterm-256color
fi

export EDITOR=vim
export VISUAL="$EDITOR"
# User configuration
export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export SSH_KEY_PATH="~/.ssh"
export AWS_CONFIG_FILE="~/.aws-config"
# Prefer US English and use UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"
# set fasd data file location
export _FASD_DATA="$CACHE_DIR/.fasd"

# Disable sound
setopt NO_BEEP
# glob for dotfiles as well (hidden)
setopt GLOB_DOTS

# create cache dir if it doesn't exist
[[ ! -d "$CACHE_DIR" ]] && mkdir "$CACHE_DIR"

# set oh my zsh plugins
plugins=(git zsh-syntax-highlighting git-extras)

# OS specific settings
if [[ "$(uname)" =~ ^Darwin ]]; then
    plugins+=brew
fi

# Source oh my zsh
if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
    source "$ZSH/oh-my-zsh.sh"
fi

# list all files in directory not alerting about no match
for file in $DOTFILES/source/*(-.N); do
    source $file
done

# list all files in ~/local/*.local
for file in $HOME/local/*.local(-.N); do
    source $file
done
unset file

if which npm &> /dev/null; then
    # Add npm completion
    eval "$(npm completion)"
fi
if which grunt &> /dev/null; then
    # grunt completion
    eval "$(grunt --completion=zsh)"
fi
if which gulp &> /dev/null; then
    # gulp completion
    eval "$(gulp --completion=zsh)"
fi
if which fasd &> /dev/null; then
    # Fasd
    eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
fi
