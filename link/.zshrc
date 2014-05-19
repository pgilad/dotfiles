# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-syntax-highlighting)

# Use brew on mac as well
if [[ "$(uname)" =~ ^Darwin ]]; then
    plugins+=brew
fi

# Source oh my zsh
if [[ -e $ZSH/oh-my-zsh.sh ]]; then
    source $ZSH/oh-my-zsh.sh
fi

# Source my autoload functions
# TODO make this source every file in ~/.dotfiles/auto-source
if [[ -e ~/.aliases ]]; then
    source ~/.aliases
fi

# User configuration
export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# set default editor
export EDITOR=$(which gvim)
export VISUAL="$EDITOR"

# ssh
export SSH_KEY_PATH="~/.ssh"

# aws config
export AWS_CONFIG_FILE=$HOME/.aws-config

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# Add npm completion
eval "$(npm completion 2> /dev/null || echo echo "Please install NPM.")"

# grunt completion
eval "$(grunt --completion=zsh 2> /dev/null || echo echo "Please install Grunt Cli: npm i -g grunt-cli")"

# gulp completion
eval "$(gulp --completion=zsh 2> /dev/null || echo echo "Please install gulp: npm i -g gulp")"

# Fasd
eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install 2> /dev/null || echo echo "Please install fasd")"

# Disable sound
setopt no_beep

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
