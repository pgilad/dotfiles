# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="eastwood"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting brew)

if [[ -e $ZSH/oh-my-zsh.sh ]]; then
    source $ZSH/oh-my-zsh.sh
fi

# User configuration
export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# set default editor
export EDITOR=$(which gvim)
export VISUAL=$(which gvim)

# ssh
export SSH_KEY_PATH="~/.ssh"

# aws config
export AWS_CONFIG_FILE=$HOME/.aws-config

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# Add npm completion
eval "$(npm completion || echo echo "Npm not installed. Can't use autocomplete.")"

# grunt completion
eval "$(grunt --completion=zsh || echo echo "Install Grunt CLI: npm i -g grunt-cli")"

# gulp completion
eval "$(gulp --completion=zsh || echo echo "Install gulp: npm i -g gulp")"

# Fasd
eval "$(fasd --init auto)"

# Source aliases
if [[ -e ~/.aliases ]]; then
    source ~/.aliases
fi

# Disable sound
setopt no_beep

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
